# Stage 7.5A — Canonical Claim Scope Ledger

Project: **The Complete Quality-Equilibrium Correspondence at Maximal Locations in the Economides (1989) Model**

Repository: `ryotamatsuki/economides-quality-equilibrium-reassessment`

Temporary verification branch: `stage75a-complete-equilibrium-formal`

PR: `#10` — verification-only; **DO NOT MERGE TO `main`**.

Formal/CI baseline audited by this ledger: `04e034368d581eeb114f316b8806d7c72382609e`.

## 1. Canonical equilibrium wording

The strongest permitted headline description is:

> **complete pure-strategy Nash-equilibrium correspondence of the maximal-location reduced quality subgame**

Equivalent local wording permitted when context is explicit:

- `all pure equilibria of the maximal-location quality game`;
- `unique pure quality equilibrium at maximal locations` for `lambda > lambda_E`;
- `we derive / we characterize / we completely characterize the pure-strategy correspondence`.

Prohibited wording:

- `complete equilibrium characterization of Economides (1989)`;
- `complete equilibrium of the three-stage game`;
- `complete pure SPNE characterization`;
- `unique equilibrium above lambda_E` without the pure-quality/maximal-location qualifier;
- `all equilibria` without the pure-quality/maximal-location qualifier.

The result does **not** cover mixed quality equilibria, the full location-quality-price game, endogenous locations, or full-game SPNE.

## 2. Frozen model scope

Baseline theorem class:

- locations fixed at `(0,1)`;
- quality strategies `a_i in [0,infinity)`;
- `lambda > 0`;
- linear Hotelling transport;
- quadratic quality cost;
- global maximal-location price continuation already solved analytically;
- equilibrium concept: pure-strategy Nash equilibrium of the reduced maximal-location quality subgame.

The baseline reduced payoff is the three-branch piecewise quality payoff frozen at Stage 4/4A.

## 3. Exact equilibrium correspondence and endpoints

Let

- `lambda_C = 4/27`;
- `lambda_M = 2/9`;
- `lambda_E = (11 + sqrt(13))/54`;
- `S_lambda = (1/(3 lambda), 1/(3 lambda))`;
- `E_lambda^+ = (1/lambda,0)` and `E_lambda^- = (0,1/lambda)`.

Canonical correspondence:

| Parameter region | Pure quality NE at maximal locations |
|---|---|
| `0 < lambda < 4/27` | `{E_lambda^+, E_lambda^-}` |
| `4/27 <= lambda < 2/9` | `{S_lambda, E_lambda^+, E_lambda^-}` |
| `lambda = 2/9` | two exclusion equilibria plus the continuum `(a,3-a)` for `beta <= a <= 3-beta` |
| `2/9 < lambda <= lambda_E` | `{S_lambda, E_lambda^+, E_lambda^-}` |
| `lambda > lambda_E` | `{S_lambda}` |

where `beta = (3/2)(sqrt(2)-1)`.

Endpoint ledger:

- `lambda = 4/27`: symmetric equilibrium **included**; below it symmetric equilibrium is excluded.
- `lambda = 2/9`: continuum exists **exactly** at this parameter; the symmetric point lies on the continuum; both continuum endpoints are included; exclusion equilibria also exist.
- `lambda = lambda_E`: exclusion equilibria **included** because the relevant values tie at the threshold.
- uniqueness of the pure quality equilibrium begins only for `lambda > lambda_E`, not `lambda >= lambda_E`.

## 4. Proof-critical regular-BR scope

The mutual regular best-response equations are

`(9 lambda - 1)a_1 + a_2 = 3`,

`a_1 + (9 lambda - 1)a_2 = 3`.

Subtracting gives

`(9 lambda - 2)(a_1-a_2)=0`.

Therefore mutual regular-BR equilibria are symmetric whenever `lambda != 2/9`, and at `lambda=2/9` the system degenerates to `a_1+a_2=3`.

This algebra does **not by itself** prove economic exhaustiveness of all branches. Exhaustiveness remains an analytic Stage 4/4A result.

## 5. Exclusion low-quality firm

On the excluded branch the firm's payoff from positive quality is `-lambda a_i^2/2 < 0` for `lambda>0`, while quality zero yields `0`. Hence the low-quality firm in an exclusion equilibrium must choose zero quality.

## 6. Welfare-selection ledger

Named-profile differences are

- `CS_E-CS_S = (21 lambda - 4)/(12 lambda)`;
- `PS_E-PS_S = (11 - 36 lambda)/(18 lambda)`;
- `W_E-W_S = (10 - 9 lambda)/(36 lambda)`.

Within the parameter range in which exclusion equilibria exist, `0 < lambda <= lambda_E`, exclusion equilibria are **total-welfare-maximizing pure equilibria of the maximal-location quality game**.

