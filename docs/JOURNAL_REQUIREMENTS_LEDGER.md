# Journal Requirements Ledger — Review of Industrial Organization

Target journal: **Review of Industrial Organization (RIO)**  
Publisher: Springer Nature  
Evidence refresh date: **2026-09-10 JST**  
Stage-14 package baseline: `d19befbd6793829aae211af34fcbcaf18e2060b7`  
Theory freeze: `ECONOMIDES-THEORY-FREEZE-2026-09-10-v1`

Evidence hierarchy follows `research-paper-workflow/checklists/JOURNAL_REQUIREMENTS_CHECKLIST.md`.

## Current official sources

1. RIO Submission Guidelines — https://link.springer.com/journal/11151/submission-guidelines — level 3, accessed 2026-09-10.
2. RIO How to Publish With Us — https://link.springer.com/journal/11151/how-to-publish-with-us — level 3, accessed 2026-09-10.
3. RIO Aims and Scope — https://link.springer.com/journal/11151/aims-and-scope — level 3, accessed 2026-09-10.
4. RIO pre-submission checklist entry — https://link.springer.com/pre-submission?journalId=11151 — level 3/4 routing aid, accessed 2026-09-10.
5. Authenticated Springer Nature submission portal — **not yet preflighted**; level 2 evidence remains pending.

## Refreshed ledger

