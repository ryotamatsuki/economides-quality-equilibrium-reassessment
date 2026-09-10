# Stage 7.5A — Retroactive Formal-Verification Closure

## Purpose

This record closes the formal-verification omission in the original Stage 7.5A workflow for `ECONOMIDES-THEORY-FREEZE-2026-09-10-v1` without reopening the frozen theory.

The governing scope authority remains:

- `theorem_certificates/STAGE7_5A_SCOPE_CERTIFICATE.md`.

The formal-proof authority is:

- `theorem_certificates/STAGE7_5A_FORMAL_VERIFICATION_CERTIFICATE.md`;
- `EconomidesFormal.lean`;
- `.github/workflows/lean.yml`.

> Stage 14R clarification (2026-09-10): this historical closure remains valid, but the formal-verification certificate now gives the controlling fine-grained coverage map and the unit mapping for the linear-transport rescaling. In particular, Lean's `scaledP2Gain` is `Δπ/(μt)`, while the manuscript reports `Δπ/μ = t × scaledP2Gain`. No theory or theorem changes.

## Closure logic

The paper is a correction/reassessment paper containing proof-critical claims about a published equilibrium result, a global deviation threshold, asymmetric quality equilibria, welfare comparisons, and parametric robustness. Under the current research-paper workflow, those claims warrant a formal-verification gate.

Rather than formalizing the entire economic environment from primitive consumer histories, the retroactive gate isolates the proof-critical reduced-form boundary already frozen by the analytical audit and machine-checks selected identities, signs, and piecewise best-response inequalities on which the manuscript's correction claims depend.

This is deliberately narrower than a full mechanization of the complete three-stage game. The distinction is substantive and must be preserved in all future descriptions of the verification status.

## What is formally closed

The Lean artifact verifies the following frozen proof-critical core:

1. P2 baseline deviation-gain identity, positivity below `4/27`, and the boundary tie;
2. endpoint price-continuation revenue square identities;
3. P3 global best-response inequalities supporting the asymmetric exclusion quality equilibria over `1/9 < λ < 2/9` and feasible qualities `a ≥ 0`, conditional on the encoded piecewise payoff functions;
4. W1 defined named-profile welfare-gap identity and sign;
5. W2 defined named-profile consumer-surplus identity/sign/equality at `4/21`;
6. R1 sign and zero of the dimensionless gain `scaledP2Gain = Δπ/(μt)`, with threshold `λt = 4/27`.

For R1 the manuscript quantity is

`Δπ/μ = (4 - 27λt)/(18λ) = t × scaledP2Gain`.

Since `t > 0`, this positive rescaling preserves sign and the zero set. The manuscript denominator is not changed.

The Lean source is subject to automated rejection of `sorry`, `admit`, and project-specific axioms and is built under pinned Lean/mathlib dependencies with `lake build --wfail`.

## What remains analytical rather than Lean-formalized

The following are not reclassified as formally proved:

- the primitive consumer-continuum and demand derivation;
- existence and uniqueness of the complete piecewise price Nash-equilibrium correspondence;
- the complete necessary-and-sufficient symmetric quality-equilibrium condition `[4/27,2/9)`;
- derivation of the encoded asymmetric piecewise payoffs from primitive price subgames;
- exhaustive characterization of all quality equilibria;
- primitive derivation of welfare and consumer-surplus expressions;
- the fixed-location planner problem and unrestricted first-best problem;
- the complete full-history three-stage game;
- P1 pure-SPNE nonexistence under the modern full-history interpretation;
- any theorem for general convex quality costs;
- robustness to arbitrary transportation technologies.

The detailed and controlling statement-fidelity boundary is in `theorem_certificates/STAGE7_5A_FORMAL_VERIFICATION_CERTIFICATE.md`.

## CI and merge evidence

Before certificate-only documentation commits, head `e6fcb4621e4439d3d2b69506da17b2986bc135f9` passed:

- Lean formal verification: GitHub Actions run `34430633600` — **SUCCESS**;
- existing reproducibility gate: GitHub Actions run `34430633612` — **SUCCESS**.

The dedicated Stage 7.5A PR was subsequently merged into `main` at merge commit:

`4e97da488f13cbea75160e3561e25f2a8140a798`.

The canonical post-merge `main` state then passed both configured gates:

- reproducibility run `34432142425` — **SUCCESS**;
- lean-formal-verification run `34432142410` — **SUCCESS**.

Stage 14 subsequently re-ran the pinned Lean kernel build in its submission-QA workflow. Stage 14R must obtain fresh build evidence for the clarified source before independent limited recheck.

## Theory-drift audit

`NO THEORY DRIFT`.

No frozen economic proposition, quantifier, threshold interpretation, welfare statement, robustness statement, or equilibrium-selection claim is changed by either the retroactive closure or the Stage 14R clarification.

## Stage decision

`FORMAL VERIFICATION PASS — RETROACTIVE STAGE 7.5A CLOSURE COMPLETE`.
