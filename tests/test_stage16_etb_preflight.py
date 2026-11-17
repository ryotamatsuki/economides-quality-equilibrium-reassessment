"""Stage16 Economic Theory Bulletin editorial/technical guards.

This test checks scope, metadata, exact carry-over of mathematical
equation/proof blocks and document references; it cannot certify novelty.
"""
from pathlib import Path
import re

ROOT = Path(__file__).resolve().parents[1]
BASE = (ROOT / "paper/short_note/main.tex").read_text(encoding="utf-8")
SRC = (ROOT / "paper/etb/main.tex").read_text(encoding="utf-8")
BIB = (ROOT / "references/references.bib").read_text(encoding="utf-8")


def _equation_blocks(text):
    return re.findall(r"\\begin\{equation\}.*?\\end\{equation\}", text, re.S)


def _environments(text, name):
    return re.findall(r"\\begin\{" + name + r"\}.*?\\end\{" + name + r"\}", text, re.S)


def test_no_scientific_theorem_or_equation_drift():
    assert _equation_blocks(SRC) == _equation_blocks(BASE)
    for name in ("theorem", "lemma", "proof"):
        assert _environments(SRC, name) == _environments(BASE, name)
    for label in ["eq:demand", "eq:prices", "eq:payoff",
                  "eq:cornerBR", "eq:FOC", "eq:gain", "eq:NE"]:
        assert r"\label{" + label + "}" in SRC
    assert "fixed endpoint locations" in SRC.lower()
    assert "full three-stage" in SRC.lower()


def test_etb_title_metadata_no_public_street_address():
    assert r"\author{Ryota Matsuki" in SRC
    assert "Independent Researcher" in SRC
    assert "Matsuyama, Ehime, Japan" in SRC
    assert r"\href{mailto:ryota.matsuki@gmail.com}" in SRC
    assert "ORCID: " in SRC
    assert not re.search(r"\b\d{3}-\d{4}\b", SRC)
    assert "street address" not in SRC.lower()
    assert r"\textbf{JEL:}" in SRC
    assert r"\textbf{Keywords:}" in SRC


def test_etb_abstract_is_150_to_250_words():
    m = re.search(r"\\begin\{abstract\}(.*?)\\end\{abstract\}", SRC, re.S)
    assert m is not None
    simple = re.sub(r"\$[^$]*\$", " MATH ", m.group(1))
    words = re.findall(r"[A-Za-z]+(?:[-'][A-Za-z]+)*", simple)
    assert 150 <= len(words) <= 250, len(words)
    assert "Theorem~2" not in m.group(1)


def test_etb_ai_and_declarations_and_references():
    assert r"\section*{Generative-AI assistance and verification}" in SRC
    assert "OpenAI's ChatGPT" in SRC
    assert "exact underlying model versions were not" in SRC
    assert "Lean results do not establish" in SRC
    assert r"\section*{Statements and Declarations}" in SRC
    for phrase in ["Funding.", "Competing interests.", "Author contributions.",
                   "Data and code availability.", "Acknowledgments."]:
        assert phrase in SRC
    known = set(re.findall(r"@\w+\s*\{\s*([^,]+)", BIB))
    cited = set()
    for m in re.finditer(r"\\cite(?:t|p)?(?:\[[^\]]*\])?\{([^{}]+)\}", SRC):
        cited.update(x.strip() for x in m.group(1).split(","))
    assert cited and cited <= known, cited - known
    labels = set(re.findall(r"\\label\{([^{}]+)\}", SRC))
    links = set(re.findall(r"\\(?:eqref|ref)\{([^{}]+)\}", SRC))
    assert links <= labels, links - labels
    assert r"\bibliography{../../references/references}" in SRC
