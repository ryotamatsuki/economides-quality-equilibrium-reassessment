PYTHON ?= python

.PHONY: verify symbolic test outputs paper clean

verify: symbolic test outputs

symbolic:
	$(PYTHON) verification/symbolic_checks.py

test:
	pytest -q

outputs:
	$(PYTHON) scripts/generate_outputs.py

paper:
	cd paper && latexmk -pdf -interaction=nonstopmode -halt-on-error main.tex

clean:
	cd paper && latexmk -C || true
	rm -f tables/parameter_regions.tex figures/parameter_regions.csv
