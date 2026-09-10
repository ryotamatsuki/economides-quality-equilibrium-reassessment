# Stage 13 — Full-Paper Integration for Review of Industrial Organization

Stage-12 baseline: `main @ 68f3f65bc462f0f12af243a1f6d10b77485fe013`.

Stage-13 substantive integration head before this closeout record: `22950ee2aaa4d04d13687479573909678035249f`.

Theory freeze: `ECONOMIDES-THEORY-FREEZE-2026-09-10-v1`.

Primary journal: **Review of Industrial Organization (RIO)**.

Stage-12 authority: `docs/STAGE12_JOURNAL_POSITIONING.md`.

Stage-11 authority: `docs/STAGE11_LIMITED_RECHECK.md` with verdict `GO — ROBUSTNESS / REFEREE ATTACK PASS`.

## 1. Executive integration verdict

The manuscript now presents one coherent RIO-facing argument: the original three-stage Economides game is retained, the maximal-location downstream price continuation is solved globally, the finite quality deviation crosses into exclusion, the exact `4/27` threshold follows, and explicit asymmetric exclusion quality equilibria destroy the reported quality-stage uniqueness characterization at maximal locations.

No new mechanism, theorem, robustness result, empirical exercise, or policy claim was introduced at Stage 13.

## 2. Section-role audit

### Introduction — PASS

The question precedes the machinery, the regime-switch mechanism is stated before algebra, the main correction and multiplicity results retain their frozen parameter domains, the welfare comparison is restricted correctly, and the full-history pure-SPNE point remains explicitly secondary.

The closest prior-art paragraph continues to concede Bunte's generic R&D-stability critique. Cohen and Heifetz (2024) is now added as a recent structural comparison rather than treated as an omitted competing correction.

### Related Literature — PASS

The section is organized by conceptual relationship:

1. Economides (1989) as the exact object being reassessed;
2. Bunte/Sorenson as prior stability critique/component overlap;
3. Cohen--Heifetz (2024) as recent structural overlap;
4. broader horizontal--vertical differentiation literature;
5. Hotelling price instability as the equilibrium-concept background.

The Cohen--Heifetz distinction is explicit: exogenous quality asymmetry + quadratic transport + location--price versus endogenous quality + linear transport + the original location--quality--price game. No claim of first discovery is reintroduced.

### Model / Results / Welfare — PASS

No substantive changes were made to the frozen model, propositions, proofs, parameter restrictions, welfare formulas, planner benchmarks, or equilibrium-selection disclaimers.

### Interpretation / Discussion / Conclusion — PASS

These sections remain interpretive and scope-disciplined. They do not convert the theoretical result into an empirical finding or policy recommendation and do not introduce a new result after the Results section.

### Research Transparency — ADDED / PASS

A non-empirical Data and Code Availability statement now points to the public reproducibility/formal-verification repository. Non-copyediting generative-AI use is disclosed in a suitable alternative manuscript section, with explicit human accountability.

## 3. Contribution-claim audit — PASS

The manuscript continues to claim only the frozen original-game contribution:

- piecewise maximal-location price continuation;
- exact `4/27` regime-changing global-deviation threshold;
- two explicit asymmetric exclusion quality equilibria;
- named-profile welfare and consumer-surplus comparisons within their certified domains.

It does **not** claim:

- first identification of a stability problem in Economides;
- exhaustive quality-equilibrium characterization;
- a general convex-cost theorem;
- arbitrary transportation-cost robustness;
- an empirically established exclusion mechanism;
- Lean verification of the complete three-stage game.

## 4. Abstract / Introduction / Conclusion alignment — PASS

The abstract remains within the verified RIO 150--250-word requirement. It states the same correction, multiplicity, welfare, and secondary SPNE observation as the Introduction and Conclusion. No killed novelty claim appears in any of the three locations.

Five keywords and four JEL classifications (`C72`, `D43`, `L13`, `R32`) are now present.

## 5. Figure/Table Architecture reconciliation — PASS

The final architecture remains intentionally minimal:

- Figure 1: generated parameter-region map;
- Table 1: generated parameter-region summary.

Both objects come from the verified generation pipeline, are cited and interpreted in the text, preserve the `4/27`, `4/21`, and `2/9` boundaries, and do not add a separate unverified quantitative claim. No decorative figure was added for journal positioning.

Exact RIO production-style caption typography/file-format conversion remains a Stage-14 package-format check because the final Springer template/workflow must be refreshed then.

## 6. Journal Requirements Ledger integration status

Implemented from the Stage-12 RIO ledger:

