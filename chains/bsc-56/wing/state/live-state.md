# Wing (fUSDT / fBUSD / fBNB) — live authority & configuration state (chain 56 / BSC)

Compound-v2 fork ("Wing Finance"). Snapshot taken during audit prep. Machine-readable copy: `live-state.json`.
Guard proofs: `simulation-results.txt` + `simulation-returncodes.txt`.

## Authority model — the whole system is controlled by FIVE externally-owned accounts (no multisig, no timelock)
| Role | Address | Type | Controls |
|---|---|---|---|
| **admin** (all fTokens, Comptroller, Insurance) | `0x90dac303c9bcf43cb6e31eedad999490670f387e` | **EOA** (codelen 2) | `withdrawAllToken` (drain entire cash), `_reduceReserves`, `_setImplementation`, `_setInterestRateModel`, `_setReserveFactor`, `updateUnderlying`, Comptroller `_setPriceOracle`/`supportMarket`/`setOperator`/`setInsurance`/`_setCloseFactor` |
| Comptroller pause operator | `0x15f88ffe891dd7eadea25e1834deb5063caa9167` | **EOA** | `pauseMarkets()` / `unpauseMarkets()` |
| InterestRateModel owner | `0x28fa655c09918afc1798f4c152013685b21507bb` | **EOA** | `setParam` (base/multiplier/jump/kink rates) |
| PriceOracle owner | `0xe828183f4f85a7ec2dc5fb49a195c7b85f57964e` | **EOA** | set per-token price feed, set operator, transferOwnership |
| **PriceOracle operator** | `0x9171f417153b6773ff41e4ace4af36bb3e736748` | **EOA** | **push arbitrary prices** (operator-gated price setter) |

> Every privileged key is a plain account. Two of them alone are individually catastrophic:
> the **admin** can pull the entire underlying balance of any market via `withdrawAllToken` (see below),
> and the **oracle operator** can overwrite any price. Neither is behind a multisig or timelock.

## Shared infrastructure
| Component | Address | Verified? | Notes |
|---|---|---|---|
| Unitroller (proxy) | `0x49620e9bfd117c7b05b4732980b05b7afee60a69` | no → recovered | stock Compound Unitroller |
| Comptroller impl | `0x17afa1eb1feede3ed791e1b5c4b32b544e6cbc0b` | no → recovered | Wing-customised (insurance, per-market liq-incentive, pause operator) |
| InterestRateModel | `0x206e179b89c18bf077b03df4ce224a7339447a0f` | no → recovered | JumpRateModel, blocksPerYear 10512000 |
| PriceOracle | `0x91cb061f29c37012daa29f8e5abe180fd415d9fa` | no → recovered | hybrid Chainlink + operator-override, keyed by **underlying** |
| Insurance (proxy) | `0x65d999ddaaa6b0424be37a53d5574e43e9433788` | no → recovered | "IInsurance" iToken, underlying = WING |
| Insurance impl | `0x3c22f604cc8b422f43beca8d8cdef9922b96f454` | no → recovered | same admin EOA, own `withdrawAllToken` |
| fToken delegate impl (18 mkts) | `0x120af5748207161cc539ee5878fef9e3a12ad11a` | no → recovered | shared by every ERC20 market incl. fUSDT/fBUSD |
| WING token | `0x3cb7378565718c64ab86970802140cc48ef1f969` | yes (proxy→impl `0xdfebae62…`) | comptroller reward token |

Comptroller config: `admin`=0x90dac303, `oracle`=0x91cb061f, `closeFactorMantissa`=0.8e18 (80%),
per-market `liquidationIncentiveMantissa`=1.05e18 (5%), `operator`=0x15f88ffe, `insurance`=0x65d999dd,
`getWingAddress`=0x3cb73785. (This fork exposes NO global `pauseGuardian`, `borrowCaps`, or `supplyCaps`.)

InterestRateModel: base=951293759/blk (~1%/yr), multiplier=8323820395/blk (~8.75%/yr),
jumpMultiplier=475646879756/blk (~500%/yr), kink=0.8e18.

