from pathlib import Path
import re
import subprocess
import sys
import sympy as sp


def test_bad_subgame_undercut_gain():
    assert sp.Rational(7, 12) - sp.Rational(1, 2) == sp.Rational(1, 12)


def test_global_quality_deviation_threshold_and_knife_edge():
    lam = sp.symbols("lam", positive=True)
    gain = (4 - 27 * lam) / (18 * lam)
    assert sp.simplify(gain.subs(lam, sp.Rational(1, 8)) - sp.Rational(5, 18)) == 0
    assert sp.simplify(gain.subs(lam, sp.Rational(4, 27))) == 0
    assert gain.subs(lam, sp.Rational(3, 20)) < 0


def test_asymmetric_equilibrium_candidate_points_are_in_exclusion_region():
    lam = sp.symbols("lam", positive=True)
    gap = 1 / lam
    assert sp.simplify(gap.subs(lam, sp.Rational(2, 9)) - sp.Rational(9, 2)) == 0


def test_consumer_surplus_threshold():
    lam = sp.symbols("lam", positive=True)
    csdiff = (21 * lam - 4) / (12 * lam)
    assert sp.simplify(csdiff.subs(lam, sp.Rational(4, 21))) == 0
    assert csdiff.subs(lam, sp.Rational(1, 6)) < 0
    assert csdiff.subs(lam, sp.Rational(1, 5)) > 0


def test_welfare_dominance_on_equilibrium_coexistence_region():
    lam = sp.symbols("lam", positive=True)
    wdiff = (10 - 9 * lam) / (36 * lam)
    assert wdiff.subs(lam, sp.Rational(4, 27)) > 0
    assert wdiff.subs(lam, sp.Rational(4, 21)) > 0
    assert wdiff.subs(lam, sp.Rational(2, 9)) > 0


def test_generated_table_marks_cs_equality_at_four_over_twenty_one():
    text = Path("tables/parameter_regions.tex").read_text(encoding="utf-8")
    assert r"$\{4/21\}$" in text
    assert r"CS_E=CS_S" in text
    assert r"$[4/21,2/9)$" not in text
    assert r"$(4/21,2/9)$" in text


def test_generated_figure_makes_endpoint_membership_explicit():
    figure = Path("figures/parameter_regions.tex").read_text(encoding="utf-8")
    results = Path("paper/sections/results.tex").read_text(encoding="utf-8")

    assert r"$(1/9,4/27)$: symmetric $S$ fails" in figure
    assert r"$[4/27,4/21)$: coexistence, $CS_E<CS_S$" in figure
    assert r"$\{4/21\}$: coexistence, $CS_E=CS_S$" in figure
    assert r"$(4/21,2/9)$: coexistence, $CS_E>CS_S$" in figure
    assert figure.count(r"fill=white") >= 5
    assert r"\fill (5.333333,1.25) circle" in figure
    assert r"\fill (6.857143,1.95) circle" in figure
    assert "Open circles exclude and filled circles include" in results
    assert "The domain endpoints $1/9$ and $2/9$ are excluded" in results


def test_linear_transport_rescaling_domain_conditions():
    lam, t = sp.symbols("lam t", positive=True)
    A = 1 / (3 * lam)
    B = 1 / lam
    rhs = (2 - 9 * lam * t) / (3 * lam)
    assert sp.simplify(((B - A) - 3 * t) - rhs) == 0
    curvature = sp.Rational(1, 9) / t - lam
    assert sp.simplify(curvature * t - (sp.Rational(1, 9) - lam * t)) == 0


def test_stage14r_rescaling_unit_mapping_is_explicit():
    lean = Path("EconomidesFormal.lean").read_text(encoding="utf-8")
    cert = Path("theorem_certificates/STAGE7_5A_FORMAL_VERIFICATION_CERTIFICATE.md").read_text(encoding="utf-8")
    robustness = Path("paper/sections/robustness.tex").read_text(encoding="utf-8")

    assert "scaledP2Gain lam t is the dimensionless gain Δπ/(μ t)" in lean
    assert "Δπ/μ = t * scaledP2Gain lam t" in lean
    assert "scaledP2Gain = Δπ/(μt)" in cert
    assert "Δπ/μ = t × scaledP2Gain" in cert
    assert r"\frac{4-27\lambda t}{18\lambda}" in robustness
    assert r"\frac{4-27\lambda t}{18\lambda t}" not in robustness


