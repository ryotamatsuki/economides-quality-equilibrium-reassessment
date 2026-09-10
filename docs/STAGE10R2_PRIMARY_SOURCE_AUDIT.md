# Stage 10R2 — Primary-Source Non-Absorption Audit

**Project:** `ryotamatsuki/economides-quality-equilibrium-reassessment`  
**Working baseline:** `main @ 6a913ea97a0f30ffeb201449d35a7aa50cc52306`  
**Theory Freeze:** `ECONOMIDES-THEORY-FREEZE-2026-09-10-v1`  
**Freeze blob before Stage 10R2:** `20b5b177f0e301e33261c2d11ea4403c187e9b97`

## 1. Governance and repository instructions

No root-level `AGENTS.md` exists in the repository at the Stage 10R2 baseline. The project therefore follows the external canonical workflow, in particular `ryotamatsuki/research-paper-workflow/GOVERNANCE.md` v2.1. The applicable rules are evidence before claims, no novelty inference from search failure, primary-source inspection of closest prior art where reasonably possible, and no silent theory drift after freeze.

## 2. Source-access ledger

| Source | Version / location obtained | Body access | Pages / sections checked | Appendix checked | Formula image cross-check | Remaining limitation |
|---|---|---|---|---|---|---|
| Economides (1989), *Quality Variations and Maximal Variety Differentiation* | Author-hosted published article PDF, `https://neconomides.com/uploads/Economides_Quality_Variations_and_Maximal_Variety_Differentiation.pdf` | YES, full 9-page article | Model and Games 1/2, price and quality calculations, Theorems 1–2, pp. 21–29 | N/A (no separate appendix in the 9-page article) | YES for material equations/pages during the earlier Stage-4/Stage-10 audit | None material for the present comparison |
| Bunte (1997), *Product Innovations and Barriers to Entry*, Chapter 3 | Maastricht University thesis record and official PDF endpoint, DOI `10.26481/dis.19970131fb`; indexed text of the same thesis also available via CiteSeerX | PARTIAL. Official repository confirms a full published PDF, but direct PDF retrieval returned HTTP 403 in this audit; indexed primary-document text was available | Ch. 3 contents; pp. 95–96 (demand/cost setup), 102–106 (Hotelling scenario), 110–111 (limit-price scenario), 115 (cost/welfare benchmark evidence), 122ff. headings, App. material around p. 144 | PARTIAL | NO for Bunte formulas: direct page-image access was unavailable | Cannot certify every equation/case in Chapter 3 from page images; indexed text is sufficient for the specific parameter mapping below but not for an exhaustive absence claim |
| Bunte (1995), CRIEFF DP 9509 | CRIEFF/institutional bibliographic listing plus RePEc/EconBiz abstract | NO full body located | Abstract / metadata only | NO | NO | Full working-paper body and appendices not obtained. Do not equate it unconditionally with 1997 Chapter 3 |
| Sorenson (1995), *Product Improvement and Leadership in Differentiated Markets* | Springer publisher page, DOI `10.1007/BF01027081` | NO full body; subscription preview only | Publisher abstract, bibliography/metadata | NO | NO | Full article unavailable in lawful open sources located in this audit; exact strategy domains, cost specification, stability derivation, thresholds, and equilibrium set remain UNKNOWN |

### Access discipline

No paywall, access control, or technical restriction was bypassed. No third-party copyrighted full text is copied into this repository. This record stores only bibliographic locations, short mathematical facts needed for comparison, and paraphrased source evidence.

## 3. Model-unit matrix

`UNKNOWN` means that the accessible primary-source evidence was insufficient; it is not an inference that the feature is absent.

