# Stage 7.5A Formal Verification Certificate — Retroactive Closure

**Project:** `ryotamatsuki/economides-quality-equilibrium-reassessment`  
**Workflow authority:** `ryotamatsuki/research-paper-workflow` main @ `f48984013898696f010f0437a8cfed6b5b54bdc2`  
**Formal-verification checklist:** `checklists/FORMAL_VERIFICATION_CHECKLIST.md`  
**Project baseline:** Stage-10R2 head `a56ca57a69af348954036f7354d4960bf1a7f97f`  
**Theory freeze:** `ECONOMIDES-THEORY-FREEZE-2026-09-10-v1` — **UNCHANGED**  
**Certified formal-source head:** `c1b2bd587058982a1dc10f3dd30d7affe530f12a`  
**Date:** 2026-09-10

## 1. Final state

**FORMAL VERIFICATION PASS — PROOF-CRITICAL CORE.**

This certificate retroactively closes the Formal Verification Gate embedded in Stage 7.5A under the current workflow. It does not reopen or alter the frozen economic theory. The formalization mechanically checks the selected high-consequence algebraic, inequality, case-partition, threshold, best-response, and welfare components conditional on the independently certified endpoint price continuation.

The result is deliberately narrower than a formal derivation of the complete Economides game. No manuscript or workflow record may describe this certificate as a machine derivation of the full demand system, price Nash correspondence, full three-stage equilibrium correspondence, or pure-SPNE result.

## 2. Toolchain and reproducible environment

- Proof assistant: Lean 4.
- Toolchain: `leanprover/lean4:v4.34.0-rc2`.
- Library: mathlib commit `74828d59824ed9c1e3002f796aaf53cec5ffb47c`.
- Dependency lock: `lake-manifest.json`.
- Lake configuration: `lakefile.toml`.
- Toolchain pin: `lean-toolchain`.
- Library entry point: `Economides.lean`.
- Formal source: `Economides/Certification.lean`.
- Clean build command: `lake build Economides`.
- CI workflow: `.github/workflows/lean-certification.yml`.

## 3. CI evidence

### Lean certification

GitHub Actions workflow **Lean formal certification**, run `34427185947`, job `102714811824`, completed successfully on the PR merge ref `399897b6344d054b08e5386f10aa06a5dc853cd1`, corresponding to formal-source head `c1b2bd587058982a1dc10f3dd30d7affe530f12a` over the Stage-10R2 base.

Evidence from the successful log:

- Lean installed as `4.34.0-rc2`;
- mathlib resolved at the pinned commit;
- `Economides.Certification` built successfully;
- `Economides` built successfully;
- final Lake result: `Build completed successfully (8908 jobs)`;
- the post-build repository scan for `sorry`, `admit`, and project-specific `axiom` tokens completed successfully.

### Existing reproducibility suite

GitHub Actions workflow **reproducibility**, run `34427185942`, job `102714812082`, also completed successfully on the same formal-source head. Its successful steps include:

1. exact symbolic verification;
2. independent numerical audit;
3. regression tests;
4. deterministic output regeneration and diff check;
5. TeX manuscript build;
6. manuscript PDF artifact upload for visual QA.

Thus the Lean layer is additive to, not a substitute for, the existing analytic/symbolic/numerical evidence.

## 4. Claim-to-formal-theorem map

