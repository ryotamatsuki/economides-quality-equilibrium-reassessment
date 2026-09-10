# Stage 7.5A — Formal Verification Certificate

## Verdict

`FORMAL VERIFICATION PASS — PROOF-CRITICAL CORE KERNEL-CHECKED`

This certificate retroactively closes the formal-verification component of Stage 7.5A for theory freeze `ECONOMIDES-THEORY-FREEZE-2026-09-10-v1`.

It does **not** reopen or modify the frozen theory. It certifies a proof-critical reduced-form core against the already-frozen analytical derivations and the Stage 7.5A scope certificate.

> Stage 14R clarification (2026-09-10): the R1 rescaling object `scaledP2Gain` is a dimensionless gain normalized by `μt`, whereas the manuscript reports the gain normalized by `μ`. The exact mapping and the formal/non-formal coverage boundary are made explicit below. No mathematical theorem, manuscript formula, threshold, or domain is changed by this clarification.

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

- the exact baseline deviation-gain identity
  `exclusionBestProfit λ - symmetricProfit λ = (4 - 27λ)/(18λ)`;
- strict profitability for `0 < λ < 4/27`;
- equality at `λ = 4/27`.

This certifies the algebra and sign logic underlying the paper's `4/27` baseline global-deviation threshold at maximal locations. It does **not** by itself formalize the complete necessity-and-sufficiency statement that the reported symmetric quality profile is a Nash equilibrium exactly on `[4/27,2/9)`; that full quality-equilibrium characterization remains analytical.

### Endpoint price-continuation identities

The two square identities used in the frozen endpoint price-continuation argument are kernel-checked. These are algebraic revenue-comparison identities supporting the reduced-form boundary used by P2/P3.

Lean does **not** derive the entire price game from primitive consumers or prove existence and uniqueness of the pure price Nash equilibrium for every quality gap. Those steps remain analytical.

### P3 — asymmetric exclusion quality-equilibrium core

For `1/9 < λ < 2/9`, and for all feasible qualities `a ≥ 0`, Lean checks both global best-response inequalities encoded by the frozen piecewise continuation:

1. against opponent quality `0`, quality `1/λ` weakly dominates every feasible deviation;
2. against opponent quality `1/λ`, quality `0` weakly dominates every feasible deviation.

Accordingly, conditional on the already-certified reduced-form piecewise continuation encoded by `payoffAgainstZero` and `payoffAgainstHigh`, the all-nonnegative-deviation inequalities supporting the two asymmetric exclusion equilibria are formally verified.

Lean does not prove that these asymmetric equilibria exhaust the quality-equilibrium set.

### W1 — named-profile welfare comparison

Lean checks the exact algebraic welfare-gap identity and its strict sign between the named symmetric and exclusion profiles over the stated parameter region. The welfare expressions are defined in the formal source; the complete planner problem and derivation of those welfare expressions from primitive allocations are not formalized.

### W2 — named-profile consumer-surplus threshold

Lean checks the defined consumer-surplus-gap identity, the sign below and above `4/21`, and equality at `λ = 4/21`. This certifies the named-profile algebraic threshold, not a general consumer-welfare theorem.

### R1 — exact linear-transport rescaling and unit mapping

The manuscript reports, with `θ = λt`,

`Δπ/μ = (4 - 27λt)/(18λ)`.

The Lean source defines

`scaledP2Gain λ t = (4 - 27λt)/(18λt)`.

Therefore `scaledP2Gain` corresponds to the dimensionless normalization

`scaledP2Gain = Δπ/(μt)`,

and the manuscript and Lean quantities satisfy

`Δπ/μ = t × scaledP2Gain`.

Because the maintained rescaling assumes `t > 0`, the positive factor `t` changes neither the sign nor the zero set. Hence the Lean theorems `r1_scaled_gain_positive` and `r1_scaled_gain_zero` correctly certify the sign and equality threshold `λt = 4/27` for the manuscript gain as well.

The manuscript formula is authoritative for `Δπ/μ` and is **not** to be changed to match the Lean denominator. The Lean denominator reflects the additional normalization by `t`.

## Claim-to-formal-coverage map

