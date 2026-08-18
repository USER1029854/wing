# Security audit — Wing (BSC) · Sperax SPABuyback (Arbitrum) · Plutus plsDPX (Arbitrum)

Scope: the five handed-over targets and every contract in their trust graph (see `README.md`/`graph.json`).
Adversary model: hostile, unprivileged, well-resourced — flash loans, many addresses, atomic multi-step
txs, arbitrary composability, hostile-but-standards-compliant tokens, extreme inputs, unlimited patience.
Out of scope by instruction: pure ordering/front-running/sandwich attacks, exploits needing other users to
act mid-attack, and a **privileged party misusing its own legitimate powers** (noted as caveats, not findings).

Method: entry points enumerated mechanically from the recovered ABIs/bytecode (Wing is decompiled —
heimdall-rs v0.9.2; Sperax/Plutus are source-verified). Every value-moving guard was checked against live
chain state with `eth_call` from an unprivileged address (`0x1111…1111`) and, where relevant, from the
admin, decoding Compound return-codes (0=ok, 1/16=UNAUTHORIZED) vs reverts. Constants were extracted from
every unverified bytecode and checked for embedded keys/signers. Configuration was read live and checked
for coherence.

---

## Verdict

**No finding that meets the reporting bar.** No unprivileged economic exploit (disproportionate,
stake-independent profit) and no unauthorized-access path (missing/defeatable guard, self-grantable
privilege, forgeable/replayable signature, or signer key in bytecode) survived verification.

This is a *complete-surface* negative, not a spot check: all externally-reachable entry points are
enumerated and individually accounted for in Artifact 1, and the state-dependency compositions are worked
in Artifact 2. Two things dominate the real risk but are **excluded by the rules of engagement**, and are
stated here so the negative verdict is not mistaken for "safe":

- **Wing is single-key custodial.** `admin` (EOA `0x90dac303`) can call `withdrawAllToken` on every fToken
  and on the Insurance contract, transferring the market's **entire** underlying balance to itself
  (verified: admin call returns `true`; unprivileged reverts `"not admin"`). The oracle **`operator`**
  (EOA `0x9171f417`) can overwrite any price. These are legitimate privileged powers, so they are not
  findings — but they mean the ~$42k in fUSDT and every other market balance is removable by one private
  key at will, and depositor safety rests entirely on off-chain key custody. Full detail in
  `chains/bsc-56/wing/state/live-state.md` and `UNRESOLVED.md`.
- **Sperax pricing trusts an off-chain DIA feeder** (`0x7919D08e…`) for 70% of SPA price and 100% of USDs
  price, under one 3-of-5 Safe. On-chain code is correct; a wrong DIA push is not visible from the chain.

If either exclusion did not apply, both would be critical. Within the adversary model as scoped, neither is
reachable by an unprivileged attacker.

---
## Artifact 1 — Entry-point enumeration (every externally-reachable function, guard, reason)

Guard column: what stops an arbitrary caller. "Reason not exploitable" is the one-line justification.
`✔sim` = confirmed by live simulation from an unprivileged (and/or admin) address.

### Wing — fToken delegate impl `0x120af5` (runs behind fUSDT, fBUSD, and 16 sibling ERC20 markets)
Compound v2 `CErc20Delegate` fork. Reentrancy guard (`_notEntered`) present on mint/redeem/borrow/liquidate (✔read).

