# Stage 14 — Submission QA Closeout

Target journal: **Review of Industrial Organization (RIO)**  
Repository: `ryotamatsuki/economides-quality-equilibrium-reassessment`  
Theory freeze: `ECONOMIDES-THEORY-FREEZE-2026-09-10-v1`  
Submission-package content baseline: `a4b53d568fa17fd88972b008e59edaf9f892d4a4`  
Final non-portal QA date: **2026-09-10 JST**

## Executive QA verdict

`CONDITIONAL PASS — AUTHENTICATED PORTAL PREFLIGHT REQUIRED`

Stage 14 is closed under the explicit exception authorized by the canonical Stage-14 workflow: every material non-portal requirement has passed, and all remaining `UNVERIFIED` items genuinely depend on the authenticated Springer Nature submission workflow.

This is not a scientific or manuscript-quality reservation. It is a submission-operations carry-forward into Stage 15.

## 1. Theory and provenance integrity

- Canonical theory freeze remains `ECONOMIDES-THEORY-FREEZE-2026-09-10-v1`.
- No Stage-14 edit changes the model, theorem statements, equilibrium regions, welfare claims, comparative statements, interpretation, or formal-verification scope.
- No new theorem, robustness result, numerical experiment, or substantive claim was introduced.
- Firstness claims remain removed in accordance with the Stage-10R / Stage-11 prior-art repair.
- The Bunte (1995) / Sorenson (1995) full-text access limitation remains a documented provenance limitation and is not represented as having been resolved.

**Theory drift:** `NO THEORY DRIFT`.

## 2. Clean-build and reproducibility result

Exact submission-package content baseline: `a4b53d568fa17fd88972b008e59edaf9f892d4a4`.

GitHub Actions reproducibility run: `34439215461`.

Result: **SUCCESS**.

The final run passed:

- exact symbolic verification;
- independent numerical deviation audit;
- regression tests;
- deterministic output regeneration and clean-diff test;
- pinned Lean toolchain installation;
- rejection of `sorry`, `admit`, and project-specific axioms;
- locked dependency invariance;
- mathlib cache resolution;
- Lean kernel check via `lake build --wfail`;
- canonical manuscript build;
- RIO anonymous flat-package build and compilation;
- RIO identified flat-package build and compilation;
- unresolved citation/reference kill tests;
- clean-source-package debris kill tests;
- PDF embedded-font kill tests;
- artifact generation and upload.

## 3. Formal verification result

The Stage-7.5A formal-verification certificate remains operative. Stage 14 re-ran the pinned Lean/mathlib build from the final submission-package content baseline rather than relying only on the historical formal-verification run.

No proof placeholders or project-specific axioms were accepted. The formalization remains limited to the previously certified proof-critical reduced-form core; Stage 14 does not enlarge the claimed Lean coverage.

Result: **PASS**.

## 4. Figure, table, and numerical-integrity result

The deterministic generation pipeline reproduces the quantitative outputs used in the paper. The manuscript threshold values and signs remain consistent with the frozen theory, including the roles of `4/27`, `4/21`, and `2/9`.

Fig. 1 and Table 1 regenerate from repository sources and are text-referenced, numbered, captioned, and visually legible. The figure does not depend on color alone. PDF fonts are embedded.

Result: **PASS**.

## 5. Bibliography and references

All manuscript citations resolve in the clean RIO package. DOI-bearing references expose full DOI links where available. Cohen and Heifetz (2024) is integrated as the closest recent RIO structural comparison without treating it as absorbing the present endogenous-quality correction.

Result: **PASS**.

## 6. RIO source-package result

The repository retains its modular research layout. A disposable flat RIO upload package is generated mechanically to comply with the journal's no-subfolder LaTeX rule.

Both variants exist and compile independently:

- anonymous manuscript/source package;
- identified manuscript/source package.