- abstract 150--250 words;
- 4--6 keywords (five supplied);
- JEL codes;
- editable LaTeX source retained;
- no-subfolder submission architecture implemented through `scripts/build_rio_flat_package.py`;
- Data and Code Availability statement;
- disclosure of non-copyediting generative-AI use;
- recent RIO structural comparison integrated;
- author-specific and portal-only unknowns kept explicit rather than guessed.

## 7. RIO flat-source package — PASS

The canonical research source remains modular. The deterministic builder creates a disposable flat package containing the manuscript, section files, bibliography, generated figure source, and generated table source in one directory with all path-bearing `\\input`/bibliography references rewritten.

`make rio-package` then compiles that flat package independently.

This structure preserves reproducible research organization while satisfying the currently verified RIO instruction not to use LaTeX subfolders at submission.

## 8. Author-specific / portal-only carry-forward

`docs/RIO_STAGE13_AUTHOR_METADATA_PENDING.md` records all items that Stage 13 deliberately does not infer.

Author confirmation remains required for:

- publication name(s);
- affiliation(s), city, country;
- active corresponding-author email;
- ORCID if available;
- Funding statement;
- Competing Interests statement;
- Author Contribution / CRediT statement;
- Acknowledgments, if any.

The following remain `UNVERIFIED` until Stage 14 live portal inspection:

- RIO's current review/anonymity model;
- exact portal article-type label;
- portal-only mandatory fields;
- whether reviewer suggestions/exclusions are mandatory;
- any submission fee shown in the portal;
- journal-specific preprint/repository handling not resolved by the public instructions.

The current canonical manuscript therefore remains author-anonymous rather than silently guessing the review-file architecture.

## 9. Notation / citation / cross-reference audit — PASS

Stage-13 regression tests now enforce:

- RIO abstract-length range;
- presence of keywords and JEL classifications;
- Cohen--Heifetz citation in Introduction and Related Literature;
- Cohen--Heifetz bibliography entry;
- Research Transparency integration;
- generation of a flat RIO package with no subdirectories or `../`/`sections/` dependencies.

A global repository search found no unresolved `TODO` marker. No new notation variant or parameter-domain change was introduced.

## 10. Theory-drift audit — PASS

Comparison of Stage-12 baseline `68f3f65...` to Stage-13 integration head `22950ee2...` shows only manuscript positioning/metadata, bibliography, transparency, package tooling, CI, and regression-test changes.

No frozen theory file, theorem certificate, proposition proof, welfare derivation, robustness theorem, or Lean theorem was modified.

`NO THEORY DRIFT`.

## 11. Verification evidence

At Stage-13 substantive integration head `22950ee2aaa4d04d13687479573909678035249f`, GitHub Actions reproducibility run `34435073071` completed **SUCCESS**.

The run passed:

- exact symbolic verification;
- independent numerical audit;
- all regression tests, including new Stage-13 RIO checks;
- deterministic output regeneration;
- canonical manuscript LaTeX build;
- deterministic RIO flat-package generation;
- independent LaTeX compilation of the RIO flat package;
- manuscript PDF artifact upload;
- RIO flat source-package artifact upload.

## 12. Changes made

1. Added Cohen and Heifetz (2024) to the bibliography.
2. Added a concise Introduction comparison.
3. Reorganized Related Literature to distinguish exact, component, and structural overlap.
4. Added five RIO keywords and four JEL codes.
5. Added Research Transparency with Data/Code and generative-AI disclosure.
6. Added deterministic RIO flat-package builder.
7. Added local `make rio-package` target.
8. Added CI build/compile/upload of the RIO source package.
9. Added regression tests for RIO metadata, literature integration, and package flatness.
10. Added explicit author-metadata and authenticated-portal carry-forward record.

## 13. Remaining blockers

**Substantive integration blockers: none.**

Only Stage-14 submission-QA items remain: refresh live RIO rules, inspect the authenticated portal, supply confirmed author-specific metadata/declarations, determine the correct identified/anonymous file arrangement, apply the final journal template/caption/reference details if required, and re-check Bunte (1995)/Sorenson (1995) full text if access becomes available.

## 14. Canonical Stage-13 verdict

`INTEGRATED MANUSCRIPT READY FOR SUBMISSION QA`

## 15. Stage-14 contract

Proceed to **Stage 14 — Submission QA for Review of Industrial Organization**.

Stage 14 must refresh all material RIO requirements from current official sources and the authenticated submission portal, reconcile any conflict with the Stage-12 ledger, complete confirmed author-specific title-page/declaration metadata, build the exact submission-file variants required by the live review model, inspect the final compiled PDF and flat source package, and fail closed on unresolved operational requirements.

Stage 14 may repair formatting/package defects but may not expand or rewrite the frozen theory or contribution.
