# Canonical Theory Freeze

**Freeze ID:** `ECONOMIDES-THEORY-FREEZE-2026-09-10-v1`  
**Freeze date:** 2026-09-10

## Canonical model

Two firms choose location, then quality, then price. Consumers `z∈[0,1]` have uniform density `μ>0` and utility

`u_i(z)=k+a_i-p_i-|z-ℓ_i|`.

Locations satisfy `ℓ_i∈[0,1]`, qualities `a_i≥0`, prices `p_i≥0`. Quality cost is `C(a_i)=c a_i^2/2`, variable production cost is zero, and `λ=c/μ`. Complete coverage is maintained.

## Frozen price continuation at maximal locations

At `x=0,y=1`, let `δ=a_1-a_2`. The pure price equilibrium is

- `(0,-δ-1)` for `δ≤-3`;
- `(1+δ/3,1-δ/3)` for `-3≤δ≤3`;
- `(δ-1,0)` for `δ≥3`.

The interior candidate beats a full-market undercut by exact squares `(δ-3)^2/18` and `(δ+3)^2/18`.

## Frozen propositions

### P1 — modern pure-SPNE nonexistence
Under the standard modern full-history definition of pure-strategy SPNE, for every `λ>0` the three-stage game has no pure SPNE. A witness proper subgame is `x=1/3,y=2/3,a_1=a_2=0`, whose price game has no pure Nash equilibrium.

This is a supporting equilibrium-concept observation, not the headline novelty claim.

### P2 — failure of the reported symmetric quality profile
At maximal locations, for `1/9<λ<4/27`, the profile

`a_1=a_2=1/(3λ)`

is not a Nash equilibrium of the quality subgame. A deviation to `a_i'=1/λ` yields normalized gain

`(4-27λ)/(18λ)>0`.

At `λ=4/27` the reported action and this exclusionary deviation tie. Within the original Theorem-2 interval, the reported symmetric profile is a quality-subgame Nash equilibrium iff `4/27≤λ<2/9`.

### P3 — additional asymmetric exclusion equilibria
At maximal locations, for every `1/9<λ<2/9`,

`(1/λ,0)` and `(0,1/λ)`

are pure-strategy Nash equilibria of the quality subgame.

No complete characterization of all quality equilibria is claimed.

## Frozen welfare comparisons

For the reported symmetric profile `S`,

`W_S/μ = k - 1/4 + 2/(9λ)`.

For a certified exclusion equilibrium `E`,

`W_E/μ = k - 1/2 + 1/(2λ)`.

Hence

`(W_E-W_S)/μ = (10-9λ)/(36λ)`.

This is a profile comparison throughout `1/9<λ<2/9` and an equilibrium-welfare comparison only on `4/27≤λ<2/9`, where both named profiles are equilibria.

Consumer-surplus difference is `(21λ-4)/(12λ)`, with threshold `λ=4/21`.

## Planner benchmark terminology

The unrestricted relevant planner may choose allocation, active firm, active-firm location, and qualities. In the relevant parameter region first-best allocations have one active firm at the market midpoint, quality `1/λ`, and full market service. Firm-label symmetry implies multiple mirror implementations.

With locations fixed at `(0,1)`, use the term **fixed-location planner optimum**. The certified asymmetric exclusion equilibria coincide with the two mirror-image fixed-location planner optima in the relevant parameter region.

## Approved robustness

With linear transportation coefficient `t>0`, exact rescaling gives the private threshold `λt=4/27` and consumer-surplus threshold `λt=4/21`.

No theorem is frozen for arbitrary convex quality costs, quadratic transportation, heterogeneous quality tastes, more than two firms, entry, outside options, or mixed strategies.

## Explicit exclusions

The paper does not claim: first discovery that Economides is wrong; a corrected full-game SPNE threshold of `4/27`; a complete quality-equilibrium correspondence; a unique corrected equilibrium; mixed-strategy SPNE characterization; all-equilibria welfare dominance; a generic convex-cost theorem; robustness to arbitrary transport technologies; or a policy prescription.

## Change control

Any change affecting equilibrium correctness/globality reopens Stage 4/4A and downstream gates. Any change affecting theorem scope, welfare-selection wording, robustness, or benchmark terminology reopens Stage 7.5A and any earlier affected stage. No silent theory drift is permitted.
