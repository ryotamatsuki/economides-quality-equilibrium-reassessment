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
| 8 | Inspect the generated PDF | CI uploads `paper/main.pdf` as `manuscript-pdf`; final 16-page PDF was rendered at 160 dpi and visually inspected page by page | PASS |

## PDF visual-QA record

The first repaired PDF rendered successfully with no xref/trailer failure, but visual inspection found overlapping labels in Figure 1. This was treated as a Stage-10R defect rather than ignored. The generator and tracked figure were revised to stagger the interval labels vertically and use a compact font while preserving the true relative threshold scale.

The subsequent CI artifact built from repair head `a656aedf45d3fa3811ef21ee091110544e048f44` was downloaded and inspected:

- PDF structure: 16 pages, Letter size, not encrypted;
- fonts embedded;
- all 16 pages rendered successfully;
- no clipped manuscript text, black boxes, broken glyphs, or page-level overlap observed;
- Figure 1 labels are separated and readable;
- the `lambda=4/21` equality point is visibly labeled `CS_E=CS_S`;
- Table 1 gives a separate `{4/21}` equality row and uses `(4/21,2/9)` for the strict positive-CS region;
- the rescaling section visibly states `theta=lambda t`, `theta in (1/9,2/9)`, the exclusion-feasibility inequality, and the coexistence restriction for equilibrium-welfare language.

## Additional regression controls

- `tests/test_regressions.py` checks the `4/21` equality row and the open interval above it.
- It also checks the exact domain identities behind the linear-transport rescaling: local regular-branch concavity requires `lambda*t>1/9`, while the proposed finite deviation reaches exclusion only when `lambda*t<=2/9`.
- The generated CSV includes an explicit zero-width equality record at `4/21` so the boundary is not silently absorbed into either strict region.
- The numerical quality audit no longer evaluates the closed-form gain formula. It reconstructs endpoint price continuations, assigns consumers from primitive utilities, subtracts quality costs, compares the reported action with the exclusion deviation, and performs coarse global best-response scans for both asymmetric equilibrium roles.

## Prior-art classification after repair

The admissible manuscript claim is narrower than “first correction.” Bunte (1995/1997) already directly criticizes the R&D stability step in Economides, and Bunte attributes the same stability condition to Sorenson (1995). That firstness claim is permanently killed.

The surviving distinction recorded at Stage 10R was the equilibrium object: retain the original noncooperative price game, solve the maximal-location price continuation over the full quality-gap domain, and derive the regime-changing global quality deviation, exact `4/27` threshold, and explicit asymmetric exclusion quality equilibria. The evidence and access limitations are recorded in `docs/PRIOR_ART_COMPARISON_STAGE10R.md`.

## CI record

Repair run `34416599764` at head `59b0d6206757e670b751d845f4d6119aa66c4161` passed exact symbolic verification, primitive-allocation numerical audit, all regression tests, deterministic output regeneration, and LaTeX build. After the Figure-1 visual repair, the subsequent run at head `a656aedf45d3fa3811ef21ee091110544e048f44` also passed the substantive tests and built/uploaded the inspected manuscript PDF.

## Recheck contract

The Stage-10R implementation repairs are now closed. Stage 11 was to be re-run as a **limited recheck** against the Astra objections rather than as a new model-development stage. The recheck contract was to verify:

1. the eight mandatory repairs above;
2. whether the Bunte/Sorenson evidence is sufficient to certify `STRUCTURALLY VERY CLOSE BUT NON-ABSORBING` for the narrow claimed contribution;
3. that no new claim inflation or mathematical problem was introduced by the repairs.

The Formal Verification Gate was subsequently retroactively closed under Stage 7.5A. Accordingly, the completed Stage-11 limited recheck treats the formal certificate and Lean source as additional hostile-audit targets rather than as a blocker. See `docs/STAGE11_LIMITED_RECHECK.md`.

## Stage 14R superseding limitation — 2026-09-10

A later independent final hostile audit correctly identified that item 2 of the historical recheck contract and the resulting `STRUCTURALLY VERY CLOSE BUT NON-ABSORBING` classification exceeded the evidence available for Bunte (1995) and Sorenson (1995). Full text of those two items had not been independently inspected, and Sorenson's omission of endogenous variety choice does not rule out overlap with a quality game conditioned on maximal locations.

The historical Stage-10R record above is preserved for provenance, but its prior-art classification is no longer operative. The current authority is `docs/PRIOR_ART_COMPARISON_STAGE10R.md` as revised in Stage 14R:

`STRUCTURALLY VERY CLOSE; EXACT OVERLAP UNRESOLVED FOR UNAVAILABLE FULL TEXTS`.

The manuscript makes no priority claim. It states only the original-game results that it derives and proves itself. The generic R&D-stability criticism remains prior art and is not claimed as a contribution.
