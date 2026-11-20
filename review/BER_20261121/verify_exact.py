"""BER revision audit, adapted from repository verification/short_note_independent_audit.py.

Requires SymPy. Exact rational arithmetic. This is not a substitute for the paper's
analytic necessity/sufficiency proof and is not a fresh Lean certification.
"""
import sympy as sp
L, a, b, d = sp.symbols('L a b d', positive=True, real=True)
R = sp.Rational
lo = -L*a**2/2
mi = (1+(a-b)/3)**2/2-L*a**2/2
hi = a-b-1-L*a**2/2
assert sp.simplify(lo.subs(a,b-3)-mi.subs(a,b-3)) == 0
assert sp.simplify(mi.subs(a,b+3)-hi.subs(a,b+3)) == 0
assert sp.simplify(sp.diff(mi,a)-(3+a-b-9*L*a)/9) == 0
assert sp.simplify(sp.diff(mi,a).subs(a,b+3)-sp.diff(hi,a).subs(a,b+3)+R(1,3))==0
A, B = 1/(3*L), 1/L
assert sp.simplify(hi.subs({a:B,b:A})-mi.subs({a:A,b:A})-(4-27*L)/(18*L))==0
assert sp.simplify((4-27*L)/(18*L)).subs(L,R(4,27))==0
assert sp.simplify(hi.subs({a:B,b:0})-mi.subs({a:3,b:0})-(1-3*L)**2/(2*L))==0
assert sp.simplify(sp.diff((3-b)/(9*L-1),b)+1/(9*L-1))==0
# Regular-price candidate vs. full-market capture boundary.
assert sp.simplify((1+d/3)**2/2-2*d/3-(d-3)**2/18)==0
assert sp.simplify((1-d/3)**2/2+2*d/3-(d+3)**2/18)==0

def payoff(l,x,y):
    z=x-y
    if z<=-3: return -l*x*x/2
    if z<=3: return (1+z/R(3))**2/2-l*x*x/2
    return z-1-l*x*x/2

def br(l,y):
    assert R(1,9)<l<R(2,9) and y>=0
    m0=max(sp.Integer(0),y-3)
    m1=y+3
    middle=max(m0,min(m1,(3-y)/(9*l-1)))
    high=max(m1,1/l)
    candidates={sp.Integer(0),m0,m1,middle,high}
    values={x:sp.simplify(payoff(l,x,y)) for x in candidates}
    best=max(values.values())
    return {x for x,v in values.items() if v==best}

lambdas=[R(5,42),R(7,50),R(4,27),R(1,6),R(1,5),R(11,50)]
for l in lambdas:
    s,e=1/(3*l),1/l
    assert br(l,0)=={e}
    assert br(l,e)=={sp.Integer(0)}
    expected={e} if l<R(4,27) else ({s,e} if l==R(4,27) else {s})
    assert br(l,s)==expected,(l,br(l,s),expected)
    assert (e,sp.Integer(0)) in {(x,y) for x in br(l,0) for y in br(l,x)}
    for k in range(49):
        y=R(k,4)
        for x in br(l,y):
            if y in br(l,x):
                assert (x,y) in {(e,sp.Integer(0)),(sp.Integer(0),e)} or (l>=R(4,27) and x==s and y==s)

# Representative rational price games: each announced candidate is a global BR
# against nonnegative alternative prices (exact candidate candidates + rational grid).
def share1(delta,p1,p2):
    return max(R(0),min(R(1),(R(1)+delta-p1+p2)/2))
def revenue1(delta,p1,p2):return p1*share1(delta,p1,p2)
def revenue2(delta,p1,p2):return p2*(1-share1(delta,p1,p2))
for delta in [R(-9),R(-4),R(-3),R(-2),R(-1),R(0),R(1),R(2),R(3),R(4),R(9)]:
    if delta <= -3: p1,p2=R(0),-delta-1
    elif delta >= 3: p1,p2=delta-1,R(0)
    else: p1,p2=1+delta/3,1-delta/3
    v1,v2=revenue1(delta,p1,p2),revenue2(delta,p1,p2)
    for j in range(0,401):
        alt=R(j,20)
        assert revenue1(delta,alt,p2) <= v1,(delta,'p1',alt)
        assert revenue2(delta,p1,alt) <= v2,(delta,'p2',alt)
print('PASS: branch continuity, slope jump, price capture squares, exact gain, cutoff equality, local response slope')
print('PASS: 6 exact lambda regimes; 294 rational rival-quality grid points; 11 price gaps and 4411 price alternatives per player')
print('SCOPE: exact identities plus sampled global checks; analytic proof gives exhaustive all-quality claim; Lean not rerun')
