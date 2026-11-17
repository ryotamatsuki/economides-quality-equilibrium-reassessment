# Stage 11 — Provisional Hostile Referee Attack: fixed-endpoint correction note

Date: 2026-11-17 JST. Exact first-draft input: `paper/short_note/main.tex` at commit `cdad5fad4207d0284ca1c2c2c48fb87c7797c546`; comparison: `docs/stage10a/MANUSCRIPT_BLUEPRINT.md`, Stage4A/7.5A P4 certificates, previous Stage6/7.5 re-kill, full project provenance.
Verification actor: **AI reviewer using an independent analytical + primitive-consumer arithmetic path**. Not an external/human blinded peer reviewer. No altered input manuscript or modified economic primitives.
**PROVISIONAL STAGE11 VERDICT: NO FORMAL GO (scientific prerequisite hold + material editor-facing revision).** Technical P4 theorem audit PASS within specified scope; `FATAL / UNRESOLVED` scientific editorial-priority overlap; one `MAJOR BUT FIXABLE` source-to-theorem exposition bridge; other listed items MINOR or explicitly NOT APPLICABLE.

## 1. Threat model and theorem scope

What the paper actually proves: at permanently fixed endpoint locations, with original covered linear Hotelling demand, quadratic quality cost, nonnegative unbounded qualities/prices, parameter `1/9<λ<2/9`, and globally determined price responses, **all pure quality NE** are the two asymmetric exclusion pairs; symmetric pair exists precisely if `λ>=4/27`. Neither full three-stage SPNE nor endogenous locations nor mixed equilibrium nor welfare is claimed. Exact theorem printed in §4 eq. (NE), with price regions in §3 and appendix A.

The *strongest target* for disproof is whether any missed positive-quality/excluded, kink, market-sharing or zero-quality profile yields an additional pure NE or makes one alleged NE fail globally. The *strongest research-priority objection* is whether P4 is already exactly present in Bunte (1995) / Sorenson (1995). Both sources remain unavailable in complete original form by user instruction; **NO attempted new full-text acquisition and no fake novelty resolution.**

## 2. Independent from-primitive mathematical reconstruction

Consumer utility at endpoints implies firm-1 weak preference iff `z <= (1+δ-p1+p2)/2`; clipping to [0,1] yields the demand displayed in §2. Conditional price optimizers have regimes `δ<=-3`, `|δ|<=3`, `δ>=3`, with continuity at boundaries. Direct integration/finite-midpoint consumer-choice evaluator tests original utilities, **not the reduced-quality v used by the Lean source**.

At a middle-branch candidate and a feasible firm-1 full-capture price, firm-1 candidate revenue minus capture revenue equals `(δ-3)^2/18` (and mirror `(δ+3)^2/18` for firm 2). For δ>3 capture candidate is `(δ-1,0)`; a price increase enters a decreasing sharing branch and a decrease lowers full-market revenue. Source §3 and Appendix A expose this bridge. No pure-price counterexample found in tested histories; exact proof inherited from Stage4A.

From continuation, `v(a,b)` has excluded, sharing and capturing pieces with coinciding value at quality difference ±3; the revenue-slope jump at +3 is from 2/3 to 1, **not** a level jump. Quality best replies:
- Opponent 0: middle payoff increasing to 3, capture payoff strictly concave with peak `B=1/λ>3`; `BR(0)={B}`.
- Opponent B: any positive quality loses against choosing 0, including a middle-branch and reverse-capture attempt; `BR(B)={0}`.
- Both qualities positive but one excluded: excluded firm can lower its quality to 0, keep zero sales and save sunk quality cost; such a profile cannot be NE even at exclusion threshold.
- Both positive and both selling: first-order necessary conditions `(9λ-1)a1+a2=3` and `a1+(9λ-1)a2=3`, so `(9λ-2)(a1-a2)=0`. Since λ<2/9, only `(A,A)` remains, `A=1/(3λ)`.
- Opponent A: sharing maximum at A; full-capture maximum at B; exact profit gain `(4-27λ)/(18λ)`. Symmetric iff λ≥4/27; tie at exact cutoff. At tie, `(B,A)` is **not** NE because opponent reply to B is zero.

