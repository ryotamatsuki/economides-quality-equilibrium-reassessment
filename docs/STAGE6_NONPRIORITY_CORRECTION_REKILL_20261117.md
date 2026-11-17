# Stage 6 — Retrospective Novelty Re-Kill, No-Priority Correction-Note Route
Date: 2026-11-17 JST
Gate provenance: current research-paper-workflow/main, templates/STAGE_06_NOVELTY_REKILL.md, Governance §2.12/§2.12A and Stage-8 closest-paper hard gate.
Verification actor: AI editorial/theorem-absorption assessment; not independent human review.
**Formal Stage 6 verdict: CONDITIONAL GO — exactly one material published-prior-art equivalence blocker. NOT a novelty PASS.**

## 1. Mandate, narrow contribution and evidence discipline

Author's instruction for this iteration: reassess specifically as a **correction research note that makes no historical firstness/priority claim**; do not repeat attempts to obtain unavailable full texts, and pursue Stages 8/9/10A only if their canonical gates permit. Earlier author instruction: 「全文取得はできないのでおいといて次行って」. This is authorization to **defer a search**, not an assertion that an unknown result is absent. Date cutoff: 2026-11-17.

Question: For Economides (1989), with locations fixed at (0,1), quadratic quality costs, completely covered demand, linear transportation costs, and 1/9<λ<2/9, what is the complete *pure-strategy quality-stage Nash equilibrium set* after global price continuation? Not a theorem for the full three-stage SPNE, endogenous location, mixed games, other cost/transport classes or all-λ cases.

P4 (Stage4A/Stage7.5A analytic and encoded reduced-payoff Lean IFF): two asymmetric exclusion equilibria ((1/λ,0),(0,1/λ)) throughout the interval; the symmetric candidate (1/(3λ),1/(3λ)) joins the set iff λ≥4/27. Necessity rules out further pure profiles. This is a scientifically valid **correction statement inside the original restricted game**. No novel policy, welfare, general-model or first-discovery claim is adopted.

## 2. Separate claim, novelty and publication-value axes

| ID and proposed statement | Mathematics | Prior-art attribution and maturity | Surviving scholarly claim |
|---|---|---|---|
| N1: Economides's global quality stability is problematic | established analytically | **ABSORBED as generic criticism** by Bunte (1997), which explicitly notes the missing R&D stability condition | Cite Bunte, make no original-critique claim |
| N2: fixed-endpoint global piecewise price continuation / regime change | certified earlier | Exact mapping to Bunte (1995), Sorenson (1995) unavailable; Bunte 1997 uses different price-instability handling | Derivation can be printed as self-contained **verified exposition**, not novelty-certified |
| N3: symmetric quality candidate fails below 4/27 | analytic exact formula, Stage4A PASS | Bunte 1997 has stability objection; exact cutoff prior equivalence is **UNRESOLVED** | Precise source-specific refutation, no precedence assertion |
| N4: complete pure-quality NE correspondence (P4), two/three equilibria | proved necessity/sufficiency and Lean reduced-game IFF | **UNRESOLVED** whether Bunte 1995/Sorenson 1995 already establish its exact theorem/domain; PR #10 by same author already contains restricted P4 | A rigorous transparent characterization offered without firstness, but cannot certify independent publication novelty |
| N5: new full three-stage SPNE, mixed game, endogenous locations, general welfare/policy | NOT CLAIMED; unformalized/outside | Not a surviving scientific novelty route | Exclude from title/theorem/abstract and submission claim |

Mathematical maturity N4: MATHEMATICALLY VERIFIED (bounded encoded source). Theorem novelty maturity N4: **UNRESOLVED**, not ABSORBED and not EVIDENCE-SCOPED NOVELTY CERTIFIED. Do not invent a negative finding about unavailable proofs.

## 3. Actual parent-source comparison, exact reading depth

1. **Economides (1989), "Quality Variations and Maximal Variety Differentiation", Regional Science and Urban Economics 19:21–29.** Full author-hosted published article actually inspected in prior project audit. Original p.27 eqs. (8)–(9), footnote 9 use local quality optimum logic; p.28 Theorem 2 states unique symmetric maximal-location outcome. The correction attacks the original alleged equilibrium under globally unrestricted nonnegative quality deviations. Difference is **IDENTICAL-DOMAIN CONTRADICTION** for its symmetric-uniqueness conclusion inside fixed-endpoint continuation. The corrected result does not certify a full game SPNE.
2. **Bunte (1997), *Product Innovations and Barriers to Entry*, Chapter 3.** Indexed primary text inspected in previous audit around printed pp.92 and 106; publicly indexed primary-source text directly says Economides did not impose an R&D stability condition, and cites Sorenson (1995). Generic stability objection **already known**. Bunte's thesis analyzes Hotelling/mutual-dependence and limit-pricing resolutions; the exact three-branch global price continuation and complete P4 mapping have **not** been independently established as identical or distinct by prior record. No assumption that absence of exact printed 4/27 means absence of an equivalent theorem. Source: `docs/PRIOR_ART_COMPARISON_STAGE10R.md`, `docs/SHORT_NOTE_PRIOR_ART_AND_INTERNAL_OVERLAP_20261117.md`.
3. **Bunte (1995), *Variety and Quality Competition in a Horizontal Differentiation Model: A Welfare Analysis*, CRIEFF DP 9509.** Bibliography/metadata only; primary 1995 original full text NOT INSPECTED. Thesis 1997 is related later analysis, **not verified text-equivalent**. No same-game/non-absorption verdict available. **UNRESOLVED plausible absorption threat**.
4. **Sorenson (1995), "Product Improvement and Leadership in Differentiated Markets", Review of Industrial Organization 10:373–388.** Bibliography/abstract available; Bunte 1997's discussion is secondhand as to Sorenson; full original proof NOT INSPECTED. Bunte reports same specification for an R&D problem. The possibility of exact P4 quality-game theorem **cannot be excluded**. **UNRESOLVED plausible absorption threat**.
5. **Cohen & Heifetz (2024), "Location, Location, Quality: The Fixed Differentiation Principle", RIO 65:705–720.** Publisher complete HTML/model sections inspected during prior audit; exogenous quality asymmetry and quadratic transportation with location–price choice do not directly deliver the claimed endogenous-quality linear-transport P4; **NOT DIRECTLY ABSORBING within checked main theorem**. No global priority assertion.
6. **Own PR #10** (`stage75a-complete-equilibrium-formal`) already contains P4 as a proper subset of a broader all-λ project; no new discovery *relative to own prior work*. PR #12 adds a narrower Lean proof and clearer delimitation; identical underlying scientific theorem. The historical RIO submission was rejected on 2026-11-17 per private correspondence; neither its unseen later transfer status nor a new publication is inferred. Distinct submissions of repackaged P4 alone would risk redundant publication.

