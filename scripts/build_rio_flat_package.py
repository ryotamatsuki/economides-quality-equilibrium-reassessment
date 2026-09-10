"""Build a flat LaTeX source package for Review of Industrial Organization.

Springer/RIO instructs authors not to use subfolders in LaTeX submissions.  The
research repository remains modular; this script creates a disposable flat
submission package without changing the canonical source layout.
"""
from __future__ import annotations

import argparse
import re
import shutil
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SECTION_NAMES = [
    "introduction",
    "model",
    "results",
    "welfare",
    "robustness",
    "interpretation",
    "related_literature",
    "discussion",
    "conclusion",
    "research_transparency",
    "proofs",
]


def build(output: Path) -> None:
    if output.exists():
        shutil.rmtree(output)
    output.mkdir(parents=True)

    main = (ROOT / "paper" / "main.tex").read_text(encoding="utf-8")
    for name in SECTION_NAMES:
        main = main.replace(rf"\input{{sections/{name}}}", rf"\input{{{name}}}")
        shutil.copy2(ROOT / "paper" / "sections" / f"{name}.tex", output / f"{name}.tex")

    main = main.replace(
        r"\bibliography{../references/references}", r"\bibliography{references}"
    )
    main = main.replace(
        r"\input{../figures/parameter_regions}", r"\input{parameter_regions_figure}"
    )
    main = main.replace(
        r"\input{../tables/parameter_regions}", r"\input{parameter_regions_table}"
    )

    # Rewrite path-bearing inputs inside copied sections.
    results_path = output / "results.tex"
    results = results_path.read_text(encoding="utf-8").replace(
        r"\input{../figures/parameter_regions}", r"\input{parameter_regions_figure}"
    )
    results_path.write_text(results, encoding="utf-8")

    welfare_path = output / "welfare.tex"
    welfare = welfare_path.read_text(encoding="utf-8").replace(
        r"\input{../tables/parameter_regions}", r"\input{parameter_regions_table}"
    )
    welfare_path.write_text(welfare, encoding="utf-8")

    (output / "main.tex").write_text(main, encoding="utf-8")
    shutil.copy2(ROOT / "references" / "references.bib", output / "references.bib")
    shutil.copy2(
        ROOT / "figures" / "parameter_regions.tex",
        output / "parameter_regions_figure.tex",
    )
    shutil.copy2(
        ROOT / "tables" / "parameter_regions.tex",
        output / "parameter_regions_table.tex",
    )

    tex_files = list(output.glob("*.tex"))
    if not tex_files:
        raise RuntimeError("RIO package contains no TeX sources")
    if any(p.is_dir() for p in output.iterdir()):
        raise RuntimeError("RIO package is not flat")

    combined = "\n".join(p.read_text(encoding="utf-8") for p in tex_files)
    path_inputs = re.findall(r"\\(?:input|include|bibliography)\{([^}]+)\}", combined)
    forbidden = [x for x in path_inputs if "/" in x or "\\" in x]
    if forbidden:
        raise RuntimeError(f"Path-bearing LaTeX dependencies remain: {forbidden}")


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--output", type=Path, default=ROOT / "build" / "rio_submission")
    args = parser.parse_args()
    build(args.output.resolve())
    print(f"RIO flat package built at {args.output.resolve()}")
