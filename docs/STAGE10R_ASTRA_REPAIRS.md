# Stage 10R — Astra Stage-11 Repair Record

> **Historical record.** This document records the Stage-10R repair as it stood before the subsequent limited recheck. That recheck found residual items: primary-source non-absorption remained uncertified, Appendix A.2 still omitted the capture-feasibility qualification, and the generated CSV was not valid three-column CSV when parsed. Those residuals are handled in Stage 10R2. For current status use `docs/STAGE10R2_PRIMARY_SOURCE_AUDIT.md` and `docs/STAGE10R2_REPAIR_RECORD.md`.

Baseline audited by Astra: `main @ f409a8a935857ecf29d83071a6a31301d79c5ec5`.

Astra verdict: `C. MAJOR POSITIONING / EXPOSITION REPAIR` / `ROLLBACK TO STAGE 10`.

Theory freeze remains `ECONOMIDES-THEORY-FREEZE-2026-09-10-v1`; no theorem or baseline model change was authorized in this repair.

## Mandatory-repair ledger as recorded at Stage 10R

The statuses below are retained as historical implementation claims, not as current Stage-11 certification. The later limited recheck superseded the Stage-10R assessment for items 3 and 6 and identified an additional CSV-format defect associated with item 2.

| # | Astra requirement | Stage 10R action | Historical Stage-10R status | Stage-10R2 status |
|---|---|---|---|---|
| 1 | State the domain of the `t>0` rescaling | Define `theta=lambda t`; restrict the exact rescaling to `theta in (1/9,2/9)` and equilibrium-welfare language to `[4/27,2/9)`; derive the exclusion-feasibility condition explicitly | implemented | retained |
| 2 | Fix the `4/21` equality boundary | Split the generated table at `{4/21}`, add `CS_E=CS_S`, change the upper interval to `(4/21,2/9)`, and mark equality in the generated figure | implemented | boundary retained; CSV serialization separately repaired in Stage 10R2 |
| 3 | Complete Bunte/Sorenson model-unit comparison | Add prior-art ledger and narrow firstness claim | implemented with source-access limitations | **not certified**; Stage 10R2 classification is `INSUFFICIENT PRIMARY-SOURCE EVIDENCE` pending full Bunte (1995) and Sorenson (1995) text |
| 4 | Scope “uniqueness characterization” | Replace ambiguous wording with “quality-stage uniqueness characterization at maximal locations” | implemented | retained |
| 5 | Make coverage and ties game rules explicit | State no outside option in the maintained covered game; every consumer buys; fixed measurable tie allocation | implemented | retained |
| 6 | Qualify the price-capture comparison | State firm-specific feasibility conditions in the main results text | implemented | limited recheck found the same qualification missing in Appendix A.2; repaired in Stage 10R2 |
| 7 | Make the numerical quality audit genuinely independent | Primitive utility allocation + quality cost + coarse global BR scans | implemented | retained |
| 8 | Inspect the generated PDF | CI artifact rendered and visually inspected | PASS | to be repeated after Stage-10R2 changes |

## PDF visual-QA record from Stage 10R

The first repaired PDF rendered successfully with no xref/trailer failure, but visual inspection found overlapping labels in Figure 1. This was treated as a Stage-10R defect rather than ignored. The generator and tracked figure were revised to stagger the interval labels vertically and use a compact font while preserving the true relative threshold scale.

The subsequent CI artifact built from repair head `a656aedf45d3fa3811ef21ee091110544e048f44` was downloaded and inspected:

- PDF structure: 16 pages, Letter size, not encrypted;
- fonts embedded;
- all 16 pages rendered successfully;
- no clipped manuscript text, black boxes, broken glyphs, or page-level overlap observed;
- Figure 1 labels were separated and readable;
- the `lambda=4/21` equality point was visibly labeled `CS_E=CS_S`;
- Table 1 gave a separate `{4/21}` equality row and used `(4/21,2/9)` for the strict positive-CS region;
- the rescaling section stated `theta=lambda t`, `theta in (1/9,2/9)`, the exclusion-feasibility inequality, and the coexistence restriction for equilibrium-welfare language.

## Prior-art status after the later limited recheck

The firstness claim remains permanently killed: Bunte already directly criticizes the R&D-stability step in Economides, and Bunte cites Sorenson in connection with the same stability condition.

Stage 10R2 additionally derives an exact parameter mapping from the accessible Bunte (1997) Chapter-3 text. Bunte's stated Hotelling-scenario R&D-stability cutoff maps to `theta>2/9`, not to the present finite-deviation threshold `theta=4/27`. This establishes that those two documented conditions are not algebraically identical.

It still does **not** certify comprehensive non-absorption. The full Bunte (1995) working paper and the full Sorenson (1995) article were not available in the lawful-access search. Therefore the controlling status is `D. INSUFFICIENT PRIMARY-SOURCE EVIDENCE`, as documented in `docs/STAGE10R2_PRIMARY_SOURCE_AUDIT.md`.

## Historical CI record

Repair run `34416599764` at head `59b0d6206757e670b751d845f4d6119aa66c4161` passed exact symbolic verification, primitive-allocation numerical audit, regression tests, deterministic output regeneration, and LaTeX build. After the Figure-1 visual repair, the subsequent run at head `a656aedf45d3fa3811ef21ee091110544e048f44` also passed and built/uploaded the inspected manuscript PDF.

## Current routing

This historical record does not authorize Stage 11 or Lean. Stage 10R2 must complete its residual implementation repairs and validation. Because closest-primary-source coverage remains incomplete, the expected fail-closed outcome is `BLOCKED — PRIMARY SOURCES REQUIRED` unless those sources become available before the Stage-10R2 audit closes.
