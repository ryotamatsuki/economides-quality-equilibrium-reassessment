# Stage 14 — Submission QA Closeout

Target journal: **Review of Industrial Organization (RIO)**  
Closeout date: **2026-09-10 JST**  
Submission-package content baseline: `9c78ab3cfc234e2b56ce146170e2cadc08b5199e`  
Theory freeze: `ECONOMIDES-THEORY-FREEZE-2026-09-10-v1`  
Stage-14 requirements ledger: `docs/JOURNAL_REQUIREMENTS_LEDGER.md`

## 1. Scope

This stage is a submission-quality audit, not a theory-development stage. No Stage-14 change is authorized to alter the economic model, theorem statements, equilibrium regions, welfare results, robustness scope, or formal-verification scope.

Result: **NO THEORY DRIFT**.

## 2. Canonical submission content

The canonical Stage-14 submission-package content baseline is:

`9c78ab3cfc234e2b56ce146170e2cadc08b5199e`

At that baseline the RIO package contains:

- anonymous manuscript source and compiled PDF;
- identified manuscript source and compiled PDF;
- separate title page;
- clean flat LaTeX source packages satisfying the no-subfolder constraint;
- reproducibility code and generated-table/figure pipeline;
- pinned Lean 4 / mathlib formal-verification environment and certificates.

The separate anonymous and identified variants are deliberately retained because the current RIO review/anonymity model cannot be established from the public journal instructions alone.

## 3. Automated final QA

GitHub Actions reproducibility run **34441724542** on the exact submission-package baseline `9c78ab3cfc234e2b56ce146170e2cadc08b5199e` completed successfully.

The run passed all of the following gates:

1. exact symbolic verification;
2. independent numerical audit;
3. regression tests;
4. deterministic output regeneration and diff check;
5. pinned Lean toolchain installation;
6. rejection of `sorry`, `admit`, and project-specific axioms;
7. pinned dependency-lock verification;
8. Lean kernel build via `lake build --wfail`;
9. canonical manuscript LaTeX build;
10. clean anonymous and identified RIO source-package builds;
11. rejection of unresolved LaTeX citations/references;
12. rejection of build debris in clean upload packages;
13. PDF font-embedding check;
14. upload of both manuscript PDFs, title page, and both flat source packages.

No mathematical, formal-verification, reproducibility, citation-resolution, package-structure, or font-embedding blocker remains.

## 4. Visual PDF QA

The final manuscript was rendered and inspected page by page.

- anonymous manuscript: **18 pages inspected — PASS**;
- title/abstract and body typography: **PASS**;
- equations and displayed expressions: **PASS**;
- Fig. 1 on page 8: **PASS**;
- Table 1 on page 9: **PASS**;
- references and DOI rendering: **PASS**;
- clipping, overlap, broken glyphs, unreadable objects: **none detected**;
- identified manuscript first page: **PASS**;
- final separately generated title page after acknowledgment correction: **PASS**.

The final title page contains the author metadata, corresponding-author information, ORCID, Funding and Competing Interests statements, and the acknowledgment:

> The author is grateful to Hiroshi Kinokuni and Takao Ohkawa for their guidance during his undergraduate studies.

## 5. Manuscript / journal compliance

The manuscript/package satisfies every Stage-14 item that can be verified from the current public RIO/Springer Nature instructions without entering the authenticated submission workflow, including:

- editable LaTeX source availability;
- flat/no-subfolder upload structure;
- 150–250-word abstract;
- 4–6 keywords;
- JEL classifications;
- title-page metadata;
- Statements and Declarations;
- Funding and Competing Interests statements;
- sole-author contribution statement;
- Data/Code Availability statement;
- generative-AI disclosure;
- reference/DOI presentation;
- table/figure numbering and rendering;
- vector figure and embedded-font checks.

The detailed evidence and status table is maintained in `docs/JOURNAL_REQUIREMENTS_LEDGER.md`.

## 6. Formal-verification consistency

Stage 14 does not enlarge the claims attributed to Lean. The final CI independently rebuilds the pinned formal environment and kernel-checks the existing formalization. The manuscript continues to treat Lean as a verification/reproducibility artifact rather than as an economic contribution.

The previously certified noncoverage remains intact: the formalization does not purport to mechanize the entire continuum-consumer model, the complete three-stage game, or a full-history pure-SPNE theorem beyond the certified reduced-form proof-critical core.

Result: **FORMAL CLAIM MAP CONSISTENT — PASS**.

## 7. Prior-art / scope preservation

Stage 14 does not restore any firstness claim. The manuscript continues to credit the prior R&D-stability criticism associated with Bunte/Sorenson and distinguishes the surviving contribution as the original-game price continuation, the regime-changing global quality deviation, the exact `4/27` result, and explicit asymmetric exclusion quality equilibria.

The unavailable full texts of Bunte (1995) and Sorenson (1995) remain a documented provenance limitation, not a Stage-14 submission blocker. Claims have been scoped so that the manuscript does not rely on an unverified priority assertion.

## 8. Authenticated-portal carry-forward

The following items cannot be authoritatively resolved from the public RIO instructions and are therefore carried forward to the live Springer Nature portal preflight:

- current RIO review/anonymity model;
- exact article-type label available in the portal;
- final file designations and mandatory metadata fields;
- whether reviewer suggestions/exclusions are required;
- any portal-only cover-letter, classification, preprint/repository, or fee question;
- exact portal metadata duplication for JEL, declarations, Funding, Competing Interests and author contribution;
- the portal-generated review PDF after upload/compilation.

These are **external operational properties of the authenticated submission workflow**, not unresolved defects in the manuscript or repository package.

## 9. Stage-14 verdict

`CONDITIONAL PASS — AUTHENTICATED PORTAL PREFLIGHT REQUIRED`

This is the strongest defensible Stage-14 verdict under the fail-closed workflow because all locally/publicly verifiable submission QA has passed, while the remaining items can only be determined inside the authenticated live portal.

**STAGE 14 CLOSED.**

## 10. Next gate

The required sequence is:

`Authenticated RIO portal preflight -> Astra Independent Final Submission-Package Hostile Gate -> Stage 15 Submission Freeze`

Astra is not a substitute for Stage 14. It is the independent final adversarial audit of the actual RIO submission package after the portal-specific configuration has been resolved.
