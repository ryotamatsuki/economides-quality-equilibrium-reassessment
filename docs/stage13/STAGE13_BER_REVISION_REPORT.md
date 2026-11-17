# Stage 13 — BER-oriented manuscript integration and editorial revision (PROVISIONAL)

Date: 17 November 2026 (JST)
Target: **Bulletin of Economic Research**, `Note/Comment`; **Economics Bulletin excluded by author**.
Source: Stage 12 Draft PR #17, head `bbba0abd402487a8c4d8b40607bde41b572e2e2d`; Stage 11 editorial reports.
Edited source: `paper/short_note/main.tex` on `draft/stage13-ber-revision-20261117`.

## Scope and what was changed

1. Retained the fixed-endpoint pure-quality Nash correspondence P4 unchanged. The regime boundaries, strict parameter domain `1/9 < lambda < 2/9`, inclusion of `lambda=4/27`, and full necessity/sufficiency proof remain.
2. Revised the abstract for the current Wiley guideline (150-word maximum) and reader-first statement of the correction. The working draft is materially below that ceiling. Keep named author, affiliation, JEL and keywords in source: the older Economics Bulletin titleless-PDF rule is NOT applicable.
3. Rebuilt Introduction around the exact logical bridge: Economides (1989) printed p. 27 eqs. (8)-(9) and p. 28 Theorem 2 state the original candidate; a putative three-stage path with fixed endpoint locations must survive global quality deviations after prices re-optimize. Failure of that necessary quality-continuation condition below `lambda=4/27` defeats the **asserted symmetric path**, but does not imply a replacement full-stage SPNE.
4. Reduced repetition in Discussion. Distinguished zero-quality exclusion-equilibrium correspondence from full-game equilibrium, and emphasized continuity of revenues versus the slope kink at `a-b=3` and sign of `(4-27 lambda)/(18 lambda)`.
5. Moved AI-transparency prose into a visible, separately labeled declaration before References; preserved the explicit scope of the Lean certificate, including the fact that primitive utility and the price stage are not Lean-certified.
6. Preserved Bunte (1997) prior general critique and Bunte (1995)/Sorenson (1995) exact-theorem overlap as UNRESOLVED. No new original result, welfare theorem, or historical priority has been claimed.

## Editorial validation checklist

| Test | Finding |
|---|---|
| Original Economides → restricted counterexample bridge | REPAIRED IN TEXT, but the original published theorem was not newly re-read in this editing pass; source location rests on prior project audit |
| Price continuation, payoff branches, NE theorem & appendix scope | PRESERVED |
| Strict cutoff and endpoint treatment | PRESERVED |
| BER named first page, abstract, JEL/keywords | DRAFT COMPLIANT; current BER guideline uses 150 words |
| AI declaration | ADDED, pending tool-version reconciliation and author signoff |
| No firstness or automatic publication-value claim | PASS IN TEXT |
| BER-specific full-read exemplar comparison | STILL UNVERIFIED; no false benchmark claim |
| Build/PDF/typesetting | CI artifact to be checked; not a substitute for source/author review |
| Close exact Bunte/Sorenson prior-work absorption | UNRESOLVED |
| Canonical Stage 8/9/10A/11/12/13 GO | **NOT ISSUED** |

## Source and verification records

- BER official requirements (shorter notes/comments, current abstract 150 words, named authors): https://onlinelibrary.wiley.com/page/journal/14678586/homepage/forauthors.html
- Wiley researcher AI-use guidance: https://www.wiley.com/en-us/publishing/article/ai-guidelines
- Wiley publishing ethics (editor's authority, AI disclosure): https://authors.wiley.com/ethics-guidelines/index.html
- Stage 11 editorial issue: `docs/stage11/EDITORIAL_REFEREE_REPORT.md`.
- Stage 12 target/fee conditions: `docs/stage12/BER_REQUIREMENTS_LEDGER.md`.
- Source/novelty hold: `docs/STAGE6_NONPRIORITY_CORRECTION_REKILL_20261117.md`.

**Disposition:** Stage13 working draft prepared; no journal submission, payment, article-originality attestation, or formal freeze. Next technical action: CI PDF and source audit, then Stage14 submission-package preflight only if canonical prerequisites have been cleared; otherwise work can continue as an explicitly provisional package.