| Item | Economides (1989) | Bunte (1995) | Bunte (1997), Ch. 3 | Sorenson (1995) | Present paper | Primary-source evidence |
|---|---|---|---|---|---|---|
| consumer utility | `k+a_i-p_i-|z-l_i|` under baseline normalization | Hotelling quality/variety model, exact equation UNKNOWN | `U=Q-P-u_B d` | UNKNOWN from full text | same as Economides, plus exact `t>0` rescaling | Economides pp. 23–24; Bunte p. 95 |
| consumer distribution / market size | uniform density `mu` on `[0,1]` | UNKNOWN beyond abstract | uniform density 1 on `[0,1]` | UNKNOWN | uniform density `mu`; normalized comparisons use per-`mu` payoffs | Economides p. 24; Bunte p. 95 |
| outside option / coverage | reservation term chosen so all consumers buy | UNKNOWN | text says consumers may buy one or none, then ignores the no-purchase possibility and assumes covered market | UNKNOWN | maintained covered duopoly; no outside option in the strategic demand rule | Economides p. 23 n.4; Bunte p. 95 |
| horizontal differentiation / locations | endogenous `x,y` | endogenous variety according to abstract | endogenous locations `s_a,s_b` in Ch. 3 | horizontally/vertically differentiated markets, exact location-choice treatment UNKNOWN | original game endogenous; headline correction conditions on `x=0,y=1` | Economides; Bunte pp. 95, 105–106; Sorenson publisher abstract |
| initial quality | quality level is strategic | abstract mentions initial-quality asymmetry | initial quality and quality improvement distinguished in asymmetry analysis | market leader/initial asymmetry central, exact state variable UNKNOWN | baseline uses quality levels directly | Bunte abstract / Ch. 3 headings; Sorenson abstract |
| quality improvement vs. level | level `a_i` | quality improvement | `Delta Q_i` added to initial quality | product-improving R&D | quality level; mapping to Bunte uses `a_i=Delta Q_i` only for the symmetric benchmark comparison | Economides p. 22; Bunte pp. 95–96, 105; Sorenson abstract |
| quality/R&D strategy domain | `a_i>=0` | UNKNOWN | nonnegative R&D/quality improvement is implied; full upper-domain statement not independently image-verified | UNKNOWN | `a_i>=0` | Economides; Bunte equations/text; Sorenson full text unavailable |
| quality/R&D cost | `c a_i^2/2` | convex R&D cost, exact coefficient UNKNOWN from accessible 1995 source | quadratic R&D expenditure in `Delta Q`; indexed text uses a cost coefficient denoted here `m_B` | UNKNOWN | `c a_i^2/2` | Economides p. 22; Bunte pp. 96, 115 and Ch. 3 equations |
| marginal production cost | zero baseline; constant MC can be reinterpreted as markup | UNKNOWN | constant `mc` | UNKNOWN | zero baseline | Economides p. 24 n.6; Bunte pp. 95, 106, 115 |
| price strategy domain | nonnegative prices | UNKNOWN | exact global price strategy domain UNKNOWN | UNKNOWN | `p_i>=0` | Economides / present model; Bunte accessible text does not certify full domain |
| timing | Game 2: location -> quality -> price | quality/variety then pricing according to abstract, precise within-period ordering UNKNOWN | Hotelling scenario: variety and quality chosen in first period; price competition in second; limit-price scenario separately specified | R&D before differentiated Bertrand | location -> quality -> price | Economides pp. 22–23; Bunte Ch. 3 Sec. 3 structure; Sorenson abstract |
| noncooperative price game | yes | pricing treatment differs per abstract | Hotelling scenario explicitly uses recognition of mutual dependence; limit-price scenario uses limit pricing | differentiated Bertrand, exact reaction restrictions UNKNOWN | original Economides noncooperative price game retained and re-solved | Economides; Bunte abstract / pp. 97, 102–111; Sorenson abstract |
| treatment of Hotelling price instability | acknowledges some subgames have no pure NE; Game 2 calculation uses regular branch candidate | Hotelling mutual-dependence scenario and limit-price scenario | same two scenario families; also discusses quadratic transport alternative | UNKNOWN | does not replace pricing rule; solves endpoint pure-price continuation globally | Economides pp. 21, 24; Bunte abstract / Ch. 3 |
| quality stability condition | local maximization conditions plus reported equilibrium calculation | abstract insufficient | separate R&D-game stability restriction; text distinguishes it from the own second-order condition | Bunte reports Sorenson has same condition, but direct full-text verification unavailable | global unilateral best-response test including branch-changing finite deviations | Economides pp. 24–27; Bunte pp. 105–106 and p. 144 |
| exclusion / limit pricing | exclusion/undercutting explicitly considered in Game 1; Game 2 reported quality calculation does not globally re-solve all quality deviations | limit-price scenario explicitly present | explicit limit-price scenario plus alternative Hotelling scenario | UNKNOWN | exclusion is an endogenous branch of the original endpoint price Nash game | Economides pp. 25–26; Bunte abstract / Sec. 4 |
| endogenous variety decision | yes | yes | yes | UNKNOWN directly; Bunte states Sorenson does not address it | not a new full-location solution; headline results condition on endpoints | Economides; Bunte; Sorenson full text unavailable |
| asymmetric quality equilibrium | original Theorem 2 reports symmetric quality | abstract says initial-quality asymmetry widens, exact equilibrium UNKNOWN | asymmetry in quality studied in Sec. 8; exact equivalence to `(1/lambda,0)` not established from accessible text | leadership/asymmetry central; exact equilibrium UNKNOWN | explicit endpoint-quality equilibria `(1/lambda,0)` and mirror | Bunte abstract / Ch. 3 contents; Sorenson abstract |
| exact thresholds | Theorem-2 interval maps to `1/9<theta<2/9` | UNKNOWN from full text | Hotelling R&D stability excludes region below `theta=2/9` under the mapping below | UNKNOWN | finite-deviation threshold `theta=4/27`; CS threshold `4/21` | Economides Theorem 2; Bunte pp. 105–106 |
| welfare | limited original welfare discussion is not the present named-equilibrium comparison | abstract reports welfare results | social planner, monopolist, asymmetry, welfare sections | UNKNOWN | named-profile/equilibrium welfare comparison and planner benchmarks | Bunte abstract and Ch. 3 Secs. 5–8 |

