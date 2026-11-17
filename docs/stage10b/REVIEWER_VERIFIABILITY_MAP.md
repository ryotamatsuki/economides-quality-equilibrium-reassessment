# Stage 10B — Reviewer verifiability map
Date: 2026-11-17 JST. Candidate-only source. No canonical freeze/GO.

| Proof object | Manuscript | Audit / evidence | Lean boundary |
|---|---|---|---|
| Covered endpoint utility, quality costs and nonnegative domains | §2, utility | Original 1989 paper; old Stage4A | Not encoded |
| Clipped demand | §2, demand | Original 1989 primitives; Stage4A | Not encoded |
| Three-branch global price equilibrium | Lemma 1; §3; Appendix A | historical Stage4A price certificate | Assumed in reduced-game encoding |
| Reduced quality payoff | §3, payoff | new P4 Stage4A certificate | Payoff is encoded |
| Corner BR to 0 and B | §4, cornerBR; Appendix B | new P4 Stage4A | br_zero_iff, br_one_iff |
| Exclusion at positive quality cannot be NE | §4 proof; Appendix B | new P4 Stage4A | excluded_not_BR |
| Both-positive market-sharing quality FOCs force symmetry | §4, FOC; Appendix B | Stage4A | interior_foc, regular_symmetry |
| Exact global deviation to full capture | §4, gain; Appendix B | independent exact SymPy checks | br_symmetric_iff |
| Full iff quality NE correspondence in original open λ domain | Theorem 1, NE | Stage4A + 7.5A | complete_pure_quality_NE, encoded reduced payoff only |
| Novelty versus older literature | §1, §5 | Stage6/7.5 rekill; Bunte/Sorenson not fully verified | Never certified by Lean |
| Reproducibility / AI provenance | Appendix C | author signoff record, build and CI | No historical priority or external peer review |

Proof clarity risk: global best responses are established across all branches, not merely FOCs. Necessity covers zero-quality profiles, positive quality with exclusion, and positive quality with both selling. Theorem never claims location equilibrium, mixed strategy equilibrium or welfare dominance.
