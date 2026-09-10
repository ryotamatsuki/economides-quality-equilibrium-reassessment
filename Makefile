PYTHON ?= python

.PHONY: verify symbolic numerical test outputs paper rio-package clean

verify: symbolic numerical test outputs

symbolic:
	$(PYTHON) verification/symbolic_checks.py

numerical:
	$(PYTHON) verification/numerical_deviation_scan.py

test:
	pytest -q

outputs:
	$(PYTHON) scripts/generate_outputs.py

paper:
	cd paper && latexmk -pdf -interaction=nonstopmode -halt-on-error main.tex

rio-package:
	$(PYTHON) scripts/build_rio_flat_package.py --output build/rio_submission
	cd build/rio_submission && latexmk -pdf -interaction=nonstopmode -halt-on-error main.tex

clean:
	cd paper && latexmk -C || true
	rm -rf build
	rm -f tables/parameter_regions.tex figures/parameter_regions.csv
