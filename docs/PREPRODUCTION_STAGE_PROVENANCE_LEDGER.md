# Preproduction Stage Provenance Ledger

## Purpose

This is a **retrospective archival index** for the preproduction stages of the current research workflow. It improves traceability for Stages 0--8, which largely preceded creation of the production repository at Stage 9.

It does **not** invent missing historical documents, replace the canonical theory freeze or theorem certificates, or re-run old scientific gates. Where a standalone historical stage verdict was not preserved in this repository, that fact is stated explicitly. The status below records the **current auditable closure state** supported by the surviving canonical artifacts.

Current workflow authority checked on 2026-09-15 JST:

1. `ryotamatsuki/research-paper-workflow/GOVERNANCE.md`
2. `ryotamatsuki/research-paper-workflow/THEORY_PAPER_RESEARCH_PIPELINE.md`
3. workflow `main @ f48984013898696f010f0437a8cfed6b5b54bdc2` (v2.1 architecture)

Current submission-stage repository state when this ledger was created:

`main @ 199e600aafd16b9cf6e6a0c24c20afb7f38d4ead`

Canonical scientific submission-content candidate remains:

`97632692448bbca7d45f17e0ac6b5071dec4f52e`

Theory freeze:

`ECONOMIDES-THEORY-FREEZE-2026-09-10-v1`

---

## Archival reconstruction rule

The production repository was created at Stage 9. Accordingly, absence of a `STAGE0.md`, `STAGE1.md`, etc. file is not by itself evidence that the underlying research work was skipped. This ledger distinguishes:

- **EXACT RECORDED VERDICT** — a surviving canonical certificate or stage record states the verdict directly;
- **CURRENT GATE CLOSED / HISTORICAL STANDALONE VERDICT NOT PRESERVED** — later canonical artifacts demonstrate that the required object survived downstream certification, but the original standalone stage report is not in the production repository;
- **NOT INVOKED / NOT APPLICABLE** — the workflow route did not require the stage.

This ledger is provenance documentation only. It cannot convert a failed or untested scientific claim into a PASS.

---

## Stage 0 — Idea / Motivation Intake

**Current closure state:** `CURRENT GATE CLOSED / HISTORICAL STANDALONE VERDICT NOT PRESERVED`

Reconstructed surviving research question: reassess the equilibrium claims in Economides (1989), with particular attention to global quality deviations and the stability/multiplicity of the maximal-location quality outcome in the original location--quality--price game.

Current evidence:

- `theory/THEORY_FREEZE.md`
- `paper/sections/introduction.tex`
- `docs/CLAIM_SCOPE.md`

The final paper is not a generic application or relabeling exercise; it is organized around a falsifiable mathematical reassessment of a published equilibrium characterization.

---

## Stage 1 — Source & Mathematical Audit

**Current closure state:** `CURRENT GATE CLOSED / HISTORICAL STANDALONE VERDICT NOT PRESERVED`

The surviving canonical record shows that the original game was reconstructed with explicit players, timing, strategy domains, consumer utility, quality costs, nonnegative prices/qualities, covered demand, equilibrium concept, and boundary regimes.

Evidence:

- `theory/THEORY_FREEZE.md`
- `paper/sections/model.tex`
- `paper/sections/results.tex`
- `paper/sections/proofs.tex`
- `verification/symbolic_checks.py`
- `verification/numerical_deviation_scan.py`

Later independent certification confirms that the source audit was not treated as sufficient by itself; the solved object was attacked again at Stage 4A and Stage 11.

---

## Stage 2 — Literature Frontier / Novelty Kill Gate

**Current closure state:** `CURRENT GATE CLOSED / HISTORICAL STANDALONE VERDICT NOT PRESERVED`

The literature positioning was repeatedly narrowed rather than inflated. The operative current position is:

- Bunte (1995): bibliographic/abstract-level information available; full text not independently inspected;
- Bunte (1997), Chapter 3: directly inspected evidence basis for detailed Bunte comparison;
- Sorenson (1995): full article not independently inspected; comparison limited to available abstract/metadata and Bunte's report;
- no priority claim;
- no definitive non-absorption claim for unavailable full texts;
- exact overlap with the unavailable full texts remains unresolved but is disclosed as a nonblocking provenance limitation.

Evidence:

- `docs/PRIOR_ART_COMPARISON_STAGE10R.md`
- `docs/STAGE10R_ASTRA_REPAIRS.md`
- `docs/STAGE11_LIMITED_RECHECK.md`
- `docs/STAGE14R_FINAL_HOSTILE_MINOR_REPAIRS.md`
- `docs/STAGE14R2_M1_PROVENANCE_DISCLOSURE_REPAIR.md`
- `paper/sections/introduction.tex`
- `paper/sections/related_literature.tex`

