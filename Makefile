PYTHON ?= python

.PHONY: verify symbolic numerical test outputs paper rio-package title-page clean

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

title-page:
	cd paper && latexmk -pdf -interaction=nonstopmode -halt-on-error title_page.tex

rio-package:
	rm -rf build/rio_anonymous build/rio_identified build/rio_anonymous_compile build/rio_identified_compile
	$(PYTHON) scripts/build_rio_flat_package.py --mode anonymous --output build/rio_anonymous
	$(PYTHON) scripts/build_rio_flat_package.py --mode identified --output build/rio_identified
	cp -a build/rio_anonymous build/rio_anonymous_compile
	cp -a build/rio_identified build/rio_identified_compile
	cd build/rio_anonymous_compile && latexmk -pdf -interaction=nonstopmode -halt-on-error main.tex
	cd build/rio_identified_compile && latexmk -pdf -interaction=nonstopmode -halt-on-error main.tex
	$(MAKE) title-page

clean:
	cd paper && latexmk -C || true
	cd paper && latexmk -C title_page.tex || true
	rm -rf build
	rm -f tables/parameter_regions.tex figures/parameter_regions.csv
