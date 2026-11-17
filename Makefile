PYTHON ?= python

.PHONY: verify symbolic numerical test p4-audit outputs paper short-note ber-package etb-package rio-package title-page clean

verify: symbolic numerical test p4-audit outputs

symbolic:
	$(PYTHON) verification/symbolic_checks.py

numerical:
	$(PYTHON) verification/numerical_deviation_scan.py

test:
	pytest -q

p4-audit:
	$(PYTHON) verification/short_note_independent_audit.py

outputs:
	$(PYTHON) scripts/generate_outputs.py

paper:
	cd paper && latexmk -pdf -interaction=nonstopmode -halt-on-error main.tex

short-note:
	cd paper/short_note && latexmk -pdf -interaction=nonstopmode -halt-on-error main.tex

ber-package:
	$(PYTHON) scripts/build_ber_flat_package.py
	rm -rf build/ber_compile
	cp -a build/ber_source build/ber_compile
	cd build/ber_compile && latexmk -pdf -interaction=nonstopmode -halt-on-error main.tex

etb-package:
	$(PYTHON) scripts/build_etb_flat_package.py
	rm -rf build/etb_compile
	cp -a build/etb_source build/etb_compile
	cd build/etb_compile && latexmk -pdf -interaction=nonstopmode -halt-on-error main.tex

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