| Function | Guard | Reason not exploitable |
|---|---|---|
| `mint(uint256)` | comptroller `mintAllowed` + pull underlying via transferFrom | Deposit; mints shares at exchange rate. Reentrancy-guarded. |
| `redeem(uint256)` / `redeemUnderlying(uint256)` | comptroller `redeemAllowed` (liquidity) | Burns shares at exchange rate; rounds in protocol favor. |
| `borrow(uint256,bool)` | comptroller `borrowAllowed` liquidity check | ✔sim: no-collateral borrow of any non-dust amount → code 3. **The `bool` does NOT bypass the check** (both values → code 3). 1-wei borrow succeeds only via shortfall rounding to 0 (dust, uneconomic). |
| `repayBorrow(uint256)` / `repayBorrowBehalf(address,uint256)` | none needed (reduces debt) | Pays down a borrow; can't harm others. |
| `liquidateBorrow(address,uint256,address)` | comptroller `liquidateBorrowAllowed` requires borrower shortfall | ✔sim: liquidating a healthy borrower → code 3. Incentive 5% fixed. |
| `seize(address,address,uint256)` | comptroller `seizeAllowed`: caller must be a **listed market** | ✔sim: `seize(attacker,victim,amt)` → code 3 for all amounts; `seizeAllowed(unlisted seizer,·,·)` → 9 (incl. self-referential). An arbitrary caller cannot seize any account's shares. |
| `transfer/transferFrom/approve` | comptroller `transferAllowed` + allowances | Standard ERC20 on the share token. |
| `accrueInterest()` | none (idempotent within block) | Public; only advances interest to current block. |
| `_reduceReserves(uint256)` | `msg.sender==admin` | ✔sim: unpriv → code 1; admin → 0. Capped at `totalReserves`. |
| `_addReserves(uint256)` | none (adds caller funds to reserves) | Donation into reserves. |
| `_setInterestRateModel/_setReserveFactor/_setComptroller/_setPendingAdmin` | `msg.sender==admin` (return-code) | ✔sim: unpriv → code 1. |
| `_acceptAdmin()` | `msg.sender==pendingAdmin` | pendingAdmin=0; not self-grantable. |
| `initialize(...)` (`0x1a31d465`, `0x4340720f`) | `msg.sender==admin` + one-time (`accrualBlockNumber`) | ✔read: "only admin may initialize"/"market may only be initialized once". Live markets already initialized. |
| `withdrawAllToken(uint256)` | `msg.sender==admin` | ✔sim: unpriv → revert "not admin"; **admin → true (drains full balance)**. *Privileged power — excluded, see Verdict.* |
| `updateUnderlying(address)` | `msg.sender==admin` | ✔sim: unpriv → revert "only admin may invoke the method". *Privileged.* |
| `repayByInsurance(address,uint256)` | `msg.sender==comptroller` | ✔read: "only comptroller could invoke". Not user-reachable. |
| name/symbol setter (`0xbf852237`) | `msg.sender==admin` | Metadata only. |
| view getters (exchangeRate*, getCash, balanceOfUnderlying, getAccountSnapshot, borrowBalance*, rates, utilizationRate) | n/a | Read-only. |

### Wing — fBNB standalone `0x6575` (native-BNB market, CEther-equivalent)
Same fork surface; native BNB in/out. Reentrancy guard (`_notEntered`, `store_g`) present on mint/redeem/borrow (✔read); native send is after state updates.

| Function | Guard | Reason not exploitable |
|---|---|---|
| `mint()` payable | comptroller `mintAllowed` | Deposit of native BNB; reentrancy-guarded. |
| `redeem/redeemUnderlying(uint256)` | comptroller `redeemAllowed` | State updated before BNB send; guard blocks re-entry. |
| `borrow(uint256,bool)` | comptroller `borrowAllowed` | Same as ERC20 market (liquidity enforced). |
| `repayBorrow()` / `repayBorrowBehalf(address)` / `repayBehalfExplicit(address)` payable | none needed | Repays debt with attached BNB. |
| `liquidateBorrow(address,address)` payable | `liquidateBorrowAllowed` (shortfall) | Requires borrower shortfall. |
| `seize(...)`, admin `_set*`/`_reduceReserves`/`withdrawAllToken`/`updateUnderlying` | as fToken above | Same guards; ✔sim parity. |

### Wing — Comptroller impl `0x17afa1eb` (Unitroller `0x49620e9b`)
Compound Comptroller fork + custom insurance/operator/per-market-liq-incentive.

