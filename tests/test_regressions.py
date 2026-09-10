import csv
from pathlib import Path
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
    # On the frozen interval lam<2/9, 1/lam>9/2>3.
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
    # Check both certified coexistence boundaries/interior exactly.
    assert wdiff.subs(lam, sp.Rational(4, 27)) > 0
    assert wdiff.subs(lam, sp.Rational(4, 21)) > 0
    assert wdiff.subs(lam, sp.Rational(2, 9)) > 0


def test_generated_table_marks_cs_equality_at_four_over_twenty_one():
    text = Path("tables/parameter_regions.tex").read_text(encoding="utf-8")
    assert r"$\{4/21\}$" in text
    assert r"CS_E=CS_S" in text
    assert r"$[4/21,2/9)$" not in text
    assert r"$(4/21,2/9)$" in text


def test_linear_transport_rescaling_domain_conditions():
    # The exclusionary deviation B-A crosses the 3t boundary iff lambda*t <= 2/9.
    lam, t = sp.symbols("lam t", positive=True)
    A = 1 / (3 * lam)
    B = 1 / lam
    rhs = (2 - 9 * lam * t) / (3 * lam)
    assert sp.simplify(((B - A) - 3 * t) - rhs) == 0
    # Local concavity of the regular quality branch requires lambda*t > 1/9.
    curvature = sp.Rational(1, 9) / t - lam
    assert sp.simplify(curvature * t - (sp.Rational(1, 9) - lam * t)) == 0


def test_generated_csv_round_trip_has_three_columns_and_boundary_labels():
    with Path("figures/parameter_regions.csv").open(newline="", encoding="utf-8") as handle:
        rows = list(csv.reader(handle))

    assert rows[0] == ["lower", "upper", "interpretation"]
    assert len(rows) == 5
    assert all(len(row) == 3 for row in rows)
    assert "(1/9,4/27)" in rows[1][2]
    assert "[4/27,4/21)" in rows[2][2]
    assert "{4/21}" in rows[3][2]
    assert "equal CS" in rows[3][2]
    assert "(4/21,2/9)" in rows[4][2]
    assert "higher W, PS, and CS" in rows[4][2]
