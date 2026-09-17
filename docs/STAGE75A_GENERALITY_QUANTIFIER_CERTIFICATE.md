# Stage 7.5A — Generality / Quantifier Certification

Project: **The Complete Quality-Equilibrium Correspondence at Maximal Locations in the Economides (1989) Model**

Repository: `ryotamatsuki/economides-quality-equilibrium-reassessment`

Temporary branch: `stage75a-complete-equilibrium-formal`

PR: `#10` — `Stage 7.5A: complete-equilibrium formal verification core`

Base: `main`

**PR #10 is a temporary verification PR and must not be merged to `main`.** Production migration for the independent paper is deferred to Stage 9.

## 1. Canonical verdict

**GO — GENERALITY / QUANTIFIER CERTIFICATION PASS**

**FORMAL VERIFICATION PASS**

Formal/CI source baseline certified: `04e034368d581eeb114f316b8806d7c72382609e`.

Canonical baseline CI evidence:

- `lean-formal-verification` run `35178952674` / job `105066762233`: **SUCCESS**;
- `reproducibility` run `35178952712` / job `105066762734`: **SUCCESS**.

The closeout documentation commits follow this source/CI baseline and do not alter the frozen theorem or Lean proofs. Final closeout-head CI is rechecked before Stage 7.5A is declared closed.

## 2. Certified theorem scope

The theorem being certified is exactly the **complete pure-strategy Nash-equilibrium correspondence of the maximal-location reduced quality subgame** with:

- locations fixed at `(0,1)`;
- `a_i in [0,infinity)`;
- `lambda>0`;
- linear Hotelling transport;
- quadratic quality cost;
- the globally solved maximal-location price continuation;
- pure quality Nash equilibrium.

It is not a complete equilibrium theorem for the full three-stage Economides game.

Excluded from the claim:

- mixed quality equilibria;
- complete equilibrium of the location-quality-price game;
- complete pure-SPNE characterization;
- endogenous locations;
- general transport technologies;
- arbitrary convex quality costs.

## 3. Exact quantifier table

| Object / claim | Exact quantifier / domain | Certification status |
|---|---|---|
| Baseline parameter | `lambda>0` | PASS |
| Quality domain | `a_i in [0,infinity)` | PASS; theorem-critical |
| Symmetric pure equilibrium | exists iff `lambda>=4/27` within the certified correspondence, including all `lambda>lambda_E` | PASS |
| Exclusion pure equilibria | exist for `0<lambda<=lambda_E` | PASS |
| Regular mutual-BR asymmetry | impossible for `lambda!=2/9` | PASS |
| Continuum | only at `lambda=2/9` | PASS |
| Continuum parameter | `(a,3-a)` with `beta<=a<=3-beta` | PASS |
| Unique pure quality equilibrium at maximal locations | only for `lambda>lambda_E` | PASS |
| Aggregate-CS S/E threshold | `lambda=4/21` | PASS |
| Total-welfare equilibrium selection | exclusion maximizes W among pure equilibria for `0<lambda<=lambda_E` | PASS |
| Fixed-location planner switch | `lambda=1`, equality included as tie | PASS |
| Unrestricted-location first-best switch | `lambda=2`, equality included as tie | PASS |
| Linear transport rescaling | every `t>0`, with `theta=lambda t` | PASS as exact restricted-family theorem |
| General convex quality costs | no universal extension | REJECTED |
| Bounded quality domain generally | no universal extension | REJECTED |

## 4. Endpoint ledger

### `lambda=4/27`

PASS.

- The symmetric pure quality equilibrium is included at equality.
- For `0<lambda<4/27`, it is not an equilibrium.
- Thus Region II begins with a weak lower inequality: `4/27 <= lambda < 2/9`.

### `lambda=2/9`

PASS.

- The continuum occurs exactly at this parameter.
- The mutual regular-BR equations collapse to `a_1+a_2=3`.
- `beta=(3/2)(sqrt(2)-1)`.
- The continuum includes both endpoints `a=beta` and `a=3-beta`.
- The symmetric point `(3/2,3/2)` is contained in the continuum.
- The two exclusion equilibria `(9/2,0)` and `(0,9/2)` also exist at this parameter.

### `lambda=lambda_E`

PASS.

`lambda_E=(11+sqrt(13))/54` satisfies `27 lambda_E^2-11 lambda_E+1=0`, and the relevant regular/exclusion candidate values tie there. Therefore exclusion equilibria remain included at `lambda=lambda_E`.

The unique-pure-quality-equilibrium statement begins at `lambda>lambda_E`, not `lambda>=lambda_E`.

### `lambda=4/21`

PASS.

From `CS_E-CS_S=(21 lambda-4)/(12 lambda)` and `lambda>0`:

- `lambda<4/21`: `CS_S>CS_E`;
- `lambda=4/21`: tie;
- `lambda>4/21`: `CS_E>CS_S`.

Within the multiplicity region this yields the canonical intervals `[4/27,4/21)`, `{4/21}`, and `(4/21,lambda_E]`.

### Planner equality cases

PASS.

