# Stage 10R — Astra Stage-11 Repair Record

Baseline audited by Astra: `main @ f409a8a935857ecf29d83071a6a31301d79c5ec5`.

Astra verdict: `C. MAJOR POSITIONING / EXPOSITION REPAIR` / `ROLLBACK TO STAGE 10`.

Theory freeze remains `ECONOMIDES-THEORY-FREEZE-2026-09-10-v1`; no theorem or baseline model change is authorized in this repair.

## Mandatory-repair ledger

| # | Astra requirement | Stage 10R action | Status |
|---|---|---|---|
| 1 | State the domain of the `t>0` rescaling | Define `theta=lambda t`; restrict the exact rescaling to `theta in (1/9,2/9)` and equilibrium-welfare language to `[4/27,2/9)`; derive the exclusion-feasibility condition explicitly | implemented |
| 2 | Fix the `4/21` equality boundary | Split the generated table at `{4/21}`, add `CS_E=CS_S`, change the upper interval to `(4/21,2/9)`, and mark equality in the generated figure | implemented |
| 3 | Complete Bunte/Sorenson model-unit comparison | Add `docs/PRIOR_ART_COMPARISON_STAGE10R.md`; revise Related Literature and Introduction to concede prior R&D-stability criticism while distinguishing the original-game price-continuation result | implemented with source-access limitations recorded |
| 4 | Scope “uniqueness characterization” | Replace ambiguous wording with “quality-stage uniqueness characterization at maximal locations” in Introduction, Results, Discussion, and Conclusion | implemented |
| 5 | Make coverage and ties game rules explicit | State no outside option in the maintained covered game; every consumer buys; fixed measurable tie allocation; off-path nonexistence proof robust to the relevant tie allocation | implemented |
| 6 | Qualify the price-capture comparison | State firm-specific feasibility conditions for nonnegative full-market capture; do not describe negative threshold prices as feasible deviations | implemented |
| 7 | Make the numerical quality audit genuinely independent | Replace direct use of the closed-form gain formula with endpoint price continuation + primitive utility allocation + quality cost; add coarse global BR scans for asymmetric profiles | implemented |
| 8 | Inspect the generated PDF | CI now uploads `paper/main.pdf` as `manuscript-pdf`; visual inspection is required before closing Stage 10R | pending CI artifact inspection |

## Additional regression controls

- `tests/test_regressions.py` now checks the `4/21` equality row and the open interval above it.
- It also checks the exact domain identities behind the linear-transport rescaling: local regular-branch concavity requires `lambda*t>1/9`, while the proposed finite deviation reaches exclusion only when `lambda*t<=2/9`.
- The generated CSV includes an explicit zero-width equality record at `4/21` so the boundary is not silently absorbed into either strict region.

## Prior-art classification after repair

The admissible manuscript claim is narrower than “first correction.” Bunte (1995/1997) already directly criticizes the R&D stability step in Economides, and Bunte attributes the same stability condition to Sorenson (1995). That firstness claim is permanently killed.

The surviving distinction is the equilibrium object: retain the original noncooperative price game, solve the maximal-location price continuation over the full quality-gap domain, and derive the regime-changing global quality deviation, exact `4/27` threshold, and explicit asymmetric exclusion quality equilibria. The evidence and access limitations are recorded in `docs/PRIOR_ART_COMPARISON_STAGE10R.md`.

## Recheck contract

Stage 11 may be re-run only after:

1. CI passes exact symbolic checks, independent numerical audit, regressions, deterministic generation, and LaTeX build;
2. the uploaded manuscript PDF is visually inspected;
3. the limited Astra recheck is given this repair record and the prior-art comparison ledger.

Lean formalization remains blocked until the Stage-11 recheck passes.
