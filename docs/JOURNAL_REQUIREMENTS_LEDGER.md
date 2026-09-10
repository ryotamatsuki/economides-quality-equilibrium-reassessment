# Journal Requirements Ledger — Review of Industrial Organization

Target journal: **Review of Industrial Organization (RIO)**  
Publisher: Springer Nature  
Evidence refresh date: **2026-09-10 JST**  
Stage-14 submission-package content baseline: `a4b53d568fa17fd88972b008e59edaf9f892d4a4`  
Theory freeze: `ECONOMIDES-THEORY-FREEZE-2026-09-10-v1`

Evidence hierarchy follows `research-paper-workflow/checklists/JOURNAL_REQUIREMENTS_CHECKLIST.md`.

## Current official sources

1. RIO Submission Guidelines — https://link.springer.com/journal/11151/submission-guidelines — level 3, accessed 2026-09-10.
2. RIO How to Publish With Us — https://link.springer.com/journal/11151/how-to-publish-with-us — level 3, accessed 2026-09-10.
3. RIO Aims and Scope — https://link.springer.com/journal/11151/aims-and-scope — level 3, accessed 2026-09-10.
4. RIO pre-submission checklist entry — https://link.springer.com/pre-submission?journalId=11151 — level 3/4 routing aid, accessed 2026-09-10.
5. Authenticated Springer Nature submission portal — **not yet preflighted**; level 2 evidence remains pending.

## Final Stage-14 ledger