## The three targets (live)
### fUSDT `0xbc11091d6203500c480f0305140c687ab52b224b`  (delegator → impl 0x120af5)
| Field | Value |
|---|---|
| underlying | USDT `0x55d398326f99059ff775485246999027b3197955` (18 dec, canonical Binance-Peg) |
| totalSupply / exchangeRate | 2735.76 fUSDT / 1.37047 |
| getCash | **42412.62 USDT** (≈ $42.4k — matches the discovery "$42k") |
| totalBorrows | 1284.79 USDT |
| totalReserves | **39948.13 USDT** (≈94% of cash — admin-withdrawable via `_reduceReserves`) |
| reserveFactor | 0.10e18 (10%) |
| collateralFactor / isListed | 0.80e18 / true |
| mint / borrow paused | false / false |
| oracle price (underlying) | $0.998962 via Chainlink USDT/USD `0xB97Ad0E74fa7d920791E90258A6E2085088b4320` |
| cash vs real USDT balance | **equal** (42412.62 = balanceOf(fToken)) — no hidden shortfall |

### fBUSD `0x5e5003e1b658a9c37660f4e6a730833b8a433047`  (delegator → impl 0x120af5, byte-identical shell to fUSDT)
| Field | Value |
|---|---|
| underlying | BUSD `0xe9e7cea3dedca5984780bafc599bd69add087d56` |
| totalSupply / exchangeRate | 12.11 fBUSD / 1.10794 |
| getCash / totalBorrows / totalReserves | 37.32 / 5.79 / 29.70 BUSD |
| reserveFactor | 0.15e18 (15%) |
| collateralFactor / isListed | **0 / true** (cannot be used as collateral) |
| mint / borrow paused | **true / true** — market is frozen/deprecated |
| oracle price | $0.999663 via Chainlink BUSD/USD `0xcBb98864Ef56E9042e7d2efef76141f15731B82f` |
| cash vs real BUSD balance | equal (37.32) |

### fBNB `0x6575cfa99a00a054cc3536f7978636701498fc81`  (STANDALONE native-BNB market, no delegator)
| Field | Value |
|---|---|
| underlying | native BNB (no `underlying()`); priced at oracle key `address(0)` |
| totalSupply / exchangeRate | 0.2329 fBNB / 1.09809 |
| getCash / totalBorrows / totalReserves | 0.4887 / 0.00808 / 0.2410 BNB |
| reserveFactor | 0.15e18 (15%) |
| collateralFactor / isListed | 0.75e18 / true |
| mint / borrow paused | false / false |
| oracle price | $602.62 via Chainlink BNB/USD `0x0567F2323251f0Aab15c8dFb1967E4e8A7D42aeE` (oracle addr(0) key) |

## Integrity checks
- **Chainlink feeds are canonical and fresh.** USDT/USD `0xB97Ad0E7…` ("USDT / USD", 8dp, $0.9990),
  BUSD/USD `0xcBb98864…` ("BUSD / USD", $0.9997), BNB/USD `0x0567F232…` ("BNB / USD", $602.62). All three
  are the genuine canonical Chainlink BSC aggregator proxies; `updatedAt` recent at snapshot time.
- **Live oracle output matches Chainlink** (e.g. fUSDT underlying price 0.998961e18 ≈ Chainlink 0.998962),
  i.e. the operator override is not currently active — but *can* be activated at will (see simulation).
- **Reported cash equals the real underlying balance** for fUSDT and fBUSD (no hidden shortfall today).
- Underlyings are the canonical Binance-Peg USDT/BUSD contracts (sources saved under `../dependencies/`).

## Guard simulation (unprivileged `0x1111…1111` vs admin) — see simulation-*.txt
- `fUSDT.withdrawAllToken(0)` from unprivileged → **revert "not admin"**; from admin → **returns true (would drain all cash)**.
- `fUSDT.updateUnderlying(x)` unprivileged → revert "only admin may invoke the method".
- `_setPendingAdmin` / `_reduceReserves` / `_setInterestRateModel` unprivileged → Compound code **1 = UNAUTHORIZED**; `_reduceReserves` from admin → **0 = success**.
- `comptroller.setInsurance/setOperator` unprivileged → revert "admin"; `_setPriceOracle` unprivileged → code **16 = UNAUTHORIZED**; `pauseMarkets` unprivileged → revert.
- `oracle` operator price-setter unprivileged → revert "Ownable: caller is not the operator"; `transferOwnership`/`updateOperator` unprivileged → "caller is not the owner".
