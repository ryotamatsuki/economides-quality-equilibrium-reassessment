# Stage 10R2 — Residual Repair Record

**Previous audited main:** `6a913ea97a0f30ffeb201449d35a7aa50cc52306`  
**Working branch:** `stage10r2-primary-source-repairs`  
**Theory Freeze:** `ECONOMIDES-THEORY-FREEZE-2026-09-10-v1`  
**Required freeze blob:** `20b5b177f0e301e33261c2d11ea4403c187e9b97`

## 1. Purpose

Stage 10R2 responds only to residual objections from the Stage-11 limited recheck. It does not develop a new model, alter a theorem, change the baseline equilibrium concept, self-certify Stage 11, or authorize Lean.

## 2. Residual-objection ledger

| # | Residual objection | Stage-10R2 action | Status |
|---|---|---|---|
| 1 | Bunte/Sorenson non-absorption had been asserted beyond primary-source evidence | Performed source-access audit; built model-unit matrix and parameter mapping; downgraded overall classification to `INSUFFICIENT PRIMARY-SOURCE EVIDENCE`; identified exact missing full texts/pages | implementation complete; external-source blocker remains |
| 2 | Prior-art ledger/manuscript overstated non-absorption | Marked Stage-10R ledger historical/superseded; revised Introduction and Related Literature to retain firstness concession and avoid absence-based novelty inference | PASS |
| 3 | Appendix A.2 omitted capture-price feasibility conditions | Added firm-specific nonnegative capture conditions: firm 1 only for `delta>=0`, firm 2 only for `delta<=0`; clarified empty capture sets on the opposite side | PASS |
| 4 | Generated CSV was malformed because commas in prose were not quoted | Replaced manual string concatenation with Python `csv.writer`; encoded interval openness in the interpretation field; regenerated tracked CSV | PASS |
| 5 | CSV lacked parser-level regression | Added standard-library `csv.reader` round-trip test requiring exactly three columns and all four boundary labels | PASS |
| 6 | Stage-10R record claimed closure too broadly | Marked it explicitly as a historical record and routed current status to Stage 10R2 documents | PASS |

## 3. Changed files

- `docs/STAGE10R2_PRIMARY_SOURCE_AUDIT.md` — new source-access, mapping, and N1–N4 audit.
- `docs/STAGE10R2_REPAIR_RECORD.md` — this record.
- `docs/PRIOR_ART_COMPARISON_STAGE10R.md` — historical status and fail-closed novelty correction.
- `docs/STAGE10R_ASTRA_REPAIRS.md` — historical/superseded status and residual-defect note.
- `paper/sections/introduction.tex` — removes unsupported non-absorption logic and states the narrower equilibrium object.
- `paper/sections/related_literature.tex` — adds exact Bunte-parameter mapping while explicitly avoiding firstness/absence claims.
- `paper/sections/proofs.tex` — Appendix A.2 capture-feasibility repair only.
- `scripts/generate_outputs.py` — standard CSV serialization and explicit interval labels.
- `figures/parameter_regions.csv` — regenerated well-formed CSV.
- `tests/test_regressions.py` — CSV round-trip regression.

## 4. Primary-source conclusion

The Stage-10R2 source audit establishes that Bunte's generic R&D-stability criticism is prior art and cannot be claimed. It also establishes, under the recovered Chapter-3 normalization, that Bunte's stated Hotelling-scenario stability cutoff maps to `theta>2/9`, whereas the present finite-deviation threshold is `theta=4/27`; these documented conditions are not algebraically identical.

However, the audit did not obtain the full Bunte (1995) working paper or the full Sorenson (1995) article. Their unavailable portions therefore cannot be used to certify absence of an equivalent N1–N3 result. The controlling prior-art classification is:

`D. INSUFFICIENT PRIMARY-SOURCE EVIDENCE`.

