#!/usr/bin/env python3
"""Build flat, reproducible ETB LaTeX source, preserving mathematical content.

Springer's Economic Theory Bulletin requires original editable TeX sources
and compiled PDF. Only the bibliography path is rebased for flat packaging.
"""
from pathlib import Path
import shutil

ROOT = Path(__file__).resolve().parents[1]
MAIN = ROOT / "paper" / "etb" / "main.tex"
BIB = ROOT / "references" / "references.bib"
OUT = ROOT / "build" / "etb_source"
OLD = r"\bibliography{../../references/references}"
NEW = r"\bibliography{references}"


def main():
    text = MAIN.read_text(encoding="utf-8")
    if text.count(OLD) != 1 or not BIB.is_file():
        raise ValueError("Unexpected ETB bibliography dependency")
    if r"\input{" in text or r"\include{" in text:
        raise ValueError("Manuscript source has unbundled external TeX dependencies")
    if OUT.exists():
        shutil.rmtree(OUT)
    OUT.mkdir(parents=True)
    flat = text.replace(OLD, NEW)
    (OUT / "main.tex").write_text(flat, encoding="utf-8")
    shutil.copyfile(BIB, OUT / "references.bib")
    if flat.replace(NEW, OLD) != text:
        raise AssertionError("ETB flat package changed scientific source content")
    print("Stage16 ETB source: build/etb_source/main.tex + references.bib")


if __name__ == "__main__":
    main()
