# Stage 7.5A — Formal Verification Certificate

## Verdict

`FORMAL VERIFICATION PASS — PROOF-CRITICAL CORE KERNEL-CHECKED`

This certificate retroactively closes the formal-verification component of Stage 7.5A for theory freeze `ECONOMIDES-THEORY-FREEZE-2026-09-10-v1`.

It does **not** reopen or modify the frozen theory. It certifies a proof-critical reduced-form core against the already-frozen analytical derivations and the Stage 7.5A scope certificate.

## Certified environment

- Lean: `leanprover/lean4:v4.33.1`
- mathlib revision: `v4.33.1` / resolved commit recorded by `lake-manifest.json`
- formal source: `EconomidesFormal.lean`
- dependency inputs: `lean-toolchain`, `lakefile.toml`, `lake-manifest.json`
- CI workflow: `.github/workflows/lean.yml`

The CI gate rejects `sorry`, `admit`, and project-specific `axiom` declarations, verifies that the dependency lock is current after `lake update`, and executes `lake build --wfail`.

## Kernel-checked proof-critical claims

The Lean artifact machine-checks the following mathematical core.

### P2 — correction-producing global quality deviation

- the exact deviation-gain identity
  `exclusionBestProfit λ - symmetricProfit λ = (4 - 27λ)/(18λ)`;
- strict profitability for `0 < λ < 4/27`;
- equality at `λ = 4/27`.

This certifies the algebra and sign logic underlying the paper's `4/27` baseline global-best-response threshold at maximal locations.

### Endpoint price-continuation identities

The two square identities used in the frozen endpoint price continuation are kernel-checked. These checks support the reduced-form payoff boundary used by P2/P3.

### P3 — asymmetric exclusion quality-equilibrium core

For `1/9 < λ < 2/9`, and for all feasible qualities `a ≥ 0`, Lean checks both global best-response inequalities encoded by the frozen piecewise continuation:

1. against opponent quality `0`, quality `1/λ` weakly dominates every feasible deviation;
2. against opponent quality `1/λ`, quality `0` weakly dominates every feasible deviation.

Accordingly, the reduced-form best-response core supporting the asymmetric exclusion equilibria is formally verified.

### W1 — welfare comparison

Lean checks the exact welfare-gap identity and strict welfare ranking between the named symmetric and exclusion profiles over the stated parameter region.

### W2 — consumer-surplus threshold

Lean checks the exact consumer-surplus-gap identity, the sign below and above `4/21`, and equality at `λ = 4/21`.

### R1 — linear-transport rescaling

Lean checks the sign and zero conditions for the exact scaled P2 gain with the product `λt`, including the threshold `λt = 4/27`.

## Axiom / placeholder audit

The formal source contains no `sorry`, no `admit`, and no project-specific `axiom` declaration.

The `#print axioms` audit for the principal exported theorems reports only Lean/mathlib's standard logical dependencies such as `propext`, `Classical.choice`, and `Quot.sound`; no `sorryAx` is present.

## CI evidence before certificate-only commits

At branch head `e6fcb4621e4439d3d2b69506da17b2986bc135f9`:

- `lean-formal-verification`, run `34430633600`: **SUCCESS**;
- `reproducibility`, run `34430633612`: **SUCCESS**.

The formal-verification job passed all of the following: toolchain installation, pinned-environment recording, placeholder/axiom rejection, locked-dependency resolution, dependency-lock verification, mathlib cache resolution, and the Lean kernel build under `--wfail`.

Certificate-only documentation commits made after this evidence do not alter `EconomidesFormal.lean` or the theory freeze; nevertheless, the PR must remain unmerged until its final head also passes the configured CI gates.

## Explicit non-coverage

This certificate does **not** claim that Lean formalizes:

- the complete consumer continuum from primitives;
- every history of the full three-stage game;
- P1's full-history pure-SPNE nonexistence theorem;
- a complete characterization of all quality equilibria;
- any general convex-cost theorem;
- arbitrary transportation technologies;
- any result outside the quantifiers permitted by `STAGE7_5A_SCOPE_CERTIFICATE.md`.

Those claims remain governed by the frozen analytical proofs, independent adversarial audits, and the Stage 7.5A scope certificate.

## Theory-drift decision

`NO THEORY DRIFT`.

No proposition, parameter region, equilibrium-selection rule, welfare claim, robustness claim, or manuscript conclusion is enlarged by this certificate.

## Formal gate decision

`PASS — STAGE 7.5A FORMAL-VERIFICATION REQUIREMENT SATISFIED FOR THE PROOF-CRITICAL CORE`.
