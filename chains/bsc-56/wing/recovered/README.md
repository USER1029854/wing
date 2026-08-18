# Recovered (unverified) Wing contracts — index

Each folder holds: `*-decompiled.sol` (heimdall-rs v0.9.2 Solidity), `*-abi.json` (recovered ABI),
`*-constants.txt` (PUSH20 addresses / PUSH32 words / embedded strings), `runtime.bytecode.hex`
(the authoritative deployed runtime), and `heimdall.log`. Decompiler output is machine-generated and may
not compile; treat the bytecode as ground truth and the `.sol` as a behavioural reading, not source.
None of these matched a verified twin on BSC or Sourcify (checked).

| Folder | Address | What it is | Key recovered facts |
|---|---|---|---|
| `fToken-delegate-impl-0x120af5/` | `0x120af5748207161cc539ee5878fef9e3a12ad11a` | Shared `CErc20Delegate` (18 markets incl. fUSDT, fBUSD) | Standard CToken money fns (mint/redeem/borrow/repay/liquidateBorrow/seize/transfer). **Custom: `withdrawAllToken(uint256)` = admin-only full-balance drain; `updateUnderlying(address)` = admin re-point underlying; `repayByInsurance` = comptroller-only.** Admin fns use Compound return-codes (1=UNAUTHORIZED). |
| `fBNB-0x6575cfa9/` | `0x6575cfa99a00a054cc3536f7978636701498fc81` | Standalone native-BNB market (CEther-equivalent) | Same custom surface (`withdrawAllToken`, `updateUnderlying`, `repayByInsurance`, `repayBehalfExplicit`). No delegator/impl. |
| `CErc20Delegator-shell-0xbc11091d/` | `0xbc11091d…` (= fUSDT; fBUSD byte-identical) | Compound `CErc20Delegator` proxy shell | Delegatecalls to `implementation()` = 0x120af5; admin-set via `_setImplementation`. |
| `Comptroller-impl-0x17afa1eb/` | `0x17afa1eb1feede3ed791e1b5c4b32b544e6cbc0b` | Wing Comptroller logic | Compound Comptroller + **custom**: `setOperator`/`setPauseOperator`/`pauseMarkets`/`unpauseMarkets` (pause operator), `insurance`/`setInsurance`/`approveInsurance`, per-market `liquidationIncentiveMantissa(address)`, `getWingAddress`/`setWingAddress`. 48 selectors remained unnamed by 4byte (see constants/abi). |
| `Unitroller-shell-0x49620e9b/` | `0x49620e9bfd117c7b05b4732980b05b7afee60a69` | Comptroller proxy | Stock Compound Unitroller (`_setPendingImplementation`/`_acceptImplementation`/admin handoff). |
| `PriceOracle-0x91cb061f/` | `0x91cb061f29c37012daa29f8e5abe180fd415d9fa` | Hybrid price oracle | `isPriceOracle=true`; keyed by **underlying** token. `getUnderlyingPrice`/`getLatestPrice` read a per-token Chainlink aggregator (+ optional reference feed). **`operator` can push arbitrary prices; `owner` sets feeds/operator.** No hardcoded feed/secret in bytecode — all storage-set. |
| `IRM-0x206e179b/` | `0x206e179b89c18bf077b03df4ce224a7339447a0f` | JumpRateModel | `blocksPerYear=10512000`; `setParam`/`transferOwner` owner-gated; live params in `state/live-state.md`. |
| `Insurance-impl-0x3c22f604/` | `0x3c22f604cc8b422f43beca8d8cdef9922b96f454` | "IInsurance" iToken (proxy `0x65d999dd`) | mint/redeem like an fToken; underlying = WING. **`withdrawAllToken()` admin-only drain**; `payInsurance` comptroller-only; `setInsuranceRepayFactor` admin. Same admin EOA `0x90dac303`. |

## Constants extraction — notable results
- **PriceOracle** embeds NO address or secret key. Its only 32-byte PUSH constants are event-topic hashes
  (`keccak256("OwnershipTransferred(address,address)")` etc.). Its trust rests entirely on live storage
  (owner/operator EOAs + per-underlying Chainlink feeds), not a hidden constant. See `PriceOracle-*/…-constants.txt`.
- The fToken/comptroller/insurance bytecodes similarly carry only revert strings and standard hashes;
  no embedded backdoor addresses were found. Full dumps in each folder's `*-constants.txt`.

## Method notes / limitations
- Decompilation was run with function-selector resolving ON; heimdall named the common Compound selectors
  and left ~48 comptroller selectors as `Unresolved_<selector>` (behaviour is present in the `.sol`/bytecode,
  just unnamed). Symbolic-execution artifacts (e.g. `decimals / 0x0100`) reflect Wing's storage packing of
  the underlying address into the high bytes of the `decimals` slot — verified against live reads.
