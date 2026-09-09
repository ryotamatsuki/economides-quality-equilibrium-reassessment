# Provenance and Decision Log

## Canonical authority chain

1. `theory/THEORY_FREEZE.md` — freeze ID `ECONOMIDES-THEORY-FREEZE-2026-09-10-v1`
2. `theorem_certificates/STAGE4A_CERTIFICATE.md` — independent mathematical adversarial certification
3. `theorem_certificates/STAGE7_5A_SCOPE_CERTIFICATE.md` — generality/quantifier certification
4. `docs/CLAIM_SCOPE.md` — Stage 7.5A quantifier/scope limits
5. `verification/symbolic_checks.py` — exact symbolic identities
6. `verification/numerical_deviation_scan.py` — independent direct-allocation numerical audit
7. `tests/test_regressions.py` — permanent counterexample and threshold regression tests

## Stage-9 repository baseline

The repository was created empty. At Stage 9 start there were no commits, branches, or pull requests. The first commit was:

`915cf88515f5f276f2aef17cb5924195ffbe5ec0` — `Initialize reproducibility repository`.

The canonical theory-freeze record was introduced at:

`4191106f9b8c5a59890c3a459312f29b254ee51c` — `Add canonical theory freeze`.

The content of `theory/THEORY_FREEZE.md` was not modified during subsequent Stage-9 implementation work.

All Stage-9 setup work was performed on `main` after confirming the empty remote state and absence of concurrent PR/branch work.

## Frozen counterexamples

- price-subgame nonexistence witness: `x=1/3,y=2/3,a_1=a_2=0`;
- exact undercut from `(1,1)` to `p_1=7/12`, gain `1/12`;
- global quality deviation `a_i'=1/λ`, gain `(4-27λ)/(18λ)`;
- knife edge `λ=4/27`;
- asymmetric quality equilibria `(1/λ,0)` and `(0,1/λ)`;
- consumer-surplus threshold `λ=4/21`.

## Change control

Theory changes are not implementation changes. Any modification to model primitives, theorem domains, equilibrium concepts, welfare quantifiers, benchmark definitions, or robustness scope must be routed back through the relevant theory stages before the repository's canonical theory files are updated.
