# Stage 7.5A — scoped quantifier, portability and Formal Verification certificate (2026-11-17)

**Subject:** only NEW P4 complete quality-NE correspondence for λ∈(1/9,2/9) at fixed endpoint locations. Prior `STAGE7_5A_SCOPE_CERTIFICATE.md` is unchanged and explicitly prohibits claiming completeness under the *old* freeze. New-scoped P4 certification must be consumed with Stage8 change control, not read retroactively into that freeze.

## Entry evidence and actor identity

- Scoped Stage4A P4 analytic/global counterexample audit: `theorem_certificates/SHORT_NOTE_STAGE4A_COMPLETE_PURE_NE.md`.
- Formal kernel CI run 44004302052, exact input commit `7427264fa83280256f188045670d171ae0667d69`, **SUCCESS**; reproducibility run 44004302061, same SHA, **SUCCESS**.
- Formal source `ShortNoteFormal.lean`, locked Lean 4.33.1/mathlib; `complete_pure_quality_NE` proves iff in normalized quality variables x=λa, y=λb. Positive payoff scaling `F(x,y)=18λ² v(x/λ,y/λ)` preserves all best-response comparisons for λ>0.
- Kernel theorem interface relies on global BR predicate `∀z≥0`; supporting necessary/sufficient lemmas explicitly check boundaries and zero qualities. No `sorryAx` or user mathematical axiom was reported; the existing workflow rejects placeholders and builds `lake build --wfail`.
- Verification actors: **AI (source-to-claim bridge check), FORMAL (kernel), COMPUTATION (CI)**; **no AUTHOR verification is claimed**.

## Quantifier contract

| Object | Permitted exact scope | Status |
|---|---|---|
| parameter λ | **strict** 1/9<λ<2/9; cutoff 4/27 included in upper branch | PASS |
| own and rival qualities | all real a_i≥0, unbounded | PASS |
| price game | globally solved at fixed endpoints (0,1), original linear Hotelling, full coverage | inherited analytical certificate; not formally derived from primitives |
| equilibrium concept | all **pure** quality Nash equilibria in reduced fixed-location subgame | PASS |
| P4 correspondence | 2 exclusion NE below 4/27; +1 symmetric NE above/equal cutoff | PASS |
| λ=2/9 continuum | **not within P4's open upper endpoint** | EXCLUDED (appears in broader PR #10, not imported) |
| location choice and full 3-stage SPNE | not covered | EXCLUDED |
| mixed equilibria, outside options, nonlinear transport, general convex costs | not covered | EXCLUDED |
| welfare/planner | not part of this short note | EXCLUDED |

## Portability / adversarial alternatives

The broader antecedent PR #10 contains specific failed extensions:
1. Quartic quality cost `C(a)=λ a^4/4` changes branch-optimum behavior and does not preserve the baseline switch theorem; **no arbitrary-convex-cost claim**.
2. Quality upper bound a_bar<3 prevents the zero-rival high-exclusion response; **unbounded quality domain is necessary to the actual theorem**.

These are inherited *diagnostic* alternatives from the antecedent report and not claimed to be freshly executed in this short-note verification. The complete P4 claim is certified **MODEL-SPECIFIC**: quadratic quality cost, linear transport, full coverage, endpoint locations and pure strategies. Optional exact positive-linear-`t` rescaling is a separately certificated result in PR #10, not a novel robustness result or body claim of this note.

## Theorem ↔ formal mapping and noncoverage

Lean `complete_pure_quality_NE` is a full necessary/sufficient proof for the **encoded reduced payoff**. This improves on the historical old Lean `EconomidesFormal.lean`, which does **not** formalize exhaustive quality NE. The proof does not encode primitive consumer demand, derive piecewise price Nash, or show full-game SPNE. Stage4A supplies the separately audited analytic bridge. No direct novelty or authorship implication follows from Lean.

## Scope and wording decision

Permitted: `we derive the complete pure-strategy quality Nash correspondence at maximal, fixed locations for 1/9<λ<2/9`; `two exclusion equilibria remain when the reported symmetric equilibrium fails`.

Forbidden: `complete equilibrium of Economides's three-stage game`, `unique corrected equilibrium`, `first complete classification`, `no pure equilibria for λ<4/27`, `all equilibria/welfare dominance`, `general convex costs`.

**Scoped Stage7.5A verdict: `GO — GENERALITY / QUANTIFIER / PORTABILITY CERTIFICATION PASS (P4 ONLY)`**; embedded `FORMAL VERIFICATION PASS — REDUCED PAYOFF FULL-IFF, PRIMITIVE MODEL NOT FORMALIZED`. This does not close the Stage8 AUTHOR or literature-overlap requirements.
