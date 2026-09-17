# Stage 7.5A — Formal Verification Certificate

Project: **The Complete Quality-Equilibrium Correspondence at Maximal Locations in the Economides (1989) Model**

Repository: `ryotamatsuki/economides-quality-equilibrium-reassessment`

Temporary verification branch: `stage75a-complete-equilibrium-formal`

PR: `#10` — verification-only; **must not be merged to `main`**.

## 1. Certified formal-source baseline

Formal/CI baseline commit audited here:

`04e034368d581eeb114f316b8806d7c72382609e`

Exact formal source:

`CompleteEquilibriumFormal.lean`

The Stage 7.5A closeout documentation is committed after that source/CI baseline. Its content does not modify theorem statements or proofs. GitHub Actions reruns on subsequent closeout commits are checked separately at final closure.

## 2. Toolchain and dependency lock

- Lean toolchain: `leanprover/lean4:v4.33.1`
- Lean version: `4.33.1`
- mathlib input revision: `v4.33.1`
- locked mathlib Git revision: `0df444a360eaa60ab8c11dca51a86af692955474`
- Lake target: `CompleteEquilibriumFormal`
- kernel command: `lake build --wfail`

`lake update` followed by `git diff --exit-code -- lean-toolchain lakefile.toml lake-manifest.json` succeeds at the certified baseline, so the dependency lock is reproducible and current.

## 3. Canonical CI evidence for the formal-source baseline

### lean-formal-verification

- workflow: `lean-formal-verification`
- run ID: `35178952674`
- run number: `26`
- job ID: `105066762233`
- head SHA: `04e034368d581eeb114f316b8806d7c72382609e`
- result: **SUCCESS**
- kernel step: `lake build --wfail` — **SUCCESS**

### reproducibility

- workflow: `reproducibility`
- run ID: `35178952712`
- run number: `105`
- job ID: `105066762734`
- head SHA: `04e034368d581eeb114f316b8806d7c72382609e`
- result: **SUCCESS**
- exact symbolic verification: **SUCCESS**
- independent numerical audit: **SUCCESS**
- regression tests: **SUCCESS**
- deterministic-output check: **SUCCESS**
- formal placeholder/axiom guard: **SUCCESS**
- kernel build: **SUCCESS**

At this baseline the reproducibility workflow was aligned so that its explicit placeholder/project-axiom guard covers both `EconomidesFormal.lean` and `CompleteEquilibriumFormal.lean`, matching the dedicated Lean workflow.

## 4. Placeholder and project-axiom audit

For the Stage 7.5A formal source and the pre-existing formal source:

- `sorry`: **0**
- `admit`: **0**
- project-defined `axiom`: **0**

The dedicated workflow rejects any line matching a proof placeholder or a top-level project-specific `axiom` declaration before the kernel build.

## 5. `#print axioms` interpretation

The selected Stage 7.5A theorems report only the standard Lean/mathlib dependencies

- `propext`;
- `Classical.choice`;
- `Quot.sound`.

These are standard logical/kernel-environment dependencies used by mathlib proofs. They are **not** project-specific axioms and therefore do not constitute a Stage 7.5A axiom failure.

No project-defined mathematical assumption has been injected through `axiom`, `sorry`, or `admit`.

## 6. Theorem-to-claim mapping

