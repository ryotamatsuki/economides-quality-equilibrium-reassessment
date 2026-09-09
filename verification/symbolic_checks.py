"""Exact symbolic verification for ECONOMIDES-THEORY-FREEZE-2026-09-10-v1."""
import sympy as sp

lam = sp.symbols("lam", positive=True, real=True)
a = sp.symbols("a", nonnegative=True, real=True)
delta = sp.symbols("delta", real=True)
P, tau, eps = sp.symbols("P tau eps", nonnegative=True, real=True)
p1, p2 = sp.symbols("p1 p2", nonnegative=True, real=True)

# 1. Adversarial price subgame x=1/3, y=2/3, a1=a2=0.
interior = sp.solve(
    [sp.Eq(p1, (1 + p2) / 2), sp.Eq(p2, (1 + p1) / 2)],
    [p1, p2], dict=True,
)
assert interior == [{p1: 1, p2: 1}]
assert sp.Rational(7, 12) - sp.Rational(1, 2) == sp.Rational(1, 12)

# Tie-boundary audit q=-1/3; tau is the share of the tied right segment given to firm 1.
d = sp.Rational(1, 3)
pi1_boundary = (P - d) * (sp.Rational(2, 3) + tau / 3)
pi2_boundary = P * (1 - tau) / 3
pi2_cut = (P - eps) * (sp.Rational(1, 3) + eps / 2)
gain2_limit = sp.simplify(sp.limit(pi2_cut - pi2_boundary, eps, 0, dir="+"))
assert sp.simplify(gain2_limit - P * tau / 3) == 0
pi1_cut = P - d - eps
gain1_limit = sp.simplify(sp.limit(pi1_cut - pi1_boundary.subs(tau, 0), eps, 0, dir="+"))
assert sp.simplify(gain1_limit - (P - d) / 3) == 0
pi1_raise_corner = eps * (sp.Rational(2, 3) - eps / 2)
assert sp.simplify(pi1_raise_corner - eps * (4 - 3 * eps) / 6) == 0

# 2. Maximal-location price continuation global checks.
p1star = 1 + delta / 3
p2star = 1 - delta / 3
pi1star = p1star**2 / 2
pi2star = p2star**2 / 2
capture1 = p2star + delta - 1
capture2 = p1star - delta - 1
assert sp.simplify(pi1star - capture1 - (delta - 3) ** 2 / 18) == 0
assert sp.simplify(pi2star - capture2 - (delta + 3) ** 2 / 18) == 0

# 3. Reported symmetric quality profile vs exclusionary global deviation.
pi_sym = sp.Rational(1, 2) - 1 / (18 * lam)
pi_exc_best = 1 / (6 * lam) - 1
gain = sp.factor(pi_exc_best - pi_sym)
assert sp.simplify(gain - (4 - 27 * lam) / (18 * lam)) == 0
assert sp.simplify(gain.subs(lam, sp.Rational(4, 27))) == 0

# 4. Asymmetric quality equilibrium best responses.
u_int0 = sp.Rational(1, 2) * (1 + a / 3) ** 2 - lam * a**2 / 2
assert sp.simplify(sp.diff(u_int0, a).subs(a, 3) - (2 - 9 * lam) / 3) == 0
u_exc0 = a - 1 - lam * a**2 / 2
assert sp.solve(sp.Eq(sp.diff(u_exc0, a), 0), a) == [1 / lam]

B = 1 / lam
u_mid = sp.Rational(1, 2) * (1 + (a - B) / 3) ** 2 - lam * a**2 / 2
critical_mid = sp.factor(sp.solve(sp.Eq(sp.diff(u_mid, a), 0), a)[0])
assert sp.simplify(critical_mid - (3 * lam - 1) / (lam * (9 * lam - 1))) == 0
assert sp.simplify(u_mid.subs(a, B - 3) + (3 * lam - 1) ** 2 / (2 * lam)) == 0
u_reverse = a - B - 1 - lam * a**2 / 2
assert sp.simplify(u_reverse.subs(a, B + 3) + (9 * lam**2 + 2 * lam + 1) / (2 * lam)) == 0

# 5. Welfare identities for named profiles.
k = sp.symbols("k", real=True)
WS = k - sp.Rational(1, 4) + 2 / (9 * lam)
WE = k - sp.Rational(1, 2) + 1 / (2 * lam)
assert sp.simplify(WE - WS - (10 - 9 * lam) / (36 * lam)) == 0
CSdiff = sp.factor((k + sp.Rational(1, 2)) - (k + 1 / (3 * lam) - sp.Rational(5, 4)))
assert sp.simplify(CSdiff - (21 * lam - 4) / (12 * lam)) == 0
PSdiff = sp.factor((1 / (2 * lam) - 1) - (1 - 1 / (9 * lam)))
assert sp.simplify(PSdiff - (11 - 36 * lam) / (18 * lam)) == 0
assert sp.simplify(CSdiff.subs(lam, sp.Rational(4, 21))) == 0

print("All exact symbolic checks passed for ECONOMIDES-THEORY-FREEZE-2026-09-10-v1.")