The three cases exhaust every pair in nonnegative quality strategies. No mathematical falsifier found for declared open λ domain. **Do not confuse this finding with a complete analytic validation of the original 3-stage model**, or with third-party peer review.

### Independent direct utility numerical attacks (falsification only)

A separate direct utility midpoint evaluator (3,000 consumers, no call to `v(a,b)` in determining shares) evaluated price equilibria at `δ=-6,-3,-2,0,2,3,6` and 121 alternative prices for each firm on [0,10]. It found no higher payoff than the candidate beyond fixed-grid tolerance 0.0015; finite tests do not certify continuum equilibrium. At `λ=1/8,4/27,1/6`, primitive consumer revenue after price continuation gave deviations from A to B with respective gains `5/18,0,-1/6`, exactly matching the symbolic formula. At `λ=1/8`, exclusion corner `(B,0)=(8,0)` yields normalized profits (3,0). `δ=±3` was included; no invalid price candidate was silently discarded.

These tests are **additional evidence only** and explicitly not substituted for the Stage4A analytic proof or Lean's global reduced-game IFF.

### Negative scope / robustness attack

Allowing a quality cap `a<=2` at `λ=1/6` makes the certified unbounded best response `BR(0)=B=6` infeasible. The original NE correspondence cannot be carried to bounded quality strategies by relabeling; unbounded nonnegative quality is an **essential** theorem assumption. Similarly quartic cost is outside scope (inherited prior Stage7.5A negative portability), and consumer outside options can change price continuation. **No model change was made.** This is an assumption challenge, not a counterexample to the theorem as stated.

## 3. Required hostile-referee attack register

| Attack | Manuscript location | Result and severity |
|---|---|---|
| 1989 source theorem accurately stated? | §1 first paragraph; §5 | **MAJOR BUT FIXABLE — editorial/logic bridge**: paper paraphrases a three-stage original outcome but never cites printed Theorem 2 / eqs (8)–(9), nor explicitly explains why a fixed-location stage-2 *profitable deviation* refutes a proposed full-stage symmetric path, while new P4 does not establish a replacement SPNE |
| Global price deviations across clipped regions | §2 demand; §3 lemma; Appendix A | PASS within fixed-endpoint game; direct consumer attacks corroborate; exact analytic proof is not Lean-formalized |
| Full vs local quality best replies | §4 theorem; Appendix B | PASS; finite capture deviation and all branch maxima shown |
| Zero-quality and positive-quality exclusion | §4 proof; Appendix B | PASS; cost-saving deviation and BR identities exhaust cases |
| Regime threshold δ=±3; cost threshold λ=4/27 | §3, §4 and Appendices A/B | PASS; equality includes symmetric pair; no extra pure profile |
| Excluded parameter endpoints λ=1/9,2/9 | §2, §4 and §5 | PASS as explicit exclusions, not a theorem there |
| Price or quality mixed NE / full-history SPNE | §2, abstract, §5 | NOT CLAIMED / PASS against overstatement |
| Consumer outside option / incomplete coverage | §2 | Assumed absent, explicitly model-specific; no portability claimed |
| Convex/nonquadratic cost and finite quality cap | §2, §5 | NOT ROBUST; proper negative portability boundary |
| Welfare ranking / policy action / empirical causal claims | §5 | NOT APPLICABLE to correction note, none asserted |
| Formal proof vs paper economic primitives | Appendix C | PASS with precise reduced-game Lean caveat; not a full price-demand kernel proof |
| Formal-source drift and missing certificates | §4, Appendix C; Stage4A/7.5A | No changed P4 claim; CI at exact PR15 head 44018818159 SUCCESS |
| Computational reproducibility / numeric-not-proof | Appendix C; project Makefile and CI | PASS as computation/build, not economic originality |
| Known-model-in-disguise / canonical normalization | Stage6 prior-art; §1,§5 | **UNRESOLVED / MATERIAL**: exact literature absorption by Bunte1995/Sorenson1995 cannot be ruled out; no-firstness avoids false precedence only |
| Own prior draft / sibling PR10 | Stage6 ledger; §5 | **MAJOR publication-control**: author's wider unpublished P4 already subsumes theorem; no parallel duplicate manuscript submission |
| Journal importance/fit | §1, §5 | **MAJOR / UNRESOLVED**: even correct correction might be deemed redundant or too narrow given older critique; target venue not set |
| Proof compression / hard bridge hidden in code | §2–4; Appendices A–C | Technically readable; main derivation intact. More explicit original→reduced correction bridge recommended |
| Figure/table necessity | §3–4 | N/A: four compact displays are better than arbitrary illustration |
| AI provenance / author verification attribution | Appendix C | PASS as currently qualified, final journal disclosure still pending |

