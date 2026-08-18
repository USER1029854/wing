# Plutus plsDPX — live authority & configuration state (chain 42161 / Arbitrum One)

## ⚠️ Discovery-address correction (read first)
The discovery step supplied `0xf236ea74B515ab96AF1c7Cd25AB88Cae42E322FA` (chain 42161) for "Plutus / plsDPX".
That address is **empty on Arbitrum**: `eth_getCode` = `0x`, nonce 0, balance 0, no contract-creation record.
It is a **corrupted address** — note the shared leading bytes `0xf236ea74b515…` then divergence.

The real Plutus DPX token is **`0xf236ea74b515ef96a9898f5a4ed4aa591f253ce1`** (verified on Arbiscan as
`PlsDpxToken`, Solidity 0.8.9). All analysis below uses the real address. The token is **VERIFIED**, not
"UNVERIFIED / unreadable custom logic" as the discovery line stated.

## Target token
| Item | Value |
|---|---|
| plsDPX (real) | `0xf236ea74b515ef96a9898f5a4ed4aa591f253ce1` — VERIFIED `PlsDpxToken` (ERC20 + Ownable) |
| totalSupply() | `6055.15…` plsDPX (`0x148efbcc7909279a6d9`) |
| plsDPX code | plain ERC20; the ONLY external power is `operator` (mint/burn) and `owner` (setOperator) |

## Authority (upstream — what controls the token)
| Role | Address | Type | Power |
|---|---|---|---|
| plsDPX.operator() | `0x53f68d06ba0957fcc7bf0348e52eb7006496c4c2` | ERC1967 proxy → VERIFIED impl `0x400ea86b40e9a5a0a29e6735bde109f58f00b423` (`PlsSykMigratorV2`) | **mint & burn unlimited plsDPX** |
| plsDPX.owner() | `0xa5c1c5a67ba16430547fea9d608ef81119be1876` | Gnosis Safe **4-of-7** | `setOperator` (swap the minter entirely) |
| migrator.owner() (UUPS) | `0xa5c1c5a67ba16430547fea9d608ef81119be1876` | same 4-of-7 Safe | **UUPS upgrade** the operator → effectively controls minting |
| migrator.paused() | `false` | — | migration live |

> The token's own code never names the operator, yet the operator holds unlimited mint/burn. This is
> exactly the "separate contract handed authority over the token" case: the real minting authority is the
> migrator + the Safe that can upgrade/replace it, not anything visible in `PlsDpxToken.sol`.

**Owner/operator-owner Safe `0xa5c1c5a67ba16430547fea9d608ef81119be1876` — 4-of-7**, owners:
- `0xf20977efcf7a6af790471881154b09754ff73dc5`
- `0xea0029660abb00e8f26cc2847a9cce056b067efc`
- `0xb5332ebad6b83b3ace553f3c62c5e9949cb3b799`
- `0xf016bdd170459d135c8d3df700904e721a343564`
- `0xfcd5d2515356b1eaf7473266e4e4305aa6bf56f5`
- `0x01dd1edf2f29dc2da8bb96e584e17e56753fd029`
- `0xb0e6686645136185390426b4a5c4083b2363337d`

## Live minter (operator) — PlsSykMigratorV2 — dependencies
The current operator is a **migration** contract (burns users' plsDPX, hands out plsSyk). It only *burns*
plsDPX today; the *mint* half of the operator role is latent but reachable via UUPS upgrade by the Safe.
State (read live):
| Field | Address | Status |
|---|---|---|
| plsSyk | `0x68d6d2545f14751baf36c417c2cc7cdf8da8a15b` | VERIFIED `PlsSykToken` |
| plsDpx | `0xf236ea74b515ef96a9898f5a4ed4aa591f253ce1` | the target (verified) |
| dpx | `0x6c2c06790b3e3e3c38e12ee22f8183b37a13ee55` | VERIFIED (ClonableBeaconProxy → impl `0x3f770ac673856f105b586bb393d122721265ad46`) |
| syk | `0xacc51ffdef63fb0c014c882267c3a17261a5ed50` | VERIFIED (ERC1967Proxy → impl `0xaa745695af0cea67fa8086a8205c4e9d7b8c5690`) |
| sykMigrator | `0x65b1ca92a017ecfa4060231dfc28f69264daa3b0` | VERIFIED `SykMigrator` |
| sykDepositor | `0x2ed0837d9f2fbb927011463fad0736f86ea6bf25` | VERIFIED (ERC1967Proxy → impl `0xc235b15a986d2b500f5312bbfe898fccf578f477`) |

## Integrity notes
- Every contract in the plsDPX graph is source-verified on Arbiscan. No decompilation was required for Plutus.
- The only non-verifiable elements are the two Gnosis Safe multisig signer sets (their key custody is off-chain).
