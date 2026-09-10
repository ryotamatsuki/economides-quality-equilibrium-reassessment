# Stage 15 — Submission Freeze

## Status

`STAGE 15 IN PROGRESS — AUTHENTICATED PORTAL PREFLIGHT REQUIRED`

Current Stage-15 verdict: `FREEZE BLOCKED` until the authenticated Review of Industrial Organization submission record is inspected and the portal-only requirements listed below are reconciled.

This is not a scientific or manuscript blocker. It is the fail-closed portal gate required by the canonical Stage-15 workflow.

## Authority

Workflow hierarchy:

1. `ryotamatsuki/research-paper-workflow/GOVERNANCE.md` (v2.1)
2. `ryotamatsuki/research-paper-workflow/THEORY_PAPER_RESEARCH_PIPELINE.md` (v2.1)
3. `templates/STAGE_15_SUBMISSION_FREEZE.md`

Target journal: **Review of Industrial Organization**  
Fallback: **Journal of Economics**  
Working title: **Global Quality Deviations and Equilibrium Multiplicity in Spatial Competition: Revisiting Economides (1989)**  
Theory freeze: `ECONOMIDES-THEORY-FREEZE-2026-09-10-v1`

## Stage-15 entry evidence

Canonical manuscript/source candidate:

`97632692448bbca7d45f17e0ac6b5071dec4f52e`

This commit merged PR #7, the bounded M1 Bunte-provenance repair. The independent Astra M1-only limited recheck subsequently returned:

- `M1-CLOSED`
- `NO NEW MATERIAL PROBLEM INTRODUCED`
- `NO THEORY DRIFT`
- `RESIDUAL UNCERTAINTY — NONBLOCKING PROVENANCE LIMITATION`
- `A. LIMITED RECHECK PASS — CLEAR FOR STAGE 15`

M2 and M3 remain closed.

## Frozen-content candidate

The content candidate intended for submission is the repository state at:

`97632692448bbca7d45f17e0ac6b5071dec4f52e`

No theory, equation, proposition, threshold, parameter domain, welfare claim, Lean theorem, figure, table, author metadata, or declaration may be silently changed after final freeze. A later substantive change must reopen the affected workflow stage and create a new freeze identifier.

No submission tag is declared yet. The immutable commit SHA is the current release-candidate identifier. A final freeze identifier/tag may be recorded only after authenticated portal reconciliation confirms which of the anonymous/identified variants and ancillary files are operative.

## Final CI evidence for the candidate

GitHub Actions reproducibility run:

- Run: `34480164184`
- Head SHA: `97632692448bbca7d45f17e0ac6b5071dec4f52e`
- Result: `SUCCESS`

The run passed:

- exact symbolic verification;
- independent numerical audit;
- regression tests;
- deterministic output regeneration and clean-diff check;
- pinned Lean/mathlib dependency verification;
- Lean kernel check;
- canonical LaTeX manuscript build;
- RIO anonymous and identified package builds;
- unresolved citation/reference rejection;
- clean-source-package hygiene;
- PDF font embedding check;
- upload of both manuscript PDFs, title page, and both flat source packages.

## Stage-15 artifact inventory and SHA-256 provenance

All artifacts below derive from GitHub Actions run `34480164184` at exact head `97632692448bbca7d45f17e0ac6b5071dec4f52e`.

| Artifact | GitHub artifact ID | SHA-256 of artifact ZIP | Notes |
|---|---:|---|---|
| RIO anonymous manuscript PDF | `10153388514` | `55d6367ffd9a5489bb3774583573e8dea5afc9721c0583d06e1b96d95fce2467` | 18-page manuscript PDF |
| RIO identified manuscript PDF | `10153389331` | `ea92881de3b1770407f255c5eaf9e6f66ac406a265d00154281cd81c363b4942` | 18-page manuscript PDF with author block |
| RIO title page | `10153390072` | `f0adf7bf60c8e222052536e5a3cf860fa863a96989ea26f41a8d1636488c2011` | separate one-page title page |
| RIO anonymous flat source | `10153390708` | `492d0550050ab60e1a64fcfe35e9ee33935d94f64a07c6e31ab37b3d94947a9a` | 15-file flat LaTeX source archive |
| RIO identified flat source | `10153391324` | `c31260af11792a07bb549d760e8080cb6343da073100a8cb2b55b642804084a9` | 15-file flat LaTeX source archive |

The downloaded artifact ZIPs were independently hashed during Stage 15 and the computed SHA-256 values matched GitHub's artifact digests exactly.

### Flat source-package inventory

Both source variants contain 15 top-level files and no subfolders:

- `main.tex`
- `introduction.tex`
- `model.tex`
- `results.tex`
- `welfare.tex`
- `robustness.tex`
- `interpretation.tex`
- `related_literature.tex`
- `discussion.tex`
- `conclusion.tex`
- `proofs.tex`
- `research_transparency.tex`
- `parameter_regions_figure.tex`
- `parameter_regions_table.tex`
- `references.bib`

The anonymous and identified archives differ only where identification/blinding requires it.

## Stage-15 independent PDF visual QA