| Topic | Operative rule / Stage-14 interpretation | Affected artifact | Verification | Status |
|---|---|---|---|---|
| Journal identity / scope | RIO publishes industrial-organization research, including significant theory; shorter notes/commentaries are also welcomed. | positioning | Official aims/scope reopened. | PASS |
| Exact portal article type | Public scope supports research papers and notes/commentaries, but the exact current portal label for this manuscript has not been inspected. | portal field | Requires authenticated portal. | UNVERIFIED — PORTAL ONLY |
| Submission system | Current journal page routes submissions to Springer Nature submission system. | portal | Official journal link confirmed. | PASS |
| Originality / simultaneous submission | Work must not have been published before or be under consideration elsewhere. | author attestation / cover letter | Current guidelines checked; manuscript is being prepared for one target at a time. | PASS subject to portal attestation |
| Review/anonymity model | The public RIO instructions do not identify the current review model. Generic Springer text does not resolve RIO. | anonymous/identified manuscript, title page, repository link | Both clean variants are generated and compile; operative choice requires authenticated portal. | UNVERIFIED — PORTAL ONLY |
| Title page | Must contain title, author name(s), affiliation(s), active corresponding-author email, ORCID if available. Acknowledgments belong in a separate title-page section. | `paper/title_page.tex` | Prepared with Ryota Matsuki, Independent Researcher, Matsuyama, Ehime, Japan, corresponding email and ORCID; `Acknowledgments: None` confirmed as the intended submission metadata. | PASS |
| Editable source at initial submission | All relevant editable sources must be provided at every submission and revision; `.docx` or LaTeX accepted. | flat LaTeX source package | CI builds source variants from clean flat directories. | PASS |
| LaTeX admissibility | Mathematical manuscripts can be submitted in LaTeX; Springer template is recommended, not stated as mandatory. | manuscript source | Current article-class source compiles with standard TeX dependencies. | PASS |
| LaTeX folder structure | Do not use subfolders. | `build/rio_anonymous`, `build/rio_identified` | Builder rejects path-bearing dependencies and CI verifies flat clean packages. | PASS |
| LaTeX auto-compilation | Uploaded LaTeX sources are automatically compiled to the peer-review PDF. | source package / portal-generated PDF | Local clean compilation passes; portal-generated PDF remains to be inspected. | PASS LOCALLY / PORTAL PREFLIGHT PENDING |
| Abstract | 150–250 words; no undefined abbreviations or unspecified references. | `paper/main.tex` | Regression test counts abstract words; integrated abstract lies within range. | PASS |
| Keywords | 4–6. | `paper/main.tex` | Five keywords present. | PASS |
| JEL | Appropriate JEL codes required. | `paper/main.tex` / portal metadata | `C72; D43; L13; R32` present; portal metadata must match. | PASS LOCALLY / PORTAL MATCH PENDING |
| Statements and Declarations | Relevant declarations must appear under `Statements and Declarations`. | `paper/sections/research_transparency.tex` | Heading and relevant statements implemented. | PASS |
| Funding | Funding disclosure required where applicable. | declarations/title page/portal | `This research received no external funding.` | PASS LOCALLY / PORTAL MATCH PENDING |
| Competing interests | Required; portal version must match manuscript. | declarations/title page/portal | `The author declares no competing interests.` | PASS LOCALLY / PORTAL MATCH PENDING |
| Author contribution | Contribution information is supplied through the submission interface; a contribution statement is prepared. | declarations/portal | Sole-author CRediT-style statement prepared. | PASS LOCALLY / PORTAL MATCH PENDING |
| Generative-AI disclosure | LLMs cannot be authors; non-copyediting LLM use must be documented in Methods or a suitable alternative section; human accountability required. | declarations | Actual non-copyediting use is disclosed and human responsibility stated. | PASS |
| Data availability | All original research must include a Data Availability Statement. | declarations | No external empirical dataset; public code/reproducibility repository identified in identified version and blinded in anonymous variant. | PASS |
| Code availability | Code/material availability may be declared. | declarations/repository | Symbolic, numerical, generator, regression and Lean artifacts are accurately described. | PASS |
| Ethics/consent | Not applicable to this theoretical study with no human participants or animals. | declarations/portal if asked | Explicit N/A statement included. | NOT APPLICABLE / PASS |
| References | Author-year style; cited works listed; full DOI links included where available. | `references/references.bib` | DOI-bearing entries render after clean build; unresolved citation/reference CI check passes. | PASS |
| Tables | Arabic numbering, consecutive text citation, caption required. | welfare table | Generated table is cited/captioned; deterministic regeneration and final visual QA pass. | PASS |
| Figures | Electronic; vector preferred for vector graphics; fonts embedded; cited consecutively; RIO caption conventions applied. | parameter-region figure / manuscript | TikZ vector retained; fonts embedded; final visual QA passes. | PASS |
| Figure accessibility | Descriptive caption; do not depend on color alone. | parameter-region figure | Black/gray line work does not encode meaning by color alone; final rendered figure inspected. | PASS |
| Figure placement | Figures normally submitted in body unless upload size causes problems. | manuscript | Figure remains in body. | PASS |
| Supplement | Optional; not needed because reproducibility artifacts are in the research repository. | package | No SI required by the paper. | NOT APPLICABLE |
| Page/word limit | No RIO-specific public page/word limit located in current instructions. | manuscript | No unsupported limit assumed; portal will be checked. | PASS PUBLIC-SOURCE CHECK / PORTAL PREFLIGHT PENDING |
| Highlights / graphical abstract | No RIO-specific public requirement located. | ancillary files | Do not create by inference; inspect portal. | UNVERIFIED — PORTAL ONLY |
| Preprint / public repository | Any portal question about prior posting or repository availability must be answered truthfully. | portal declaration | Requires authenticated portal wording. | UNVERIFIED — PORTAL ONLY |
| Reviewer suggestions/exclusions | Whether RIO currently requires them has not been established from public instructions. | portal | Requires authenticated portal. | UNVERIFIED — PORTAL ONLY |
| Editor/section/topic classifications | Exact current fields unknown. | portal | Requires authenticated portal. | UNVERIFIED — PORTAL ONLY |
| Cover letter | No journal-specific public mandatory-file rule located. | portal/file | Requirement to be checked in portal. | UNVERIFIED — PORTAL ONLY |
| Submission fee | No public RIO submission-fee rule identified; absence of a public statement is not treated as proof of zero fee. | portal/payment | Requires portal confirmation if a fee step appears. | UNVERIFIED — PORTAL ONLY |
| Open access | Hybrid. Subscription route has no APC; optional OA terms are handled after acceptance. | post-acceptance | Official publishing-options page checked. | PASS |
| Licensing | No pre-submission action required beyond avoiding incompatible commitments. | post-acceptance | Official publishing-options page checked. | NOT APPLICABLE AT SUBMISSION |
| Portal-generated PDF | Must be approved after source upload/compilation. | final portal PDF | Cannot be reproduced outside authenticated portal. | UNVERIFIED — PORTAL ONLY |

## Final non-portal QA status

The submission-package content baseline `a4b53d568fa17fd88972b008e59edaf9f892d4a4` has passed the non-portal Stage-14 checks that are reproducible locally: symbolic and numerical verification, regression tests, deterministic output checks, pinned Lean/mathlib kernel verification, manuscript and both RIO source-variant builds, unresolved citation/reference rejection, flat-package hygiene, and font embedding.

Final PDF visual QA was performed page by page on both the 18-page anonymous manuscript and the 18-page identified manuscript, together with the separate one-page title page. No clipping, overlap, broken glyph, unreadable mathematical object, figure/table legibility defect, or title-page layout defect was found. Fig. 1, Table 1, declarations, proofs, and references were specifically inspected. `Acknowledgments: None` is confirmed and internally consistent with the title-page source.

No Stage-14 change alters the economic model, theorem statements, parameter regions, welfare claims, or formal-proof scope. `NO THEORY DRIFT`.

The remaining unknowns are properties of the authenticated live submission workflow, principally the current review/anonymity model, exact article-type/file designations, mandatory portal fields, and the portal-generated review PDF. They are operational carry-forward items rather than defects in the manuscript or source package.

Stage-14 verdict:

`CONDITIONAL PASS — AUTHENTICATED PORTAL PREFLIGHT REQUIRED`
