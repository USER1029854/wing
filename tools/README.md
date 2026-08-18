# Recovery tooling (reproducibility)

The exact helpers used to build this repo. API keys were redacted — set `ETHERSCAN_V2_KEY` in your
environment (Etherscan V2 multichain key) before running. RPC endpoints are public BSC/Arbitrum nodes.

| Script | Purpose |
|---|---|
| `es.sh <chainid> <module> <action> k=v...` | Etherscan V2 API wrapper (source, ABI, creation) |
| `fetch_source.py <chainid> <addr> <outdir>` | fetch + unpack verified source (multi-file standard-JSON → real files) + ABI + metadata |
| `rpc.sh <chainid> <method> <params-json>` | raw JSON-RPC over public endpoints w/ failover |
| `w.py <chainid> <to> <sig> [outtypes] [args...]` | selector-based `eth_call` with ABI encode/decode (eth-abi/eth-utils) |
| `call.sh <chainid> <addr> <selector> [suffix]` | quick raw eth_call by selector |
| `constants.py <bytecode.hex>` | extract PUSH20 addresses / PUSH32 words / embedded strings from runtime bytecode |
| `decompile.sh` | heimdall-rs v0.9.2 decompile driver (`--include-sol`, selector resolving) |
| `sim.py` | guard simulation: call state-changing fns from unprivileged vs admin, decode revert/return-code |
| `wing_state.py` | gather Wing live authority + config + integrity state → JSON |

Decompiler: heimdall-rs v0.9.2 (`bifrost`/`heimdall decompile <bytecode> --include-sol`).
