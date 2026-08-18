# UNRESOLVED — what an auditor still cannot see from this repo

Everything reachable on-chain has been brought in as source (where verified) or as decompilation +
extracted constants + guard simulation (where not). What remains below is genuinely outside the chain's
reach or intrinsically unprovable from bytecode. Each item says what it might hide.

## Blockers on a whole contract
*(none)* — every unverified contract in a value path was decompiled with a real decompiler
(heimdall-rs v0.9.2), its constants extracted, and its guards simulated against live state. No contract
was left as an opaque blob. (Had a decompiler been unavailable this section would name it as a blocker;
it was available and used — see `chains/bsc-56/wing/recovered/`.)

## Wing (BSC) — off-chain key custody is the real hole
1. **Five privileged EOAs — their private-key custody is invisible.** admin `0x90dac303`, comptroller
   pause-operator `0x15f88ffe`, IRM owner `0x28fa655c`, oracle owner `0xe828183f`, oracle **price-operator**
   `0x9171f417`. All are plain accounts (no multisig, no timelock). The chain shows *what* each key can do;
   it cannot show *who holds it or how it is secured*.
   - **admin** → `withdrawAllToken` drains the entire underlying balance of **every** market (fUSDT's ~$42k
     and all 18 others) to itself, in one call. Simulated: admin call returns `true`. This is not a latent
     capability — it is a live, unbounded, single-key drain. Open question: who holds this key and under
     what controls. Nothing on-chain bounds it.
   - **oracle price-operator** → can overwrite any market's price (operator-gated setter, simulated to
     reject non-operators). A single key can therefore drive liquidations/insolvency independent of admin.
     A clean simulation proves the guard *exists*; it cannot prove the operator key isn't already in the
     wrong hands. This is the "signature-gated function is fine whether or not the key is safe" case.
2. **~48 Comptroller selectors were not name-resolved** by the 4byte directory. Their behaviour is present
   in `Comptroller-impl-0x17afa1eb/ComptrollerImpl-decompiled.sol` and the raw bytecode, but they carry no
   human-readable name, so any bespoke logic among them is readable only as decompiled control flow, not by
   signature. (The security-critical named ones — admin drains, pause, insurance, oracle — were resolved
   and analysed.)
3. **fBNB / delegate `updateUnderlying` re-point.** `updateUnderlying(address)` (admin-only) lets the admin
   change a market's underlying token pointer. Whether it has ever been used, and to what, is a historical
   question not answered by current state; the capability is confirmed.

## Sperax (Arbitrum) — an off-chain price feeder in the value path
4. **DIA oracle `0x7919D08e0f41398cBc1e0A8950Df831e4895c19b` is off-chain.** SPAOracle blends 70% DIA
   "SPA/USD" with 30% Uniswap-V3 TWAP; USDsDIAOracle takes USDs price from DIA. DIA prices are pushed
   on-chain by an external operator. If DIA reports a wrong price (operator compromise, stale/thin source),
   SPABuyback's SPA→USDs rate is wrong even though every on-chain contract is correct and verified. The
   86400s staleness threshold and the Uniswap blend bound but do not eliminate this. What DIA *actually*
   reports over time, and who runs its SPA feed, is not answerable from these contracts — it is the kind of
   off-chain "is the reported price real" question that only external evidence can close.
5. **Sperax owner Safe `0x5b12d984` (3-of-5) is the entire trust root** (logic owner + ProxyAdmin upgrade +
   the whole oracle stack). Its signer key custody is off-chain. A quorum can upgrade SPABuyback to
   arbitrary code or repoint any feed. Signer set is listed in `sperax/state/live-state.md`.

## Plutus (Arbitrum) — mostly closed
6. **Discovery address was corrupted** — `0x…E322FA` is empty; real plsDPX is `0x…f253ce1` (verified).
   Documented and corrected throughout. Not a residual risk, but the discrepancy itself is worth flagging:
   any downstream tooling keyed on the handed-over address is looking at a dead address.
7. **plsDPX mint authority = 4-of-7 Safe `0xa5c1c5a6`** (can `setOperator` / UUPS-upgrade the minter to code
   that mints unlimited plsDPX). All contracts verified; the only unprovable element is the Safe signers'
   off-chain key custody. Signer set in `plutus/state/live-state.md`.

## General
8. **Live state is a snapshot.** Authorities, balances, pause flags, feeds and prices were read once during
   prep; a privileged key can change any of them between now and the audit. Re-read `state/live-state.*`
   before relying on a value. Values were read from public RPCs and cross-checked where noted.
