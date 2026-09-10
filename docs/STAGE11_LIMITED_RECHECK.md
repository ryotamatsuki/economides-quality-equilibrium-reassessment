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

### 3. Bunte/Sorenson positioning — PASS WITH RECORDED SOURCE-ACCESS LIMITATION

The manuscript no longer claims first discovery of a stability problem in Economides (1989). Bunte (1995/1997) is treated as the closest prior critique and is credited with the R&D-stability objection. Sorenson (1995) is treated as directly relevant to R&D stability before differentiated Bertrand competition.

The surviving claim is narrower: retain the original noncooperative price game, derive the maximal-location price continuation over the full quality-gap domain, and establish the model-specific `4/27` global-deviation threshold and explicit asymmetric exclusion quality equilibria.

Available source evidence supports the classification `STRUCTURALLY VERY CLOSE BUT NON-ABSORBING` for that narrow claim. The Bunte 1997 thesis is an official full-text source and the checked Chapter-3 comparison directly discusses Economides; the Bunte 1995 abstract confirms the alternative Hotelling/limit-price scenarios; the Sorenson publisher record confirms product-improving R&D before differentiated Bertrand competition. Full text of Bunte (1995) and Sorenson (1995) was not independently available to this recheck. This is retained as a provenance limitation, not converted into a firstness or exhaustive-prior-art claim. If accessible copies become available before submission, they should be checked as an additional Stage-14 provenance step.

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

### Paper claim -> formal theorem map — PASS

The formal certificate and `EconomidesFormal.lean` cover a deliberately reduced proof-critical core:

- P2 deviation-gain identity/sign/boundary;
- endpoint price-continuation square identities;
- P3 global best-response inequalities for the two asymmetric roles under the frozen reduced-form continuation;
- W1 welfare-gap identity/ranking;
- W2 consumer-surplus threshold at `4/21`;
- R1 linear-transport threshold core.

The manuscript does not state or imply that the complete consumer continuum, full three-stage game, P1 full-history SPNE nonexistence result, exhaustive equilibrium correspondence, general convex quality costs, or arbitrary transportation technologies have been formally proved.

No proof-assistant scope inflation or paper/formal statement drift was found.

### Formal artifact integrity — PASS

The canonical main merge `4e97da488f13cbea75160e3561e25f2a8140a798` passed post-merge GitHub Actions on `main`:

- reproducibility run `34432142425`: `SUCCESS`;
- lean-formal-verification run `34432142410`: `SUCCESS`.

The Lean gate rejects `sorry`, `admit`, and project-specific `axiom` declarations, checks dependency-lock invariance, and executes `lake build --wfail` under the pinned Lean/mathlib environment.

## New-defect search

No new mathematical contradiction, parameter-domain drift, benchmark-label drift, claim inflation, or stale formal theorem was identified in the Stage-10R manuscript plus retroactive formal-verification integration.

The only residual item is the already-recorded inability to independently inspect the full texts of Bunte (1995) and Sorenson (1995). Because the manuscript concedes the generic stability critique, makes no firstness claim, and limits its contribution to the original-game results actually proved, this limitation is not a Stage-11 blocker. It remains a submission-provenance item to revisit if access becomes available.

## Theory drift

`NO THEORY DRIFT`.

No theorem, equilibrium set claim, threshold interpretation, welfare claim, robustness statement, planner benchmark, or equilibrium concept is altered by this recheck.

## Attack classification

- `FATAL`: none.
- `MAJOR BUT FIXABLE`: none.
- `MINOR`: one documentation/provenance item — full-text Bunte (1995)/Sorenson (1995) recheck if access becomes available before submission.

## Canonical Stage-11 verdict

`GO — ROBUSTNESS / REFEREE ATTACK PASS`

## Routing

`GO TO STAGE 12 — JOURNAL POSITIONING`