This does not license `socially optimal monopoly`, `first best`, or any claim against allocations outside the pure-equilibrium set.

Aggregate consumer-surplus selection among the symmetric and exclusion equilibria:

- `[4/27,4/21)`: `CS_S > CS_E`;
- `lambda = 4/21`: tie;
- `(4/21,lambda_E]`: `CS_E > CS_S`.

At `lambda=2/9`, each exclusion equilibrium strictly dominates every point of the continuum in aggregate CS, PS, and total welfare. No individual-consumer Pareto-dominance claim is licensed.

## 7. Planner terminology ledger

### Fixed-location planner

Locations remain fixed at `(0,1)`. The optimized reduced objective is

`W^FL(x) = k + [x^2+(1-x)^2]/2 * (1/lambda - 1)`.

Canonical terminology: **fixed-location planner optimum**.

- `0 < lambda < 1`: one active firm;
- `lambda = 1`: optimized market splits tie;
- `lambda > 1`: equal split.

This benchmark must **not** be called first best.

### Unrestricted-location planner

When the planner also chooses locations,

`W^FB(x) = k + [x^2+(1-x)^2] * (1/(2 lambda)-1/4)`.

Within the explicitly stated two-firm/full-coverage environment this benchmark may be called the **first best**.

- `0 < lambda < 2`: one active midpoint firm;
- `lambda = 2`: optimized splits tie;
- `lambda > 2`: equal halves with locations `(1/4,3/4)`.

## 8. Generality classification

### Baseline functional form

Certified only for:

- linear transport;
- quadratic quality cost;
- unbounded nonnegative quality domain;
- maximal locations;
- pure quality Nash equilibrium.

### Restricted function-class exact theorem

For linear transport coefficient `t>0`, set `q_i=a_i/t` and `theta=lambda t`. Dividing payoffs by `t` maps every frozen continuation branch exactly into the baseline reduced game. Therefore the thresholds in the rescaled parameter are exactly

`theta_C=4/27`, `theta_M=2/9`, `theta_E=(11+sqrt(13))/54`.

Permitted wording: **exact for arbitrary positive transport coefficients within the linear-transport family**.

### Not proved / prohibited

No theorem is claimed for:

- arbitrary convex quality costs;
- nonlinear transportation technologies;
- quadratic/general convex spatial costs;
- outside options or incomplete coverage;
- bounded quality domains generally;
- more firms;
- endogenous entry;
- mixed equilibria;
- endogenous locations.

## 9. Counterexample ledger

### CE-1: arbitrary convex quality cost

Replace quadratic quality cost by `C(a)=lambda a^4/4`. Then the regular symmetric stationary quality is `(3 lambda)^(-1/3)` and the high-exclusion stationary quality is `lambda^(-1/3)`. At the baseline quadratic threshold `lambda=4/27`, their difference is approximately `0.5795108777 < 3`, so the baseline `4/27` regime-switch theorem does not transfer unchanged. Generic convex-cost robustness is rejected.

### CE-2: bounded quality domain

If `a_i <= a_bar < 3`, a firm facing a zero-quality rival cannot reach the high-exclusion branch. Thus the unbounded strategy domain `a_i in [0,infinity)` is theorem-critical.

## 10. Historical-priority limitation

The full text of Sorenson (1995), *Product Improvement and Leadership in Differentiated Markets*, remains unavailable. Secondary evidence through Bunte indicates related use of the Economides R&D specification/stability issue. Accordingly the paper must not claim `first discovery`, `first complete characterization`, or that previous literature overlooked all relevant equilibria.

Permitted language remains descriptive: `we derive`, `we characterize`, `we completely characterize the pure-strategy correspondence`, `the correspondence exhibits ...`.

## 11. Formalization boundary

Lean formalizes algebra/order consequences and branchwise rescaling, not the primitive economic model. The following remain analytic:

- primitive consumer continuum;
- demand derivation;
- downstream price-Nash derivation from primitives;
- a formal Nash-equilibrium definition for the quality game;
- proof that the encoded continuation branches and FOCs exhaust the economic game;
- full-game SPNE;
- mixed equilibria.

No statement in Stage 7.5A may imply otherwise.

## 12. Canonical routing

Provided the formal-verification certificate and final CI remain green, the scope state is:

`GO — GENERALITY / QUANTIFIER CERTIFICATION PASS`

and the next route is:

`GO TO STAGE 8 — THEORY FREEZE`.

Stage 8 may freeze only the existing model, correspondence, thresholds, welfare/planner propositions, linear-`t` corollary, novelty boundary, Sorenson limitation, Stage 4A certificate, Stage 7.5A scope certificate, and Lean certificate. No new mechanism, parameter, extension, or refinement is admitted at Stage 8.