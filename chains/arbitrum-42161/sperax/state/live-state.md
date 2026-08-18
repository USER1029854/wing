# Sperax SPABuyback — live authority & configuration state (chain 42161 / Arbitrum One)

Snapshot taken during audit prep (block ~ latest at time of read). Re-read before relying on any value.

## Proxy / implementation
| Item | Value |
|---|---|
| Target (proxy) | `0xFbc0d3cA777722d234FE01dba94DeDeDb277AFe3` (TransparentUpgradeableProxy — shell UNVERIFIED, standard OZ) |
| EIP-1967 implementation | `0xa8308a2deeaeb7ee7cb27845328a27cd755c8dc9` — **VERIFIED** `SPABuyback` (Solidity 0.8.19) |
| EIP-1967 admin (ProxyAdmin) | `0x3e49925a79cbfb68baa5bc9dfb4f7d955d1ddf25` — **VERIFIED** OZ `ProxyAdmin` |
| ProxyAdmin.owner() | `0x5b12d9846f8612e439730d18e1c12634753b1bf1` — Gnosis Safe **3-of-5** |

> The task listed this target as "SPABuyback UNVERIFIED proxy". Only the proxy **shell** is unverified;
> the implementation that actually runs is fully verified. Resolved through the proxy per the brief.

## Authority (who can move funds / change rules)
| Role | Address | Type | Power |
|---|---|---|---|
| SPABuyback.owner() | `0x5b12d9846f8612e439730d18e1c12634753b1bf1` | Gnosis Safe 3-of-5 | setOracle, setVeSpaRewarder, updateRewardPercentage, withdraw (any token except SPA) |
| ProxyAdmin.owner() | `0x5b12d9846f8612e439730d18e1c12634753b1bf1` | Gnosis Safe 3-of-5 | **upgrade implementation** (total control) |
| MasterPriceOracle.owner() | `0x5b12d9846f8612e439730d18e1c12634753b1bf1` | same Safe | set/remove any token price feed |
| SPAOracle.owner() | `0x5b12d9846f8612e439730d18e1c12634753b1bf1` | same Safe | updateDIAParams, setUniMAPriceData |
| USDsDIAOracle.owner() | `0x5b12d9846f8612e439730d18e1c12634753b1bf1` | same Safe | DIA params |

**Owner Safe `0x5b12d9846f8612e439730d18e1c12634753b1bf1` — 3-of-5**, owners:
- `0xb35b791f5ce98ec129db525fb89e5ce228e90a4d`
- `0xc6e00e0e3544c93460cdfb53e85c4528ef348265`
- `0xc8569b19d7a2129b7aabb71d5f06c970eed4f1d0`
- `0x0a8d4be257a17fc4357fb59edb6fecbda50de88a`
- `0xd902e6429c08670c9d97ec8e2dff56fa79e41ef3`

A single Safe holds logic-admin, upgrade, AND the entire price-oracle stack. It is the whole trust root.

## Downstream dependencies (what SPABuyback reaches)
| Dep | Address | Status |
|---|---|---|
| SPA token (hardcoded const) | `0x5575552988A3A80504bBaeB1311674fCFd40aD4B` | VERIFIED `SperaxTokenL2` |
| USDS token (hardcoded const) | `0xD74f5255D557944cf7Dd0E45FF521520002D5748` | proxy → VERIFIED impl `0x67b58013742ce6bb0cdc2ef3ce0a35c1d2f5f3c2` |
| oracle (state var) | `0x14d99412dab1878dc01fe7a1664cde85896e8e50` | VERIFIED `MasterPriceOracle` |
| veSpaRewarder (state var) | `0x5ed5c72d24ff0931e5a38c2969160dfe259e7c05` | proxy(TUP) → VERIFIED impl `0x3380b7130dd112ba44dd140abe5fd360836106a5` |
| MasterPriceOracle → SPA feed | `0xe69671c98842f3ddb965b94c0d99b60d8e161f34` | VERIFIED `SPAOracle` (getPrice()) |
| MasterPriceOracle → USDS feed | `0xd6ce80d968c8229fdaea6e315b0441d299fb40f4` | VERIFIED `USDsDIAOracle` (getPrice()) |
| SPAOracle → DIA oracle (hardcoded const) | `0x7919D08e0f41398cBc1e0A8950Df831e4895c19b` | DIA off-chain feeder (see off-chain notes) |

## Live configuration
| Param | Value | Notes |
|---|---|---|
| SPABuyback.rewardPercentage() | `1` (of MAX_PERCENTAGE 10000) | 0.01% of incoming SPA goes to rewarder, **99.99% is burned** |
| MasterPriceOracle.getPrice(SPA) | price=`191278`, precision=`1e8` → **$0.00191278** | pass-through from SPAOracle |
| MasterPriceOracle.getPrice(USDS) | price=`99777664`, precision=`1e8` → **$0.99777664** | from USDsDIAOracle |
| SPAOracle.weightDIA() | `70` (of 100) | SPA price = 70% DIA "SPA/USD" + 30% Uniswap-V3 TWAP |
| SPABuyback USDs balance | `1014214513130765267` ≈ **1.014 USDs** | this is the only immediately-drainable amount today |
| SPABuyback SPA balance | `0` | |

## Integrity notes
- SPA and USDS addresses are compile-time `constant`s in the verified impl; they match the live token
  contracts. The oracle and rewarder are mutable state (owner-settable) — see authority table.
- Current on-hand USDs is ~1 USDs, so the *immediate* economic surface of a mispriced buyback is ~$1.
  The standing risk is the owner Safe (upgrade + oracle control) and the DIA off-chain feeder, not the
  current balance.
