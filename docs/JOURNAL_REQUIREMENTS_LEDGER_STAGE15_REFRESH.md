# Journal Requirements Ledger — Stage 15 Refresh

Target journal: **Review of Industrial Organization (RIO)**  
Publisher: Springer Nature  
Refresh date: **2026-09-10 JST**  
Canonical Stage-14 ledger: `docs/JOURNAL_REQUIREMENTS_LEDGER.md`  
Stage-15 freeze candidate: `97632692448bbca7d45f17e0ac6b5071dec4f52e`  
Theory freeze: `ECONOMIDES-THEORY-FREEZE-2026-09-10-v1`

This file is the Stage-15 delta refresh to the canonical Stage-14 Journal Requirements Ledger. It does not erase the Stage-14 evidence history.

## Public-source refresh

The official RIO submission guidelines were reopened on 2026-09-10 during Stage 15. No material public-source rule was found that invalidates the current local package.

Reconfirmed public requirements:

- all relevant editable source files are required at every submission and revision;
- mathematical manuscripts may be submitted in LaTeX;
- LaTeX submissions must not use subfolders;
- uploaded LaTeX sources are automatically compiled into a single PDF for author approval;
- title-page author information, an active corresponding e-mail address, and ORCID if available are requested;
- abstract: 150–250 words;
- keywords: 4–6;
- JEL codes required;
- relevant Statements and Declarations required;
- Author Contribution and Competing Interest information must also be supplied through the submission interface;
- author-year references and full DOI links where available;
- figure captions and figure placement requirements remain as recorded in the Stage-14 ledger.

The current public `Submit your manuscript` link is exposed through `submission.nature.com` and routes to the Springer Nature submission system. The authenticated RIO submission record has not yet been preflighted.

## Current candidate verification

Canonical candidate: `97632692448bbca7d45f17e0ac6b5071dec4f52e`.

GitHub Actions run `34480164184`: `SUCCESS`.

The run passed symbolic, numerical, regression, deterministic-output, Lean, LaTeX, anonymous/identified RIO-package, citation/reference, package-hygiene and font-embedding gates.

Stage-15 independent visual QA was also performed on the exact CI artifacts from this run: anonymous manuscript 18 pages, identified manuscript 18 pages, and separate title page 1 page, rendered at 200 dpi. Result: `PASS`.

## Portal-only unresolved items

The following remain `UNVERIFIED — AUTHENTICATED PORTAL ONLY`:

1. exact article-type label;
2. operative review/anonymity model;
3. anonymous vs identified main-document choice;
4. title-page handling;
5. exact file designations;
6. cover-letter requirement/designation;
7. reviewer suggestions/exclusions;
8. editor/section/topic fields;
9. exact independent/unaffiliated-author metadata handling;
10. prior-publication/preprint/public-repository questions;
11. portal versions of funding, competing interests, CRediT, AI, data/code, ethics and author attestations;
12. any submission-fee step;
13. portal warnings;
14. portal-generated PDF;
15. final submit confirmation.

These are operational unknowns, not evidence of a manuscript defect. They nevertheless remain material for Stage 15 and therefore fail closed until the actual authenticated submission record is inspected.

## Stage-15 ledger status

Public-source compliance: `PASS`  
Local package/reproducibility: `PASS`  
Final local visual QA: `PASS`  
Authenticated portal reconciliation: `PENDING`  
Portal-generated PDF inspection: `PENDING`

Current routing status:

`FREEZE BLOCKED — AUTHENTICATED PORTAL PREFLIGHT REQUIRED`

If the authenticated portal requires only administrative metadata/file-designation choices, resolve them within Stage 15. If it requires any content-changing repair, return to Stage 14 for a bounded compliance repair and rerun the affected checks before establishing a new freeze candidate.
