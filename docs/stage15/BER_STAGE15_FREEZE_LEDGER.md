# Stage 15 — BER technical submission candidate freeze ledger

**Date:** 2026-11-17 (JST)  
**Target:** Bulletin of Economic Research (Wiley), short Note/Comment.  
**Status:** TECHNICAL SUBMISSION CANDIDATE — scientific/submission gate **HOLD**. This is not formal Stage 15 GO and no submission/payment occurred.  
**Excluded venue:** Economics Bulletin (explicit author instruction).  
**Prior base:** Stage14 Draft PR #19 head `14a00b423c3061e11b20bc806283ba0814c63b08`.  
**Stage14 CI:** https://github.com/ryotamatsuki/economides-quality-equilibrium-reassessment/actions/runs/44024339520 (success, with independent symbolic/numerical/regression, Lean kernel, TeX, citation resolution, fonts and source bundle).

## A. Inherited verified facts (no further questions or invented metadata)

| Field | Current value | Evidence status |
|---|---|---|
| Full name | Ryota Matsuki | same author's existing title-page source / prior communications |
| Authorship | one author; corresponding author | same manuscript, prior RIO submission |
| Affiliation | Independent Researcher | existing title page |
| City/country | Matsuyama, Ehime, Japan | existing title page |
| Corresponding email | ryota.matsuki@gmail.com | existing RIO title page and related correspondence |
| ORCID | 0009-0005-2329-531X | existing title page |
| Funding | none; manuscript: `This research received no external funding.` | prior Economides RIO version; carried forward |
| Competing interests | none; manuscript: `The author declares no competing interests.` | prior Economides RIO version; carried forward |
| Acknowledgments | None | prior single-author title page |
| JEL | C72 / D43 / L13 / R32 | verified current manuscript |
| Keywords | spatial competition; quality differentiation; Hotelling; market exclusion; equilibrium multiplicity | verified current manuscript |
| AI | OpenAI ChatGPT assisted theoretical exploration, computations, Lean and drafting in 2026; reviewed global quality equilibrium argument | author review record and project provenance |
| Exact AI model versions | NOT RECOVERABLE for every historic step; no invented versions | explicit limitation |
| Open access | **Do not select paid OA**; traditional/subscription only | author's cost-avoidance instruction |
| RIO history | earlier, broader Economides version rejected 2026-11-17; no longer under consideration at RIO | author-controlled 2026-11-17 decision message |
| Transfer to another journal | no distinct transfer confirmation located in searched contemporaneous correspondence | NOT verified absent |
| Public prior disclosure | https://github.com/ryotamatsuki/economides-quality-equilibrium-reassessment | public GitHub work history; do NOT misrepresent as certified formal preprint |
| Author full mailing/postal address | UNKNOWN | journal asks for address; cannot infer |
| Other journals' active submission status | UNKNOWN beyond rejected RIO case; do not import certification from unrelated JICT project | author final exclusive-submission declaration required |
| Bunte1995 / Sorenson1995 exact theorem equivalence | material scholarly originality problem remains UNRESOLVED | Stage6/7.5 original source limits |

## B. Final-version candidate text changes
- Main title, scientific model, global price continuation, full P4 reduced-game Nash correspondence and mathematical proofs **unchanged** relative to Stage14.
- Public-facing PDF should not display internal `Not approved for submission` / `pre-freeze` production labels; leave submission decision/holds in this ledger instead.
- Fixed publisher-facing bibliography/availability wording by including exact public repository URL.
- Replaced an internal instruction not to submit with scientifically appropriate no-priority attribution and an explicit statement that exact older-theorem overlap is not established.
- Expanded AI disclosure to name tool, 2026 use, contribution, author review, types of independent checks and missing historical underlying model-version records; no false claim that Lean proves the full primitive game.
- Added same-research no-funding, no-conflict, sole-author contribution, no empirical data, public code, and acknowledgment declarations from the older RIO project information.
- `submission/BER_PORTAL_METADATA_CANDIDATE.json` and `submission/BER_COVER_LETTER_STAGE15_CANDIDATE.md` filled from verified prior records; unknown fields explicitly null/UNKNOWN.

## C. Technical freeze sequence and remaining actions

1. Rebuild the BER **flat source** and review PDF using `make ber-package`; validate bibliography and cross-references, fonts, full pages, complete metadata, clean source package.
2. Record exact successful CI **head SHA**, artifact names, page count and immutable sha256 checksums of generated files after build.
3. Mark technical package `LOCKED_CANDIDATE` only after exact-head successful CI and visual PDF review. Any subsequent text/model change invalidates those hashes and requires a new build.
4. The manuscript's mathematical theorem claim is intentionally unchanged; this freeze does **NOT** make an original-new-theory attestation.
5. **Material Stage6/7.5 blocker:** Bunte (1995) and Sorenson (1995) might already contain precisely the fixed-location P4 theorem. No-firstness framing does NOT solve scholarly redundancy. User previously deferred more unsuccessful full-text acquisition; do not repeat this as if found.
6. Confirm no other currently active submission or transfer; the rejected RIO old version is conclusively closed only for that venue. Confirm complete postal address only when required and final author consent.
7. Verify Wiley Authors portal-only article type and fee items. **No paid OA and no payment authorized.** Current BER public guidance gives a non-OA subscription path but does not definitively establish zero mandatory submission/non-OA fees. 
8. AI exact-version history is incomplete. Wiley requests AI technology and version/year where applicable. Any available version details must be sourced rather than invented; discuss remaining non-recoverability transparently at final portal stage.
9. Signed exclusive-submission, authorship/copyright, AI and originality statements are author actions, not inferable from earlier work on a different manuscript.

## D. Original-rejection-vs-revised-note distinction

The rejected RIO manuscript was broader and evaluated welfare and additional three-stage issues. The present short note supplies a P4 **complete fixed-location pure-quality equilibrium correspondence**, with two asymmetric exclusion equilibria in the low-lambda range, whereas the earlier RIO report discussed potential nonexistence of pure quality NE in that range. The later P4 theorem's mathematical status has been tested separately. This historical difference is not proof of novelty relative to Bunte/Sorenson, nor automatic right to duplicate-submit unchanged scientific results.

## E. Publisher references

- https://onlinelibrary.wiley.com/page/journal/14678586/homepage/forauthors.html
- https://onlinelibrary.wiley.com/page/journal/14678586/homepage/fundedaccess.html
- https://www.wiley.com/publishing/article/ai-guidelines
- https://authors.wiley.com/ethics-guidelines/index.html

**Stage15 scientific submission verdict: HOLD / NOT AUTHORISED until remaining material checks and author certification. Technical package may nevertheless be finalized independently and shared for inspection.**
