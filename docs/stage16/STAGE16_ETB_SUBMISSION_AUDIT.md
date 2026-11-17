# Stage 16 — Economic Theory Bulletin pre-submission suitability and technical audit

**Date:** 2026-11-17 (JST)
**Current venue:** Economic Theory Bulletin, Springer Nature (eISSN 2196-1093).
**Superseded venue:** Bulletin of Economic Research (BER) — halted due to public postal-street-address problem, NOT submitted.
**Source parent:** Stage15 PR #20, commit `f13064c0b503b7171fe514520979709fa206cdaa`.
**ETB manuscript:** `paper/etb/main.tex` (separate from prior BER source `paper/short_note/main.tex`).
**Formal submission authorization:** NO. Technical package and pre-submission QA may proceed; scientific prior-theorem overlap hold remains.

## 1. Authoritative journal instructions checked 2026-11-17

Official journal instructions: https://link.springer.com/journal/40505/submission-guidelines

Official aims/scope: https://link.springer.com/journal/40505/aims-and-scope

Subscription/open access: https://link.springer.com/journal/40505/how-to-publish-with-us

| ETB requirement | Verified journal rule | Stage16 status |
|---|---|---|
| Independent author address | Affiliation city/country and corresponding email/ORCID; the guidelines say temporarily unaffiliated authors are captured by city and country, and warn full addresses would be published if provided | **PASS public manuscript**: no private street or postal code; use `Independent Researcher, Matsuyama, Ehime, Japan`. The authenticated portal may still request private administrative information; no promise that no private data will ever be requested |
| Article type / scope | Short rigorous theoretical notes are welcome, on substantive economic problems | **FORMAT FIT**, but a genuinely incremental result is unacceptable |
| Abstract | 150–250 words, no undefined abbreviations/unexplained references | **PASS draft**: ~188 words under Python regex replacing math formulae by single tokens; exact portal counting may vary but range comfortably met |
| Keywords | 4–6 | **PASS**: 5 |
| JEL | Appropriate codes | **PASS**: C72 / D43 / L13 / R32 |
| Editable source | LaTeX and its dependencies, along with compiled PDF | **PASS local package**: main.tex + references.bib; CI build and artifact pending |
| References | Author-year, alphabetical, DOI links when available | **PASS local BibTeX compile**; publisher-specific `sn-jnl` template is recommended, not mandatory; custom `article` class used to minimize theorem formatting drift |
| AI | Substantive LLM use disclosed in Methods or appropriate section; human accountable | **PASS content provisional**: transparent generative-AI use + Python/Lean scope, exact model-version ledger incomplete; portal-only disclosures to confirm |
| Funding/COI/data and code | Relevant statements and disclosures in manuscript | **PASS carried-forward**: no funding, no COI, no empirical data, public source URL, sole author |
| Publication option | Hybrid: traditional subscription model explicitly has **no APC** | **PASS preference**: subscription/non-OA; any unexpected submission/other mandatory fee remains portal-only |
| Simultaneous submission | Prohibited; originality and copyright guarantees required | **HOLD**: RIO older manuscript rejected 2026-11-17, other transfer/active submission to be affirmatively checked |
| Prior posted manuscript | Transparently report material reuse and public release | **HOLD author portal declaration**; GitHub working versions already publicly available |

## 2. Scientific theorem delta audit

Compared full source `paper/short_note/main.tex` at Stage15 with `paper/etb/main.tex`:

1. **No edits to any math equation environment, lemma, theorem or proof environment.** All nine labelled mathematical equation environments identical by source comparison; one lemma, one theorem and one proof environment unchanged.
2. Abstract expanded to fit ETB and remove cited original theorem from abstract. It explicitly restricts the result to fixed locations and the reduced quality game.
3. Introduction contribution paragraph rephrased to reflect the exact iff classification, while preserving credit to Bunte 1995/1997 and Sorenson 1995 and not asserting historical firstness.
4. Unnumbered heading revised to `Statements and Declarations` and AI usage heading revised as a suitable alternative to Methods.
5. The 5-keyword list, JEL codes, all numerical thresholds and inclusion of equality at lambda=4/27 were preserved.
6. Public-facing address contains **no personal street or postal code**.

**Theorem scope:** with fixed (0,1) endpoints and 1/9<lambda<2/9, both asymmetric exclusion equilibrium profiles persist; the symmetric candidate joins iff lambda>=4/27; no assertion of full 3-stage SPNE or other parameter cases. Existing Lean certificate covers encoded reduced payoffs, not primitive demand or price FOC derivation.

