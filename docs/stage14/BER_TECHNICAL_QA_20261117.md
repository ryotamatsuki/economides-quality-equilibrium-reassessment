# Stage 14 — BER Submission Quality Assurance (technical preflight, provisional)

**Date:** 2026-11-17 (JST)
**Journal:** Bulletin of Economic Research, Wiley; short refereed Note / Comment.
**Explicit author exclusion:** Economics Bulletin is not an active target.
**Baseline:** Stage 13 PR #18, head `395585532a1c17c1982ffbc6a9779ad3e7e9c49e`; current Stage14 branch `audit/stage14-ber-preflight-20261117`.
**Status:** PROVISIONAL TECHNICAL PRE-FLIGHT. **NOT A SUBMISSION / NOT A THEORY-FREEZE / NOT A NOVELTY CERTIFICATE.**

## 1. What was actually audited and repaired

1. **Stage13 CI run 44023522883 FAILED.** Exact symbolic verification and numerical audit PASSED, but the existing string-literal editorial regression test failed after legitimate prose rewording (`no claim of historical`). Lean and PDF build were skipped, so it was invalid to call the original Stage13 PDF READY.
2. Updated `tests/test_stage10b_short_note.py` to preserve substantive editorial guardrails against false priority and full-game overclaim, without demanding fixed wording. Added checks for journal front matter, <=150-word abstract, AI declaration, every internal LaTeX reference target, and BibTeX citation-key availability.
3. Corrected duplicate author-name prose at the start of the introduction (`Economides \\citet{Economides1989}` -> proper named citation).
4. The existing historical `paper/title_page.tex` provides author name, independent-researcher affiliation, Matsuyama location, corresponding email and ORCID; these were **carried forward provisionally** to this short-note manuscript. They require author reconfirmation before submission. A complete street/postal address may still be required by BER.
5. Added `scripts/build_ber_flat_package.py` to create `build/ber_source/main.tex` plus `references.bib`. The only permitted source change is the bibliography path: `../../references/references` -> `references`; the script checks exact reversibility and absence of other external TeX `\\input`/`\\include` dependencies.
6. Updated Makefile and CI to build an **independent** flat-source package, compile the BER-review PDF, inspect file structure, detect unresolved cross-references and citations, check PDF font embedding and expose downloadable source/PDF Action artifacts when CI succeeds.
7. Independently checked sample cutoff gain with Python exact rational arithmetic: lambda=1/8 -> 5/18; lambda=4/27 -> 0; lambda=1/6 -> -1/6. This checks reported formula and representative signs, not a mathematical proof of P4. Lean/Stage4A proof remains an inherited, bounded certificate.

## 2. Main text/claim-scope controls

| Area | Finding | Disposition |
|---|---|---|
| Correct original target | Cites Economides 1989 pp.27-28, eqs.8-9 and Theorem 2, with conditional deviation logic | TEXT REPAIRED; source pinpoint inherited from prior source audit |
| Restricted theorem | Fixed endpoint (0,1); quality Nash after globally optimized price; no endogenous locations | PRESERVED |
| Exact parameter | Strict 1/9 < lambda < 2/9; symmetric threshold lambda >= 4/27 inclusive | PRESERVED |
| Number and type of equilibria | Two exclusion NE throughout; third symmetric NE at/above cutoff; no other pure profiles | PRESERVED |
| Necessity | Corner BR, excluded-positive-quality cost-saving move, interior FOCs | PRESERVED |
| Formal scope | Lean certifies encoded reduced-payoff pure NE iff only, not primitive demand or full three-stage SPNE | PRESERVED |
| Earlier literature | Generic critique credited Bunte 1997; exact theorem overlap Bunte 1995 / Sorenson 1995 undecided | UNRESOLVED MATERIAL EDITORIAL RISK |
| Parallel source | Broader earlier internal PR #10 contains restricted P4 | CONFIRM ONE ARTICLE UNIT BEFORE SUBMISSION |

## 3. Journal-level requirements (official Wiley sources)

- Official author guidelines: https://onlinelibrary.wiley.com/page/journal/14678586/homepage/forauthors.html
- Wiley AI research guidance: https://www.wiley.com/publishing/article/ai-guidelines
- Wiley publication ethics: https://authors.wiley.com/ethics-guidelines/index.html
- Optional OA fee: https://onlinelibrary.wiley.com/page/journal/14678586/homepage/fundedaccess.html

| Requirement | Actual result | Status |
|---|---|---|
| Article type | Refereed shorter articles / notes / comments accepted | CONFIRMED |
| Scope | Original substantial contribution of broad economic interest | EDITORIAL VALUE UNRESOLVED; not certified by note format |
| Initial format | Free Format; editable LaTeX + PDF for review; bibliography source supplementary | PACKAGE SCRIPT PROVIDED; CI COMPILATION PENDING |
| Abstract | 150-word maximum on current guidelines | AUTOMATED TEST ADDED; no final portal verification |
| Metadata | Title, name, affiliation, JEL, keywords, postal/e-mail address, ORCID | EMAIL/ORCID CARRIED FROM EXISTING TITLE PAGE; COMPLETE POSTAL ADDRESS UNVERIFIED |
| References | Consistent style; citation keys and LaTeX cross-references | AUTOMATED GUARDS ADDED; pending passing CI |
| AI | Research and drafting use must be disclosed, author accountable | MANUSCRIPT DECLARATION PRESENT; exact versions/validations and portal questions UNVERIFIED |
| Non-OA / cost | Non-OA copyright-transfer path available; optional OA paid | OPTIONAL OA NOT SELECTED; mandatory submission/non-OA fees UNVERIFIED |
| Originality | No duplicate active submission, rights to reproduce and article-unit uniqueness | AUTHOR/PORTAL CONFIRMATION REQUIRED |
| Final technical PDF | Flat PDF, citations, fonts, page visual proof | **NO FINAL PASS BEFORE CI AND VISUAL INSPECTION** |

## 4. Gate judgment and routing

**Stage14 provisional technical work: COMPLETE AS SOURCE PACKAGE AND QA DESIGN; final PDF verification depends on CI.**

Even when CI and PDF pass, the manuscript remains **NOT AUTHORISED FOR JOURNAL SUBMISSION** because (a) exact published-paper theorem equivalence to Bunte 1995/Sorenson 1995 remains unresolved under Stage6/7.5; (b) corresponding author metadata and precise AI models/versions require signoff; (c) portal-only charges/fields and simultaneous-submission position remain unverified. The author's prior instruction not to repeatedly reattempt inaccessible full-text acquisition is honored.

Do not turn this provisional quality check into a formal Stage8/9/10A/11/12/13/14 scientific GO. Continue with Stage15 package review only as provisional preparation, or resolve scientific originality by genuinely decisive evidence without claiming absent evidence.
