# BER theory note — author's pre-submission review package

Prepared 21 November 2026 from the identified six-page ETB Stage17 source PDF (`libfile_fb11eb690360819194c2c1e5e1623750`) and the source file `paper/etb/main.tex` in GitHub commit `867d11c41a4a65330917c691fc1b6492e72ef195`, repository `ryotamatsuki/economides-quality-equilibrium-reassessment`.

**Scientific recommendation: 追加確認後に判断**. The revised six-page paper builds and its exact identities pass rechecking. Bunte (1995) and Sorenson (1995) full texts remain unverified and precise theorem overlap is unresolved, notwithstanding the known Bunte (1997) stability critique. This is a document package for the author's review, **not permission to submit or a certified novelty finding**.

## Contents

- `main.tex` / `main.pdf`: revised BER-targeted standalone source and rendered six-page manuscript
- `references.bib`: citations
- `BER_cover_letter.md`: English cover-letter draft; remove final internal note after author confirmation
- `Revision_memo_JA.md`: Japanese editorial, prior-art and technical audit
- `verify_exact.py` / `verification_output.txt`: SymPy exact-rational checks
- `PDF_QA.txt`: local TeX PDF checks

## Rebuild (TeX Live with bibtex8)

```sh
pdflatex -interaction=nonstopmode -halt-on-error main.tex
bibtex8 main
pdflatex -interaction=nonstopmode -halt-on-error main.tex
pdflatex -interaction=nonstopmode -halt-on-error main.tex
python verify_exact.py
```

The LaTeX `article` class provides a transparent submission-stage manuscript; Wiley may request a different template after editorial processing. The editor's portal may have additional mandatory fields. No publisher submission or GitHub repository mutation occurred in creating this local package.

## Verification boundaries

Analytic proof supports the entire stated quality strategy space conditional on global pure price continuation at fixed endpoints. Exact-rational tests and selected price-deviation grids are independent supplementary checks, **not** an exhaustive computational proof. Prior Lean theorem certifies the encoded reduced payoff; it was not rerun and does not formalize primitive price demand or the full endogenous location game.

## Author gate before any submission

- Obtain or independently check primary full text of Bunte (1995) and Sorenson (1995) against this precise theorem; do not represent unresolved theorem overlap as absent.
- Confirm the manuscript is not submitted or under a publisher transfer to another journal, despite the known RiO/ETB rejections.
- Verify author metadata, originality and AI-use declarations; compare journal's live portal requirements.
- Approve and sign the cover letter and delete its internal instruction footer.
