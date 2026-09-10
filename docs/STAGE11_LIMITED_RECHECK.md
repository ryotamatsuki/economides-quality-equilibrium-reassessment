# Stage 11 — Limited Hostile Referee Recheck

Canonical baseline: `main @ 4e97da488f13cbea75160e3561e25f2a8140a798`.

Theory freeze: `ECONOMIDES-THEORY-FREEZE-2026-09-10-v1`.

Prior Stage-11 verdict: `C. MAJOR POSITIONING / EXPOSITION REPAIR` with rollback to Stage 10.

Stage-10R repair authority: `docs/STAGE10R_ASTRA_REPAIRS.md`.

Formal-verification authority: `theorem_certificates/STAGE7_5A_FORMAL_VERIFICATION_CERTIFICATE.md` and `EconomidesFormal.lean`.

## Mission

This is a limited Stage-11 recheck, not a new model-development stage. It tests whether the eight Stage-10R repairs close the prior objections, whether the Bunte/Sorenson positioning remains supportable without a firstness claim, whether Stage 10R introduced any new mathematical or claim-scope defect, and whether the manuscript remains consistent with the retroactively closed Formal Verification Gate.

## Recheck findings

### 1. Linear-transport rescaling domain — PASS

`paper/sections/robustness.tex` defines `theta = lambda t`, restricts the exact rescaling to `theta in (1/9,2/9)`, derives the exclusion-feasibility condition explicitly, and confines equilibrium-welfare language to the coexistence region `[4/27,2/9)`. The text explicitly rejects robustness claims for quadratic/arbitrary transportation technologies and arbitrary convex quality costs.

### 2. Consumer-surplus boundary at 4/21 — PASS

The manuscript states the three cases strictly below, exactly at, and strictly above `4/21`. The generated table retains a separate `{4/21}` equality row, and the regression test rejects accidental use of `[4/21,2/9)` for the strict positive-CS region.

### 3. Bunte/Sorenson positioning — HISTORICAL PASS, LATER QUALIFIED IN STAGE 14R

At this recheck, the manuscript no longer claimed first discovery of a stability problem in Economides (1989). Bunte (1995/1997) was treated as the closest prior critique and credited with the R&D-stability objection. Sorenson (1995) was treated as directly relevant to R&D stability before differentiated Bertrand competition.

The surviving manuscript claim was narrower: retain the original noncooperative price game, derive the maximal-location price continuation over the full quality-gap domain, and establish the model-specific `4/27` global-deviation threshold and explicit asymmetric exclusion quality equilibria.

This recheck classified the available evidence as supporting `STRUCTURALLY VERY CLOSE BUT NON-ABSORBING`. That classification is preserved here as the historical Stage-11 conclusion, but a later independent final hostile audit found the non-absorption part too strong because the full texts of Bunte (1995) and Sorenson (1995) had not been independently inspected. Stage 14R therefore supersedes this evidentiary conclusion with: `STRUCTURALLY VERY CLOSE; EXACT OVERLAP UNRESOLVED FOR UNAVAILABLE FULL TEXTS`. See the Stage-14R note at the end of this record and the revised `docs/PRIOR_ART_COMPARISON_STAGE10R.md`.

### 4. Uniqueness scope — PASS

The Introduction, Results, Discussion, and Conclusion consistently qualify the challenged claim as the symmetric quality-stage characterization at maximal locations. The paper explicitly states that the two asymmetric profiles are existence results and does not claim a complete pure quality-equilibrium correspondence.

### 5. Covered-market and tie rules — PASS

`paper/sections/model.tex` states the no-outside-option covered game, nonnegative prices and qualities, and a fixed measurable tie-allocation rule. The off-path pure-price-nonexistence witness is written to allow arbitrary allocation of the relevant positive-measure tie set.

### 6. Full-market price-capture feasibility — PASS

`paper/sections/results.tex` restricts the full-market capture comparisons to cases where the required capture price is nonnegative and explicitly labels the opposite-sign cases infeasible under the maintained nonnegative-price strategy set.

### 7. Independent numerical quality audit — PASS

