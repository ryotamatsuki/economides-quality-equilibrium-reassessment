"""Independent exact-rational adversarial checks. Not a complete proof; Lean certifies encoded reduced-game IFF."""
import sympy as sp
L,a,b=sp.symbols("L a b", positive=True, real=True)
lo=-L*a**2/2
mi=(1+(a-b)/3)**2/2-L*a**2/2
hi=a-b-1-L*a**2/2
assert sp.simplify(lo.subs(a,b-3)-mi.subs(a,b-3))==0
assert sp.simplify(mi.subs(a,b+3)-hi.subs(a,b+3))==0
assert sp.simplify(sp.diff(mi,a)-(3+a-b-9*L*a)/9)==0
A,B=1/(3*L),1/L
assert sp.simplify(hi.subs({a:B,b:A})-mi.subs({a:A,b:A})-(4-27*L)/(18*L))==0

def payoff(l,x,y):
    d=x-y
    if d<=-3:return -l*x*x/2
    if d<=3:return (1+d/sp.Integer(3))**2/2-l*x*x/2
    return d-1-l*x*x/2

def br(l,y):
    assert sp.Rational(1,9)<l<sp.Rational(2,9) and y>=0
    m0=max(sp.Integer(0),y-3);m1=y+3
    opt=max(m0,min(m1,(3-y)/(9*l-1)))
    highbest=max(m1,1/l)
    C={sp.Integer(0),m0,m1,opt,highbest}
    V={x:sp.simplify(payoff(l,x,y)) for x in C}
    M=max(V.values())
    return {x for x,z in V.items() if z==M}

ls=[sp.Rational(5,42),sp.Rational(7,50),sp.Rational(4,27),sp.Rational(1,6),sp.Rational(1,5),sp.Rational(11,50)]
for l in ls:
    s,e=1/(3*l),1/l
    assert br(l,0)=={e}
    assert br(l,e)=={sp.Integer(0)}
    expected={e} if l<sp.Rational(4,27) else ({s,e} if l==sp.Rational(4,27) else {s})
    assert br(l,s)==expected
    for k in range(49):
        y=sp.Rational(k,4)
        for x in br(l,y):
            if y in br(l,x):
                assert (x,y) in {(e,sp.Integer(0)),(sp.Integer(0),e)} or (l>=sp.Rational(4,27) and x==s and y==s)
print("PASS exact symbolic identities, six rational lambda regimes and 294 opponent-grid cases")
