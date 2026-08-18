# Wing Finance lending market — BSC (chain 56)

Targets handed over: **fUSDT** `0xbc11091d6203500c480f0305140c687ab52b224b`,
**fBUSD** `0x5e5003e1b658a9c37660f4e6a730833b8a433047`,
**fBNB** `0x6575cfa99a00a054cc3536f7978636701498fc81` — all listed UNVERIFIED.

This is a **Compound v2 fork** with custom modifications. `fUSDT`/`fBUSD` are `CErc20Delegator`
proxies delegating to one shared delegate implementation; `fBNB` is a standalone native-BNB market.
None of the target code was verified or on Sourcify, so every unverified contract in the value path was
**decompiled (heimdall-rs v0.9.2), had its constants extracted, and was simulated** against live chain state.
Raw runtime bytecode is stored next to each decompilation as ground truth (`runtime.bytecode.hex`).

## Trust graph

```
                          admin EOA 0x90dac303  ── (single key: withdrawAllToken / _reduceReserves / _setImplementation / updateUnderlying)
                                 │  controls
        ┌────────────────────────┼──────────────────────────────┬───────────────────────────┐
        ▼                        ▼                               ▼                           ▼
  fUSDT (delegator) ─┐    fBUSD (delegator) ─┐            fBNB (standalone)            Comptroller/Unitroller
  0xbc11091d…        │    0x5e5003e1…        │            0x6575cfa9…                  0x49620e9b (proxy)
        │  delegatecall│         │  delegatecall│                 │                        │ delegatecall
        ▼            ▼          ▼             ▼                  │                        ▼
     fToken delegate impl  0x120af5  (shared by 18 markets)     │                 Comptroller impl 0x17afa1eb
        │                                                        │                        │ reads
        ├── underlying USDT 0x55d39832   ├── underlying BUSD 0xe9e7cea3   ├── native BNB   ├── PriceOracle 0x91cb061f
        │                                                        │                        │      (owner EOA 0xe828183f, operator EOA 0x9171f417)
        └── InterestRateModel 0x206e179b (owner EOA 0x28fa655c)  ┘                        ├── Insurance 0x65d999dd → impl 0x3c22f604 (underlying WING)
                                                                                          ├── WING token 0x3cb73785 (verified)
                                                                                          └── pause operator EOA 0x15f88ffe
   PriceOracle price sources (keyed by UNDERLYING token, not fToken):
     USDT → Chainlink USDT/USD 0xB97Ad0E7…   BUSD → Chainlink BUSD/USD 0xcBb98864…   BNB(addr0) → Chainlink BNB/USD 0x0567F232…
```

The Comptroller lists **19 markets** total (see `state/all-markets.txt`); 18 share the delegate impl
`0x120af5`, only fBNB is standalone. The 16 non-target markets are siblings sharing this exact code +
Comptroller + oracle; they are enumerated in `state/all-markets.txt` and are covered code-wise by the
single recovered delegate impl.

## Contract inventory
| Contract | Address | Verified | Location |
|---|---|---|---|
| fUSDT (target, delegator) | `0xbc11091d6203500c480f0305140c687ab52b224b` | no | `recovered/CErc20Delegator-shell-0xbc11091d/` |
| fBUSD (target, delegator; byte-identical shell to fUSDT) | `0x5e5003e1b658a9c37660f4e6a730833b8a433047` | no | same shell code as fUSDT |
| fBNB (target, standalone) | `0x6575cfa99a00a054cc3536f7978636701498fc81` | no | `recovered/fBNB-0x6575cfa9/` |
| fToken delegate impl (18 markets) | `0x120af5748207161cc539ee5878fef9e3a12ad11a` | no | `recovered/fToken-delegate-impl-0x120af5/` |
| Comptroller impl | `0x17afa1eb1feede3ed791e1b5c4b32b544e6cbc0b` | no | `recovered/Comptroller-impl-0x17afa1eb/` |
| Unitroller (proxy shell) | `0x49620e9bfd117c7b05b4732980b05b7afee60a69` | no | `recovered/Unitroller-shell-0x49620e9b/` |
| PriceOracle | `0x91cb061f29c37012daa29f8e5abe180fd415d9fa` | no | `recovered/PriceOracle-0x91cb061f/` |
| InterestRateModel | `0x206e179b89c18bf077b03df4ce224a7339447a0f` | no | `recovered/IRM-0x206e179b/` |
| Insurance (proxy + impl) | `0x65d999dd…` / `0x3c22f604…` | no | `recovered/Insurance-impl-0x3c22f604/` |
| USDT underlying | `0x55d398326f99059ff775485246999027b3197955` | yes | `dependencies/USDT-0x55d39832/` |
| BUSD underlying | `0xe9e7cea3dedca5984780bafc599bd69add087d56` | yes | `dependencies/BUSD-0xe9e7cea3/` |
| WING reward token | `0x3cb7378565718c64ab86970802140cc48ef1f969` | yes | `dependencies/WING-impl-0xdfebae62/` |

## What the recovery established (see `recovered/README.md` for per-contract detail)

1. **`withdrawAllToken(uint256)` is an unbounded admin drain on every market.** Guarded only by
   `require(msg.sender == admin, "not admin")`, it transfers the fToken's **entire underlying balance**
   (not just reserves) to `admin`. Confirmed by simulation: unprivileged → revert "not admin"; from the
   admin EOA → returns `true` (would execute). Stock Compound has no such function. The same function
   exists on the Insurance iToken (drains its WING). This is the single most important fact about Wing:
   the $42k in fUSDT (and the balance of every other market) is unilaterally removable by one private key.
   `updateUnderlying(address)` (admin-only) can additionally re-point a market's underlying token.

2. **Five independent EOAs, no multisig/timelock.** admin `0x90dac303`, pause-operator `0x15f88ffe`,
   IRM owner `0x28fa655c`, oracle owner `0xe828183f`, oracle **price operator** `0x9171f417` — all plain
   accounts. See `state/live-state.md`.

3. **The PriceOracle is a hybrid Chainlink + manual-override oracle, keyed by the underlying token.**
   `getUnderlyingPrice(x)` looks up a per-underlying feed; for the targets those feeds are the canonical
   Chainlink USDT/USD, BUSD/USD, and (via the `address(0)` key) BNB/USD aggregators — verified genuine and
   fresh. **But a separate `operator` EOA can call the operator-gated price setter and push arbitrary
   prices** (simulation: unprivileged caller → "caller is not the operator"). A mispriced oracle drives
   liquidations and borrow limits, so this key is a second drain vector independent of the admin.
   No price source or key is hardcoded in the oracle bytecode — everything is owner/operator-set storage.

4. **Compound accounting is intact right now.** Reported `getCash` equals the real ERC20 balance for
   fUSDT and fBUSD; Chainlink prices flow through unaltered. fBUSD is frozen (collateralFactor 0,
   mint+borrow paused). fUSDT's reserves are ~94% of its cash (admin can pull them via `_reduceReserves`).

## Files
- `recovered/` — per contract: `*-decompiled.sol`, `*-abi.json`, `*-constants.txt`, `runtime.bytecode.hex`, `heimdall.log`.
- `state/live-state.md` + `live-state.json` — authority + config + integrity snapshot.
- `state/simulation-results.txt`, `state/simulation-returncodes.txt` — guard proofs.
- `dependencies/` — verified source of USDT, BUSD, WING.
- See root `UNRESOLVED.md` for what remains genuinely open (the EOA key custody, the 48 unnamed selectors).