- fixed-location coefficient equals zero at `lambda=1`, so optimized market splits tie;
- unrestricted-location coefficient equals zero at `lambda=2`, so optimized splits tie.

Neither equality case may be silently assigned to a strict side of the threshold.

## 5. Equilibrium-selection ledger

The complete certified pure-NE correspondence is:

| Parameter region | Equilibrium set |
|---|---|
| `0<lambda<4/27` | `{E_lambda^+,E_lambda^-}` |
| `4/27<=lambda<2/9` | `{S_lambda,E_lambda^+,E_lambda^-}` |
| `lambda=2/9` | `{(9/2,0),(0,9/2)} union {(a,3-a): beta<=a<=3-beta}` |
| `2/9<lambda<=lambda_E` | `{S_lambda,E_lambda^+,E_lambda^-}` |
| `lambda>lambda_E` | `{S_lambda}` |

Canonical wording is always qualified by `pure`, `quality`, and `maximal locations` as needed to prevent migration into a full-game equilibrium claim.

## 6. Welfare-selection ledger

Frozen named-profile welfare:

- `CS_S = k + 1/(3 lambda) - 5/4`;
- `PS_S = 1 - 1/(9 lambda)`;
- `W_S = k - 1/4 + 2/(9 lambda)`;
- `CS_E = k + 1/2`;
- `PS_E = 1/(2 lambda)-1`;
- `W_E = k - 1/2 + 1/(2 lambda)`.

Differences:

- `CS_E-CS_S=(21 lambda-4)/(12 lambda)`;
- `PS_E-PS_S=(11-36 lambda)/(18 lambda)`;
- `W_E-W_S=(10-9 lambda)/(36 lambda)`.

Because `lambda_E<10/9`, `W_E>W_S` throughout `0<lambda<=lambda_E`. Combining this with the complete pure-equilibrium correspondence gives:

> exclusion equilibria are **total-welfare-maximizing pure equilibria of the maximal-location quality game** for `0<lambda<=lambda_E`.

This is an equilibrium-selection statement, not a planner-optimum or social-optimum theorem. `socially optimal monopoly` is prohibited.

At `lambda=2/9`, for `d=a_1-a_2` and `|d|<=6-3 sqrt(2)`:

- `CS_C=k+1/4+d^2/36`;
- `PS_C=1/2+d^2/18`;
- `W_C=k+3/4+d^2/12`.

The exclusion equilibrium has `CS_E=k+1/2`, `PS_E=5/4`, `W_E=k+7/4`, and strictly dominates every continuum point in all three aggregate measures. No individual-consumer Pareto-dominance claim is made.

## 7. Planner benchmark ledger

### Fixed locations `(0,1)`

Canonical term: **fixed-location planner optimum**.

After quality optimization:

`W^FL(x)=k+[x^2+(1-x)^2]/2*(1/lambda-1)`.

- `0<lambda<1`: one active firm;
- `lambda=1`: all optimized market splits tie;
- `lambda>1`: equal split.

This benchmark is not first best.

### Locations chosen by planner

Canonical term: **first best within the stated two-firm/full-coverage model**.

`W^FB(x)=k+[x^2+(1-x)^2]*(1/(2 lambda)-1/4)`.

- `0<lambda<2`: one active midpoint firm;
- `lambda=2`: optimized splits tie;
- `lambda>2`: equal halves with locations `(1/4,3/4)`.

The first-best label must retain its model qualifier when there is any risk of being read as a claim for a broader environment.

## 8. Generality classification

### A. Baseline functional form — CERTIFIED

- linear transport;
- quadratic quality cost;
- unbounded nonnegative quality;
- maximal locations;
- pure quality NE.

### B. Restricted function-class exact theorem — CERTIFIED

For `t>0`, with utilities `u_i(z)=k+a_i-p_i-t|z-l_i|`, define `q_i=a_i/t` and `theta=lambda t`. Dividing the reduced payoff by `t` maps each frozen continuation branch exactly to the normalized baseline branch. Hence the exact thresholds are

- `theta_C=4/27`;
- `theta_M=2/9`;
- `theta_E=(11+sqrt(13))/54`.

Permitted claim: exact robustness to arbitrary positive coefficients **within the linear-transport family**.

Prohibited stronger claim: robustness to arbitrary transport costs / general transportation technologies.

### C. Not proved / prohibited

- arbitrary convex quality costs;
- nonlinear transport;
- quadratic/general convex spatial costs;
- outside option;
- incomplete coverage;
- bounded quality domain generally;
- more firms;
- endogenous entry;
- mixed equilibrium;
- endogenous location equilibrium.

## 9. Counterexample ledger

### CE-1 — arbitrary convex quality cost

With `C(a)=lambda a^4/4`, regular symmetric stationarity gives `a_S=(3 lambda)^(-1/3)` while the high-exclusion stationary quality is `a_E=lambda^(-1/3)`. At `lambda=4/27`, `a_E-a_S` is approximately `0.5795108777`, strictly below the branch distance `3`. The quadratic model's `4/27` switch therefore does not carry over unchanged. A generic convex-cost theorem is rejected.

### CE-2 — bounded quality domain

