# Stage 10B — Provisional paper construction report
Date: 2026-11-17 JST.
Work product: paper/short_note/main.tex. Article title: Quality Differentiation and Market Exclusion: A Note on Economides (1989).
**Status: FULL FIRST DRAFT WRITTEN; CANONICAL STAGE10B GO NOT CLAIMED.** The author explicitly requested to proceed to the stage following 10A despite the Stage8/9/10A gate hold; this is an exploratory at-risk manuscript, NOT a waiver or retrospective pass.

## Exact Stage10A exemplar-adoption trace
- Ahlin 2008 (pp.55–56): short problem-first introduction and visible finite deviation. Used at §1 and §4 exact gain. Does not borrow congestion assumptions or prose.
- d'Aspremont et al. 1979 (pp.1145–1147, 1149): globally checked price response, necessity vs sufficiency proof, economic lesson. Used in §§2–4 and Appendix A/B; no quadratic-transport extension imported.
- Ebina–Shimizu 2012 (pp.2871–2874): predecessor model reconstructed first, direct corrected theorem, bounded conclusion. Used in §§1–2 and §5; no unidirectional-location claim imported.

## Design decisions
- Model before result; all primitives and strategy spaces displayed once.
- One headline complete pure-quality NE theorem for 1/9<λ<2/9 with λ=4/27 included in symmetric branch.
- Price continuation and piecewise payoff displayed; full BR logic and global gain shown in main text, technical casework in appendix.
- No welfare, full three-stage SPNE or policy result.
- Full-text-equivalence test for Bunte 1995 and Sorenson 1995 UNRESOLVED; no precedence claim; no journal submission authorisation.
- No figure/table, as unnecessary to understand the correction; see EXPOSITION_ARCHITECTURE.md.
- Formal transparency: encoded reduced-quality full iff in Lean, primitives/price continuation only analytic.
- Material AI use honestly disclosed in provisional appendix, author mathematic review noted without an independent rederivation assertion.

## Reproducibility plan
Single command: make short-note, invoking latexmk from paper/short_note/ with the repository shared references at ../../references/references.bib. Existing make verify / pytest and pinned Lean builds stay intact. The reproducibility GitHub Actions job now additionally compiles this short-note source and uploads an artifact named stage10b-provisional-short-note-pdf. New regression test checks headline theorem/scope/LaTeX key equations and bibliography path. CI result and PDF build remain to be checked after commit.

## Editorial entry and risk
Stage6/7.5 CONDITIONALLY passed only as working correction-note research with exact published-prior-art absorption undecided; Stage8 FREEZE BLOCKED, Stage9 TECHNICAL PASS / formal GO withheld; Stage10A CONTENT COMPLETE / canonical GO withheld. Stage10B written at user's direct request but not officially authorised, and Stage11 referee assessment and journal-specific instructions have not been run. This distinction is retained in any public README or draft status.
