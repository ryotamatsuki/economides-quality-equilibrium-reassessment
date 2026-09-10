# Stage 14R2 — M1 Provenance Disclosure Bounded Repair

## Status

Bounded repair responding only to Astra's limited-recheck residual M1 objection. M2 and M3 remain closed and are not reopened.

## Authority and baseline

- Repository: `ryotamatsuki/economides-quality-equilibrium-reassessment`
- Base main / prior canonical merge: `c2e3aa67718cddf3abd5d2d01d8786ae970e8729`
- Prior Astra limited-recheck verdict: `B. LIMITED RECHECK FAIL — REMAIN IN STAGE 14R FOR BOUNDED REPAIR`
- Theory freeze: `ECONOMIDES-THEORY-FREEZE-2026-09-10-v1`
- Repair branch: `audit/stage14r2-m1-provenance-disclosure`

## Residual M1 objection

Astra found that the Stage 14R repair correctly narrowed non-overlap and priority claims, but the manuscript itself did not explicitly distinguish the evidence basis for Bunte (1995) from the directly inspected Chapter 3 material in Bunte (1997). The prior-art ledger already made this distinction; the remaining defect was manuscript-level provenance disclosure only.

## Repair

### Introduction

The Bunte paragraph now states that the detailed comparison of Bunte's argument is based on Chapter 3 of Bunte (1997), and that the full text of the corresponding 1995 discussion paper has not been independently inspected. The subsequent description of Bunte's critique is expressly tied to the material directly inspected.

### Related Literature

The Bunte paragraph now makes the same source distinction: detailed comparison is based on the Chapter 3 material in Bunte (1997), while the full text of the corresponding 1995 discussion paper has not been independently inspected. Statements about Bunte's specifications, stability objection, and downstream pricing scenarios are attributed to the inspected Chapter 3 material rather than implicitly to both versions.

### Regression guard

`tests/test_regressions.py` now checks that both manuscript sections preserve the Bunte (1995) full-text noninspection disclosure and the Bunte (1997) Chapter 3 evidence basis.

## Scope / theory-drift decision

`NO THEORY DRIFT`.

This repair changes only literature-provenance wording and a regression test. It does not alter the model, timing, strategy sets, price continuation, `4/27` or `4/21`, the maintained parameter domain, equilibrium claims, welfare claims, planner results, linear-transport rescaling, Lean definitions/theorems, or the modern full-history pure-SPNE statement.

## Residual prior-art uncertainty

The full texts of Bunte (1995) and Sorenson (1995) remain independently uninspected. Exact overlap therefore remains unresolved. The manuscript makes no priority claim and does not treat absence of an equivalent result as established.

## Verification contract

Before merge, the exact repair head must pass the existing symbolic, numerical, regression, deterministic-output, Lean, LaTeX, RIO-package, citation/reference, package-hygiene, and font-embedding gates. Because this bounded repair does not alter Figure 1 or Table 1, their previously closed M3 content is not reopened.

Final CI run IDs, PR metadata, merge SHA, and the exact SHA for the next independent M1-only limited recheck will be appended after verification and merge.
