# Sperax SPABuyback — Arbitrum One (chain 42161)

Target handed over: **SPABuyback** `0xFbc0d3cA777722d234FE01dba94DeDeDb277AFe3` (listed "UNVERIFIED proxy").

**Resolution:** only the proxy *shell* is unverified. The implementation that actually executes is
source-verified. Resolved through the proxy → the entire Sperax graph turned out to be verified; **no
decompilation was required**. All source is saved as real files below.

## What SPABuyback does
A `TransparentUpgradeableProxy` → `SPABuyback` impl. Users sell **SPA** and receive **USDs** at the oracle
price (`buyUSDs`). Of the SPA taken in, `rewardPercentage` goes to the veSPA rewarder and the **remainder is
burned**. USDs to pay users must be pre-funded into this contract. `withdraw` can pull any token *except* SPA;
`owner` can change the oracle, rewarder and percentage; the ProxyAdmin owner can upgrade the whole impl.

## Trust graph
```
Safe 3-of-5  0x5b12d984 ── owns ──► ProxyAdmin 0x3e49925a ──upgrades──► SPABuyback impl 0xa8308a2d
      │  also owns (logic owner)                                              │
      │  also owns oracle stack                                              │ reads / moves
      ▼                                                                       ▼
 MasterPriceOracle 0x14d99412 ──getPrice──► SPAOracle 0x e69671c9 ──70%──► DIA oracle 0x7919D08e (OFF-CHAIN feeder)
      │                                          └────────30%──► Uniswap V3 SPA/quote TWAP
      └──getPrice(USDS)──► USDsDIAOracle 0xd6ce80d9 ──► DIA
 SPABuyback ── SPA 0x55755529 (burned) · USDS 0xD74f5255 (paid out) · veSpaRewarder 0x5ed5c72d (rewarded)
```

## Contract inventory (all VERIFIED)
| Contract | Address | Location |
|---|---|---|
| SPABuyback proxy (target) | `0xFbc0d3cA777722d234FE01dba94DeDeDb277AFe3` | `SPABuyback-proxyshell-0xFbc0d3cA/` (decompiled — confirmed vanilla OZ TransparentUpgradeableProxy: admin/changeAdmin/implementation/upgradeTo, no custom logic, EIP-1967 slots → verified impl+ProxyAdmin) |
| SPABuyback impl | `0xa8308a2deeaeb7ee7cb27845328a27cd755c8dc9` | `SPABuyback-impl-0xa8308a2d/` |
| ProxyAdmin | `0x3e49925a79cbfb68baa5bc9dfb4f7d955d1ddf25` | `ProxyAdmin-0x3e49925a/` |
| MasterPriceOracle | `0x14d99412dab1878dc01fe7a1664cde85896e8e50` | `MasterPriceOracle-0x14d99412/` |
| SPAOracle (SPA price) | `0xe69671c98842f3ddb965b94c0d99b60d8e161f34` | `SPAOracle-0xe69671c9/` |
| USDsDIAOracle (USDs price) | `0xd6ce80d968c8229fdaea6e315b0441d299fb40f4` | `USDsDIAOracle-0xd6ce80d9/` |
| veSPA rewarder impl | `0x3380b7130dd112ba44dd140abe5fd360836106a5` | `veSPARewarder-impl-0x3380b713/` |
| SPA token | `0x5575552988A3A80504bBaeB1311674fCFd40aD4B` | `SperaxTokenL2` (address const in impl) |
| USDs token impl | `0x67b58013742ce6bb0cdc2ef3ce0a35c1d2f5f3c2` | `USDs-impl-0x67b58013/` |

## Where the security actually lives (both directions)
- **Downstream (what SPABuyback leans on): the oracle.** `buyUSDs` prices SPA→USDs entirely from
  `MasterPriceOracle.getPrice`. `MasterPriceOracle` is a generic `staticcall(source, msgData)` router; the
  SPA source is `SPAOracle` (70% DIA "SPA/USD" + 30% Uniswap V3 TWAP), the USDs source is `USDsDIAOracle`
  (DIA). A wrong price lets a caller drain the USDs held here — but **the contract currently holds ~1.01 USDs**
  (see `state/live-state.md`), so today's economic surface is ~$1. The standing risk is the *ability* to
  reprice + the standing USDs float, not the current balance.
- **Upstream (what stands above the target): one 3-of-5 Gnosis Safe** `0x5b12d984` owns the logic (owner),
  the upgrade path (ProxyAdmin), AND every oracle in the price stack. It can upgrade SPABuyback to arbitrary
  code, or repoint any price feed. This single multisig is the whole trust root.

## Off-chain component (must be named, cannot be simulated)
- **DIA oracle `0x7919D08e0f41398cBc1e0A8950Df831e4895c19b`** — SPAOracle reads `getValue("SPA/USD")` from
  it (weight 70%) and USDsDIAOracle reads DIA for USDs. DIA is an off-chain price feeder: an external
  operator pushes prices on-chain. If DIA reports a wrong SPA or USDs price (compromise, stale feed, thin
  source markets), SPABuyback's exchange rate is wrong regardless of the on-chain code being correct. The
  `diaMaxTimeThreshold` (86400s) staleness guard and the 30% Uniswap TWAP blend bound but do not remove this.

See `state/live-state.md` for live owner/threshold, feed addresses, weights, prices and balances.
