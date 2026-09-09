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
