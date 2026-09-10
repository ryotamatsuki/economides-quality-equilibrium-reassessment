# Stage 10R2 — Residual Repair Record

**Previous audited main:** `6a913ea97a0f30ffeb201449d35a7aa50cc52306`  
**Working branch:** `stage10r2-primary-source-repairs`  
**Theory Freeze:** `ECONOMIDES-THEORY-FREEZE-2026-09-10-v1`  
**Required freeze blob:** `20b5b177f0e301e33261c2d11ea4403c187e9b97`

## 1. Purpose

Stage 10R2 responds only to residual objections from the Stage-11 limited recheck. It does not develop a new model, alter a theorem, change the baseline equilibrium concept, or authorize Lean.

## 2. Residual-objection ledger

| # | Residual objection | Stage-10R2 action | Status before final validation |
|---|---|---|---|
| 1 | Bunte/Sorenson non-absorption had been asserted beyond primary-source evidence | Performed source-access audit; built model-unit matrix and parameter mapping; downgraded overall classification to `INSUFFICIENT PRIMARY-SOURCE EVIDENCE`; identified exact missing full texts/pages | implemented; external-source blocker remains |
| 2 | Prior-art ledger/manuscript overstated non-absorption | Marked Stage-10R ledger historical/superseded; revised Introduction and Related Literature to retain firstness concession and avoid absence-based novelty inference | implemented |
| 3 | Appendix A.2 omitted capture-price feasibility conditions | Added firm-specific nonnegative capture conditions: firm 1 only for `delta>=0`, firm 2 only for `delta<=0`; clarified empty capture sets on the opposite side | implemented |
| 4 | Generated CSV was malformed because commas in prose were not quoted | Replaced manual string concatenation with Python `csv.writer`; encoded interval openness in the interpretation field; regenerated tracked CSV | implemented |
| 5 | CSV lacked parser-level regression | Added standard-library `csv.reader` round-trip test requiring exactly three columns and all four boundary labels | implemented |
| 6 | Stage-10R record claimed closure too broadly | Marked it explicitly as a historical record and routed current status to Stage 10R2 documents | implemented |

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

However, the audit did not obtain the full Bunte (1995) working paper or the full Sorenson (1995) article. Their unavailable portions therefore cannot be used to certify absence of an equivalent N1–N3 result. The controlling prior-art classification is `D. INSUFFICIENT PRIMARY-SOURCE EVIDENCE`.

## 5. Theory integrity

The branch copy of `theory/THEORY_FREEZE.md` still has blob SHA `20b5b177f0e301e33261c2d11ea4403c187e9b97` after the substantive edits. No frozen theorem, baseline domain, `4/27` threshold, asymmetric-equilibrium formula, welfare formula, planner benchmark, or robustness class has been changed.

**Theory drift:** `NO` as of the pre-validation branch state.

## 6. Validation plan / status

The following must pass on the final branch head before this record is closed:

- exact symbolic checks — PENDING;
- primitive-allocation numerical audit — PENDING;
- regression tests including CSV round-trip — PENDING;
- deterministic regeneration — PENDING;
- LaTeX build — PENDING;
- generated manuscript PDF artifact — PENDING;
- render of every PDF page — PENDING;
- visual QA of Figure 1, Table 1, rescaling section, Appendix A.2, Related Literature, references, and equation/page breaks — PENDING;
- final Theory-Freeze blob recheck — PENDING.

## 7. Current blocker

Even if all implementation validation passes, the novelty certification remains blocked by missing primary text:

1. full Bunte (1995), CRIEFF Discussion Paper 9509;
2. full Sorenson (1995), *Review of Industrial Organization* 10(3), 373–388.

The exact sections needed are recorded in `docs/STAGE10R2_PRIMARY_SOURCE_AUDIT.md`.

## 8. Handoff rule

Stage 10R2 implementation completion is not Stage-11 PASS. The final Stage-10R2 outcome must remain fail-closed if the primary-source blocker persists. Lean formalization remains blocked until an independent Stage-11 limited recheck passes.