| Function | Guard | Reason not exploitable |
|---|---|---|
| `enterMarkets(address[])` / `exitMarket(address)` | user self-service; exit checks no debt/collateral use | Standard membership. |
| `mintAllowed/redeemAllowed/borrowAllowed/repayBorrowAllowed/liquidateBorrowAllowed/seizeAllowed/transferAllowed` + `*Verify` | called by markets; hooks return codes | Even if called directly they only read/roll reward indices and return a code; no value moves. `seizeAllowed` requires listed seizer (✔sim). |
| `claimWing(address[],address[],bool,bool)` | per-holder accrual math | ✔sim: returns 0 distributing nothing — **`wingSpeeds`=0 for all markets, comptroller holds dust WING**; reward system inert. Compound duplicate-cToken double-claim guard (supplierIndex set to current) applies. |
| `refreshWingSpeeds()` / index refresh (`0x5c0689a7`) | permissionless but idempotent | ✔sim: no-op; speeds 0; index set to current block. |
| `_setPriceOracle/_setCloseFactor/supportMarket/_setCollateralFactor/_setLiquidationIncentive/_become/setWingAddress/_setWingRate/_dropWingMarket/_setMint|Borrow|Seize|TransferPaused` | `msg.sender==admin` (code 16) | ✔sim: `_setPriceOracle` unpriv → code 16; `setInsurance`/`setOperator` unpriv → revert "admin". |
| `setOperator/setPauseOperator/setInsurance` | `msg.sender==admin` | ✔sim revert "admin". |
| `pauseMarkets()/unpauseMarkets()` | operator/pauseOperator | ✔sim: unpriv → revert. |
| `approveInsurance(uint256)` | admin-or-operator | ✔sim: unpriv → revert "admin or operator". |
| setter `0xc3ea6d56(uint256)` | `msg.sender==admin` | ✔sim revert. |
| setter `0xfc8d77bb(uint256)` | admin-or-operator, arg `<1e18` | ✔sim revert "admin". |
| views (markets, getAccountLiquidity, getHypotheticalAccountLiquidity, oracle, insurance, wing*, *Paused, closeFactor, liquidationIncentive(address)) | n/a | Read-only. |

### Wing — PriceOracle `0x91cb061f`, Insurance `0x3c22f604`, InterestRateModel `0x206e179b`
| Function | Guard | Reason not exploitable |
|---|---|---|
| Oracle `getUnderlyingPrice/getLatestPrice(address)` | n/a (view-like) | Reads per-underlying Chainlink feed (canonical USDT/BUSD/BNB-USD, ✔verified fresh). |
| Oracle price setter (`0xbcf8a99e`) | `msg.sender==operator` | ✔sim: unpriv → "caller is not the operator". *Privileged (operator = EOA) — excluded.* |
| Oracle feed setters (`0x6bc98166/0xda055fa7/0x6ae028a3`), `updateOperator`, `transferOwnership`, `renounceOwnership` | `msg.sender==owner` | ✔sim: unpriv → "caller is not the owner". |
| Insurance `mint(uint256)` | pulls WING via transferFrom | ✔sim: attacker w/o WING → "transfer amount exceeds balance". Deposit only. |
| Insurance `redeem/redeemUnderlying` | comptroller `redeemAllowed` | ✔sim: → code 9 (blocked; insurance shares not freely redeemable). |
| Insurance `payInsurance(address,address,uint256)` | `msg.sender==comptroller` | ✔sim: unpriv → revert. |
| Insurance `withdrawAllToken()` | `msg.sender==admin` | ✔sim: revert "only admin can invoke this method". *Privileged.* |
| Insurance `setInsuranceRepayFactor` / `_setComptroller/_setPriceOracle/_setPendingAdmin`, `initialize` | admin / once | ✔sim: revert / return-code. |
| IRM `setParam(uint256,uint256,uint256,uint256)` / `transferOwner(address)` | `msg.sender==owner` (IRM owner EOA `0x28fa655c`) | ✔read "only admin". Only changes rate curve; can't move funds. *Privileged.* |