## 4. Strongest plausible scientific rejection

> The mathematics may correctly re-characterize the pure quality game at exogenously fixed extreme locations, but the broader quality-stability problem was already identified in earlier literature. Without checking the actual theorems in Bunte (1995) and Sorenson (1995), the work has not established an unabsorbed new economic result even as a note; and it neither solves the full original stage game nor offers a new welfare or generality theorem. A rigorous derivation of a potentially known fact is insufficient evidence of original journal-level contribution. This is an **unresolved serious originality objection**, not a demonstrated duplicate or disproof of P4.

## 5. Precise repair route (no uncontrolled new theory)

**R1 MAJOR BUT FIXABLE — return to Stage10B manuscript architecture, without changing the certified theorem.** At the end of §1 paragraph one or beginning paragraph two, cite exact Economides 1989 printed p.27 eqs. (8)–(9) and p.28 Theorem 2, with source-accurate wording. Explicitly say: the original claimed candidate at maximal locations would have to be a Nash choice in the continuation quality subgame; finding a profitable quality deviation at the same locations is sufficient to reject that proposed path, **but** the two asymmetric quality NE themselves do not certify a full-game equilibrium. Then repeat a short specific bridge in §5, with one clear limit sentence. Avoid portraying the original paper as if it only claimed a fixed-location equilibrium.

**R2 MINOR — edit for reader economy.** Shorten the third Intro paragraph's uncertainty/priority discussion and keep source-depth qualification in §5; preserve citations and truthfulness. In post-result intuition, make the threshold tradeoff `(4-27λ)/(18λ)` verbally explicit, and state that revenue is continuous at δ=3 but its slope increases.

**R3 EXISTING MATERIAL SCIENTIFIC HOLD — return to Stage6/7.5, not Stage13.** No new full-text acquisition authorized. Keep published Bunte/Sorenson theorem absorption UNRESOLVED and no-priority framing. Do not waive this issue in an editorial rewrite.

**R4 PUBLICATION CONTROL — before eventual submission**, ensure old rejected RIO draft and PR10 overlap are transparently handled and any later transfer/submission status is checked with author. Do not independently submit this same theory twice.

## 6. Final Stage11 routing

- **P4 MATHEMATICAL / FORMAL CORE:** PASS within exact fixed-endpoint reduced-game scope (analytic, finite direct-utility stress tests, Lean reduced-game iff).
- **REVIEWER VERIFIABILITY:** CONDITIONAL — one source-claim → reduced-game-refutation bridge should be explicit in body; no numerical/Lean artifact may substitute.
- **COMMUNICATION:** REVISE — see `docs/stage11/EDITORIAL_REFEREE_REPORT.md`.
- **NOVELTY / JOURNAL ORIGINALITY:** UNRESOLVED — earlier exact P4 absorption threat remains.
- **CANONICAL STAGE 11 GO:** **NOT ISSUED**. Stage8 and Stage9 formal GO + Stage10A GO prerequisites are absent. Author explicitly authorized a provisional Stage10B draft, which permits productive at-risk referee work but not retroactive certification.
- Stage12 venue comparison may be researched in preparation, but cannot override the unresolved scientific gate. No main-branch theory-freeze mutation.
