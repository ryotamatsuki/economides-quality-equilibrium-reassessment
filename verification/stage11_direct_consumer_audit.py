"""Stage 11 direct-utility falsification tests; does NOT prove a continuum Nash result."""
from math import isclose

def share_from_consumer_utilities(a1,a2,p1,p2,n=3000):
    """Integrate consumer choices using utility comparisons, not reduced payoff."""
    count=0
    for i in range(n):
        z=(i+0.5)/n
        count+=(a1-p1-z >= a2-p2-(1-z))
    return count/n

def price_candidate(a1,a2):
    d=a1-a2
    if d<=-3: return 0.,-d-1.
    if d>=3: return d-1.,0.
    return 1+d/3,1-d/3

def primitive_profit(lam,a1,a2):
    p1,p2=price_candidate(a1,a2)
    s=share_from_consumer_utilities(a1,a2,p1,p2)
    return p1*s-lam*a1*a1/2,p2*(1-s)-lam*a2*a2/2

def test_market_share_and_price_deviation_attack():
    for delta in (-6,-3,-2,0,2,3,6):
        p1,p2=price_candidate(delta,0)
        s=share_from_consumer_utilities(delta,0,p1,p2)
        assert abs(s-max(0,min(1,(1+delta-p1+p2)/2))) < 1/3000+1e-12
        originals=(p1*s,p2*(1-s))
        for firm in (0,1):
            candidate_prices=[k*10/120 for k in range(121)]
            candidate_prices += [max(0,(p1,p2)[firm]+offset) for offset in (-.001,0,.001)]
            for pd in candidate_prices:
                q1,q2=(pd,p2) if firm==0 else (p1,pd)
                ss=share_from_consumer_utilities(delta,0,q1,q2)
                revenue=pd*(ss if firm==0 else 1-ss)
                assert revenue <= originals[firm] + 0.0015, (delta,firm,pd,revenue,originals)

def test_quality_deviation_crosses_price_regimes():
    for lam in (1/8,4/27,1/6):
        A=1/(3*lam)
        B=1/lam
        actual=primitive_profit(lam,B,A)[0]-primitive_profit(lam,A,A)[0]
        expected=(4-27*lam)/(18*lam)
        assert isclose(actual,expected,rel_tol=0,abs_tol=1e-10),(lam,actual,expected)
        assert primitive_profit(lam,B,0)[1]==0
        assert B-A>3
