"""Stage10B provisional short-note structural regression tests."""
from pathlib import Path
SRC = (Path(__file__).resolve().parents[1] / "paper" / "short_note" / "main.tex").read_text(encoding="utf-8")
def test_core_bridge_equations_and_parameter_domain():
    for s in [r"\label{eq:demand}",r"\label{eq:prices}",r"\label{eq:payoff}",
              r"\label{eq:cornerBR}",r"\label{eq:FOC}",r"\label{eq:gain}",
              r"\label{eq:NE}",r"\dfrac4{27}\leq\lambda<\dfrac29"]:
        assert s in SRC,s
def test_editorial_and_theorem_scope_guards():
    for s in ["There are no other pure quality equilibria.",
              "fixed endpoint locations", "no claim of historical",
              "not a full three-stage", "not a claim",
              "full-text theorem-level equivalence"]:
        assert s.lower() in SRC.lower(),s
    assert r"\bibliography{../../references/references}" in SRC
def test_latex_main_environment_pairs():
    for e in ["document","abstract","theorem","lemma","proof"]:
        assert SRC.count(r"\begin{"+e+"}")==SRC.count(r"\end{"+e+"}")