| Lean theorem | Paper-level claim | What is formally certified | What remains analytic / outside this theorem |
|---|---|---|---|
| `lambdaE_polynomial_root` | `lambda_E` satisfies `27 lambda^2-11 lambda+1=0` | Exact polynomial identity for `(11+sqrt 13)/54` | Economic reason this value is the exclusion-disappearance threshold depends on the reduced-game best-response audit |
| `core_threshold_order` | ordering of `4/27`, `4/21`, `2/9`, `lambda_E` and the PS comparison bound | Exact strict ordering `lambda_C < lambda_CS < lambda_M < lambda_E < 11/36` | Equilibrium existence/nonexistence in those regions is analytic Stage 4/4A content |
| `upper_threshold_value_tie` | exclusion survives at `lambda=lambda_E` by value tie | Exact equality of the encoded regular and exclusion candidate values at `lambda_E` | That these are the economically exhaustive global best-response candidates is analytic |
| `mutual_regular_difference_identity` | subtracting regular BR equations yields `(9 lambda-2)(a_1-a_2)=0` | Exact algebraic identity | Economic derivation of the regular BR equations is analytic |
| `mutual_regular_symmetry` | regular mutual-BR solutions are symmetric for `lambda != 2/9` | Conditional implication from the two encoded equations and `lambda != lambda_M` to `a_1=a_2` | Does not by itself prove all equilibria are regular or exhaust other branches |
| `mutual_regular_at_lambdaM_iff` | at `lambda=2/9`, the two regular equations collapse to `a_1+a_2=3` | Exact iff statement | Continuum endpoint admissibility/global optimality remains tied to analytic branch checks |
| `beta_dmax_identity` | continuum endpoint parameterization matches `|d| <= 6-3 sqrt 2` | Exact identity `3-2 beta = continuumDmax` | The derivation of `beta` as the economic endpoint is analytic |
| `excluded_positive_quality_strictly_worse_than_zero` | excluded low-quality firm must choose zero if it remains excluded | For `lambda>0`, every `a>0` has strictly lower encoded excluded payoff than `a=0` | Whether a deviation changes branch/status is handled by the global analytic best-response proof |
| `welfare_gap_formula` | `W_E-W_S=(10-9 lambda)/(36 lambda)` | Exact identity for named profiles | Equilibrium existence of S/E at a given parameter is analytic |
| `cs_gap_formula` | `CS_E-CS_S=(21 lambda-4)/(12 lambda)` | Exact identity | Dedicated region-by-region CS ordering is an elementary corollary plus equilibrium-existence ledger, not a formal NE theorem |
| `ps_gap_formula` | `PS_E-PS_S=(11-36 lambda)/(18 lambda)` | Exact identity | Same scope limitation as above |
| `exclusion_welfare_higher_through_lambdaE` | E has higher total welfare than S for `0<lambda<=lambda_E` | Exact strict inequality between the encoded S/E welfare functions under those parameter assumptions | Statement that E is welfare-maximizing **among all pure equilibria** also uses the analytic complete-correspondence theorem |
| `exclusion_ps_higher_through_lambdaE` | E has higher aggregate PS than S through `lambda_E` | Exact strict inequality for encoded S/E PS | No claim about non-equilibrium allocations |
| `continuumDmax_sq_lt_twelve`, `continuumDmax_sq_lt_nine`, `continuum_abs_bound_implies_sq_lt_*` | bounds needed for strict continuum dominance | Exact real-algebra bounds | Identification of the economic continuum with the assumed `|d|` range is analytic |
| `exclusion_welfare_dominates_continuum` | at `lambda=2/9`, E strictly dominates every continuum point in W | Exact inequality for all encoded `d` satisfying `|d|<=continuumDmax` | Does not define Nash equilibrium or independently establish that every such point is an equilibrium |
| `exclusion_cs_dominates_continuum` | E strictly dominates every continuum point in aggregate CS | Exact inequality under the same bound | No individual-consumer Pareto claim |
| `exclusion_ps_dominates_continuum` | E strictly dominates every continuum point in aggregate PS | Exact inequality under the same bound | Same formalization boundary |
| `fixed_location_coefficient_sign` | fixed-location planner threshold is `lambda=1` | For `lambda>0`, coefficient positive iff `lambda<1` | Economic derivation of the reduced planner objective and optimization over market shares are analytic; equality tie follows from zero coefficient |
| `first_best_coefficient_sign` | unrestricted-location planner threshold is `lambda=2` | For `lambda>0`, coefficient positive iff `lambda<2` | Economic derivation of the location-planner problem and location choices is analytic; equality tie follows from zero coefficient |
| `regular_linear_transport_rescale` | exact linear-transport rescaling on regular branch | Exact algebraic payoff equality after `a_i=t q_i`, division by `t`, with `t != 0` | Economic theorem restricts to `t>0` so branch inequalities and transport interpretation are preserved |
| `excluded_linear_transport_rescale` | exact linear-transport rescaling on exclusion branch | Exact algebraic payoff equality | Same `t>0` economic restriction |
| `high_linear_transport_rescale` | exact linear-transport rescaling on high/exclusion branch | Exact algebraic payoff equality | Same `t>0` economic restriction |

## 7. Formal certification scope

The Lean kernel therefore certifies the proof-critical core requested for Stage 7.5A:

1. exact threshold definitions/order used by the audit;
2. `lambda_E` polynomial identity;
3. value tie at the upper threshold;
4. mutual regular-BR difference identity;
5. symmetry away from `lambda=2/9`;
6. degeneracy at `lambda=2/9`;
7. strict inferiority of positive quality for an excluded firm on the encoded excluded branch;
8. S/E welfare-gap identities and key rankings;
9. strict exclusion-vs-continuum dominance under the certified continuum bound;
10. planner coefficient sign thresholds at `1` and `2`;
11. exact branchwise linear-`t` rescaling identities.

## 8. Explicitly non-formalized scope

Stage 7.5A does **not** claim Lean formalization of:

- the primitive continuum of consumers;
- demand derivation from primitive utilities;
- the downstream price Nash equilibrium from primitives;
- a formal definition of the quality game's Nash equilibrium relation;
- a kernel proof that all encoded branches / FOCs exhaust every economically feasible quality deviation;
- the complete full-game SPNE correspondence;
- endogenous location equilibrium;
- mixed quality equilibria;
- arbitrary transport technologies;
- arbitrary convex quality costs.

The complete pure-strategy Nash-equilibrium correspondence of the maximal-location reduced quality subgame relies on the combination of the Stage 4/4A analytic/adversarial certificate and this Stage 7.5A formal core. It must not be described as a fully mechanized proof of the primitive economic game.

## 9. Formal result

No false theorem statement, kernel failure, proof placeholder, or project-specific axiom was found.

**FORMAL VERIFICATION PASS**

Routing condition: subject to final closeout-head CI remaining green, proceed to Stage 8 Theory Freeze.