### Sperax — SPABuyback `0xFbc0d3cA` (impl `0xa8308a2d`) + oracle stack (all source-verified)
| Function | Guard | Reason not exploitable |
|---|---|---|
| `buyUSDs(uint256,uint256)` / `buyUSDs(address,uint256,uint256)` | `nonReentrant`; oracle price; slippage `minUSDsOut`; USDs balance check | Pays USDs for SPA at oracle rate, burns SPA. **Contract holds ~1.01 USDs** → max extractable ≈ $1 even under a mispriced oracle; SPA price is 70% DIA + 30% Uni-V3 **TWAP (≥10-min)** → not atomically manipulable. No disproportionate gain. |
| `distributeAndBurnSPA()` | public | Acts only on SPA already in the contract; `rewardPercentage`=1/10000 → 0.01% to rewarder, rest burned. No caller profit; called internally by `buyUSDs` (which is `nonReentrant`). |
| `withdraw(address,address,uint256)` | `onlyOwner`, cannot withdraw SPA | Owner (Safe) emergency withdraw of non-SPA. *Privileged.* |
| `updateOracle/updateVeSpaRewarder/updateRewardPercentage(...)` | `onlyOwner` | Config. *Privileged.* |
| `initialize(address,uint256)` | `initializer`; impl `_disableInitializers()` in ctor | Already initialized (owner set); not re-callable. |
| `MasterPriceOracle.updateTokenPriceFeed/removeTokenPriceFeed` | `onlyOwner` | Safe-controlled feed routing. *Privileged.* |
| `SPAOracle.updateDIAParams/setUniMAPriceData/updateMasterOracle` | `onlyOwner` | weightDIA≤100, maPeriod∈[10m,2h]. *Privileged.* |
| `USDsDIAOracle.updateDIAParams` | `onlyOwner` | staleness threshold >120s. *Privileged.* |
| `veSPARewarder.addRewards(address,uint256,uint256)` | permissionless, `nonReentrant` | Pulls `_amount` from caller (donation); can't extract. `recover*` are `onlyOwner`. |
| oracle/rewarder views | n/a | Read-only. |

### Plutus — plsDPX `0xf236…f253ce1` + migrator + Stryke plumbing (all source-verified)
| Function | Guard | Reason not exploitable |
|---|---|---|
| `plsDPX.mint(address,uint256)` / `burn(address,uint256)` | `msg.sender==operator` | Operator = migrator proxy; unlimited mint/burn is the operator's by design. *Privileged.* |
| `plsDPX.setOperator(address)` | `onlyOwner` (4-of-7 Safe) | *Privileged.* |
| `plsDPX` ERC20 transfer/approve/transferFrom | allowances | Standard OZ ERC20. |
| `PlsSykMigratorV2.migrate()` | `nonReentrant`, `whenNotPaused` | Burns **caller's own** plsDPX, pays plsSyk at **constant** `dpxConversionRate=1e6` (1 plsDPX→100 plsSyk); reverts if payout > held plsSyk. Value-preserving, rate not manipulable, no token hooks. |
| `PlsSykMigratorV2.adminMigrate/recoverErc20/setPaused/_authorizeUpgrade` | `onlyOwner` (Safe) | *Privileged (UUPS upgrade = latent mint control).* |
| `SykMigrator.migrate(address,uint256)` | token∈{dpx,rdpx}, period not over | Fixed-rate `adminMint` of SYK to caller for tokens they deposit; constant rates. `extendMigrationPeriod/recoverERC20` are `restricted` (AccessManager). |
| `SykDepositor.deposit(...)` / PlsSykToken | operator/owner-gated mint | Verified; same operator pattern as plsDPX. |

**Proxy shells** (SPABuyback proxy, Unitroller, USDs proxy, ERC1967 proxies): standard OZ/Compound proxies;
admin/upgrade paths are owner-gated (Safe or Wing admin EOA). SPABuyback shell decompiled → vanilla TUP
(`admin/changeAdmin/implementation/upgradeTo` only). No custom logic in any shell.

---
## Artifact 2 — State-dependency map & compositions worked

Format: **state → written by → read by → composition tested → why no exploit.**

