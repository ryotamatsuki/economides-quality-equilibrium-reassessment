# Stage 14R — Final Hostile Audit Minor Repairs

## Status

Working repair record. Final CI/PDF/PR evidence will be appended before the implementation-side closeout verdict.

## Authority and baseline

- Repository: `ryotamatsuki/economides-quality-equilibrium-reassessment`
- Target branch: `main`
- Astra audited baseline: `1ef9fe0a4890dd0257bdfdce7b42d222410ec850`
- Stage-14 submission-package content baseline: `9c78ab3cfc234e2b56ce146170e2cadc08b5199e`
- Theory freeze: `ECONOMIDES-THEORY-FREEZE-2026-09-10-v1`
- Repair branch: `audit/stage14r-final-hostile-minor-repairs`
- Repair-start main: `1ef9fe0a4890dd0257bdfdce7b42d222410ec850`

The repository root had no `AGENTS.md` at repair start (`404 Not Found`). Workflow authority was therefore taken from the current `ryotamatsuki/research-paper-workflow` hierarchy: `GOVERNANCE.md`, `THEORY_PAPER_RESEARCH_PIPELINE.md`, Stage 13/14/15 templates, and the submission/figure-table/formal-verification checklists.

This is a bounded post-Stage-14 repair. It does not create a new canonical stage or authorize theory changes.

## M1 — Prior-art evidence boundary

### Problem

The prior record used `STRUCTURALLY VERY CLOSE BUT NON-ABSORBING` and partly relied on Bunte's statement that Sorenson does not analyze variety choice. That fact cannot establish non-overlap with the present paper's quality game conditioned on maximal locations. Full texts of Bunte (1995) and Sorenson (1995) were not independently inspected.

### Repair

- `paper/sections/introduction.tex` and `paper/sections/related_literature.tex` now state that the Sorenson comparison is limited to the publisher abstract and Bunte's discussion.
- Sorenson's reported omission of variety choice is no longer used as the decisive non-overlap test.
- The operative statement is: no equivalent result has been identified in the materials examined; exact overlap remains unresolved.
- The manuscript makes no priority claim and presents the `4/27` condition, piecewise maximal-location continuation, and explicit asymmetric exclusion profiles only as results self-containedly derived and proved in this paper.
- `docs/PRIOR_ART_COMPARISON_STAGE10R.md` now distinguishes direct primary-source inspection, abstract/metadata evidence, Bunte's secondary report about Sorenson, and unresolved full-text questions.
- Historical `STRUCTURALLY VERY CLOSE BUT NON-ABSORBING` conclusions in Stage-10R/Stage-11 records are preserved for provenance but explicitly superseded rather than silently erased.

### Residual uncertainty

Exact overlap with the unavailable full texts of Bunte (1995) and Sorenson (1995) remains unresolved. Their full-text acquisition is not a condition for this bounded repair, but absence of equivalent results is not asserted.

## M2 — Lean rescaling units and coverage

### Problem

The manuscript's rescaled gain is

`Δπ/μ = (4 - 27λt)/(18λ)`,

while Lean defines

`scaledP2Gain λ t = (4 - 27λt)/(18λt)`.

### Repair

`EconomidesFormal.lean` now documents, without changing the definition or theorem bodies, that

`scaledP2Gain = Δπ/(μt)`

and therefore

`Δπ/μ = t × scaledP2Gain`.

Since `t > 0`, multiplication by `t` preserves sign and the zero set, hence the `λt=4/27` threshold.

`theorem_certificates/STAGE7_5A_FORMAL_VERIFICATION_CERTIFICATE.md` and `docs/STAGE7_5A_RETROACTIVE_FORMAL_CLOSURE.md` now distinguish the actual kernel-checked core from unformalized economic structure. In particular:

- primitive consumer/demand derivation: not formalized;
- full price-NE existence/uniqueness correspondence: not formalized;
- endpoint revenue square identities: formalized;
- `4/27` gain identity/sign/equality: formalized;
- complete symmetric-quality-equilibrium iff statement: not formalized;
- asymmetric all-nonnegative-deviation inequalities: formalized conditional on encoded piecewise payoffs;
- named-profile welfare/CS algebraic identities/signs: formalized;
- planner problems: not formalized;
- full-history pure-SPNE nonexistence: not formalized;
- `t`-rescaling sign/equality for the dimensionless gain: formalized.

The manuscript formula was not changed.

## M3 — Figure 1 endpoint membership

### Problem

The prior single-row line-segment figure did not itself make all open/closed endpoint memberships unambiguous.

### Repair

`scripts/generate_outputs.py` now generates four vertically separated rows on the same true relative `λ` scale, with explicit interval notation and open/filled endpoint markers:

- `(1/9,4/27)`: symmetric `S` fails;
- `[4/27,4/21)`: coexistence and `CS_E<CS_S`;
- `{4/21}`: coexistence and `CS_E=CS_S`;
- `(4/21,2/9)`: coexistence and `CS_E>CS_S`.

The Figure 1 caption states that open circles exclude and filled circles include endpoints and explicitly states that `1/9` and `2/9` are outside the maintained domain. The tracked `figures/parameter_regions.tex` is regenerated from the generator; Table 1 retains the same interval partition.

## Minor wording clarification

The Conclusion changes `minimal-quality` to `minimal quality differentiation` to avoid reading the phrase as minimization of the quality level. No proposition or interpretation changes.

## Regression protection

`tests/test_regressions.py` adds guards for:

- evidence-bounded M1 wording and superseding prior-art ledger;
- M2 unit mapping and preservation of the manuscript denominator;
- M3 interval labels, endpoint-marker semantics, and domain-endpoint exclusion.

## Theory-drift decision

`NO THEORY DRIFT`.

The repairs do not alter players, timing, strategy sets, price continuation, `4/27`, `4/21`, the `(1/9,2/9)` domain, asymmetric-equilibrium existence scope, welfare scope, planner benchmarks, linear-transport restriction, or the modern pure-SPNE statement.

## Pending implementation-side verification

Before this record receives its final verdict, the repair branch must pass:

- symbolic verification;
- independent numerical audit;
- regression tests;
- deterministic figure/table regeneration;
- pinned Lean/mathlib kernel build and placeholder/axiom gate;
- canonical LaTeX build;
- anonymous and identified RIO flat-package builds;
- unresolved citation/reference checks;
- source-package hygiene and embedded-font checks;
- rendered visual inspection of the updated Figure 1 and Table 1 pages.

The resulting CI run IDs, PDF visual result, PR URL, merge status, and exact limited-recheck SHA will be appended after those checks complete.