The source-access details, model-unit matrix, exact parameter mapping, and itemized N1–N4 judgments are in `docs/STAGE10R2_PRIMARY_SOURCE_AUDIT.md`.

## 5. Theory integrity

The branch copy of `theory/THEORY_FREEZE.md` retained blob SHA `20b5b177f0e301e33261c2d11ea4403c187e9b97` after all substantive Stage-10R2 edits. No frozen theorem, baseline domain, `4/27` threshold, asymmetric-equilibrium formula, welfare formula, planner benchmark, or robustness class was changed.

**Theory drift:** `NO`.

## 6. Validation results

Pull-request workflow run `34419717801`, on the complete substantive repair head `808754c26b999c06f4ca20de6403ae3bbb07f052`, completed successfully.

- exact symbolic checks — **PASS**;
- primitive-allocation numerical audit — **PASS**;
- regression tests, including standard-CSV round trip — **PASS**;
- deterministic regeneration — **PASS**;
- generated-output clean-tree check — **PASS**;
- LaTeX build — **PASS**;
- manuscript artifact upload — **PASS**.

The CI artifact `manuscript-pdf` (artifact id `10130472403`) was downloaded independently after the successful run.

### PDF visual QA

The generated `paper/main.pdf` was inspected separately from the CI success signal.

- PDF structure: 17 pages, Letter size, not encrypted;
- fonts: embedded Type-1 Computer Modern fonts;
- all 17 pages rendered successfully at 160 dpi;
- all rendered pages were inspected, first as contact sheets and then at full-page resolution for the repair-sensitive pages;
- no clipped body text, black boxes, broken glyphs, unresolved-reference markers, or page-level overlaps were observed;
- Figure 1 remains readable, preserves the actual `36*lambda` horizontal scale, and visibly marks the `4/21` equality point;
- Table 1 has four distinct regions/points and correctly gives `CS_E=CS_S` at `{4/21}` and `CS_E>CS_S` only on `(4/21,2/9)`;
- the rescaling section visibly states `theta=lambda t`, the `theta in (1/9,2/9)` domain, and the equilibrium-welfare comparison restriction;
- Appendix A.2 visibly states that firm 1's nonnegative capture deviation exists only for `delta>=0` and firm 2's only for `delta<=0`, with the opposite-side capture sets empty;
- Related Literature renders the narrowed Bunte/Sorenson discussion and exact Bunte parameter mapping without layout defects;
- the reference list is complete across pp. 16–17 and has no observed clipping.

The Stage-10R2 page count is 17 rather than the prior Stage-10R 16 pages because the revised literature/proof exposition changes pagination; this is not treated as a defect.

## 7. Remaining blocker

Implementation repairs are closed, but publication-level novelty certification remains blocked by missing primary text:

1. full Bunte (1995), CRIEFF Discussion Paper 9509, especially the model, Hotelling/limit-price quality stages, asymmetry section, and stability appendices;
2. full Sorenson (1995), *Review of Industrial Organization* 10(3), 373–388, especially the model, R&D strategy/cost, Bertrand continuation, stability derivation, asymmetric-equilibrium propositions, and any appendix.

The CRIEFF series page confirms DP 9509 exists but does not mark it as an electronically downloadable paper, and the Springer page exposes only subscription-preview material for Sorenson. No access restriction was bypassed and no external contact or purchase was undertaken.

## 8. Stage-10R2 status and handoff

The implementation portion of Stage 10R2 is complete and reviewable in Draft PR #3. It is **not** a Stage-11 PASS.

Because the closest-source coverage remains incomplete, the fail-closed Stage-10R2 disposition is:

`BLOCKED — PRIMARY SOURCES REQUIRED`.

If lawful copies of the missing Bunte (1995) and Sorenson (1995) full texts become available, the next action is a narrowly scoped completion of the N1–N4 absorption audit followed by an independent Stage-11 limited recheck. Lean formalization remains blocked until that Stage-11 recheck passes.
