# Stage 14R — Final Hostile Audit Minor Repairs

## Status

`MINOR REPAIRS COMPLETE — READY FOR INDEPENDENT LIMITED RECHECK`

This is the implementation-side closeout of the bounded repairs requested by the final Astra audit. It is **not** Stage 15 authorization. The next scientific gate is an independent limited recheck of M1/M2/M3 and a bounded new-defect check, not a new full hostile audit.

## Authority and baseline

- Repository: `ryotamatsuki/economides-quality-equilibrium-reassessment`
- Target branch: `main`
- Astra audited baseline: `1ef9fe0a4890dd0257bdfdce7b42d222410ec850`
- Stage-14 submission-package content baseline: `9c78ab3cfc234e2b56ce146170e2cadc08b5199e`
- Theory freeze: `ECONOMIDES-THEORY-FREEZE-2026-09-10-v1`
- Repair branch: `audit/stage14r-final-hostile-minor-repairs`
- Repair-start main: `1ef9fe0a4890dd0257bdfdce7b42d222410ec850`
- Fully repaired submission-package content head inspected below: `922a580576a5094d1f4192483ad6c39d9d1a9367`
- Pull request: `#6` — `Stage 14R: final hostile minor repairs`

The repository root had no `AGENTS.md` at repair start (`404 Not Found`). Workflow authority was therefore taken from the current `ryotamatsuki/research-paper-workflow` hierarchy: `GOVERNANCE.md`, `THEORY_PAPER_RESEARCH_PIPELINE.md`, Stage 13/14/15 templates, and the submission/figure-table/formal-verification checklists.

“Stage 14R” is only the bounded repair label. It does not create a new canonical workflow stage and does not authorize theory development.

## M1 — Prior-art evidence boundary — COMPLETE

### Problem

The prior record used `STRUCTURALLY VERY CLOSE BUT NON-ABSORBING` and partly relied on Bunte's statement that Sorenson does not analyze variety choice. That fact cannot establish non-overlap with the present paper's quality game conditioned on maximal locations. Full texts of Bunte (1995) and Sorenson (1995) were not independently inspected.

### Repair

- `paper/sections/introduction.tex` and `paper/sections/related_literature.tex` state that the Sorenson comparison is limited to the publisher abstract and Bunte's discussion.
- Sorenson's reported omission of variety choice is no longer used as the decisive non-overlap test.
- The operative statement is: no equivalent result has been identified in the materials examined; exact overlap remains unresolved.
- The manuscript makes no priority claim and presents the `4/27` condition, piecewise maximal-location continuation, and explicit asymmetric exclusion profiles only as results self-containedly derived and proved in this paper.
- `docs/PRIOR_ART_COMPARISON_STAGE10R.md` distinguishes direct primary-source inspection, abstract/metadata evidence, Bunte's secondary report about Sorenson, and unresolved full-text questions.
- Historical `STRUCTURALLY VERY CLOSE BUT NON-ABSORBING` conclusions in Stage-10R/Stage-11 records are preserved as historical findings but explicitly superseded for current use rather than silently erased.

### Residual uncertainty

Exact overlap with the unavailable full texts of Bunte (1995) and Sorenson (1995) remains unresolved. Their full-text acquisition is not a condition for this bounded repair, but absence of equivalent results is not asserted.

## M2 — Lean rescaling units and coverage — COMPLETE

### Problem

The manuscript's rescaled gain is

`Δπ/μ = (4 - 27λt)/(18λ)`,

while Lean defines

`scaledP2Gain λ t = (4 - 27λt)/(18λt)`.

### Repair

`EconomidesFormal.lean` documents, without changing the definition or theorem bodies, that

`scaledP2Gain = Δπ/(μt)`

and therefore

`Δπ/μ = t × scaledP2Gain`.

Since `t > 0`, multiplication by `t` preserves sign and the zero set, hence the `λt=4/27` threshold. The manuscript's denominator remains `18λ` and was not altered to match the Lean normalization.

`theorem_certificates/STAGE7_5A_FORMAL_VERIFICATION_CERTIFICATE.md` and `docs/STAGE7_5A_RETROACTIVE_FORMAL_CLOSURE.md` now distinguish the actual kernel-checked core from unformalized economic structure:

- primitive consumer/demand derivation: not formalized;
- full price-NE existence/uniqueness correspondence: not formalized;
- endpoint revenue square identities: formalized;
- `4/27` gain identity/sign/equality: formalized;
- complete symmetric-quality-equilibrium iff statement: not formalized;
- asymmetric all-nonnegative-deviation inequalities: formalized conditional on the encoded piecewise payoffs;
- named-profile welfare/consumer-surplus algebraic identities and signs: formalized;
- planner problems: not formalized;
- full-history pure-SPNE nonexistence: not formalized;
- `t`-rescaling sign/equality for the dimensionless gain: formalized.

### Formal execution evidence

At repaired package head `922a580576a5094d1f4192483ad6c39d9d1a9367`:

- dedicated `lean-formal-verification` workflow run `34451698685`: **SUCCESS**;
- reproducibility workflow run `34451698669`, including the embedded formal gate: **SUCCESS**.

The dedicated Lean run used Lean `v4.33.1`, resolved mathlib to commit `0df444a360eaa60ab8c11dca51a86af692955474`, verified the dependency lock, rejected `sorry`/`admit`/project-specific axioms, and completed `lake build --wfail`. The printed dependencies for the exported formal theorems were only the standard Lean/mathlib logical dependencies `propext`, `Classical.choice`, and `Quot.sound`.