| Topic | Operative rule / Stage-14 interpretation | Affected artifact | Verification | Status |
|---|---|---|---|---|
| Journal identity / scope | RIO publishes industrial-organization research, including significant theory; shorter notes/commentaries are also welcomed. | positioning | Official aims/scope reopened. | PASS |
| Exact portal article type | Public scope supports research papers and notes/commentaries, but the exact current portal label for this manuscript has not been inspected. | portal field | Requires authenticated portal. | UNVERIFIED — PORTAL ONLY |
| Submission system | Current journal page routes submissions to Springer Nature submission system. | portal | Official journal link confirmed. | PASS |
| Originality / simultaneous submission | Work must not have been published before or be under consideration elsewhere. | author attestation / cover letter | Current guidelines checked; manuscript is being prepared for one target at a time. | PASS subject to portal attestation |
| Review/anonymity model | The public RIO instructions do not identify the current review model. Generic Springer text discusses both single- and double-anonymous workflows but does not resolve RIO. | anonymous/identified manuscript, title page, repository link | Both clean variants are generated; operative choice requires authenticated portal. | UNVERIFIED — PORTAL ONLY |
| Title page | Must contain title, author name(s), affiliation(s), active corresponding-author email, ORCID if available. Acknowledgments belong in a separate title-page section. | `paper/title_page.tex` | Prepared with Ryota Matsuki, Independent Researcher, Matsuyama, Ehime, Japan, corresponding email and ORCID; acknowledgments = None. | PASS |
| Editable source at initial submission | All relevant editable sources must be provided at every submission and revision; `.docx` or LaTeX accepted. | flat LaTeX source package | CI builds source variants from clean flat directories. | PASS |
| LaTeX admissibility | Mathematical manuscripts can be submitted in LaTeX; Springer template is recommended, not stated as mandatory. | manuscript source | Current article-class source compiles with standard TeX dependencies. | PASS |
| LaTeX folder structure | Do not use subfolders. | `build/rio_anonymous`, `build/rio_identified` | Builder rejects path-bearing dependencies and CI verifies flat clean packages. | PASS |
| LaTeX auto-compilation | Uploaded LaTeX sources are automatically compiled to the peer-review PDF. | source package / portal-generated PDF | Local exact-layout clean compilation passes; portal-generated PDF remains to be inspected. | PASS locally / PORTAL PREFLIGHT PENDING |
| Abstract | 150–250 words; no undefined abbreviations or unspecified references. | `paper/main.tex` | Regression test counts abstract words; integrated abstract lies within range. | PASS |
| Keywords | 4–6. | `paper/main.tex` | Five keywords present. | PASS |
| JEL | Appropriate JEL codes required. | `paper/main.tex` / portal metadata | `C72; D43; L13; R32` present; portal metadata must match. | PASS locally / PORTAL MATCH PENDING |
| Statements and Declarations | Relevant declarations must appear under `Statements and Declarations`; missing relevant declarations can be returned incomplete. | `paper/sections/research_transparency.tex` | Heading and relevant statements implemented. | PASS |
| Funding | Funding disclosure required where applicable; acknowledgments/funder names handled as instructed. | declarations/title page/portal | `This research received no external funding.` | PASS locally / PORTAL MATCH PENDING |
| Competing interests | Required; also supplied through submission interface, whose version controls publication. | declarations/title page/portal | `The author declares no competing interests.` | PASS locally / PORTAL MATCH PENDING |
| Author contribution | Author Contribution information is supplied through submission interface; publisher guidance supports a contribution statement. | declarations/portal | Sole-author CRediT-style statement prepared. | PASS locally / PORTAL MATCH PENDING |
| Generative-AI disclosure | LLMs cannot be authors; non-copyediting LLM use must be documented in Methods or a suitable alternative section; human accountability required. | declarations | Actual non-copyediting use is disclosed and human responsibility stated. | PASS |
| Data availability | All original research must include a Data Availability Statement. | declarations | No external empirical dataset; public code/reproducibility repository identified in identified version and blinded in anonymous variant. | PASS |
| Code availability | Code/material availability may be declared; current project exposes symbolic, numerical, generator, regression and Lean artifacts. | declarations/repository | Accurate repository statement included; anonymous version masks authorship-bearing URL pending review-model confirmation. | PASS |
| Ethics/consent | Not applicable to this theoretical study with no human participants or animals. | declarations/portal if asked | Explicit N/A statement included. | NOT APPLICABLE / PASS |
| References | Author-year style; reference list should contain cited works; full DOI links should be included where available. | `references/references.bib` | Bibliography changed to expose `https://doi.org/...` links for DOI-bearing entries; build must confirm rendering. | PASS subject to final build |
| Tables | Arabic numbering, consecutive text citation, caption required. | welfare table | Current generated table is cited and captioned; deterministic regeneration is CI-tested. | PASS |
| Figures | Electronic; vector preferred for vector graphics; fonts embedded; cited consecutively; caption begins `Fig.` + number in bold, no punctuation after number or at caption end. | parameter-region figure / manuscript | TikZ vector source retained; caption formatting updated; font embedding is CI-tested. | PASS subject to final build |
| Figure accessibility | Descriptive caption; use patterns in addition to color; adequate contrast. | parameter-region figure | Figure is black/gray line work and does not encode meaning by color alone; visual QA required on final artifact. | PASS subject to final visual QA |
| Figure placement | Figures normally submitted in body unless upload size causes problems. | manuscript | Figure remains in body. | PASS |
| Supplement | Optional; not needed for the present paper because reproducibility artifacts are in the public research repository. | package | No SI required by the paper. | NOT APPLICABLE |
| Page/word limit | No RIO-specific public page/word limit located in current journal instructions. | manuscript | No unsupported limit assumed. Portal will be checked for any field-specific constraint. | PASS PUBLIC-SOURCE CHECK / PORTAL PREFLIGHT PENDING |
| Highlights / graphical abstract | No RIO-specific public requirement located. | ancillary files | Do not create by inference; inspect portal. | UNVERIFIED — PORTAL ONLY |
| Preprint / public repository | No RIO-specific public instruction located on the journal page that alters the publisher's general preprint treatment. Any portal question about prior posting or repository availability must be answered truthfully. | portal declaration | Requires authenticated portal wording. | UNVERIFIED — PORTAL ONLY |
| Reviewer suggestions/exclusions | Public publisher guidance permits suggestions/exclusions, but whether RIO currently requires them has not been established. | portal | Requires authenticated portal. | UNVERIFIED — PORTAL ONLY |
| Editor/section/topic classifications | Exact current fields unknown. | portal | Requires authenticated portal. | UNVERIFIED — PORTAL ONLY |
| Cover letter | No journal-specific public mandatory-file rule located. A concise cover letter can be supplied if requested by the portal. | portal/file | Requirement to be checked in portal. | UNVERIFIED — PORTAL ONLY |
| Submission fee | No public RIO submission-fee rule identified. Absence of a public fee statement is not treated as proof of zero submission fee. | portal/payment | Requires portal confirmation if a fee step appears. | UNVERIFIED — PORTAL ONLY |
| Open access | Hybrid. Subscription route has no APC. Optional OA APC currently £2,390 / US$3,290 / €2,690, subject to applicable tax; choice is after acceptance. | post-acceptance | Current official publishing-options page checked. | PASS |
| Licensing | Subscription standard terms or OA CC options after acceptance; no pre-submission action required beyond avoiding incompatible commitments. | post-acceptance | Official publishing-options page checked. | NOT APPLICABLE AT SUBMISSION |
| Portal-generated PDF | Must be approved after the source upload is auto-compiled. | final portal PDF | Cannot be reproduced outside authenticated portal. | UNVERIFIED — PORTAL ONLY |

## Fail-closed conclusion

All non-portal journal requirements that can be verified from current official public sources have a compliant local artifact or explicit N/A treatment. The remaining material unknowns concern the authenticated live submission workflow, principally the review/anonymity model, exact article-type/file designations, mandatory portal fields, and the portal-generated PDF.

Therefore Stage 14 cannot return a full `SUBMISSION QA PASS` before authenticated portal preflight. The maximum permitted verdict is:

`CONDITIONAL PASS — AUTHENTICATED PORTAL PREFLIGHT REQUIRED`
