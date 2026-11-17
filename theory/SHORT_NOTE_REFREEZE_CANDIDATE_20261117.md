# Theory Re-freeze Candidate — restricted pure-quality P4

**State: DRAFT / NOT FROZEN. No Stage 8 GO, no replacement of `theory/THEORY_FREEZE.md`.**
Date 2026-11-17 JST. Proposed freeze ID: `ECONOMIDES-SHORT-NOTE-P4-REFREEZE-2026-11-17-CANDIDATE` (never use as an operative frozen ID until gate closure).

## Inherited source and exact change

The canonical historical freeze `ECONOMIDES-THEORY-FREEZE-2026-09-10-v1` prohibits a complete quality-equilibrium correspondence; this candidate **changes only that prohibition for the newly certified P4 domain**, while preserving the earlier P1–P3/W1/W2/R1 scope and explicit restrictions for all other theorems. The short-note manuscript will make no welfare or full-SPNE claim. The expanded headline therefore requires its own current Stage4A and Stage7.5A certificates, not silent inheritance.

## Economic model and equilibrium concept

Two firms at fixed ℓ1=0, ℓ2=1, continuum of z∈[0,1] at density μ>0, full market coverage, utility `k+a_i−p_i−|z−ℓ_i|`, zero variable production cost, quality cost `c a_i²/2`; a_i≥0 unbounded and p_i≥0. λ=c/μ; restrict P4 to 1/9<λ<2/9. Firms simultaneously choose qualities, then simultaneously choose prices after qualities. Pure Nash equilibrium of the **reduced quality game**, evaluated after the original three-branch global pure price continuation at every quality profile. No continuum-consumer demand or price-stage history is represented as Lean-formalized.

With δ=a−b:
- price NE `(0,-δ-1)` for δ≤−3, `(1+δ/3,1−δ/3)` for |δ|≤3, `(δ−1,0)` for δ≥3;
- own normalized payoff `v(a,b)=−λa²/2` for a−b≤−3, `[1+(a−b)/3]²/2−λa²/2` for |a−b|≤3, and `a−b−1−λa²/2` for a−b≥3 (coincident boundary values).

## Proposed frozen result and classification

**P4 — COMPLETE PURE QUALITY NE CORRESPONDENCE AT FIXED MAXIMAL LOCATIONS (analytic PROVED, formal FULL REDUCED PAYOFF IFF):**

```
1/9<λ<4/27  : {(1/λ,0),(0,1/λ)}
4/27≤λ<2/9 : {(1/λ,0),(0,1/λ),(1/(3λ),1/(3λ))}
```

Exact kink/threshold included λ=4/27; domain excludes 1/9 and 2/9. Nonnegative deviations are unrestricted. The symmetric pair is NOT absent for every λ; and absence of the symmetric pair is NOT nonexistence of all pure quality NE. The complete claim **does not** include PR #10 all-positive-λ correspondence or its λ=2/9 continuum.

## Proof, provenance and allowed economic inference

Necessary/sufficient analytic proof and independent exact-rational checks: `theorem_certificates/SHORT_NOTE_STAGE4A_COMPLETE_PURE_NE.md` and `verification/short_note_independent_audit.py`. Lean theorem `ShortNoteFormal.complete_pure_quality_NE` under x=λa,y=λb and positive scaling F=18λ² v; formal source commit 7427264fa83280256f188045670d171ae0667d69, CI 44004302052 **PASS**. Exact upper bound, cutoff, λ domain, excluded branch logic and support restrictions in `theorem_certificates/SHORT_NOTE_STAGE75A_COMPLETE_PURE_NE.md`. Substantive original-game economic conclusion: global quality investment can exclude the rival even when both locally choose positive quality; there remain two asymmetrically specialized quality NE below the symmetric cutoff.

**Proof boundary:** Lean's encoded reduced payoff is assumed; primitive demand, full price equilibrium, true three-stage SPNE, pure location NE and mixed equilibria not certified by P4. P1 older supporting no-full-SPNE claim must never be reinterpreted as P4's implication. No unsupported broad model generality or policy conclusions.

## Closest prior work and priority

Original Economides (1989) eqs 8–9 and Theorem 2 inspected directly. Bunte (1997) already critiques the quality/R&D stability. Bunte (1995) and Sorenson (1995) exact overlap unresolved due to original full-text access. Cohen–Heifetz (2024) model differs in exogenous quality and transport assumptions. Author's own broader PR #10 already contains the restricted P4 result. Hence **no 'first', 'novel critique', or no prior equivalent' claim**. See `docs/SHORT_NOTE_PRIOR_ART_AND_INTERNAL_OVERLAP_20261117.md`.

## Counterexamples / portability / excluded scope

Inherited diagnostic counterexamples: quartic quality cost and bounded quality <3 defeat naive transfer of this P4 result. Thus model-specific only. No arbitrary convex cost, nonlinear transport, outside option, more firms, endogenous entry, incomplete coverage, mixed equilibrium, endogenous location, or full-game SPNE correspondence. Welfare and planner results are not adopted as short-note claims. Price continuation is inherited only for exact primitives.

## Gate dependency status

- Scoped P4 Stage4A: **GO** as AI analytical/adversarial certification plus FORMAL and independent exact-rational checks, no external/author review.
- Scoped P4 Stage7.5A: **GO** for model-specific quantifier and Lean reduced-payoff full iff. Requires previous analytic price continuation bridge.
- Formal Verification Gate: **PASS** at 742726... under exact encoded reduced game.
- Stage6 literature novelty: **strong priority NOT certified** (Bunte/Sorenson source limits; internal paper overlap). Honest descriptive correction positioning only.
- `AUTHOR_INTELLECTUAL_CONTRIBUTION_RECORD`: **MISSING**.
- Existing Stage7.5 contribution-completeness / editorial-value decision for P4 short-note as a distinct paper: **not signed by author**.
- Formal Stage8: **FREEZE BLOCKED** pending author substantive reasoning/selection and resolution of material paper redundancy and any Stage6 hard novelty risk (old RIO consideration no longer active as of 2026-11-17, but later transfer/submission not verified). No `THEORY FROZEN` verdict.

## Change control and next-stage linkage

Existing frozen v1 remains operative on main. New P4 cannot be pasted into the old freeze while old P4-exclusion wording is retained. Only after the real author record and novelty/editorial compatibility are closed: record approved freeze date, ID and immutable commit, reconcile old vs new certified claims, preserve proof/limits and update `theory/THEORY_FREEZE.md` through reviewed change-control PR; then Stage9 can issue its own reproducibility verdict. Stage10A blueprint `docs/stage10a/MANUSCRIPT_BLUEPRINT.md` remains provisional and must be checked against approved freeze.