If `a_i<=a_bar<3`, a firm facing zero quality cannot enter the high-exclusion branch. Therefore the baseline theorem requires the unbounded domain `a_i in [0,infinity)`; general bounded-domain robustness is rejected.

## 10. Historical-priority limitation

Sorenson (1995), *Product Improvement and Leadership in Differentiated Markets*, remains unavailable in full text. Secondary evidence through Bunte indicates related use of the Economides R&D specification/stability issue.

Therefore Stage 7.5A freezes the following priority restrictions:

Prohibited:

- `first discovery`;
- `first complete characterization`;
- `previous literature overlooked all these equilibria`.

Permitted:

- `we derive`;
- `we characterize`;
- `we completely characterize the pure-strategy correspondence`;
- `the correspondence exhibits ...`.

This provenance limitation is carried forward to Stage 8 and later manuscript stages.

## 11. Lean theorem audit summary

The detailed theorem-by-theorem mapping is canonical in `theorem_certificates/STAGE75A_FORMAL_VERIFICATION_CERTIFICATE.md`.

Critical mappings:

| Lean theorem | Certified core | Analytic remainder |
|---|---|---|
| `lambdaE_polynomial_root` | exact polynomial identity | economic threshold interpretation |
| `upper_threshold_value_tie` | exact candidate-value equality | candidate exhaustiveness |
| `mutual_regular_symmetry` | symmetry conditional on encoded mutual regular BRs and `lambda!=2/9` | derivation/exhaustiveness of economic BRs |
| `mutual_regular_at_lambdaM_iff` | exact `a_1+a_2=3` degeneracy | economic continuum endpoint/global-BR proof |
| `excluded_positive_quality_strictly_worse_than_zero` | strict cost loss for positive excluded quality | branch-changing deviations |
| welfare gap/ranking theorems | exact S/E formulas and selected inequalities | equilibrium existence from complete analytic correspondence |
| continuum dominance theorems | strict CS/PS/W inequalities under exact `|d|` bound | formal NE definition / continuum-as-equilibrium proof |
| planner sign theorems | coefficient sign switches at 1 and 2 | planner-objective derivation and location optimization |
| linear transport rescaling theorems | exact branchwise algebraic identities | economic restriction `t>0` and branch interpretation |

## 12. Formalization boundary

Lean does not formalize and Stage 7.5A does not claim formalization of:

- primitive consumer continuum;
- demand derivation;
- downstream price NE derivation from primitives;
- a formal Nash-equilibrium definition for the quality game;
- proof that all encoded branches / FOCs exhaust the economic game;
- full-game SPNE;
- mixed equilibria.

The complete pure quality-equilibrium correspondence is certified by the joint package: analytic/adversarial Stage 4/4A proof plus Stage 7.5A Lean proof-critical core.

## 13. Axiom / placeholder audit

At certified source baseline `04e034368d581eeb114f316b8806d7c72382609e`:

- `sorry = 0`;
- `admit = 0`;
- project-specific `axiom = 0`;
- `lake build --wfail = SUCCESS`.

`#print axioms` reports only `propext`, `Classical.choice`, and `Quot.sound` for the selected formal theorems. These are Lean/mathlib standard dependencies, not project-specific mathematical axioms.

## 14. Claim-scope change audit

No frozen theorem statement has been weakened to obtain CI success. The Lean repairs were tactic/type-level repairs only.

Stage 7.5A does, however, impose explicit **wording/scope restrictions** that are mandatory going forward:

1. always qualify completeness by pure strategy + maximal-location quality subgame;
2. never convert the fixed-location planner benchmark into a first-best claim;
3. restrict transport robustness to positive coefficients within the linear family;
4. prohibit generic convex-cost and bounded-domain extensions;
5. retain the Sorenson provenance limitation.

These are scope clarifications, not mathematical rollback.

## 15. Rollback decision

**NO ROLLBACK REQUIRED.**

No mathematical counterexample to the frozen equilibrium theorem, welfare propositions, planner thresholds, or exact linear-transport rescaling was found during Stage 7.5A. The counterexamples found apply only to prohibited over-generalizations beyond the frozen model.

## 16. Stage 8 handoff contract

Stage 8 receives only:

1. frozen maximal-location reduced model;
2. complete pure-equilibrium correspondence;
3. exact threshold set `4/27`, `2/9`, `lambda_E` plus CS threshold `4/21`;
4. `lambda=2/9` continuum theorem;
5. welfare propositions;
6. fixed-location and unrestricted-location planner propositions;
7. exact positive-linear-`t` rescaling corollary;
8. novelty boundary;
9. Sorenson provenance limitation;
10. Stage 4A adversarial certificate;
11. this Stage 7.5A scope/generality certificate and claim-scope ledger;
12. `STAGE75A_FORMAL_VERIFICATION_CERTIFICATE.md`.

Stage 8 must not add a new mechanism, extension, parameter, or equilibrium refinement.

## 17. Routing

Subject to green CI on the final closeout HEAD:

**GO TO STAGE 8 — THEORY FREEZE**

Final Stage 7.5A state:

**STAGE 7.5A PASS — GO TO STAGE 8**