### Wing
| Shared state | Written by | Read by (trusts it) | Composition examined | Result |
|---|---|---|---|---|
| `exchangeRate` = (cash+borrows−reserves)/totalSupply | mint/redeem/borrow/repay/accrueInterest/_reduceReserves | mint (shares out), redeem (underlying out), collateral valuation | **First-depositor / donation inflation**: mint 1 wei → donate underlying → redeem; and grief a later minter into 0 shares | Not reachable: all 3 targets already have supply the attacker can't displace; to round a normal deposit to 0 shares on fBNB (supply 2.33e17, rate 1.098e18) needs raising the rate to ~1e36, i.e. donating ~1e17 BNB (infeasible), and the donation benefits all holders pro-rata → no stake-independent gain. |
| `totalBorrows`, `borrowIndex`, per-acct `borrowBalance` | borrow/repay/liquidate/accrueInterest | liquidity checks, liquidation amounts | borrow→(shift reserves/price)→liquidate self; split one borrow into N | Liquidity check recomputed each call from oracle+balances; `accrueInterest` idempotent per block; splitting borrow doesn't defeat the check (each sub-call re-checks). |
| account liquidity (Σ collateral vs Σ borrow×price) | mint/redeem/borrow/transfer/enter/exit | borrowAllowed, redeemAllowed, liquidateBorrowAllowed | flash-borrow to distort a market then borrow/redeem against it in same tx | Prices come from **Chainlink** (canonical feeds, ✔fresh), not from pool reserves the attacker can move; no read-of-manipulable-state. |
| oracle price map (per underlying) | oracle `operator` (EOA) / `owner` | every liquidity & liquidation calc | operator front-runs a price to enable self-liquidation/borrow | Requires the **operator key** (privileged, excluded). Unprivileged sees only Chainlink. |
| `wing*` reward indices, `wingSpeeds` | accrue hooks / refresh / admin | `claimWing` payout | claim same holder×cToken twice; inflate accrual via refresh | Inert: `wingSpeeds`=0, comptroller WING balance is dust; duplicate-market claim protected by supplierIndex=current. |
| `totalReserves` | accrueInterest(+reserveFactor), _addReserves, _reduceReserves | `_reduceReserves` cap, `withdrawAllToken` | grow reserves then pull | `_reduceReserves` admin-only & capped; `withdrawAllToken` admin-only (privileged). Unprivileged cannot touch. |
| Insurance iToken cash/exchangeRate | Insurance mint / `payInsurance` (comptroller) | Insurance redeem, bad-debt cover | mint insurance → force a payout → redeem, or the reverse | `payInsurance` comptroller-only (unpriv can't trigger); insurance `redeem` returns code 9 (blocked). No attacker-driven sequence. |

**Repetition / rounding (N small vs 1 large):** mint/redeem/borrow/repay round in the protocol's favour;
`liquidateCalculateSeizeTokens` and the 5% incentive are linear in repayAmount; `closeFactor`=0.8 caps a
single liquidation but splitting is neutral (each sub-liquidation re-checks shortfall and pays the same
linear incentive). No contracting-state or directional-rounding gain from splitting was found.

**Cross-market / reentrancy:** all money functions carry the `_notEntered` guard (✔read on
mint/redeem/borrow/liquidate for both fToken and fBNB); fBNB updates state before the native send. The 18
ERC20 markets share the Comptroller and a Chainlink-based oracle — a hostile *underlying* token cannot move
another market's price (prices are external Chainlink), and cross-market seize requires a listed caller.

### Sperax
| State | Written by | Read by | Composition | Result |
|---|---|---|---|---|
| SPA price (70% DIA + 30% UniV3 TWAP) | DIA feeder (off-chain) / pool trades | `buyUSDs` USDs payout | flash-pump the SPA/quote pool then `buyUSDs` atomically | 30% weight *and* ≥10-min TWAP make an atomic pump ~ineffective; 70% is DIA (off-chain). Even a fully wrong price caps at the **~1.01 USDs** on hand → not disproportionate. |
| USDs balance of buyback | external funding / `buyUSDs` payout / `withdraw` | `buyUSDs` "InsufficientUSDsBalance" | drain via repeated buyUSDs | Bounded by balance (~$1); refills are a privileged/other-party action. |
| `rewardsPerWeek` | `addRewards` (permissionless, pulls caller funds) | rewarder claims | seed fake rewards | Caller funds the rewards; no extraction. |

### Plutus
| State | Written by | Read by | Composition | Result |
|---|---|---|---|---|
| plsDPX totalSupply | operator mint/burn | migrate payout, market value | mint cheap → migrate → profit | Mint is operator-only; unprivileged must buy plsDPX at market. |
| migrator plsSyk balance | owner `adminMigrate`/`recoverErc20`; `migrate` payout | `migrate` payout cap | drain plsSyk via migrate | `migrate` burns caller's own plsDPX 1:1-by-rate; can't exceed held plsSyk; constant rate. Value-preserving. |

No composition across the two chains is possible (separate systems, no shared state or bridge).

---

## Secrets / constants check
Constants were extracted from every unverified Wing bytecode (`chains/bsc-56/wing/recovered/*/*-constants.txt`)
and read from the verified sources.
- **No private key, and no hardcoded signer address, in any contract.** The Wing PriceOracle contains **no**
  embedded address at all — its 32-byte constants are event-topic hashes
  (`keccak256("OwnershipTransferred(address,address)")` etc.); its price sources and `operator`/`owner` are
  **storage** values (owner slot0, operator slot5), not baked into code. So there is no "signature-gated path
  whose signer is public in bytecode": the oracle gate is `msg.sender==operator`, an ordinary access check.
- The only signature scheme in scope is **EIP-2612 permit** on `PlsSykToken`/`PlsSykToken`-family (standard
  OZ `ERC20Permit`): domain separator binds `chainid`+contract address, nonces prevent replay → not
  forgeable or cross-chain-replayable.
- Sperax/Plutus hardcoded addresses (`SPA`, `USDS`, `DIA_ORACLE`, Uniswap factory/utils, canonical Chainlink
  feeds) are **public infrastructure**, not secrets.

## Configuration audit (as deployed, read live)
- Wing: `closeFactor` 0.8, per-market `liquidationIncentive` 1.05, CF fUSDT 0.80 / fBNB 0.75 / fBUSD **0**,
  reserveFactors 0.10–0.15, `wingSpeeds` **0** — internally coherent. fBUSD is deliberately frozen (CF 0 +
  mint/borrow paused); existing suppliers can still redeem. Oracle price scaling is coherent with the
  comptroller math (empirically: undercollateralized borrow and healthy-borrower liquidation both correctly
  rejected). Chainlink feeds are the **canonical BSC aggregators** and fresh. `getCash` == real underlying
  balance for fUSDT/fBUSD (no hidden shortfall). No parameter combination found that makes a guard vacuous.
- Sperax: `rewardPercentage`=1 (0.01%), `weightDIA`=70, DIA staleness 86400s. Coherent; the tiny reward
  share and near-empty USDs float mean no config-driven surface.
- Plutus: migrator active (`paused`=false); conversion rate a compile-time constant. Coherent.

## Assumptions & limitations (what would change the verdict)
1. **Wing is decompiled, not source.** Access control and the presence/branching of guards were confirmed
   by *live simulation* (the strongest available evidence) and by reading heimdall output; but a subtle
   arithmetic bug in a path that simulation didn't exercise with the exact triggering state could exist and
   not be visible in decompiled output. Confidence on *access control* is high (simulated); confidence on
   *deep arithmetic invariants* is medium. A source verification or a byte-identical verified twin would
   raise it.
2. **Off-chain DIA feeder (Sperax)** is trusted for SPA (70%) and USDs (100%) prices. A wrong/stale/
   compromised DIA push is not detectable from the chain; if it occurred, `buyUSDs` would misprice — bounded
   today by the ~$1 USDs float, but unbounded if the buyback is refunded while DIA is wrong.
3. **Live state is a snapshot.** `wingSpeeds`=0, the ~1 USDs float, pause flags, feed addresses, and all
   balances were read once. A privileged key can change any of them; several "not exploitable because the
   balance/speed is ~0" conclusions would need re-checking if that changes (they remain non-findings for an
   *unprivileged* attacker regardless, since the guards hold).
4. **Excluded by rules of engagement:** the Wing admin/oracle-operator/IRM-owner EOAs and the Sperax/Plutus
   Safes misusing their own powers. These are the dominant real-world risks (see Verdict) but are not
   "unauthorized access" and are out of finding scope.
