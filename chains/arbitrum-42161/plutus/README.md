# Plutus plsDPX — Arbitrum One (chain 42161)

Target handed over: **plsDPX** at `0xf236ea74B515ab96AF1c7Cd25AB88Cae42E322FA` (listed "UNVERIFIED").

## ⚠️ The handed-over address is wrong — corrected here
`0xf236ea74B515ab96AF1c7Cd25AB88Cae42E322FA` has **no code on Arbitrum** (getCode `0x`, nonce 0, balance 0,
no creation record). It is a corrupted address (note the shared prefix `0xf236ea74b515…`). The real Plutus
DPX token is **`0xf236ea74b515ef96a9898f5a4ed4aa591f253ce1`**, which **is source-verified** (`PlsDpxToken`,
Solidity 0.8.9). So the "UNVERIFIED / unreadable custom logic" label is a consequence of the bad address;
the actual token and its whole graph are verified. No decompilation was required.

## What plsDPX is
A minimal `ERC20 + Ownable`. Its only privileged surface:
- `operator` can `mint`/`burn` **unlimited** plsDPX.
- `owner` can `setOperator` (replace the minter entirely).

The token's own code never names who the operator is. That authority is a **separate contract** — the
classic "power over the token that isn't in the token" case. Resolving it is the point of this folder.

## Trust graph (upstream authority is everything here)
```
 Safe 4-of-7  0xa5c1c5a6 ── owns ──► plsDPX 0xf236…f253ce1  (setOperator)
      │  also owns (UUPS)                    ▲ operator (mint/burn)
      ▼                                      │
 PlsSykMigratorV2  (operator) 0x53f68d06 (ERC1967 proxy) → impl 0x400ea86b
      │ burns plsDPX, hands out plsSyk; mint half latent, reachable via UUPS upgrade by the Safe
      ├─ plsSyk 0x68d6d254   ├─ dpx 0x6c2c0679   ├─ syk 0xacc51ffd
      ├─ sykMigrator 0x65b1ca92 (Stryke DPX→SYK) └─ sykDepositor 0x2ed0837d (SYK→plsSyk)
```

## Contract inventory (all VERIFIED)
| Contract | Address | Location |
|---|---|---|
| plsDPX token (target, real) | `0xf236ea74b515ef96a9898f5a4ed4aa591f253ce1` | `plsDPX-0xf236ea74/` |
| operator / minter proxy | `0x53f68d06ba0957fcc7bf0348e52eb7006496c4c2` | (ERC1967Proxy) |
| operator / minter impl | `0x400ea86b40e9a5a0a29e6735bde109f58f00b423` | `plsDPX-minter-impl-0x400ea86b/` (`PlsSykMigratorV2`) |
| plsSyk (destination) | `0x68d6d2545f14751baf36c417c2cc7cdf8da8a15b` | `plsSyk-0x68d6d254/` |
| SykMigrator | `0x65b1ca92a017ecfa4060231dfc28f69264daa3b0` | `sykMigrator-0x65b1ca92/` |
| SykDepositor impl | `0xc235b15a986d2b500f5312bbfe898fccf578f477` | `sykDepositor-impl-0xc235b15a/` |
| owner Gnosis Safe (4-of-7) | `0xa5c1c5a67ba16430547fea9d608ef81119be1876` | see `state/live-state.md` |

## Where the security lives
- **Upstream is the whole story.** plsDPX integrity = "who can mint it". Today: the migrator (which only
  burns), plus the **4-of-7 Safe** that can `setOperator` to any address or UUPS-upgrade the migrator to code
  that mints arbitrarily. There is no cap, no timelock — Safe-quorum control over unlimited mint.
- **Downstream is empty at the token** (plain ERC20). The migrator's downstream (Stryke SYK migration
  plumbing) is one hop past the authority and all verified; included for completeness.

## Off-chain / unresolvable
- The only non-verifiable elements are the two Gnosis Safe signer sets' **key custody** (off-chain). Signer
  lists + threshold are in `state/live-state.md`.
