# Stage 7.5A — Retroactive Formal-Verification Closure

## Purpose

This record closes the formal-verification omission in the original Stage 7.5A workflow for `ECONOMIDES-THEORY-FREEZE-2026-09-10-v1` without reopening the frozen theory.

The governing scope authority remains:

- `theorem_certificates/STAGE7_5A_SCOPE_CERTIFICATE.md`.

The formal-proof authority is:

- `theorem_certificates/STAGE7_5A_FORMAL_VERIFICATION_CERTIFICATE.md`;
- `EconomidesFormal.lean`;
- `.github/workflows/lean.yml`.

## Closure logic

The paper is a correction/reassessment paper containing proof-critical claims about a published equilibrium result, a global deviation threshold, asymmetric quality equilibria, welfare comparisons, and parametric robustness. Under the current research-paper workflow, those claims warrant a formal-verification gate.

Rather than formalizing the entire economic environment from primitive consumer histories, the retroactive gate isolates the proof-critical reduced-form boundary already frozen by the analytical audit and machine-checks the identities, sign restrictions, piecewise best-response inequalities, welfare thresholds, and exact linear rescaling on which the manuscript's correction claims depend.

This is deliberately narrower than a full mechanization of the complete three-stage game. The distinction is substantive and must be preserved in all future descriptions of the verification status.

## What is formally closed

The Lean artifact verifies the following frozen proof-critical core:

1. P2 deviation-gain identity, positivity below `4/27`, and the boundary tie;
2. endpoint price-continuation square identities;
3. P3 global best-response inequalities supporting the asymmetric exclusion quality equilibria over `1/9 < λ < 2/9` and feasible qualities `a ≥ 0`;
4. W1 welfare-gap identity and ranking for the named profiles;
5. W2 consumer-surplus threshold at `4/21`;
6. R1 exact linear-transport scaling with threshold `λt = 4/27`.

The Lean source is subject to automated rejection of `sorry`, `admit`, and project-specific axioms and is built under pinned Lean/mathlib dependencies with `lake build --wfail`.

## What remains analytical rather than Lean-formalized

The following are not reclassified as formally proved:

- the complete consumer-continuum derivation from primitives;
- the complete full-history three-stage game;
- P1 pure-SPNE nonexistence under the modern full-history interpretation;
- exhaustive characterization of all quality equilibria;
- any theorem for general convex quality costs;
- robustness to arbitrary transportation technologies.

These remain covered only to the extent established by the frozen manuscript, prior clean-room derivations, reproducibility artifacts, and adversarial audits.

## CI and merge evidence

Before certificate-only documentation commits, head `e6fcb4621e4439d3d2b69506da17b2986bc135f9` passed:

- Lean formal verification: GitHub Actions run `34430633600` — **SUCCESS**;
- existing reproducibility gate: GitHub Actions run `34430633612` — **SUCCESS**.

The dedicated Stage 7.5A PR was subsequently merged into `main` at merge commit:

`4e97da488f13cbea75160e3561e25f2a8140a798`.

The canonical post-merge `main` state then passed both configured gates:

- reproducibility run `34432142425` — **SUCCESS**;
- lean-formal-verification run `34432142410` — **SUCCESS**.

The retroactive formal closure is therefore operationally complete, not merely authorized.

## Theory-drift audit

`NO THEORY DRIFT`.

No frozen economic proposition, quantifier, threshold interpretation, welfare statement, robustness statement, or equilibrium-selection claim is changed by this retroactive closure.

## Stage decision

`FORMAL VERIFICATION PASS — RETROACTIVE STAGE 7.5A CLOSURE COMPLETE`.