## 3. Pre-submission hostile editorial audit

| Issue | Risk/severity | Evidence and disposition |
|---|---|---|
| Bunte (1995) / Sorenson (1995) exact P4 theorem overlap | **CRITICAL / unresolved scholarly originality** | Stage6 specifically defers full-text equivalence; their exact theorem is not certified distinct. ETB explicitly excludes corollaries of known results. No firstness language cannot cure redundancy |
| Bunte (1997) already criticized global stability | High/known | Cited in introduction; manuscript must not portray global-stability objection as first discovered here |
| Fixed-location theorem vs original full-game equilibrium | High if overclaimed | Clear necessary-path contradiction bridge, all disclaimers intact; DOES NOT characterize full game or endogenous locations |
| The rejected RIO version/own prior PR #10 contain related results | High if hidden | Rejected RIO paper was broader; PR #10 already contains P4. Correspondence and public source reuse explicitly logged and should be disclosed when asked |
| Publisher-side economics significance | High/ETB bar | Must justify why explicit complete reduced pure-quality correspondence is more than a straightforward corollary of known stability criticism; substantive editorial value not established by proof correctness alone |
| Generative-AI-assisted original theorizing | Medium/policy | Springer instructions permit properly disclosed LLM support with human responsibility; exact model version per step unknown. Prior author reviewed exhaustive pure-NE proof, not an independent human referee validation |
| No formal Springer template | Low | Journal recommends but does not require Springer template; standard LaTeX (with original editable source) is accepted at initial submission. Portal may request template later |
| Home address | **RESOLVED at public author-instructions level** | No street/ZIP in manuscript; independent author's city/country and email match guidelines; authenticated portal restrictions remain unknown |
| Fees | **No APC** for subscription | Explicit ETB fee page; other charges are not independently ruled out |

**Economic and editorial judgment:** technically coherent short theory note and compliant with ETB's *format*, but not independently cleared as a **publishable contribution**. The unresolved possible exact-theorem precedence is especially material for ETB's 'no corollary of already known results' rule. No claim of unconditional referee acceptance probability can be made.

## 4. Verifications / checks

- Author metadata and earlier RIO submission history carried from Stage15; full mail street address NEVER inserted.
- Local clean TeX/BibTeX build: SUCCESS, 6 PDF pages. Local build environment had a broken `/usr/bin/bibtex` symlink, bypassed by the installed `bibtex.original` binary; this is a container environment issue, not a manuscript defect.
- Local text extraction and six-page render visual audit: PASS; no obvious clipping, blank pages, missing equations, unresolved citations, or broken labels.
- Exact checks remain in `tests/test_stage16_etb_preflight.py` (both LaTeX math drift and Springer metadata). GitHub CI compiles ETB flat sources and PDF, checks reference errors and embedded fonts, and uploads artifact ZIPs.

## 5. Work package / next action

- `paper/etb/main.tex`: ETB source of record (not a copy of older RIO/Ber manuscript file uploaded in error).
- `scripts/build_etb_flat_package.py`, `make etb-package`: flat `build/etb_source/main.tex` and `references.bib`, compiled `build/etb_compile/main.pdf`.
- `submission/ETB_PORTAL_METADATA_CANDIDATE.json`: pre-filled portal metadata.
- `submission/ETB_COVER_LETTER_DRAFT.md`: NOT SENT / contains internal hold.
- CI artifact names: `stage16-etb-flat-source-provisional`, `stage16-etb-review-pdf-provisional`.

## 6. Stage16 gate decision

- **PUBLIC-ADDRESS COMPLIANCE: PASS** (street address not required by publicly visible ETB guidance; live portal may ask for private contact info).
- **DOCUMENT FORMAT / SOURCE / ABSTRACT: PASS locally; independent CI must pass for freeze.**
- **MATHEMATICAL SCOPE PRESERVATION: PASS**, with previously certified reduced-payoff bounds.
- **AI DISCLOSURE: PASS as manuscript wording**, remaining final author/portal signoff.
- **ECONOMIC THEORY ORIGINALITY: HOLD / NO SCIENTIFIC GO** pending defensible distinction from Bunte 1995/Sorenson 1995 and from previously released own theorem.
- **SUBMISSION: NOT PERFORMED.** No publication license, fee or exclusive-submission declaration accepted.

Next stage should review this frozen candidate, resolve genuinely material originality/simultaneous-submission declarations or choose a better original manuscript unit, and only then approach authenticated Editorial Manager. Do not repeat unproductive fulltext attempts as an automatic action.
