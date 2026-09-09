"""Deterministic numerical sanity checks independent of the symbolic solver."""
from fractions import Fraction


def share_and_revenue(x, y, a1, a2, p1, p2, n=20001):
    """Directly assign midpoint consumers by primitive utility."""
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


# Certified off-path witness: direct consumer assignment.
base = share_and_revenue(Fraction(1, 3), Fraction(2, 3), 0, 0, 1, 1)
dev = share_and_revenue(Fraction(1, 3), Fraction(2, 3), 0, 0, Fraction(7, 12), 1)
assert abs(base[0] - 0.5) < 1e-4
assert dev[0] > 0.9999
assert dev[2] > base[2]

# Global quality-deviation gain: numerical sign scan around the exact threshold.
def gain(lam):
    return (4.0 - 27.0 * lam) / (18.0 * lam)

samples_below = [0.112, 0.125, 0.14, 0.148]
samples_above = [0.149, 0.16, 0.19, 0.22]
assert all(gain(v) > 0 for v in samples_below)
assert all(gain(v) < 0 for v in samples_above)
assert abs(gain(4.0 / 27.0)) < 1e-12

print("Numerical direct-allocation/deviation checks passed.")