## 4. Parameter mapping and objective comparison

### 4.1 Symbols

To avoid OCR ambiguity between Bunte's innovation-cost character and his transportation/disutility parameter, this audit renames them:

- `m_B`: Bunte's coefficient on quadratic product-R&D / quality-improvement cost;
- `u_B`: Bunte's utility loss per unit horizontal distance.

Bunte p. 95 writes consumer utility as

`U = Q - P - u_B d`.

The present paper with a general linear transportation coefficient writes

`u_i(z)=k+a_i-p_i-t|z-l_i|`.

Thus the direct utility mapping is `a_i = Delta Q_i`, `t=u_B`, up to the common additive initial-quality/base-utility term and price measured relative to marginal cost.

### 4.2 Quality-cost normalization

Economides/current paper uses

`C(a_i) = (c/2) a_i^2`,  `lambda=c/mu_market`.

Bunte Chapter 3 uses a quadratic expenditure in the quality rise `Delta Q`; denote its coefficient by `m_B`, i.e. `m_B (Delta Q)^2` in the normalization recovered from the Chapter-3 equations. With Bunte's consumer density normalized to one, the coefficient mapping is

`c = 2 m_B`, hence `lambda = 2 m_B`.

The symmetric Hotelling-scenario quality improvement reported by Bunte on pp. 105–106 is

`Delta Q_a = Delta Q_b = 1/(6 m_B)`.

Under `lambda=2m_B`, this is exactly the Economides/current regular-branch candidate

`A = 1/(3 lambda) = 1/(6 m_B)`.

This correspondence is evidence of genuine structural overlap and must not be presented as novelty.

### 4.3 Dimensionless interval mapping

Let `theta=lambda t`. Under `lambda=2m_B` and `t=u_B`,

`theta = 2 m_B u_B`.

Bunte p. 106 describes the Economides maximum-differentiation parameter region as

`1 < 18 m_B u_B < 2`.

This maps exactly to

`1/9 < theta < 2/9`,

which is the original Theorem-2 interval in the present normalization.

Bunte also states that his R&D-game stability condition requires

`18 m_B u_B > 2`,

which maps to

`theta > 2/9`.

The present paper's branch-changing global quality-deviation threshold is instead

`theta = 4/27`.

Therefore, under the exact normalization above, Bunte's stated Hotelling-scenario stability cutoff is mathematically different from the present `4/27` finite-deviation threshold. This is stronger than a difference in notation: `2/9 != 4/27` and the inequalities select different parameter regions.

### 4.4 What Bunte's “stability condition” is — and is not

Bunte p. 105 calls the restriction a “stability condition for the R&D game.” In appendix material around p. 144, the text states the own second-order condition and the stability condition separately. Chapter 3 also interprets R&D choices through strategic-substitute/complement relations under the two price scenarios. The accessible primary text therefore supports the following narrow statement:

- Bunte's stability condition is a restriction on stability of the R&D reaction system, separate from the own second-order condition;
- after exact parameter mapping its Hotelling-scenario cutoff is `theta>2/9`;
- it is not the same algebraic condition as the present unilateral finite-deviation test `theta=4/27`.

Because the official PDF pages could not be image-inspected and the complete derivation was not retrieved as continuous page images, this audit does **not** label Bunte's condition more specifically as a particular dynamic-adjustment theorem, nor does it assert that it is or is not a Nash-existence condition beyond what the primary text expressly states.

### 4.5 Pricing objective is not merely relabeled

Bunte's abstract and Chapter 3 explicitly resolve linear-Hotelling price instability through two scenarios: (i) a Hotelling scenario in which firms recognize mutual dependence / respect backyards, and (ii) a limit-price scenario. The present paper instead holds maximal locations fixed and asks for pure Nash pricing in the original Economides noncooperative price game after each quality pair. Hence an identity in the regular symmetric benchmark does not make the downstream games identical. Whether all present endpoint results already appear elsewhere nevertheless requires primary-source inspection of the unavailable Bunte (1995) and Sorenson (1995) full texts.

## 5. Surviving-contribution absorption audit

### N1 — Full quality-gap endpoint price continuation in the original noncooperative price game

Present result:

- `delta<=-3`: `(p1,p2)=(0,-delta-1)`;
- `-3<=delta<=3`: `(1+delta/3,1-delta/3)`;
- `delta>=3`: `(delta-1,0)`.