| Claim | Formal theorem(s) | Encoded assumptions | Certified component | Explicitly not certified | State |
|---|---|---|---|---|---|
| P2 — symmetric quality correction | `p2_deviation_gain_identity`, `p2_profitable_below_four_over_twenty_seven`, `p2_knife_edge`, `regular_branch_no_gain`, `high_exclusion_no_gain`, `best_exclusion_no_gain_above_threshold`, `p2_reduced_payoff_failure_core`, `p2_global_best_response_core` | reduced endpoint payoff induced by the Stage-4A certified price branches; `1/9<lambda<2/9`; nonnegative quality deviations | exact gain `(4-27 lambda)/(18 lambda)`, strict failure below `4/27`, knife edge, and global no-gain inequalities over the encoded reduced payoff at/above `4/27` | primitive demand derivation; proof that the encoded price continuation is the Nash price correspondence; a corrected full-game location threshold | PASS |
| P3 — asymmetric exclusion equilibria | `br_zero_global_core`, `regular_high_rival_no_gain_from_left`, `high_against_high_nonpos`, `br_high_global_core`, `reduced_payoff_zero_against_high`, `asymmetric_best_response_core` | same reduced payoff; `1/9<lambda<2/9`; all deviations `a>=0` | global best-response inequalities supporting `BR(0)` at `1/lambda` and `BR(1/lambda)` at zero, across the complete encoded three-branch payoff | derivation of the branch partition from consumer primitives; full or asymmetric equilibrium correspondence beyond the two certified profiles | PASS |
| B — price-branch transcription/boundaries | `price_branches_match_at_plus_three`, `price_branches_match_at_minus_three` | already certified endpoint price formulas | exact matching at `delta=+3` and `delta=-3` | Nash derivation of those formulas and tie-allocation proof | PASS |
| W — welfare and surplus identities | `welfare_gap_identity`, `cs_gap_identity`, `ps_gap_identity`, `cs_equal_at_four_over_twenty_one`, `cs_lower_below_four_over_twenty_one`, `cs_higher_above_four_over_twenty_one` | named symmetric profile S and certified exclusion profile E accounting formulas | exact welfare/PS/CS differences and the `4/21` CS threshold | derivation of welfare accounting from measure-theoretic consumer allocation; all-equilibria welfare ranking | PASS |
| exact regression witness | `exact_counterexample_one_eighth` | `lambda=1/8` | candidate profit `1/18`, deviation profit `1/3`, gain `5/18` | none beyond the reduced-payoff encoding boundary | PASS |
| P1 — modern pure-SPNE nonexistence | not formalized in this pass | n/a | none | game tree, proper-subgame definition, discontinuous price game, tie-allocation proof, pure-SPNE nonexistence | EXCLUDED BY TARGET MAP |

## 5. Statement-fidelity audit

### P2

`p2_reduced_payoff_failure_core` proves, for `1/9 < lambda < 4/27`, that the encoded reduced payoff at the exclusionary action `1/lambda` strictly exceeds the payoff at the reported symmetric action `1/(3 lambda)`.

`p2_global_best_response_core` proves, for `1/9 < lambda`, `4/27 <= lambda`, `lambda < 2/9`, and every nonnegative quality action `a`, that the encoded reduced payoff against the symmetric rival action is no greater than the payoff at the reported action.

This matches the frozen P2 claim at the maximal-location endpoint quality game. It does **not** certify a threshold for the complete location-quality-price game.

### P3

`asymmetric_best_response_core` universally quantifies over every nonnegative deviation `a` and proves both best-response inequalities needed for the two mirror asymmetric exclusion profiles throughout `1/9 < lambda < 2/9`.

This is an existence certificate for the two named reduced-quality equilibria conditional on the certified endpoint price continuation. It does **not** claim the complete quality-equilibrium set.

### Welfare

The formal welfare theorems reproduce the exact named-profile identities and the exact `4/21` consumer-surplus threshold. They do not convert the below-`4/27` symmetric profile into an equilibrium, and they do not establish a ranking over every possible equilibrium.

### Quantifiers and strictness

The formal inequalities preserve the frozen interval endpoints and strict/weak inequalities:

- lower original interval: `1/9 < lambda`;
- P2 failure: `lambda < 4/27`;
- P2 knife edge: `lambda = 4/27`;
- P2 global no-gain: `4/27 <= lambda` with `lambda < 2/9`;
- P3: `1/9 < lambda < 2/9`;
- all formalized quality deviations: `a >= 0`;
- CS threshold: strict signs below/above `4/21`, equality at `4/21`.

No theorem was weakened to obtain compilation.

## 6. Imported rather than proved economic content

The following economic facts are supplied by prior analytic/adversarial certification rather than derived from primitives in Lean:

1. the endpoint consumer-demand formulas;
2. the piecewise price continuation and its interpretation as the relevant pure Nash price continuation at maximal locations;
3. the mapping from quality gaps to the low-exclusion, regular, and high-exclusion branches;
4. the economic meaning of the encoded reduced quality payoff;
5. the named-profile welfare accounting formulas before algebraic comparison.

Lean proves implications and inequalities **conditional on this encoding**. The independent Stage-4A work remains authoritative for the economic derivation of the encoding.

