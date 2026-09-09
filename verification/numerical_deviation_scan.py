"""Deterministic numerical sanity checks using primitive utility allocation."""
from fractions import Fraction


def share_and_revenue(x, y, a1, a2, p1, p2, n=20001):
    """Directly assign midpoint consumers by primitive utility, with no outside option."""
    q1 = 0.0
    q2 = 0.0
    for j in range(n):
        z = (j + 0.5) / n
        u1 = float(a1) - float(p1) - abs(z - float(x))
        u2 = float(a2) - float(p2) - abs(z - float(y))
        if u1 > u2:
            q1 += 1.0
        elif u2 > u1:
            q2 += 1.0
        else:
            q1 += 0.5
            q2 += 0.5
    q1 /= n
    q2 /= n
    return q1, q2, float(p1) * q1, float(p2) * q2


def endpoint_price_equilibrium(a1, a2):
    """Piecewise pure price continuation at locations 0 and 1."""
    delta = float(a1) - float(a2)
    if delta <= -3.0:
        return 0.0, -delta - 1.0
    if delta >= 3.0:
        return delta - 1.0, 0.0
    return 1.0 + delta / 3.0, 1.0 - delta / 3.0


def endpoint_quality_payoffs(a1, a2, lam, n=20001):
    """Compute normalized quality-stage payoffs from prices and primitive allocation."""
    p1, p2 = endpoint_price_equilibrium(a1, a2)
    q1, q2, r1, r2 = share_and_revenue(0, 1, a1, a2, p1, p2, n=n)
    v1 = r1 - 0.5 * float(lam) * float(a1) ** 2
    v2 = r2 - 0.5 * float(lam) * float(a2) ** 2
    return v1, v2, (q1, q2), (p1, p2)


# Certified off-path witness: direct consumer assignment.
base = share_and_revenue(Fraction(1, 3), Fraction(2, 3), 0, 0, 1, 1)
dev = share_and_revenue(Fraction(1, 3), Fraction(2, 3), 0, 0, Fraction(7, 12), 1)
assert abs(base[0] - 0.5) < 1e-4
assert dev[0] > 0.9999
assert dev[2] > base[2]

# Independent quality-deviation audit: no closed-form gain formula is used here.
for lam in [0.112, 0.125, 0.14, 0.148]:
    A = 1.0 / (3.0 * lam)
    B = 1.0 / lam
    base_payoff = endpoint_quality_payoffs(A, A, lam)[0]
    dev_payoff = endpoint_quality_payoffs(B, A, lam)[0]
    assert dev_payoff > base_payoff
    assert endpoint_quality_payoffs(B, A, lam)[3][1] == 0.0

for lam in [0.149, 0.16, 0.19, 0.22]:
    A = 1.0 / (3.0 * lam)
    B = 1.0 / lam
    base_payoff = endpoint_quality_payoffs(A, A, lam)[0]
    dev_payoff = endpoint_quality_payoffs(B, A, lam)[0]
    assert dev_payoff < base_payoff

lam = 4.0 / 27.0
A = 1.0 / (3.0 * lam)
B = 1.0 / lam
base_payoff = endpoint_quality_payoffs(A, A, lam)[0]
dev_payoff = endpoint_quality_payoffs(B, A, lam)[0]
assert abs(dev_payoff - base_payoff) < 2e-4

# Coarse global best-response sanity checks for the asymmetric equilibria.
for lam in [0.112, 0.125, 0.16, 0.20, 0.22]:
    B = 1.0 / lam
    grid = [B * j / 400.0 for j in range(0, 801)]
    pay_against_zero = [endpoint_quality_payoffs(a, 0.0, lam, n=4001)[0] for a in grid]
    best_a = grid[max(range(len(grid)), key=pay_against_zero.__getitem__)]
    assert abs(best_a - B) <= B / 200.0

    grid2 = [B * 2.0 * j / 400.0 for j in range(0, 401)]
    pay_against_B = [endpoint_quality_payoffs(a, B, lam, n=4001)[0] for a in grid2]
    best_a2 = grid2[max(range(len(grid2)), key=pay_against_B.__getitem__)]
    assert abs(best_a2) < 1e-12

print("Primitive-allocation price and quality deviation checks passed.")