`verification/numerical_deviation_scan.py` does not evaluate the closed-form P2 gain formula. It reconstructs endpoint price continuations, allocates consumers from primitive utilities, subtracts quality costs, checks the `4/27` boundary from primitive payoffs, and performs coarse global best-response scans for both roles in the asymmetric exclusion profiles.

As an additional limited recheck, representative clean-room numerical scans of primitive-demand price best responses and induced quality payoffs were repeated across interior, boundary, and exclusion cases. No profitable deviation contradicting Lemma 1, Proposition 1, or Proposition 2 was found. The scans reproduced the `4/27` tie and the asymmetric best responses `BR(0)=1/lambda` and `BR(1/lambda)=0` on representative points in the frozen interval. These scans are sanity checks, not substitutes for the analytical proofs or Lean certificate.

### 8. PDF / generated-object repair — PASS

Stage 10R records page-by-page visual inspection of the repaired 16-page PDF after the Figure-1 label repair. Current reproducibility CI continues to rebuild the manuscript and deterministic generated outputs successfully.

## Formal-verification hostile check

### Paper claim -> formal theorem map — PASS AT STAGE 11, COVERAGE CLARIFIED IN STAGE 14R

The formal certificate and `EconomidesFormal.lean` cover a deliberately reduced proof-critical core:

- P2 deviation-gain identity/sign/boundary;
- endpoint price-continuation square identities;
- P3 global best-response inequalities for the two asymmetric roles under the frozen reduced-form continuation;
- W1 welfare-gap identity/ranking;
- W2 consumer-surplus threshold at `4/21`;
- R1 linear-transport threshold core.

The manuscript does not state or imply that the complete consumer continuum, full three-stage game, P1 full-history SPNE nonexistence result, exhaustive equilibrium correspondence, general convex quality costs, or arbitrary transportation technologies have been formally proved.

Stage 14R later makes the R1 units and the formal/non-formal boundary more explicit; it does not alter any Lean-checked mathematical result.

### Formal artifact integrity — PASS

The canonical main merge `4e97da488f13cbea75160e3561e25f2a8140a798` passed post-merge GitHub Actions on `main`:

- reproducibility run `34432142425`: `SUCCESS`;
- lean-formal-verification run `34432142410`: `SUCCESS`.

The Lean gate rejects `sorry`, `admit`, and project-specific `axiom` declarations, checks dependency-lock invariance, and executes `lake build --wfail` under the pinned Lean/mathlib environment.

## New-defect search

No new mathematical contradiction, parameter-domain drift, benchmark-label drift, claim inflation, or stale formal theorem was identified in the Stage-10R manuscript plus retroactive formal-verification integration.

The source-access limitation for Bunte (1995) and Sorenson (1995) remained. Stage 14R subsequently tightened the inference drawn from that limitation; it remains nonblocking only because the manuscript now makes no priority or exact-non-overlap claim.

## Theory drift

`NO THEORY DRIFT`.

No theorem, equilibrium set claim, threshold interpretation, welfare claim, robustness statement, planner benchmark, or equilibrium concept is altered by this recheck.

## Attack classification at the time of Stage 11

- `FATAL`: none.
- `MAJOR BUT FIXABLE`: none.
- `MINOR`: one documentation/provenance item — full-text Bunte (1995)/Sorenson (1995) recheck if access becomes available before submission.

## Canonical Stage-11 verdict at the time

`GO — ROBUSTNESS / REFEREE ATTACK PASS`

## Routing at the time

`GO TO STAGE 12 — JOURNAL POSITIONING`

## Stage 14R superseding evidence note — 2026-09-10

The later final hostile audit did not overturn any mathematical Stage-11 pass. It identified a narrower evidence-scope defect: absence of full-text inspection cannot support a definitive claim that Bunte (1995) or Sorenson (1995) does not contain an equivalent fixed-maximal-location result.

Accordingly:

- the historical `STRUCTURALLY VERY CLOSE BUT NON-ABSORBING` classification is no longer operative;
- Sorenson's reported omission of variety choice is not used to prove non-overlap with the fixed-location quality result;
- the operative statement is: **No equivalent result has been identified in the materials examined; exact overlap remains unresolved**;
- no priority claim is made;
- the generic R&D-stability objection remains acknowledged prior art.

This is an evidentiary narrowing only. It does not change the Stage-11 mathematical conclusions or the frozen model.
