# AUTHOR_INTELLECTUAL_CONTRIBUTION_RECORD — NEW P4 (2026-11-17)

**Status: AUTHOR ATTESTATION AND PARTIAL SUBSTANTIVE REASONING RECORDED 2026-11-17; COMPLETENESS PROOF VERIFICATION AND PUBLICATION-UNIT JUDGMENT UNRECORDED — FORMAL STAGE 8 SIGN-OFF NOT COMPLETED.**
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

## Direct author's substantive explanation — supplied in conversation on 2026-11-17

**Actor: AUTHOR; recorded verbatim without silently reconstructing missing mathematical tokens.**

> 最大差別化された立地の下で、 では、相手の品質が0なら最適反応は 、相手の品質が なら最適反応は0となるため、 と の2つの非対称排除均衡が成立します。
>
> ただし、この証明は存在証明であり、他の純粋品質均衡が存在しないことまでは証明していません。
>
> 実際、 では対称品質選択と排除への逸脱が無差別となり、 では対称均衡も成立します（ と は証明対象の区間外です）。

**Integrity note:** mathematical expressions in the user-submitted message were received as blank spans. Equations are **not author-authored** in this direct quote. The assistant interprets this against the existing frozen candidate as a discussion of BR(0)=1/λ, BR(1/λ)=0, exclusion profiles (1/λ,0)/(0,1/λ), equality λ=4/27 and symmetric equilibrium above it, excluding λ=1/9 and 2/9. These reconstructions are explicitly labeled AI, not attributed as exact authored mathematical text.

**Author-supplied evaluation:** author correctly distinguishes existence of two corner/exclusion equilibria from **exhaustiveness**. This is substantive critical reading, not a routine checkbox. The sentence that existence alone does not rule out additional quality equilibria is mathematically accurate. It is **not** an author verification of the separate necessity/exhaustiveness argument.

**AI-supplied proof repair, not misattributed to author:** any excluded firm investing positive quality can reduce it to zero while remaining excluded, ruling out a both-positive-quality exclusion NE. Both-positive-quality, both-selling interior pairs must satisfy `(9λ−1)a1+a2=3` and `a1+(9λ−1)a2=3`, implying `(9λ−2)(a1−a2)=0`. Because λ<2/9, symmetry follows; the unique interior candidate is `A=1/(3λ)` and is a global reply only at λ≥4/27, with equality included. All zero-quality cases are addressed by BR(0) and BR(1/λ). This analytic argument is separately supported by Stage 4A and Lean's full reduced-payoff iff at SHA 7427264.

**Attribution/status:** AUTHOR has supplied meaningful recognition of the distinction between existence and completeness, of cutoff indifference, and of open parameter endpoints. However, the final exclusion-of-all-other-NE proof was supplied by AI/formal sources, not independently articulated/verified by the author in the submitted message. Do not mark `AUTHOR COMPLETE-PROOF VERIFIED`. A later explicit author-side review of that necessity argument, plus actual paper-unit/novelty judgment, would close these remaining items. The author's prior general statement `著者による検証OKです。` remains an attestation but does not create an unrecorded proof derivation.

## Current actor ledger

| Result | Actor | Evidence |
|---|---|---|
| Independent proof/case argument | AI | SHORT_NOTE_STAGE4A_COMPLETE_PURE_NE.md |
| Exact symbolic and rational-grid checks | COMPUTATION | verification/short_note_independent_audit.py, local PASS 2026-11-17 |
| Full reduced payoff NE iff | FORMAL | ShortNoteFormal.lean / Actions 44004302052 |
| Analytical primitive price continuation | prior AI/analytic certificate | Existing Stage4A old freeze |
| Prior-art/source limitations | AI | SHORT_NOTE_PRIOR_ART_AND_INTERNAL_OVERLAP_20261117.md |
| Existence-vs-exhaustiveness distinction and boundary understanding | AUTHOR | Direct substantive explanation supplied 2026-11-17, quoted above; missing equation tokens disclosed |
| Complete-NE necessity verification, academic priority and final paper unit | AUTHOR | **PARTIAL — missing independent author review of exclusion/FOC necessity and separate publication judgment** |

Status: **AUTHOR SUBSTANTIVE REASONING PARTIALLY RECORDED** (existence and cutoff, not complete necessity). Stage8/9 remains blocked until the author explicitly verifies the proof-critical exclusion/FOC necessity and records research/paper-unit judgment; do not infer missing content. This is a reproducible blocker, not an invitation to automatically attribute reasoning to the author.