## 7. Axiom and placeholder audit

The formal source contains no admitted proof and no project-specific axiom.

The successful CI repository scan rejects any source token matching `sorry`, `admit`, or `axiom` in `Economides.lean` and `Economides/`.

The retained `#print axioms` diagnostics report:

- `p2_reduced_payoff_failure_core` → `[propext, Classical.choice, Quot.sound]`;
- `p2_global_best_response_core` → `[propext, Classical.choice, Quot.sound]`;
- `asymmetric_best_response_core` → `[propext, Classical.choice, Quot.sound]`;
- `welfare_gap_identity` → `[propext, Classical.choice, Quot.sound]`;
- `cs_equal_at_four_over_twenty_one` → `[propext, Classical.choice, Quot.sound]`.

These are standard Lean/mathlib logical axioms used by the imported tactics/library. No `sorryAx` appears in any designated headline theorem after the successful build.

## 8. Model-boundary certificate

| Object | Status in Lean |
|---|---|
| algebraic profit definitions | formalized |
| complete three-branch reduced endpoint quality payoff | formalized as an encoded definition |
| global deviation domain `a>=0` for P2/P3 core | formalized |
| exact threshold and knife-edge algebra | formalized |
| branchwise/global inequality skeleton | formalized |
| endpoint price branch equality at `+-3` | formalized |
| welfare/CS/PS comparison algebra | formalized |
| consumer primitives and continuum demand | not formalized |
| demand/allocation measure | not formalized |
| Nash price correspondence from primitives | not formalized |
| complete sequential game/SPNE definition | not formalized |
| P1 pure-SPNE nonexistence | not formalized |
| mixed equilibria | not formalized |
| complete quality-equilibrium correspondence | not formalized |
| location-stage equilibrium | not formalized |
| literature/novelty claims | not formalizable and not certified here |

## 9. Conclusion-smuggling audit

No condition structure is presented as though it were a primitive derivation of Nash equilibrium. The reduced payoff is openly defined as the payoff induced by the independently certified price-continuation branches. The Lean theorems then establish the mapped algebraic/global-inequality consequences of that definition.

No helper lemma assumes the target inequality or threshold conclusion. The key global results are assembled from explicit algebraic identities, nonnegativity of squares, exact branch bounds, and quantified case splits.

## 10. Surviving risks

This formal PASS does not remove the following risks:

- an error in the economic derivation of the encoded endpoint price continuation would remain outside Lean and is controlled by Stage 4A / hostile review;
- the paper still does not characterize every quality equilibrium;
- the supporting full-history pure-SPNE observation remains analytic rather than formalized;
- prior-art/positioning risk is unaffected by Lean;
- manuscript wording must continue to distinguish a reduced endpoint quality-game statement from a full-game equilibrium statement.

These are scope boundaries, not failures of the formal targets.

## 11. Change control / rollback rule

This certificate becomes stale if any later change materially alters:

- the reduced payoff definition or its branch domains;
- the price-continuation formulas used by the encoding;
- the `1/9`, `4/27`, `4/21`, or `2/9` thresholds;
- the domain `a>=0`;
- the P2/P3 theorem quantifiers or equilibrium interpretation;
- the welfare accounting identities used as inputs.

A formal-source/build defect with unchanged mathematics may be repaired within the Formal Verification Gate. A false theorem, missing economic condition, or changed strategy/equilibrium domain must route to the earliest affected analytic stage under workflow governance before refreeze/re-certification.

## 12. Gate decision

All current Formal Verification Checklist requirements for the selected proof-critical core are satisfied:

- applicability decision recorded;
- target map recorded;
- pinned Lean/mathlib environment committed;
- selected high-value targets compile;
- statement fidelity audited;
- no admitted proof or project-specific axiom remains;
- model boundary explicitly certified;
- clean CI evidence retained;
- independent symbolic/numerical/reproducibility evidence preserved;
- limitations and surviving risks recorded;
- theory freeze unchanged.

Therefore the canonical state is:

> **FORMAL VERIFICATION PASS — PROOF-CRITICAL CORE**

and the retroactive Stage-7.5A Formal Verification Gate is **CLOSED** for `ECONOMIDES-THEORY-FREEZE-2026-09-10-v1` at the theorem scope documented above.
