# Formal Verification Target Map

Workflow authority: `research-paper-workflow` main @ `f48984013898696f010f0437a8cfed6b5b54bdc2`, especially `checklists/FORMAL_VERIFICATION_CHECKLIST.md` and the embedded Stage-7.5A Formal Verification Gate.

Project baseline for this retroactive gate: Stage-10R2 head `a56ca57a69af348954036f7354d4960bf1a7f97f` with unchanged theory freeze `ECONOMIDES-THEORY-FREEZE-2026-09-10-v1`.

Applicability decision: **APPLICABLE**. The paper corrects a published mathematical result and its headline claims depend on piecewise regimes, quantified inequalities, global deviations, best-response partitions, exact thresholds, knife edges, and welfare identities. A targeted proof-critical formalization materially increases assurance even though formalizing the entire continuum game would be disproportionate.

| Claim ID | Paper claim | Proof-critical component | Lean target | Explicitly excluded | Reason for exclusion | Expected assurance gain |
|---|---|---|---|---|---|---|
| P2 | Symmetric reported quality fails for `1/9<lambda<4/27`; survives in the reduced endpoint quality game for `4/27<=lambda<2/9` | exact candidate/deviation payoffs, exclusion feasibility, regular-branch global bound, high-exclusion global bound, threshold sign and knife edge | formalize the reduced endpoint payoff induced by the certified price-continuation branches and prove the branchwise/global inequalities | derivation of demand and proof that the encoded price continuation is the Nash price correspondence | already independently certified at Stage 4A; encoding those economic primitives would be much larger than the proof-critical algebraic core | kernel-check the exact `4/27` logic and the global-best-response inequality skeleton rather than only the final gain formula |
| P3 | `(1/lambda,0)` and mirror are endpoint quality equilibria for `1/9<lambda<2/9` | `BR(0)=1/lambda` and `BR(1/lambda)=0` over all nonnegative qualities and all three payoff regimes | define the complete piecewise reduced quality payoff and prove both global best-response inequalities | derivation of each regime from consumer demand/price Nash equilibrium | the Stage-4A certificate already supplies the economic continuation; formal target is the fragile global-deviation partition conditional on that continuation | directly kernel-check the strongest algebraic content behind the asymmetric-equilibrium existence claim |
| B | Endpoint price continuation | boundary consistency at `delta=+-3`, nonnegative branch prices within their certified domains | prove exact boundary equalities and basic sign/domain identities | prove the price correspondence from Nash best-response definitions | requires formalizing demand/tie allocation and discontinuous price deviations; Stage 4A already supplies independent global certification | detects branch transcription/domain errors that would contaminate P2/P3 |
| W | Welfare and CS thresholds | exact `W_E-W_S`, `CS_E-CS_S`, threshold signs and equality | formalize exact identities and threshold ordering/signs | derive welfare accounting from measure-theoretic consumer allocation | welfare accounting already independently derived; algebra is the proof-critical contribution-facing core | kernel-check `4/21` and welfare-difference algebra used in text/figure/table |
| P1 | modern full-history pure-SPNE nonexistence | game-tree/proper-subgame/Nash definition and tie-boundary proof | **not targeted in this pass** | entire P1 formalization | high implementation cost relative to contribution; P1 is supporting, not headline novelty, and has an independent Stage-4A witness proof | avoids spending formalization effort on a lower-value supporting observation |

## Statement-fidelity rule

Lean may certify only the encoded reduced endpoint payoff and its inequalities. The formal certificate must not state that Lean has derived the demand correspondence, the price Nash correspondence, the full three-stage game, a complete quality-equilibrium correspondence, or pure-SPNE nonexistence unless those objects are later formalized explicitly.

## Rollback rule

If Lean cannot prove a mapped statement without adding an economic assumption not present in the frozen theorem, or exposes a false inequality/case domain, route to the earliest affected analytic stage under workflow governance. Do not weaken the theorem silently to obtain compilation.
