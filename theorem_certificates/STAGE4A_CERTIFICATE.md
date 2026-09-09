# Stage 4A — Independent Mathematical Adversarial Certification

## Frozen model
Economides (1989), three-stage location → quality → price game; linear Hotelling distance, uniform consumers, complete coverage, quality cost `c a_i^2/2`, `λ=c/μ>0`, pure strategies.

## Certified headline claims

### A. Pure-SPNE nonexistence
For every `λ>0`, the full three-stage game has no pure-strategy SPNE under the standard modern full-history domain.

Independent witness history:

`x_1=1/3, x_2=2/3, a_1=a_2=0`.

The ensuing pure price subgame has no Nash equilibrium. The audit checks the unique interior candidate, strict exclusion regions, and positive-measure tie boundaries. The boundary argument is robust to allocation of tied consumers.

Certificate: PASS.

### B. Endpoint price continuation
For `x_1=0,x_2=1`, with `δ=a_1-a_2`,

- `(0,-δ-1)` for `δ≤-3`;
- `(1+δ/3,1-δ/3)` for `-3≤δ≤3`;
- `(δ-1,0)` for `δ≥3`.

The interior candidate beats a full-market undercut by exact squares `(δ-3)^2/18` and `(δ+3)^2/18`.

Certificate: PASS.

### C. Failure of the reported symmetric quality characterization
At maximal locations, `a_1=a_2=1/(3λ)` is not a quality-stage Nash equilibrium for `1/9<λ<4/27`. The exact gain from the exclusionary global deviation `a_i=1/λ` is

`(4-27λ)/(18λ)`.

At `λ=4/27` the two actions tie.

Certificate: PASS.

### D. Asymmetric exclusion quality equilibria
For `1/9<λ<2/9`, `(1/λ,0)` and `(0,1/λ)` are quality-subgame Nash equilibria at maximal locations. Independent best-response calculations establish `BR(0)=1/λ` and `BR(1/λ)=0`.

Certificate: PASS.

## Scope limitations

- No claim that these are all quality equilibria.
- No mixed-strategy SPNE claim.
- The 1989 phrase “perfect equilibrium” is distinguished from a modern SPNE interpretation.
- Welfare is certified separately as a named-profile comparison.

## Stage 4A verdict

`GO — MATHEMATICAL ADVERSARIAL CERTIFICATION PASS`