Current quick **metadata/theorem-phrase** check of publicly indexed information, without new full-text acquisition, did not reveal reliable primary evidence deciding N4's exact precedence. A separate Economides paper containing number 4/27 pertains to a different quality-of-complementary-systems model and was discarded as a false lexical match; a shared numerical value is no theorem mapping.

### Canonical-form model/absorption matrix

| Parent result | Mapping to the present game | Result directly derivable on verified text? | Status |
|---|---|---|---|
| Economides 1989 reported symmetric endpoint candidate | same restricted original-game primitives; global qualities allowed | P4 **refutes** the purported unique outcome in a subinterval; original local FOC insufficient | SOURCE CORRECTION, original contradiction |
| Bunte 1997 stability criticism | economically close stability question, but different downstream price-instability scenarios | Generic 'check global stability' follows, exact P4 does not follow from inspected passages | GENERIC CRITIQUE ABSORBED; EXACT P4 UNRESOLVED |
| Bunte 1995 actual theorem | exact primary proof/model unavailable | Cannot test substitution or normalization | UNRESOLVED |
| Sorenson 1995 actual theorem | same-specification threat reported secondhand | Cannot test theorem equivalence | UNRESOLVED |
| Cohen–Heifetz 2024 | quadratic transport/exogenous quality, different action/timing | No direct same-P4 implication in checked main result | NOT DIRECTLY ABSORBING IN VERIFIED SCOPE |
| Own PR #10 prior unpublished theorem | restricted-λ P4 identical to included claim | Yes, exact proper subset of author's own broader work | INTRA-AUTHOR OVERLAP (not historical external priority) |

## 4. Economic learning and strongest kill attack

In a two-stage quality–price continuation with fixed maximally differentiated varieties, a locally stationary equal-quality profile can be destroyed by a **finite deviation** that endogenously changes subsequent price competition to market exclusion. Yet losing a symmetric equilibrium does not mean the entire reduced *pure* quality game lacks equilibrium: the two corner exclusion equilibria always remain. This correction changes the precise existence/multiplicity statement; it is not cosmetic, and is clearer than merely repeating an older generic stability concern.

A hostile referee can still legitimately object: (i) Bunte/Sorenson already discussed Economides's stability and may have classified exactly the same equilibria; (ii) an independent formal proof of known results does not alone create a new economics contribution; (iii) fixed-location pure-quality characterization does not solve the full sequential game; (iv) the author's own earlier submitted draft and PR #10 overlap materially. These are stronger than the cosmetic "no policy application" objection.

An express **NO FIRSTNESS** sentence solves the risk of *false priority language*, but **does not solve theorem-level duplication or editorial nonredundancy**. The published article could still be wholly redundant. It is unsound to convert UNRESOLVED to NOT ABSORBED without reading or equivalent decisive source evidence.

## 5. Stage 6 decision, future-research memo, and stop rule

**CURRENT-PAPER:** `CONDITIONAL GO` under the **CORRECTION–REASSESSMENT / RESEARCH NOTE** route, with one material precise blocker: published **exact-P4 equivalence/absorption** in Bunte (1995) and/or Sorenson (1995) remains untestable with available evidence. Known generic stability critique is ABSORBED and removed from originality claims. This assessment does not assert a theorem-level novelty GO. Because the user requested deferral of full texts, mark source repair **DEFERRED BY AUTHOR**, not PASS; no repeated acquisition attempts now.

**NEXT-FRONTIER (separate, not automatically authorized):** A general solution to location-endogenous/mixed price continuation would be substantively distinct, but current status **UNRESOLVED**; Osborne–Pitchik (1987) is an identified threat and later-work clearance has not been completed. No validated new theme selected here; `PROPOSED / NOT AUTHORIZED`. Do not use that possible future idea to rescue this note's novelty gate.

**Required downstream label:** Stage 7.5 must keep the one essential novelty issue; Stage 8 kill test explicitly blocks on unresolved closest-paper positioning. Stage 9 may issue only **technical reproducibility preflight PASS**, not formal `REPRODUCIBILITY BASELINE READY`. Stage 10A may preserve/complete its writing-comparison artifacts as preflight, never issue canonical GO authorizing Stage10B.

**One-item source gate without indefinite re-search:** If decisively comparable primary source evidence later becomes available, attempt exact theorem/domain mapping once; if absorption found, NO-GO or revise a genuinely different contribution via the affected earlier stages. If access remains impossible, preserve this documented research hold rather than imply automatic novelty after passage of time. Changing the workflow to allow a documented non-original correction route is a separate substantive governance proposal, not authorized or implemented here.