## M3 — Figure 1 endpoint membership — COMPLETE

### Problem

The prior single-row line-segment figure did not itself make all open/closed endpoint memberships unambiguous.

### Repair

`scripts/generate_outputs.py` now generates four vertically separated rows on the same true relative `λ` scale, with explicit interval notation and open/filled endpoint markers:

- `(1/9,4/27)`: symmetric `S` fails;
- `[4/27,4/21)`: coexistence and `CS_E<CS_S`;
- `{4/21}`: coexistence and `CS_E=CS_S`;
- `(4/21,2/9)`: coexistence and `CS_E>CS_S`.

The Figure 1 caption states that open circles exclude and filled circles include endpoints and explicitly states that `1/9` and `2/9` are outside the maintained domain. The tracked `figures/parameter_regions.tex` is regenerated from the generator; Table 1 retains the same interval partition.

### Deterministic regeneration and visual evidence

At `922a580576a5094d1f4192483ad6c39d9d1a9367`, reproducibility run `34451698669` passed both `Regenerate deterministic outputs` and `Check generated outputs are deterministic`.

The exact CI-produced submission artifacts from that run were downloaded and inspected after rendering at 200 dpi:

- identified manuscript: 18 pages, Figure 1 on p. 8 and Table 1 on p. 10;
- anonymous manuscript: 18 pages, Figure 1 on p. 8 and Table 1 on p. 10;
- separate title page: 1 page.

Figure 1 passed visual inspection in both manuscript variants. The interval labels are readable; there is no clipping or overlap; `4/27` is open on the failure row and filled on the coexistence row; `4/21` is represented as the included equality point while the adjacent strict regions exclude it; and `1/9` and `2/9` are shown as excluded domain endpoints. The caption and marker semantics agree.

Table 1 passed visual inspection in both manuscript variants. The four rows are `(1/9,4/27)`, `[4/27,4/21)`, `{4/21}`, and `(4/21,2/9)`, with the corresponding failure/coexistence and consumer-surplus rankings. No overflow, overlap, or unreadable table text was observed.

## Minor wording and submission-metadata repairs

The Conclusion changes `minimal-quality` to `minimal quality differentiation` to avoid reading the phrase as minimization of the quality level. No proposition or interpretation changes.

A cross-document Stage-14 check also found that the title-page source still contained a stale acknowledgments sentence even though the operative Stage-14 metadata/ledger stated `Acknowledgments: None`. `paper/title_page.tex` was restored to `None.` and the regression test was aligned. The one-page CI title-page PDF was rendered and visually checked; `Acknowledgments: None.` is present and the page has no clipping or overflow. This is an administrative consistency repair only and does not alter scientific content.

## Regression protection

`tests/test_regressions.py` now guards:

- evidence-bounded M1 wording and the superseded prior-art classification;
- M2 unit mapping and preservation of the manuscript denominator;
- M3 interval labels, endpoint-marker semantics, and domain-endpoint exclusion;
- title-page acknowledgments consistency.

## Cross-document and package verification

At repaired package head `922a580576a5094d1f4192483ad6c39d9d1a9367`, reproducibility run `34451698669` completed **SUCCESS** for every configured step, including:

- exact symbolic verification;
- independent numerical audit;
- regression tests;
- deterministic output regeneration and clean-diff check;
- pinned Lean/mathlib dependency and kernel verification;
- canonical LaTeX manuscript build;
- anonymous and identified RIO flat-package build/compile;
- unresolved citation/reference rejection;
- clean source-package/no-build-debris check;
- PDF font-embedding check;
- upload of anonymous/identified manuscript PDFs, title page, and both flat source packages.

No configured scientific, reproducibility, LaTeX, source-package, citation/reference, or artwork gate failed. Portal operation, the live anonymity model, fees, and exact portal file designations were not tested because they are outside this bounded scientific repair and remain governed by the existing Stage-14/15 portal-preflight contract.

## Theory-drift decision

`NO THEORY DRIFT`.

The repair changes no frozen model primitive, timing, strategy set, price-continuation formula, `4/27` threshold, `4/21` threshold, `(1/9,2/9)` domain, asymmetric-equilibrium existence claim, complete-equilibrium nonclaim, named-profile welfare scope, planner benchmark, exact linear-transport restriction, or modern full-history pure-SPNE statement.

`EconomidesFormal.lean` changes only the explanatory unit-convention comment around the existing R1 definition; no Lean definition or theorem body is changed. M3 changes only the generated exposition of already-certified intervals. M1 narrows literature claims rather than enlarging them.

## Limited-recheck contract

The next independent Astra check should use the merged `main` SHA and be limited to:

1. whether M1 now correctly distinguishes inspected evidence from unresolved Bunte (1995)/Sorenson (1995) full-text overlap and closes the overclaim objection;
2. whether M2 correctly maps `scaledP2Gain` to `Δπ/(μt)` while preserving the manuscript's `Δπ/μ` formula and accurately states formal coverage/noncoverage;
3. whether M3 makes endpoint membership unambiguous and remains consistent with Table 1;
4. whether these bounded repairs introduced any new mathematical, scope, literature-positioning, or submission-package defect.

It should not reopen already-passed theorem content without a concrete new defect.

## Implementation-side verdict

M1: `COMPLETE`  
M2: `COMPLETE`  
M3: `COMPLETE`

`MINOR REPAIRS COMPLETE — READY FOR INDEPENDENT LIMITED RECHECK`

This verdict is **not** permission to proceed to Stage 15. Stage 15 remains blocked until the independent limited recheck clears the repaired objections.