| Paper object | Formal status | What Lean checks | What remains outside Lean |
|---|---|---|---|
| Primitive consumer model / demand | **NOT FORMALIZED** | none | utility-to-demand derivation, coverage/tie allocation from primitives |
| Price continuation | **PARTIAL** | endpoint revenue square identities | full price-NE existence/uniqueness and derivation of the complete piecewise continuation |
| `4/27` deviation | **FORMALIZED CORE** | gain identity, strict sign below `4/27`, equality at `4/27` | economic derivation of the payoff formulas from primitives |
| Symmetric quality equilibrium iff `[4/27,2/9)` | **NOT FORMALIZED AS A COMPLETE IFF** | the correction-producing deviation core only | complete necessity/sufficiency/global best-response proof for the symmetric candidate |
| Asymmetric equilibria | **FORMALIZED CONDITIONAL ON ENCODED PIECEWISE PAYOFFS** | all `a ≥ 0` best-response inequalities for both asymmetric roles | derivation of encoded payoff continuation from primitive price subgames; exhaustive equilibrium correspondence |
| Welfare comparison | **FORMALIZED ALGEBRAIC CORE** | defined welfare-gap identity and sign | primitive welfare derivation and planner optimization |
| Consumer-surplus comparison | **FORMALIZED ALGEBRAIC CORE** | defined CS-gap identity/sign/equality at `4/21` | primitive CS derivation and any general welfare theorem |
| Fixed-location planner | **NOT FORMALIZED** | none | planner objective, optimum, equivalence to exclusion profiles |
| Unrestricted first best | **NOT FORMALIZED** | none | planner objective and midpoint optimum |
| Full-history pure-SPNE nonexistence | **NOT FORMALIZED** | none | feasible no-price-NE history and full-game implication |
| Linear-transport rescaling | **FORMALIZED SIGN/ZERO CORE** | sign and equality of `Δπ/(μt)` through `scaledP2Gain` | primitive derivation of the rescaled model and other rescaled welfare/planner claims |

This table is the controlling description of Lean coverage. A green Lean build must not be described as formal verification of the entire consumer model, full price correspondence, complete quality-equilibrium characterization, planner problems, or full three-stage SPNE statement.

## Axiom / placeholder audit

The formal source contains no `sorry`, no `admit`, and no project-specific `axiom` declaration.

The `#print axioms` audit for the principal exported theorems reports only Lean/mathlib's standard logical dependencies such as `propext`, `Classical.choice`, and `Quot.sound`; no `sorryAx` is present.

## CI evidence before certificate-only commits

At branch head `e6fcb4621e4439d3d2b69506da17b2986bc135f9`:

- `lean-formal-verification`, run `34430633600`: **SUCCESS**;
- `reproducibility`, run `34430633612`: **SUCCESS**.

The formal-verification job passed all of the following: toolchain installation, pinned-environment recording, placeholder/axiom rejection, locked-dependency resolution, dependency-lock verification, mathlib cache resolution, and the Lean kernel build under `--wfail`.

Subsequent Stage-14 CI also re-ran the pinned Lean kernel build as part of submission QA. Stage 14R must obtain fresh CI evidence for the current repaired source before the independent limited recheck.

## Explicit non-coverage

For avoidance of doubt, this certificate does **not** claim that Lean formalizes:

- the primitive consumer continuum or demand correspondence;
- existence/uniqueness of the complete price Nash-equilibrium correspondence;
- the complete `if and only if` characterization of the symmetric quality candidate;
- every history of the full three-stage game;
- P1's full-history pure-SPNE nonexistence theorem;
- a complete characterization of all quality equilibria;
- the fixed-location planner problem or unrestricted first best;
- any general convex-cost theorem;
- arbitrary transportation technologies;
- any result outside the quantifiers permitted by `STAGE7_5A_SCOPE_CERTIFICATE.md`.

Those claims remain governed by the frozen analytical proofs, independent adversarial audits, numerical/symbolic checks where applicable, and the Stage 7.5A scope certificate.

## Theory-drift decision

`NO THEORY DRIFT`.

No proposition, parameter region, equilibrium-selection rule, welfare claim, robustness claim, or manuscript conclusion is enlarged or altered by the Stage 14R unit/coverage clarification.

## Formal gate decision

`PASS — STAGE 7.5A FORMAL-VERIFICATION REQUIREMENT SATISFIED FOR THE PROOF-CRITICAL CORE`.
