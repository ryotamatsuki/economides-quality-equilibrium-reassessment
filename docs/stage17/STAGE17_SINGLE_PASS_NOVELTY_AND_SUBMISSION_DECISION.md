# Stage 17 — One-pass prior-art adjudication and submission recommendation

**Date:** 2026-11-17 (JST)  
**Artifact:** `paper/etb/main.tex` (ETB), compared with Stage16 head `1f741b5de345e25b218b9b9f4b5997f712dd8a1b`  
**Examination:** a bounded AI editorial assessment, **not an independent expert referee or an author originality warranty**.

## Explicit decision

- **Mathematical correctness (in model-specific reduced-game scope):** PASS by prior Stage16 test and Lean certificate; theoretical theorem/proof unchanged in Stage17.
- **Known generic instability/stability objection as a novelty claim:** NO GO. Bunte (1997) already discusses Economides's missing quality/R&D stability condition, and reports on Sorenson (1995).
- **Complete fixed-endpoint pure-quality equilibrium correspondence as a separate manuscript subject:** **EVIDENCE-BOUNDED, CONDITIONALLY DEFENSIBLE** as a correction/note (it is logically stronger than detecting one destabilizing deviation); no proof of firstness or non-absorption by Bunte (1995) / Sorenson (1995).
- **Editorial-fit risk at ETB:** HIGH because ETB explicitly excludes mere corollaries of known results and applies Economic Theory's standards of substantial interest. Proving the statement rigorously is necessary but not sufficient for acceptance.
- **One-pass AI recommendation:** **CONDITIONAL GO TO STAGE18 EDITORIAL-MANAGER DRAFT**, not an unconditional theoretical-novelty GO and **not permission to attest originality or click final Submit**. The finite pre-submission decision has been made; repeat prior-art loops are not required.
- **Formal framework Stage6 novelty gate:** remains **UNRESOLVED** on exact-P4 equivalence. A recommendation to seek journal editorial assessment is not a declaration that the standard original-theory novelty gate passed.
- **Author decision required before final submission:** author must personally decide whether the self-derived P4 classification is a sufficiently independent scholarly note given the disclosed overlap/uncertainty, and truthfully verify no parallel live submission or transfer. If not, stop; do not claim originality to satisfy a form.

## 1. One-pass claim–source matrix

| Proposed claim | Evidence inspected (not all full texts) | Independent contribution verdict | What the submitted paper may say |
|---|---|---|---|
| Original Economides (1989) symmetric maximum-location candidate | Original article examined at printed pp. 27–28, eqs. (8)–(9) and Theorem 2, archived Stage6 | **Original target**; not own discovery | Proposes a symmetric path for the sequential game; the fixed-endpoint subgame supplies a necessary optimality test |
| Any global quality deviation can undermine local FOCs | Bunte (1997), chap. 3, university thesis primary material previously inspected; specifically quality/R&D stability caveat | **KNOWN / NOT NOVEL** | Explicitly credit Bunte; do not claim first correction/stability recognition |
| Bunte (1995) variety-and-quality analysis | Verified bibliographic title, discussion paper record; full theorem text not independently inspected | **POSSIBLE ABSORPTION, NOT DECIDED** | Cite as related research only; make no statement that P4 is absent |
| Sorenson (1995) product-improving R&D before differentiated Bertrand | Publisher abstract directly accessible, https://link.springer.com/article/10.1007/BF01027081; Bunte (1997) reports comparable R&D specification and stability condition | **POSSIBLE EXACT OR INDIRECT ABSORPTION, NOT DECIDED** | Credit related work. Distinguish publisher abstract from Bunte's SECONDARY description; make no claim Sorenson lacks the P4 result |
| `(1/λ,0)` and `(0,1/λ)` at fixed endpoints | Own exact-case derivation and Lean reduced-payoff certificate; no identical theorem found in inspected literature | **SELF-DERIVED / UNKNOWN HISTORICAL PRIORITY** | Explicit existence of both exclusion equilibria, not full 3-stage equilibrium |
| Symmetric quality iff `λ≥4/27` | Own exact gain and global best-response proof; Bunte/Sorenson full theorems untested | **SELF-DERIVED / UNKNOWN PRIORITY** | Exact threshold, include equality, no historical novelty claim |
| No other pure quality equilibria in `1/9<λ<2/9` | Own necessity proof using corner BR, interior shared-price FOC and exclusion of positive losing investment | **SELF-DERIVED / UNKNOWN PRIORITY** | Necessity-and-sufficiency characterizes the COMPLETE pure-quality equilibrium correspondence; this goes beyond merely rejecting one symmetric candidate as a LOGICAL STATEMENT |
| New full endogenous-location subgame-perfect equilibrium | Not established by own theorem or Lean | **NOT CLAIMED** | State no such result follows |
| Relation to author's own prior draft/PR #10 | PR #10 already included restricted P4, old broader RIO manuscript rejected 2026-11-17 | **NOT NEW RELATIVE TO SELF; PUBLIC HISTORY** | Treat as one research line/revision; do not present reformulated P4 as a separate new discovery and another parallel submission |

