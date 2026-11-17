"""Provisional short-note manuscript scope and BER submission preflight guards.

Structural checks only; not a substitute for mathematical/novelty review.
"""
from pathlib import Path
import re

SRC = (Path(__file__).resolve().parents[1] / "paper" / "short_note" / "main.tex").read_text(encoding="utf-8")
PLAIN = re.sub(r"\\(?:emph|textbf)\{([^{}]+)\}", r"\1", SRC)
PLAIN = re.sub(r"\s+", " ", PLAIN).lower()


def test_core_bridge_equations_and_parameter_domain():
    for s in [
        r"\label{eq:demand}", r"\label{eq:prices}", r"\label{eq:payoff}",
        r"\label{eq:cornerBR}", r"\label{eq:FOC}", r"\label{eq:gain}",
        r"\label{eq:NE}", r"\dfrac4{27}\leq\lambda<\dfrac29",
    ]:
        assert s in SRC, s


def test_editorial_and_theorem_scope_guards():
    # Preserve intellectual claims while allowing the prose to be rewritten.
    for phrase in [
        "there are no other pure quality equilibria.",
        "fixed endpoint locations",
        "no claim to have been the first",
        "does not characterize full",
        "not claims about endogenous location equilibrium",
        "exact theorem-level relation",
        "theorem~2",
    ]:
        assert phrase in PLAIN, phrase
    assert r"\bibliography{../../references/references}" in SRC


def test_ber_metadata_abstract_and_ai_disclosure():
    assert r"\author{Ryota Matsuki" in SRC
    assert "Matsuyama, Ehime, Japan" in SRC
    assert r"\href{mailto:" in SRC
    assert "ORCID:" in SRC
    assert r"\textbf{Keywords:}" in SRC
    assert r"\textbf{JEL:}" in SRC
    assert r"\section*{Declaration of generative-AI assistance}" in SRC
    m = re.search(r"\\begin\{abstract\}(.*?)\\end\{abstract\}", SRC, flags=re.S)
    assert m, "missing abstract"
    without_math = re.sub(r"\$[^$]*\$", " MATH ", m.group(1))
    words = re.findall(r"[A-Za-z]+(?:[-'][A-Za-z]+)*", without_math)
    assert len(words) <= 150, f"abstract has {len(words)} words, BER limit 150"


def test_latex_main_environment_pairs():
    for e in ["document", "abstract", "theorem", "lemma", "proof"]:
        assert SRC.count(r"\begin{" + e + "}") == SRC.count(r"\end{" + e + "}")


def test_internal_refs_and_citation_keys_resolve_in_sources():
    source_labels = set(re.findall(r"\\label\{([^{}]+)\}", SRC))
    cited_labels = set(re.findall(r"\\(?:eqref|ref)\{([^{}]+)\}", SRC))
    assert not cited_labels - source_labels, sorted(cited_labels - source_labels)

    bib_text = (Path(__file__).resolve().parents[1] / "references" / "references.bib").read_text(encoding="utf-8")
    known_bib_keys = set(re.findall(r"@\\w+\\s*\{\s*([^,]+)", bib_text))
    cited_bib_keys = set()
    for match in re.finditer(r"\\cite(?:t|p)?(?:\[[^\]]*\])?\{([^{}]+)\}", SRC):
        cited_bib_keys.update(k.strip() for k in match.group(1).split(","))
    assert not cited_bib_keys - known_bib_keys, sorted(cited_bib_keys - known_bib_keys)
    assert cited_bib_keys, "Expected substantive references to original and prior works"
