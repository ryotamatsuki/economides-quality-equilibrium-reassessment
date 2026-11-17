"""Stage17 fixed-scope literature-positioning regression checks.

Protects accuracy of the author-facing priority comparison; this cannot
certify what is contained in uninspected published full texts.
"""
from pathlib import Path
import re

ROOT = Path(__file__).resolve().parents[1]
SRC = (ROOT / "paper/etb/main.tex").read_text(encoding="utf-8")
BASE = (ROOT / "paper/short_note/main.tex").read_text(encoding="utf-8")


def _env(s, name):
    return re.findall(r"\\begin\{" + name + r"\}.*?\\end\{" + name + r"\}", s, re.S)


def test_stage17_only_edits_intro_not_theorem_math():
    for name in ("equation", "lemma", "theorem", "proof"):
        assert _env(SRC, name) == _env(BASE, name)
    assert SRC.count(r"\section{Introduction}") == 1
    assert SRC.count(r"\section{Model and equilibrium object}") == 1


def test_prior_stability_attribution_and_narrow_correction():
    intro = SRC.split(r"\section{Introduction}")[1].split(r"\section{Model and equilibrium object}")[0]
    assert r"\citet[chap.~3]{Bunte1997}" in intro
    assert r"\citet{Sorenson1995}" in intro
    assert r"\citet{Bunte1995}" in intro
    assert "complete pure-strategy" in intro
    assert r"Theorem~\ref{thm:complete}" in intro
    assert "no historical-priority claim" in intro
    assert "endogenous" in intro


def test_no_private_postal_data_and_ai_declarations_kept():
    assert "Independent Researcher" in SRC
    assert "Matsuyama, Ehime, Japan" in SRC
    assert not re.search(r"\b\d{3}-\d{4}\b", SRC)
    assert "OpenAI's ChatGPT" in SRC
    assert r"\section*{Statements and Declarations}" in SRC