**Bunte 1997:** accessible primary text establishes that the Hotelling and limit-price scenarios use alternative resolutions of price instability. The checked material does not itself state the above original-game three-branch Nash correspondence. Obtaining it from Bunte's stated scenario analysis would require an additional argument because the pricing rule/equilibrium object differs.

**Bunte 1995 / Sorenson:** full texts unavailable; no absence claim is permitted.

**Classification:** `ADDITIONAL NONTRIVIAL PROOF REQUIRED` relative to checked Bunte-1997 material; `PRIMARY-SOURCE EVIDENCE INSUFFICIENT` for an overall firstness/non-absorption certification.

### N2 — Exact `4/27` global-deviation threshold

Present result compares `A=1/(3lambda)` with `B=1/lambda` after re-solving the original endpoint price game and obtains

`[pi_i(B,A)-pi_i(A,A)]/mu = (4-27lambda)/(18lambda)`

(or `theta=4/27` under general linear transport).

**Bunte 1997:** its stated Hotelling R&D-stability cutoff maps to `theta>2/9`, not `theta=4/27`. Thus Bunte's cited stability restriction is not parameter-equivalent to N2. No `4/27`-equivalent cutoff was located in the checked primary text.

**Bunte 1995 / Sorenson:** full texts unavailable, so “not located” cannot be upgraded to “does not exist.”

**Classification:** `NOT PARAMETER-EQUIVALENT TO THE CHECKED BUNTE-1997 STABILITY CONDITION`; overall `PRIMARY-SOURCE EVIDENCE INSUFFICIENT` for non-absorption across all three closest sources.

### N3 — Explicit asymmetric exclusion quality equilibria

Present result: `(1/lambda,0)` and `(0,1/lambda)` for `1/9<lambda<2/9` at endpoints.

**Bunte:** the 1995 abstract and 1997 Chapter 3 clearly study quality asymmetry and state that initial asymmetry can widen. That is substantive component overlap. The accessible Chapter-3 material checked here did not establish identity with the present two explicit endpoint equilibria.

**Sorenson:** publisher abstract studies persistence of leadership after product-improving R&D but does not expose the complete equilibrium formulas or strategy domain.

**Classification:** `COMPONENT OVERLAP`, with `PRIMARY-SOURCE EVIDENCE INSUFFICIENT` to certify that the exact pair is absent from Bunte (1995) or Sorenson (1995).

### N4 — Named-profile / named-equilibrium welfare comparison

Bunte (1995/1997) already contains substantial welfare analysis and analysis of quality asymmetry. Hence welfare analysis in this class is not novel as a component. The present formulas are tied specifically to N1–N3 and to the certified exclusion profiles, but the unavailable full texts prevent an exhaustive equivalence check.

**Classification:** `STRONG COMPONENT OVERLAP`; exact present comparison not shown to be absorbed in the checked Bunte-1997 passages, but overall non-absorption remains unverified.

## 6. Overall prior-art classification

**D. INSUFFICIENT PRIMARY-SOURCE EVIDENCE**

The available evidence is enough to make two negative determinations with confidence:

1. any claim of first identifying an R&D/quality stability problem in Economides (1989) is false and remains permanently killed;
2. Bunte's stated Hotelling-scenario R&D-stability cutoff is not the present `4/27` global-deviation threshold after exact parameter mapping.

It is **not** enough to certify `STRUCTURALLY VERY CLOSE BUT NON-ABSORBING` across the closest literature, because the full Bunte (1995) working paper and the full Sorenson (1995) article were not obtained. The governance rule “failure to find is not novelty evidence” therefore controls.

## 7. Exact missing evidence required to close the gate

### Bunte (1995)

Need the full CRIEFF DP 9509 body, especially the sections corresponding to:

- demand/cost specification;
- price-stability treatment;
- Hotelling-scenario prices and quality/R&D;
- limit-price prices and quality/R&D;
- asymmetry in quality;
- appendices deriving the R&D stability condition and any asymmetric equilibria.

The 1995 abstract cannot establish whether its equations are identical to the later thesis chapter.

### Sorenson (1995)

Need the full RIO article, especially:

- model and consumer/demand specification;
- R&D strategy set and cost;
- differentiated Bertrand price subgame;
- stability condition derivation;
- horizontal-differentiation case;
- asymmetric equilibrium propositions and proofs;
- appendices, if any.

The Springer abstract and Bunte's footnote are insufficient to certify whether N1–N3 are absent or parameter-equivalent.

## 8. Stage-10R2 audit status

This document does not alter the Theory Freeze and does not authorize Lean. It records a fail-closed novelty state for transfer to the next independent Stage-11 limited recheck.
