"""Build a flat LaTeX source package for Review of Industrial Organization.

The research repository remains modular. This script creates a disposable,
no-subfolder upload package and supports both anonymous and identified variants
until the authenticated RIO portal confirms the operative review model.
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

AUTHOR_BLOCK = r"\author{Ryota Matsuki\\Independent Researcher, Matsuyama, Ehime, Japan\\\texttt{ryota.matsuki@gmail.com}\\ORCID: 0009-0005-2329-531X}"
PUBLIC_REPO = r"\url{https://github.com/ryotamatsuki/economides-quality-equilibrium-reassessment}"
BLINDED_REPO = r"\textit{[blinded repository link supplied through the submission system]}"


def build(output: Path, mode: str) -> None:
    if output.exists():
        shutil.rmtree(output)
    output.mkdir(parents=True)

    main = (ROOT / "paper" / "main.tex").read_text(encoding="utf-8")
    if mode == "identified":
        main = main.replace(r"\author{}", AUTHOR_BLOCK)

    for name in SECTION_NAMES:
        main = main.replace(rf"\input{{sections/{name}}}", rf"\input{{{name}}}")
        shutil.copy2(ROOT / "paper" / "sections" / f"{name}.tex", output / f"{name}.tex")

    main = main.replace(r"\bibliography{../references/references}", r"\bibliography{references}")

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

    transparency_path = output / "research_transparency.tex"
    transparency = transparency_path.read_text(encoding="utf-8")
    if mode == "anonymous":
        transparency = transparency.replace(PUBLIC_REPO, BLINDED_REPO)
        transparency = transparency.replace("Ryota Matsuki:", "The author:")
    transparency_path.write_text(transparency, encoding="utf-8")

    (output / "main.tex").write_text(main, encoding="utf-8")
    shutil.copy2(ROOT / "references" / "references.bib", output / "references.bib")
    shutil.copy2(ROOT / "figures" / "parameter_regions.tex", output / "parameter_regions_figure.tex")
    shutil.copy2(ROOT / "tables" / "parameter_regions.tex", output / "parameter_regions_table.tex")

    if any(p.is_dir() for p in output.iterdir()):
        raise RuntimeError("RIO package is not flat")

    tex_files = list(output.glob("*.tex"))
    combined = "\n".join(p.read_text(encoding="utf-8") for p in tex_files)
    path_inputs = re.findall(r"\\(?:input|include|bibliography)\{([^}]+)\}", combined)
    forbidden = [x for x in path_inputs if "/" in x or "\\" in x]
    if forbidden:
        raise RuntimeError(f"Path-bearing LaTeX dependencies remain: {forbidden}")

    if mode == "anonymous":
        forbidden_identity = [
            "Ryota Matsuki",
            "ryota.matsuki@gmail.com",
            "0009-0005-2329-531X",
            "github.com/ryotamatsuki",
        ]
        leaked = [x for x in forbidden_identity if x in combined]
        if leaked:
            raise RuntimeError(f"Anonymous RIO package leaks identity: {leaked}")
    else:
        if "Ryota Matsuki" not in main or "ryota.matsuki@gmail.com" not in main:
            raise RuntimeError("Identified RIO package is missing author metadata")


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--mode", choices=("anonymous", "identified"), required=True)
    args = parser.parse_args()
    build(args.output.resolve(), args.mode)
    print(f"RIO {args.mode} flat package built at {args.output.resolve()}")