The anonymous builder rejects leakage of the author's name, email, ORCID, and authorship-bearing GitHub URL. The identified variant retains the author metadata and public repository link.

Result: **PASS LOCALLY; OPERATIVE VARIANT PENDING PORTAL REVIEW-MODEL CONFIRMATION**.

## 7. Author metadata and declarations

Separate title-page source is prepared with:

- Ryota Matsuki;
- Independent Researcher;
- Matsuyama, Ehime, Japan;
- corresponding-author email;
- ORCID;
- `Acknowledgments: None`;
- no external funding;
- no competing interests.

The manuscript contains Statements and Declarations covering funding, competing interests, sole-author contributions, data/code availability, ethics/consent N/A, and actual non-copyediting generative-AI use with explicit human accountability.

`Acknowledgments: None` was explicitly reconfirmed at final QA and is the authoritative submission metadata.

Result: **PASS LOCALLY; PORTAL METADATA MUST MATCH EXACTLY**.

## 8. Final PDF visual QA

Visual QA was conducted on the actual artifacts produced by final successful run `34439215461`.

Inspected page by page:

- anonymous manuscript: **18 pages**;
- identified manuscript: **18 pages**;
- separate title page: **1 page**.

No clipping, overlap, broken glyphs, unreadable equations, overwide table, malformed reference block, figure/table legibility problem, or title-page layout defect was found. Fig. 1, Table 1, Statements and Declarations, appendical proofs, and References were specifically checked.

Result: **PASS**.

## 9. Refreshed journal-compliance ledger

Canonical ledger: `docs/JOURNAL_REQUIREMENTS_LEDGER.md`.

Current official RIO/Springer sources were refreshed on 2026-09-10. The ledger records source level, operative rule, verification method, artifact/portal mapping, and status.

Every non-portal material item is `PASS` or `NOT APPLICABLE`.

## 10. Authenticated portal-only carry-forward

The following cannot be resolved from current public journal-specific instructions and therefore remain for authenticated Stage-15 preflight:

1. current RIO review/anonymity model and therefore final choice between anonymous and identified manuscript;
2. exact portal article-type label;
3. exact manuscript/title-page/source file designations;
4. mandatory portal-only metadata fields and topic/editor classifications;
5. whether reviewer suggestions/exclusions are required and their exact count/format;
6. whether a cover letter, highlights, or graphical abstract are required by the live workflow despite no public journal-specific requirement found;
7. portal wording for preprint/public-repository declarations;
8. any live submission-fee screen or attestation;
9. exact portal metadata matching for title, abstract, keywords, JEL, funding, competing interests, contribution, and AI/data/code declarations;
10. inspection and approval of the **portal-generated review PDF**.

These are the sole remaining material `UNVERIFIED` items.

## 11. Stage-14 closure decision

Under `research-paper-workflow/templates/STAGE_14_SUBMISSION_QA.md`, Stage 14 may close with a conditional pass when all non-portal checks pass and the remaining requirements can only be resolved in the authenticated submission system.

That condition is satisfied.

### Canonical Stage-14 verdict

**`CONDITIONAL PASS — AUTHENTICATED PORTAL PREFLIGHT REQUIRED`**

### Stage status

**`STAGE 14 CLOSED`**

## 12. Stage-15 contract

Proceed to **Stage 15 — Submission Freeze**, with the following mandatory order:

1. authenticate into the live RIO/Springer submission workflow;
2. resolve every portal-only item listed above;
3. select the correct anonymous/identified package without substantive manuscript change;
4. upload the exact source package and required metadata;
5. inspect the portal-generated review PDF;
6. if the portal reveals a conflicting requirement, make only the bounded compliance repair, rerun affected Stage-14 checks, and create a new freeze candidate;
7. before final immutable freeze/submission, run the planned independent Astra final hostile audit on the exact submission package.

No substantive theory or interpretation change is authorized between this Stage-14 closeout and Stage 15.
