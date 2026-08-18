# Contract audit bundle — target trust graphs, source & recovered behaviour

Self-contained, audit-ready repository for the contracts handed over from discovery. For each target it
resolves the **trust graph in both directions** — everything the target leans on (down) and everything that
holds power over it (up) — brings every reachable contract in as **real source** (verified) or **recovered
behaviour** (decompilation + extracted constants + guard simulation, where unverified), and records the
**live authority + configuration + integrity state** that source alone cannot show. Open questions that are
genuinely outside the chain's reach are collected in **[`UNRESOLVED.md`](UNRESOLVED.md)** — read that too.

This is a map + evidence bundle for an auditor. It does **not** judge exploitability.

## Targets (as handed over) and where they went
| # | Discovery line | Chain | Status found | Where |
|---|---|---|---|---|
| 1 | `0xbc11091d…224b` Wing / fUSDT — UNVERIFIED, "$42k" | 56 BSC | unverified → **recovered** (decompiled) | [`chains/bsc-56/wing/`](chains/bsc-56/wing/) |
| 2 | `0x5e5003e1…3047` Wing / fBUSD — UNVERIFIED clone | 56 BSC | unverified → **recovered** (byte-identical shell → same impl) | [`chains/bsc-56/wing/`](chains/bsc-56/wing/) |
| 3 | `0x6575cfa9…fc81` Wing / fBNB — UNVERIFIED clone | 56 BSC | unverified standalone → **recovered** (decompiled) | [`chains/bsc-56/wing/`](chains/bsc-56/wing/) |
| 4 | `0xFbc0d3cA…AFe3` Sperax / SPABuyback — UNVERIFIED proxy | 42161 ARB | proxy shell unverified, **impl VERIFIED** → source | [`chains/arbitrum-42161/sperax/`](chains/arbitrum-42161/sperax/) |
| 5 | `0xf236ea74…22FA` Plutus / plsDPX — UNVERIFIED | 42161 ARB | **address corrupted/empty**; real token `0x…f253ce1` **VERIFIED** → source | [`chains/arbitrum-42161/plutus/`](chains/arbitrum-42161/plutus/) |

Two discovery-line corrections, both detailed in the subsystem docs:
- **#4 SPABuyback** is not opaque — only its proxy shell is unverified; the running implementation is fully
  verified. Resolved through the proxy.
- **#5 plsDPX** — the handed-over address `0x…E322FA` has **no code on Arbitrum**. The real, verified token
  is `0xf236ea74b515ef96a9898f5a4ed4aa591f253ce1`. Used throughout.

## The one-paragraph picture per subsystem
- **Wing (BSC), targets 1–3** — a Compound-v2 fork. The three targets are ordinary CToken markets, but the
  code that can drain them is not the tokens: it is a **custom `withdrawAllToken` admin function on every
  market that transfers the entire underlying balance to `admin`**, and a **price oracle whose `operator`
  can push arbitrary prices** — both controlled by **plain EOAs** (five of them, no multisig/timelock).
  Accounting and Chainlink feeds are currently intact; the exposure is the keys. Everything unverified here
  was decompiled, constant-extracted, and simulated.
- **Sperax (Arbitrum), target 4** — SPABuyback swaps SPA→USDs at an oracle price and burns SPA. The whole
  graph is verified. Risk lives (a) downstream in the oracle, which ultimately trusts an **off-chain DIA
  feeder** for SPA/USDs, and (b) upstream in a **single 3-of-5 Safe** that owns the logic, the upgrade path,
  and the entire oracle stack. It holds ~1 USDs today.
- **Plutus (Arbitrum), target 5** — plsDPX is a plain ERC20 whose **`operator` can mint/burn without limit**
  and whose **4-of-7 Safe owner can swap that operator**. All verified. The token's risk is entirely the
  upstream mint authority, not anything in the token.

## Repo layout
```
README.md                     ← you are here (master map)
UNRESOLVED.md                 ← what remains genuinely open, per subsystem
graph.json                    ← machine-readable inventory of every contract + role + status + path
chains/
  bsc-56/wing/
    README.md                 ← Wing subsystem map + trust graph + findings
    recovered/                ← 8 unverified contracts: *-decompiled.sol, *-abi.json, *-constants.txt, runtime.bytecode.hex
      README.md               ← per-contract index of recovered behaviour
    dependencies/             ← verified source of USDT, BUSD, WING
    state/                    ← live-state.md + live-state.json + all-markets.txt + simulation-*.txt
  arbitrum-42161/sperax/
    README.md, <Contract>-.../ (verified source per contract), state/live-state.md
  arbitrum-42161/plutus/
    README.md, <Contract>-.../ (verified source per contract), state/live-state.md
```

## How each contract was resolved (method)
- **Source:** Etherscan V2 `getsourcecode` (multi-file standard-JSON unpacked into real files) for anything
  verified; proxies resolved to the implementation that actually runs before saving.
- **Recovered behaviour (unverified):** raw runtime via `eth_getCode`; **decompiled with heimdall-rs v0.9.2**
  (`--include-sol`, selector-resolving on) saved as `*-decompiled.sol` + `*-abi.json`; **constants extracted**
  (PUSH20 addresses, PUSH32 words, embedded strings) saved as `*-constants.txt`; **simulated** by calling
  state-changing functions from an unprivileged address (and from the admin) via `eth_call` and decoding the
  result/revert (Compound return-codes 1/16 = UNAUTHORIZED distinguished from reverts). Before filing anything
  unverified, its bytecode was checked for a verified twin on BSC and on Sourcify (none matched).
- **Live state:** authority (role holders, account type EOA/Safe), configuration (rates, factors, caps, pause
  flags, feeds, prices) and integrity (cash vs real balance, Chainlink feed canonicality/freshness) read from
  public RPC and recorded beside the code.

## Headline findings (evidence in the subsystem docs; not an exploitability judgement)
1. **Wing:** `withdrawAllToken(uint256)` on every fToken (and the Insurance iToken) is an admin-only,
   unbounded drain of the market's entire underlying balance — confirmed by decompilation and by simulation
   (admin call returns `true`). The admin is a single EOA. (`chains/bsc-56/wing/`)
2. **Wing:** the price oracle has a separate `operator` EOA that can push arbitrary prices; all five Wing
   control roles are EOAs with no multisig/timelock.
3. **Sperax & Plutus:** code fully verified; risk concentrated in one Safe each (upgrade/mint/oracle
   authority) and, for Sperax, an off-chain DIA price feeder.

Etherscan V2 + Sourcify were used for verification/source; heimdall-rs for decompilation; public BSC/Arbitrum
RPCs for state and simulation.