def test_stage14r_prior_art_claim_is_evidence_bounded():
    intro = Path("paper/sections/introduction.tex").read_text(encoding="utf-8")
    literature = Path("paper/sections/related_literature.tex").read_text(encoding="utf-8")
    ledger = Path("docs/PRIOR_ART_COMPARISON_STAGE10R.md").read_text(encoding="utf-8")

    assert "exact overlap remains unresolved" in intro
    assert "we make no priority claim" in intro
    assert "exact overlap remains unresolved" in literature
    assert "We make no priority claim" in literature
    assert "EXACT OVERLAP UNRESOLVED FOR UNAVAILABLE FULL TEXTS" in ledger
    assert "Sorenson no-variety fact is **not** used" not in ledger  # guard stale shorthand
    assert "is **not** used as the decisive non-overlap test" in ledger


def test_stage13_rio_metadata_and_recent_comparison():
    main = Path("paper/main.tex").read_text(encoding="utf-8")
    intro = Path("paper/sections/introduction.tex").read_text(encoding="utf-8")
    literature = Path("paper/sections/related_literature.tex").read_text(encoding="utf-8")
    bib = Path("references/references.bib").read_text(encoding="utf-8")

    abstract = re.search(r"\\begin\{abstract\}(.*?)\\end\{abstract\}", main, re.S)
    assert abstract is not None
    plain = re.sub(r"\\[A-Za-z]+(?:\{[^}]*\})?", " ", abstract.group(1))
    words = re.findall(r"[A-Za-z0-9]+(?:[-'][A-Za-z0-9]+)*", plain)
    assert 150 <= len(words) <= 250

    assert r"\textbf{Keywords:}" in main
    assert r"\textbf{JEL Classification:}" in main
    assert "CohenHeifetz2024" in intro
    assert "CohenHeifetz2024" in literature
    assert "@article{CohenHeifetz2024" in bib
    assert r"\input{sections/research_transparency}" in main


def test_stage14_rio_declarations_and_title_page():
    declarations = Path("paper/sections/research_transparency.tex").read_text(encoding="utf-8")
    title_page = Path("paper/title_page.tex").read_text(encoding="utf-8")
    bib = Path("references/references.bib").read_text(encoding="utf-8")

    assert r"\section*{Statements and Declarations}" in declarations
    assert "This research received no external funding." in declarations
    assert "The author declares no competing interests." in declarations
    assert "Ryota Matsuki: Conceptualization" in declarations
    assert "Use of generative AI" in declarations
    assert "Ryota Matsuki" in title_page
    assert "Independent Researcher" in title_page
    assert "ryota.matsuki@gmail.com" in title_page
    assert "0009-0005-2329-531X" in title_page
    assert "Acknowledgments" in title_page
    assert "Hiroshi Kinokuni" in title_page
    assert "Takao Ohkawa" in title_page
    assert "guidance during his undergraduate studies" in title_page
    assert "https://doi.org/10.1007/s11151-024-09989-3" in bib
    assert "https://doi.org/10.1016/0166-0462(89)90031-8" in bib


def _build_package(output: Path, mode: str) -> str:
    subprocess.run(
        [
            sys.executable,
            "scripts/build_rio_flat_package.py",
            "--mode",
            mode,
            "--output",
            str(output),
        ],
        check=True,
    )
    assert (output / "main.tex").exists()
    assert (output / "references.bib").exists()
    assert not any(path.is_dir() for path in output.iterdir())
    combined = "\n".join(path.read_text(encoding="utf-8") for path in output.glob("*.tex"))
    assert "../" not in combined
    assert "sections/" not in combined
    return combined


def test_rio_anonymous_flat_package_is_flat_and_blinded(tmp_path):
    combined = _build_package(tmp_path / "rio_anonymous", "anonymous")
    assert "Ryota Matsuki" not in combined
    assert "ryota.matsuki@gmail.com" not in combined
    assert "0009-0005-2329-531X" not in combined
    assert "github.com/ryotamatsuki" not in combined
    assert "blinded repository link" in combined


def test_rio_identified_flat_package_is_flat_and_identified(tmp_path):
    combined = _build_package(tmp_path / "rio_identified", "identified")
    assert "Ryota Matsuki" in combined
    assert "ryota.matsuki@gmail.com" in combined
    assert "0009-0005-2329-531X" in combined
    assert "github.com/ryotamatsuki" in combined