The later Stage 14R/14R2 repairs supersede any earlier historical wording that characterized the unavailable Bunte/Sorenson full texts as definitively non-absorbing.

---

## Stage 3 — Candidate Mechanism Search

**Current closure state:** `CURRENT GATE CLOSED / HISTORICAL STANDALONE VERDICT NOT PRESERVED`

The surviving mechanism is the regime-changing finite/global quality deviation in the original game: a quality deviation changes the downstream price regime and yields the exact `4/27` threshold at maximal locations. The paper does not rescue the result by adding a new mechanism or feature.

Evidence:

- `theory/THEORY_FREEZE.md`
- `theory/THEOREM_REGISTER.md`
- `paper/sections/results.tex`
- `paper/sections/interpretation.tex`

Rejected or prohibited expansions are preserved in the theory freeze and scope certificate, including arbitrary convex quality costs, arbitrary transport technologies, mixed-strategy characterization, and complete equilibrium correspondence claims.

---

## Stage 4 — Minimal Model Gate

**Current closure state:** `CURRENT GATE CLOSED / HISTORICAL STANDALONE VERDICT NOT PRESERVED`

The solved object carried forward to independent certification contains:

- maximal-location piecewise price continuation;
- global exclusionary quality deviation and exact `4/27` threshold;
- asymmetric exclusion quality equilibria `(1/lambda,0)` and `(0,1/lambda)` on the certified interval;
- named-profile welfare and consumer-surplus comparisons;
- a modern full-history pure-SPNE nonexistence observation as a secondary result.

Evidence:

- `theory/THEORY_FREEZE.md`
- `theory/THEOREM_REGISTER.md`
- `verification/symbolic_checks.py`
- `verification/numerical_deviation_scan.py`
- `tests/test_regressions.py`

A standalone historical Stage-4 verdict file is not preserved here. The next mandatory gate, Stage 4A, is preserved and passed independently.

---

## Stage 4A — Independent Mathematical Adversarial Certification

**Current closure state:** `EXACT RECORDED VERDICT`

Canonical verdict:

`GO — MATHEMATICAL ADVERSARIAL CERTIFICATION PASS`

Authority:

- `theorem_certificates/STAGE4A_CERTIFICATE.md`

The certificate independently attacks globality, boundaries, price continuation, the `4/27` deviation, asymmetric best responses, and full-history pure-SPNE interpretation. It explicitly preserves limitations such as no exhaustive quality-equilibrium characterization and no mixed-strategy SPNE claim.

---

## Stage 5 — Mechanism Hardening

**Current closure state:** `NOT INVOKED / NOT APPLICABLE`

Stage 5 is a repair route for a Stage-4/4A conditional result requiring one authorized economic modification. The surviving project did not adopt a new economic margin at this point. Later repairs were evidence-scope, exposition, formal-verification, or submission-QA repairs and did not constitute Stage-5 mechanism expansion.

---

## Stage 6 — Novelty Re-Kill

**Current closure state:** `CURRENT GATE CLOSED / HISTORICAL STANDALONE VERDICT NOT PRESERVED`

The solved propositions were re-exposed to prior-art attacks. The generic R&D-stability novelty was conceded; the paper's contribution was narrowed to the self-contained original-game derivation and certified model-specific results. Later Stage 10R, Stage 11, Stage 14R and Stage 14R2 performed further novelty/provenance attacks and narrowed claims again where evidence required it.

Evidence:

- `docs/PRIOR_ART_COMPARISON_STAGE10R.md`
- `docs/STAGE11_LIMITED_RECHECK.md`
- `docs/STAGE14R_FINAL_HOSTILE_MINOR_REPAIRS.md`
- `docs/STAGE14R2_M1_PROVENANCE_DISCLOSURE_REPAIR.md`
- `theorem_certificates/STAGE7_5A_SCOPE_CERTIFICATE.md`

No standalone original Stage-6 verdict file is preserved in the Stage-9-created production repository.

---

## Stage 7 — Welfare / Generality / Institutional Validation

**Current closure state:** `CURRENT GATE CLOSED / HISTORICAL STANDALONE VERDICT NOT PRESERVED`

The current frozen theory contains exact named-profile welfare and consumer-surplus formulas, the `4/21` consumer-surplus threshold, the equilibrium-comparison domain restriction, and explicit planner benchmark definitions.

Evidence:

- `theory/THEORY_FREEZE.md`
- `paper/sections/welfare.tex`
- `paper/sections/interpretation.tex`
- `paper/sections/proofs.tex`
- `verification/symbolic_checks.py`

