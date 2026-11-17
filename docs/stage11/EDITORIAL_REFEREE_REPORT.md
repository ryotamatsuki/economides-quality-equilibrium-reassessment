# Stage11 — Communication-only Editorial Referee Report

Date 2026-11-17 JST. Source for first-pass reading: actual `paper/short_note/main.tex` at PR15 SHA `cdad5fad4207d0284ca1c2c2c48fb87c7797c546`, read in its normal abstract→Intro→model→lemma→theorem→discussion→appendix order. Critical AI reading pass, **not a truly blinded human referee**: the model can have prior research context; no outside expert or anonymous peer review occurred.
**Editorial verdict: REVISE (one important, repairable reader bridge, several minor issues).**

## 1. First-pass cold-reader paraphrases, exact manuscript locations

- **What is the economic problem?** A quality increase can change downstream price competition from sharing consumers to excluding a rival; a firm optimized only on the sharing branch may miss a profitable finite deviation. This is visible in §1 paragraph 1, sentences 1–7, before formal notation. **PASS**.
- **What does the paper actually discover/prove?** At fixed maximal locations, for λ in (1/9,2/9), two pure exclusion quality NE persist; the symmetric pair is an additional NE iff λ≥4/27. Visible in abstract, §1 paragraph 2 and §4 Theorem 1. **PASS**.
- **Which competing forces matter?** Smooth quadratic investment cost versus revenue gain from crossing the market-capture boundary, with a discrete rise in the slope of gross revenue (not in the level). §4 first paragraph after proof gives 2/3→1. **PASS with MINOR improvement:** tie the 4/27 cutoff to the finite gain `(4-27λ)/(18λ)` in a plain-language sentence.
- **What is old and what is genuinely claimed?** Original Economides symmetric quality claim vs new restricted-game exact iff; earlier stability critique credited to Bunte1997; Bunte1995/Sorenson1995 theorem absorption unknown. §1 paragraphs 1–3 and §5. **MAJOR BUT FIXABLE:** original paper claimed full 3-stage equilibrium, while manuscript correction proves reduced fixed-loc quality NE; the contradiction bridge is logically present in the analysis but not explicitly stated in the narrative.
- **Scope and limitations?** §2 fixed endpoint, covered, nonnegative/unbounded a, quadratic cost, λ open interval; §5 no endogenous locations/mixed/full SPNE/welfare. **PASS**.
- **Is the finding clear early enough?** Yes; abstract and first 2 Intro paragraphs already say two vs three equilibria. **PASS**.
- **Does discussion teach rather than merely repeat formulas?** §5 correctly separates disappearing symmetric NE from pure-NE nonexistence, but repeats §4 first/second paragraphs with little additional economic consequence. **MINOR:** compress repetitions, explain economically what pure exclusion does/does not imply about location differentiation and welfare.
- **Proof independently auditable without Lean?** Yes, §3, §4, Appendices A/B contain the price, payoff, corner BR, FOC and deviation paths. Appendix C carefully names what Lean cannot prove. **PASS** subject to one original-source bridge.

## 2. Communication-only hypothetical rejection paragraph

> The note is admirably explicit about its fixed-location theorem, but it moves too quickly from a three-stage result in Economides (1989) to a conditional quality equilibrium without locating and quoting the original theorem's operative assertion or telling readers why the conditional deviation is enough to disprove that asserted equilibrium path. This makes the correction appear to attack a different object. Even if the restricted result is mathematically sound, the Introduction does not yet make the paper's logical target and correction implication referee-verifiable without reading the old article and filling in the missing connection. The heavy no-priority caveat in the opening also displaces a crisp economic contribution statement.

This is **communication-only**; it differs from the scientific rejection for unknown prior-theorem absorption.

## 3. Role-by-role comparison to the Stage10A selected papers

| Role | Observed exemplar technique (location in Stage10A register) | Draft evidence | Editorial assessment |
|---|---|---|---|
| Opening correction | Ahlin (2008) p.55 source statement → omitted deviation | §1 paragraph 1 | Good, but add exact named original theorem / requirement bridge |
| Model/strategy clarity | d'Aspremont et al. (1979) p.1145 full primitives | §2 and demand | PASS for required fixed-loc domain |
| Price continuation and global vs local | d'Aspremont et al. pp.1146–47 global alternatives | §3, Appendix A | PASS; clipped demand and capture alternatives explicit |
| Brief named theorem | Ebina–Shimizu (2012) p.2873 source candidate vs corrected result | §4 Theorem 1 | PASS; exact λ and equality |
| Proof necessity/sufficiency | d'Aspremont et al. pp.1146–47 exclusion of other cases | §4 and Appendix B | PASS; no missing corner case identified |
| Finite profitable deviation | Ahlin pp.55–56 explicit comparison | §4 gain equation | PASS; add one plain sentence interpreting sign of gain |
| Economic intuition | d'Aspremont et al. p.1149 economic inference | §4 after proof | PASS / MINOR: revenue level remains continuous, slope kink is point |
| Discussion and limitations | Ebina–Shimizu pp.2873–74 bounded conclusion | §5 | PASS with minor duplication reduction |
| Graphics | Ahlin none / d'Aspremont kink figure | §3–4 equations, zero illustrations | Well justified for short mathematical note; figure unnecessary |
| Contribution/priority | Ahlin names original result; E3 bounded repair | §1 paragraph 3; §5 | Priority caution correct but initially too prominent; move detailed caveat to §5 without deleting it |

This uses verified Stage10A source-reading notes; it does **not** re-read missing Bunte/Sorenson primary texts, and writing-model comparisons do not establish economic originality.

## 4. Repair text suggestion (NOT yet added to LaTeX)

At the §1 original-result passage, after a source-verified pinpoint citation, use the following *conceptual* bridge in original words:

> A proposed three-stage equilibrium with endpoint locations and symmetric quality must in particular survive every unilateral quality deviation at those locations, with prices re-optimized after the deviation. The profitable exclusionary deviation below the cutoff disproves that proposed equilibrium path. The existence of the two asymmetric quality equilibria, however, is a statement about the fixed-location continuation game; it does not establish any new equilibrium of the full location-stage game.

Before inserting into paper, independently verify exact source theorem wording, printed page and model equilibrium concept; do not infer that the old paper itself admitted the newly computed continuation.

## 5. Final editorial call

**REVISE — MAJOR BUT FIXABLE (one connection between original predecessor theorem and exact restricted-game refutation).** Other issues are minor economy/reader arrival. Cannot claim an actual blinded referee decision or formal Stage11 GO. Post-repair a fresh critical read is required; no new scientific theorem needed. Scientific prior-art uncertainty is a separate Stage6 issue, not fixed by prose.