The exact CI artifacts from run `34480164184` were downloaded and rendered at 200 dpi.

Inspected:

- anonymous manuscript: all 18 pages;
- identified manuscript: all 18 pages;
- separate title page: 1 page.

Result: `VISUAL QA PASS`.

No clipping, overlap, missing glyph, unreadable equation, malformed reference, broken figure/table, declaration-layout defect, or title-page defect was observed. Figure 1 and Table 1 remain legible after the M1 provenance repair. The identified first page correctly displays the intended author block; the anonymous first page contains no author block.

PDF preflight also confirmed all three PDFs are openable, unencrypted, and non-scanned.

## Intended submission metadata

Sole author: Ryota Matsuki  
Affiliation/title-page form: Independent Researcher, Matsuyama, Ehime, Japan  
Corresponding author: Ryota Matsuki  
E-mail: ryota.matsuki@gmail.com  
ORCID: 0009-0005-2329-531X  
Acknowledgments: None.  
Funding: This research received no external funding.  
Competing interests: The author declares no competing interests.  
JEL: C72; D43; L13; R32

Author contribution statement and the generative-AI, data/code, and ethics statements are preserved in `paper/sections/research_transparency.tex` and must be reconciled verbatim in substance with any corresponding portal fields.

## RIO public-source refresh — 2026-09-10 JST

The current official RIO submission guidelines were reopened during Stage 15. The public requirements relevant to the package remain materially consistent with the Stage-14 ledger:

- all relevant editable source files are required at every submission/revision;
- mathematical manuscripts may be submitted in LaTeX;
- LaTeX submissions must not use subfolders;
- uploaded LaTeX source files are automatically compiled into a single PDF that the author must approve at the end of the submission process;
- title-page author information, an active corresponding e-mail, and ORCID if available are requested;
- abstract length is 150–250 words;
- 4–6 keywords and JEL codes are required;
- relevant Statements and Declarations are required;
- Author Contribution and Competing Interest information must also be supplied through the submission interface;
- full DOI links should be included where available.

The public RIO page currently exposes a `Submit your manuscript` route through `submission.nature.com`, which redirects to the Springer Nature submission system. The authenticated submission record itself has not yet been inspected.

## Authenticated portal preflight — REQUIRED / NOT YET COMPLETED

The following remain fail-closed because they are properties of the actual authenticated portal rather than the public journal page:

1. exact article-type label;
2. current RIO review/anonymity model;
3. whether the operative main-document upload must be anonymous or identified;
4. title-page handling and separate author-information-file requirement;
5. exact file designations for manuscript/source/title page/figures/tables/ancillary files;
6. whether a cover letter is mandatory, optional, or text-only;
7. reviewer suggestion/exclusion fields;
8. editor/section/topic/classification fields;
9. exact treatment of an unaffiliated/independent author in the affiliation metadata fields;
10. prior-publication/preprint/public-repository declarations;
11. funding, competing-interest, CRediT, AI, data/code, ethics and author-attestation portal wording;
12. any submission-fee step or confirmation;
13. portal warnings;
14. portal-generated review PDF and its author-approval requirement;
15. final submission confirmation.

These items are not inferred from generic Springer behavior. They must be read from the actual authenticated submission record.

## Cover letter

A conservative RIO cover-letter draft is prepared at `submission/RIO_COVER_LETTER.md`. It is a portal-ready ancillary draft, not evidence that RIO currently requires a cover letter. Upload/designation remains portal-dependent.

## Kill-test status

Scientific/substantive kill tests: PASS.  
Artifact provenance: PASS.  
Exact-head CI: PASS.  
Final local PDF visual QA: PASS.  
Public journal-guideline refresh: PASS.  
Authenticated portal reconciliation: **NOT COMPLETED**.  
Portal-generated PDF inspection: **NOT COMPLETED**.

Because material portal-only requirements remain `UNVERIFIED`, the Stage-15 template does not permit declaring `SUBMISSION FROZEN` or `SUBMITTED` yet.

## Current Stage-15 verdict

`FREEZE BLOCKED — AUTHENTICATED PORTAL PREFLIGHT REQUIRED`

This is an operational hold only. The current candidate `97632692448bbca7d45f17e0ac6b5071dec4f52e` is scientifically and locally submission-ready.

## Next-stage contract within Stage 15

Open the actual authenticated RIO submission record and complete the portal preflight in `templates/STAGE_15_SUBMISSION_FREEZE.md` before final submission.

If the portal requires no content-changing repair, update this record with:

- operative article type;
- operative anonymous/identified choice;
- final upload/designation inventory;
- reconciled portal metadata/declarations;
- portal-generated PDF inspection result;
- final freeze identifier;
- final submission status and confirmation evidence.

If the portal requires a bounded content/compliance change, do not patch the freeze silently. Return to Stage 14 for the affected compliance repair, rerun the affected checks, obtain any necessary limited recheck, and create a new Stage-15 candidate.

If the portal requires no substantive change but only administrative designations/metadata entry, complete those within Stage 15 and proceed to final freeze/submission after the generated PDF is inspected.