The unrestricted planner benchmark and fixed-location planner optimum are distinguished. The project does not use policy claims or empirical validation to enlarge the theorem scope.

---

## Stage 7.5 — Scope / Value Decision

**Current closure state:** `CURRENT GATE CLOSED / HISTORICAL STANDALONE VERDICT NOT PRESERVED`

Scope discipline is preserved in:

- `docs/CLAIM_SCOPE.md`
- `theory/THEOREM_REGISTER.md`
- `theorem_certificates/STAGE7_5A_SCOPE_CERTIFICATE.md`

The project distinguishes existence from exhaustive characterization, equilibrium comparison from profile comparison, local model-specific robustness from generic robustness, and unrestricted first best from the fixed-location planner benchmark.

The standalone Stage-7.5 historical verdict is not separately preserved, but Stage 7.5A records the mandatory independent scope certification that followed.

---

## Stage 7.5A — Generality / Quantifier Red-Team Gate

**Current closure state:** `EXACT RECORDED VERDICT`

Canonical verdict:

`GO — GENERALITY / QUANTIFIER CERTIFICATION PASS`

Authority:

- `theorem_certificates/STAGE7_5A_SCOPE_CERTIFICATE.md`

The certificate freezes the exact domains and prohibited overclaims, including no complete equilibrium characterization, no generic convex-cost theorem, no arbitrary-transport theorem, and careful qualification of the modern full-history SPNE statement.

### Embedded Formal Verification Gate

Current formal-verification verdict:

`FORMAL VERIFICATION PASS — PROOF-CRITICAL CORE KERNEL-CHECKED`

Authority:

- `theorem_certificates/STAGE7_5A_FORMAL_VERIFICATION_CERTIFICATE.md`
- `EconomidesFormal.lean`
- `lean-toolchain`
- `lakefile.toml`
- `lake-manifest.json`
- `.github/workflows/lean.yml`

Historical routing note: the v2.1 formal-verification obligation was closed **retroactively** after manuscript construction had begun. This is recorded explicitly in:

- `docs/STAGE7_5A_RETROACTIVE_FORMAL_CLOSURE.md`

The retroactive closure did not change theory. After formal closure, downstream hostile review and submission QA were rerun with the formal artifacts in scope. This ledger does not rewrite that historical ordering; it records it as a repaired routing irregularity.

---

## Stage 8 — Canonical Theory Freeze

**Current closure state:** `EXACT RECORDED FREEZE`

Freeze ID:

`ECONOMIDES-THEORY-FREEZE-2026-09-10-v1`

Authority:

- `theory/THEORY_FREEZE.md`

The freeze records the model, complete strategy domains, price continuation, propositions, welfare comparisons, planner terminology, approved linear-transport rescaling, explicit excluded claims, and change-control rule.

No later Stage 9--15 repair has changed the frozen economic model or theorem scope. Later changes have been implementation, exposition, evidence-provenance, formal-coverage clarification, journal-compliance, or submission-release work and were audited for theory drift.

---

## Stage 9 onward — canonical production trail

The production repository itself begins at Stage 9. The surviving forward trail includes:

- `docs/PROVENANCE.md` — Stage-9 repository baseline and decision log;
- Stage 10 manuscript construction and Stage 10R repairs;
- `docs/STAGE11_LIMITED_RECHECK.md`;
- `docs/STAGE12_JOURNAL_POSITIONING.md`;
- `docs/STAGE13_FULL_PAPER_INTEGRATION.md`;
- `docs/STAGE14_SUBMISSION_QA.md` and `docs/STAGE14_SUBMISSION_QA_CLOSEOUT.md`;
- `docs/STAGE14R_FINAL_HOSTILE_MINOR_REPAIRS.md`;
- `docs/STAGE14R2_M1_PROVENANCE_DISCLOSURE_REPAIR.md`;
- `docs/STAGE15_SUBMISSION_FREEZE.md`.

The scientific submission-content candidate currently remains:

`97632692448bbca7d45f17e0ac6b5071dec4f52e`

Stage 15 release documentation was merged later and does not change the manuscript/theory content represented by that candidate.

---

## Archival verdict

`PREPRODUCTION PROVENANCE RECONSTRUCTION COMPLETE`

This record closes the documentary traceability gap identified during the 2026-09-15 workflow audit. It does not claim that standalone historical Stage 0--3/4/6/7/7.5 reports existed when they did not, and it does not substitute retrospective documentation for the exact Stage 4A, Stage 7.5A, formal-verification, or theory-freeze authorities.

`NO THEORY DRIFT`.