### Interpretation

A negative result about a particular candidate is logically weaker than a complete equilibrium correspondence that proves existence, sufficiency, and the absence of other pure profiles. Therefore P4 is **not merely a restatement** of the already-known generic warning that a stability check is needed. This logical difference may support a narrow correction-note submission.

However, it does **NOT** follow that P4 is a new result in the publication record. Bunte (1995) and Sorenson (1995) may prove an equivalent characterization under different notation, and those source theorems are not available in the audited record. A full proof of a previously established theorem may be insufficient for ETB's substantial-interest criterion. ETB's decision is editorial and independent of the formal verification.

## 2. Actual manuscript changes — minimal, math-preserving

- In `paper/etb/main.tex` Introduction only: credited **Bunte (1997)** explicitly for the known global stability critique, characterized Bunte (1995) as a variety-and-quality study, and attributed statements about Sorenson (1995) to Bunte's discussion, rather than pretending to have independently inspected Sorenson's theorem.
- Identified the incremental **object** of this paper: a complete pure-quality equilibrium **set**, not just the inequality ruling out symmetry. Necessity means excluding additional pure equilibria; sufficiency establishes the two corners and the cost-conditional symmetric branch.
- Added exact links to existing Theorem and Appendix; no attempt to enlarge theorem claim.
- Updated `submission/ETB_COVER_LETTER_DRAFT.md` analogously. It remains not signed or sent, and contains a separate INTERNAL HOLD footer (remove before real submission).
- **No changes** to Lemma 1, Theorem 1, mathematical equations, proof, appendix proofs, AI disclosures, author address or sources list.

## 3. Last-passage adversarial screening

**Reject argument 1: Already known.** Correct for the generic global stability objection. P4's exact equivalence to the old theorems cannot be ruled out. No priority claim permissible.

**Reject argument 2: Only a trivial corollary.** P4 includes two exclusion equilibria and complete necessity (no other pure equilibria) under specified primitives; those do not logically follow solely from the statement that the symmetric candidate may be unstable. Yet an editor may still judge the added classification to be an elementary corollary of prior model-specific algebra. Risk remains high.

**Reject argument 3: Wrong equilibrium concept.** The note is explicitly about a fixed-location *reduced quality* Nash game. It supplies a necessary-path counterexample to a symmetric endpoint SPNE claim in a subinterval, not a new full-game SPNE.

**Reject argument 4: Citation evidence overclaim.** Only Bunte (1997) chapter primary material and Sorenson (1995) publisher abstract/metadata were examined; the Bunte (1995) and Sorenson (1995) full primary theorems were not verified. Draft was repaired to avoid implying a proof of absent overlap.

**Reject argument 5: Duplicate author publications.** The old RIO manuscript was rejected; GitHub's own PR #10 contains P4, a prior working draft, not a separately published peer-reviewed paper. The author must declare public versions and verify no subsequent active transfer or publication, with no invented exclusivity.

## 4. Closed finite decision and stop rules

**Single-pass result:** `CONDITIONAL_SUBMISSION_RECOMMENDATION_WITH_UNRESOLVED_NOVELTY`.

Author can reasonably decide to present the result as a transparently scoped **self-contained correction note** for editorial judgment, with no priority claim and acknowledgment of the known critique. This is **not** a claim that same theorem is absent from uninspected sources.

Do not repeat the same unproductive fulltext attempts. Update the matrix only upon new decisive primary-source evidence, a concrete editor request, or proof of duplication.

**If** exact matching original theorem is confirmed before submission, revoke the recommendation and stop. **If** editorial manager requires a positive warranty that no materially equivalent work is known and author cannot truthfully make it, stop. **If** author disagrees that P4 merits independent publication, stop and expand the theory or choose another project. Otherwise allow portal draft preparation and author-level evaluation.

## 5. Publisher and evidence links

- ETB official scope (short substantial theory, known corollaries excluded): https://link.springer.com/journal/40505/aims-and-scope
- ETB submission rules: https://link.springer.com/journal/40505/submission-guidelines
- Economides (1989) author PDF: https://neconomides.com/uploads/Economides_Quality_Variations_and_Maximal_Variety_Differentiation.pdf
- Bunte (1995) discussion-paper bibliographic entry: https://www.econbiz.de/Record/variety-and-quality-competition-in-a-horizontal-differentiation-model-a-welfare-analysis-bunte-frank/10005697002
- Bunte (1997) Maastricht thesis: https://cris.maastrichtuniversity.nl/en/publications/product-innovations-and-barriers-to-entry
- Sorenson (1995) original publisher abstract: https://link.springer.com/article/10.1007/BF01027081
- Internal prior source audits: `docs/PRIOR_ART_COMPARISON_STAGE10R.md`, `docs/SHORT_NOTE_PRIOR_ART_AND_INTERNAL_OVERLAP_20261117.md`, `docs/STAGE6_NONPRIORITY_CORRECTION_REKILL_20261117.md`.

**Important:** This report is an AI-supported analysis and is not a formal independent human originality certification. Neither an automatic publisher declaration nor payment nor final Submit was made.
