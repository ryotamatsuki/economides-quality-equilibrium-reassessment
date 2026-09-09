# Economides Quality-Equilibrium Reassessment

Reproducible research repository for the theoretical reassessment of Nicholas Economides (1989), *Quality Variations and Maximal Variety Differentiation*, Regional Science and Urban Economics 19(1), 21–29.

## Canonical theory

Theory is frozen under:

`ECONOMIDES-THEORY-FREEZE-2026-09-10-v1`

The frozen headline results are:

1. At maximal locations, the reported symmetric quality profile `a1=a2=1/(3λ)` is not a quality-subgame Nash equilibrium for `1/9 < λ < 4/27`.
2. At maximal locations, `(1/λ,0)` and `(0,1/λ)` are additional pure quality-subgame equilibria for `1/9 < λ < 2/9`.
3. Under the standard modern full-history SPNE interpretation, the three-stage pure-strategy game has no pure SPNE because a feasible price subgame has no pure Nash equilibrium. This is a supporting equilibrium-concept observation, not the headline novelty claim.

The repository must not silently expand these claims. See `theory/THEORY_FREEZE.md` and `docs/CLAIM_SCOPE.md`.

## Reproducibility

Python 3.11+ is recommended.

```bash
python -m pip install -r requirements.txt
python verification/symbolic_checks.py
pytest -q
python scripts/generate_outputs.py
```

To build the manuscript scaffold when a TeX distribution is installed:

```bash
make paper
```

Run all reproducibility gates:

```bash
make verify
```

## Repository map

- `theory/` — canonical theory freeze and theorem register
- `theorem_certificates/` — adversarial theorem certification record
- `docs/` — claim scope, provenance, and decision log
- `verification/` — exact symbolic checks
- `tests/` — permanent regression tests from certified counterexamples
- `scripts/` — deterministic generated outputs
- `tables/` and `figures/` — generated manuscript objects
- `paper/` — modular LaTeX manuscript scaffold
- `references/` — bibliography source
- `.github/workflows/` — CI reproducibility gate

## Change control

Any change affecting equilibrium correctness or globality must reopen the relevant Stage 4/4A certification. Any change affecting theorem scope, welfare-selection language, robustness, or benchmark terminology must reopen the relevant Stage 7.5A certification. No silent theory drift is permitted.
