# Stage 9 — restricted P4 repository/reproducibility audit (2026-11-17)

**Verdict: REPRODUCIBILITY BASELINE TECHNICALLY PASS / FORMAL STAGE 9 GO BLOCKED BY STAGE 8.** Author directly confirmed the complete three-case P4 proof explanation on 2026-11-17, so proof-understanding verification is recorded. Literature priority and editorial-nonredundancy remain unresolved; Stage8 entry therefore still blocks formal Stage9 GO.
The canonical Stage9 entry contract requires an actual approved Stage8 theory freeze; the short-note freeze remains CANDIDATE. A green CI is not authorization to certify Stage9 before Stage8.

## Actual repository / reference snapshot

Repo: `ryotamatsuki/economides-quality-equilibrium-reassessment`.
Existing production `main` was checked, not reset; historical 2026-09-10 v1 freeze remains unchanged. PR #12 formal target commit `7427264fa83280256f188045670d171ae0667d69`. PR #13 Stage10A evidence based on PR #12 is draft and is not a newly frozen theory. This branch extends PR #13 with targeted Stage4A/7.5A documentation, author template and exact checking code; it is **not merged to main**.

## Infrastructure

- LaTeX source `paper/` and `references/`, `Makefile`, Python symbolic/regression verification, generated exhibits, Lean `ShortNoteFormal.lean`, pinned `lean-toolchain`, `lake-manifest.json`, `lakefile.toml`, workflows `.github/workflows/lean.yml` and reproducibility workflow.
- CI run 44004302052 at exact P4 formal SHA: SUCCESS incl placeholder/axiom rejection, pinned-dependency check and kernel build.
- CI run 44004302061 at same SHA: SUCCESS incl Python regression tests, reproducibility, manuscript build, and prior RIO variant builds.
- A **new separate exact-rational source-based check** `verification/short_note_independent_audit.py` was run locally on 2026-11-17: PASS, 294 rational opponent-grid audit cases plus six parameter samples and exact symbolic identities.
- CI reproducibility now runs the new P4 test via `tests/test_short_note_p4.py`; Makefile `p4-audit` independently executes it; `verify.yml` placeholder/axiom guard explicitly covers both EconomidesFormal and ShortNoteFormal (repairing an inherited coverage gap). Check latest exact-HEAD PR run status before later GO.
- CI success on old source does not imply CI at this new HEAD until the new run actually passes.
- The previously compiled LaTeX manuscript corresponds to the OLD longer RIO version, not the new Stage10B short note; don't claim the new note's final manuscript exists or has passed build.

## Traceability matrix

| P4 object | Provenance |
|---|---|
| Economic primitive / price-NE bridge | historical theory/THEORY_FREEZE.md and theorem_certificates/STAGE4A_CERTIFICATE.md |
| New complete quality correspondence | theorem_certificates/SHORT_NOTE_STAGE4A_COMPLETE_PURE_NE.md |
| Scope, portability and formal boundary | theorem_certificates/SHORT_NOTE_STAGE75A_COMPLETE_PURE_NE.md |
| Reduced Nash iff Lean code | ShortNoteFormal.lean, exact SHA/CI above |
| Independent math/program check | verification/short_note_independent_audit.py |
| Prior-literature and sibling-claim boundary | docs/SHORT_NOTE_PRIOR_ART_AND_INTERNAL_OVERLAP_20261117.md |
| Author proof review and separate unresolved novelty/editorial judgment | research_provenance/AUTHOR_INTELLECTUAL_CONTRIBUTION_RECORD_SHORT_NOTE.md |
| Candidate theory specification (not frozen) | theory/SHORT_NOTE_REFREEZE_CANDIDATE_20261117.md |
| Exemplar benchmark and writing blueprint | docs/stage10a/ (PR #13 child branch) |

## Technical evidence refreshed 2026-11-17

- Latest fully **completed successful** branch CI reviewed at decision time: run [44014433290](https://github.com/ryotamatsuki/economides-quality-equilibrium-reassessment/actions/runs/44014433290), commit `7192d083f4021004b7b4a84f19c3a67376f76ccc`. This workflow passed the source-connected P4 regression audit, exact symbolic/numerical tests, generated-output determinism, pinned Lean verification, existing LaTeX and flat RIO source-package checks.
- Later documentation commits after this SHA do not change `ShortNoteFormal.lean`, `verification/short_note_independent_audit.py`, `tests/test_short_note_p4.py`, `Makefile`, `requirements.txt`, or `verify.yml`. The updated head CI must still be checked before any final Stage9 GO. Passing the old 18-page RIO manuscript compilation is not evidence that a new short note has been written or built.
- The author has deferred further Bunte/Sorenson full-text acquisition. This has no effect on CI or theorem correctness, but does **not** remove the missing Stage8-entry decision. Therefore record `STAGE9 TECHNICAL PREFLIGHT PASS / CANONICAL GO WITHHELD`.

## Mandatory Stage9 final GO prerequisites

1. Author's substantive P4 proof review: **DONE** (contextual verification recorded). The selected paper form is the short correction note. Still required: reasoned closest-paper distinction / editorial contribution case that does not assume unseen Bunte/Sorenson results or duplicate PR #10, plus verified disposition of any later transfer/submission. Private editorial correspondence is retained outside this public repository.
2. Stage8 **THEORY FROZEN** with valid source freeze SHA and compatible Stage4A/7.5A/full-claim evidence. Any discovery of a substantive defect reopens exact affected scientific gate.
3. Confirm newest remote branch state, and run CI on the exact production freeze branch/head; reconcile generated files and scripts, formal theorem mapping, reproducibility and provenance against new freeze.
4. Stage9 issued `REPRODUCIBILITY BASELINE READY` only after 1–3, then approve Stage10A source register/blueprint anew. Stage10B remains unauthorized until Stage10A GO.

Stage7.5's editor-facing decision is documented in `docs/SHORT_NOTE_STAGE75_EDITORIAL_NOVELTY_GATE_20261117.md` as a CONDITIONAL GO pending one material published-prior-art equivalence test; this is **not** author research-priority certification.

**No Stage9 GO is represented or issued in this document.**
