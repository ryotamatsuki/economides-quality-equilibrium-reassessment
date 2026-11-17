# AUTHOR_INTELLECTUAL_CONTRIBUTION_RECORD — NEW P4 (2026-11-17)

**Status: AUTHOR ATTESTATION RECEIVED 2026-11-17; SUBSTANTIVE AUTHOR REASONING STILL NOT RECORDED — FORMAL STAGE 8 SIGN-OFF NOT COMPLETED.**
The author directly stated in the active research conversation on 2026-11-17: **「著者による検証OKです。」** This is faithfully logged as the author's claim that their verification is satisfactory, referring to the new P4 audit and Draft PR #14 source at `2664ec331f0a7de25acb41c7a26cf36aca9dc4ce`. This line was supplied by the AUTHOR; no derivation or paper-level novelty determination was supplied with it. The assertion is **not** reclassified as a detailed AUTHOR proof or an EXTERNAL HUMAN review.

Earlier conversation records support the author's choice of a **short research note**, rather than combining all-λ results into a full paper, but do not provide the author's own proof of why all other equilibria are excluded. Preserve that distinction; neither AI explanations nor the source code may fill the AUTHOR-only fields.

Source and claims to inspect: `theorem_certificates/SHORT_NOTE_STAGE4A_COMPLETE_PURE_NE.md`, `ShortNoteFormal.lean` at SHA 7427264..., `theorem_certificates/SHORT_NOTE_STAGE75A_COMPLETE_PURE_NE.md`, and `docs/SHORT_NOTE_PRIOR_ART_AND_INTERNAL_OVERLAP_20261117.md`.

## Author-authored substantive record required before Stage 8

1. **Economic contribution / paper unit:** In your own words, why is complete characterization of the *fixed-location* quality game useful beyond the old 'symmetric candidate fails' result, given the antecedent PR #10? Should this be a single revision of the old RIO work, a distinct research note or a different broader paper? Why?
   - AUTHOR entry: **NOT PROVIDED**.
2. **Proof understanding / global vs local:** Explain why, on the original 1/9<λ<2/9 interval, `BR(0)=1/λ`, `BR(1/λ)=0`, and the only two-positive-quality candidate must solve `(9λ−2)(a1−a2)=0`. Explain why switching to the full-capture price regime defeats symmetric stationary quality below λ=4/27 and why equality is included.
   - AUTHOR entry: **NOT PROVIDED**.
3. **Scope / caveats / literature judgment:** State the strongest claim you personally accept, distinguish quality NE from three-stage SPNE/mixed equilibrium, and explicitly judge how Bunte/Sorenson incomplete access and historical RIO decision, any later transfer/re-submission, and sibling PR #10 overlap constrain novelty or the intended publication.
   - AUTHOR entry: **NOT PROVIDED**.

Author's own checks, corrections, rejections, signatures/dated notes and any proof annotation should be recorded **verbatim in substance** when supplied. Repeating an AI-produced checklist or merely saying 'CI passed' is insufficient. Neither AI nor an automatic tool may fill these fields as AUTHOR.

## Current actor ledger

| Result | Actor | Evidence |
|---|---|---|
| Independent proof/case argument | AI | SHORT_NOTE_STAGE4A_COMPLETE_PURE_NE.md |
| Exact symbolic and rational-grid checks | COMPUTATION | verification/short_note_independent_audit.py, local PASS 2026-11-17 |
| Full reduced payoff NE iff | FORMAL | ShortNoteFormal.lean / Actions 44004302052 |
| Analytical primitive price continuation | prior AI/analytic certificate | Existing Stage4A old freeze |
| Prior-art/source limitations | AI | SHORT_NOTE_PRIOR_ART_AND_INTERNAL_OVERLAP_20261117.md |
| Author substantive verification, academic priority judgment and final intended paper unit | AUTHOR | **MISSING — MUST NOT INVENT** |

Status cannot advance to `AUTHOR VERIFIED` until the author's own substantive text/checks are received. Stage 8 and hence Stage 9 remain blocked. This is a reproducible blocker, not an invitation to automatically attribute reasoning to the author.
