#!/usr/bin/env python3
"""Prepare a flat, explicitly provisional LaTeX source package for BER.

This script copies existing verified manuscript sources and rebases only
the bibliography path. It does not alter any theorem, proof, citation
key, or scientific claim, and does not authorize journal submission.
"""
from pathlib import Path
import shutil

ROOT = Path(__file__).resolve().parents[1]
MAIN = ROOT / "paper" / "short_note" / "main.tex"
BIB = ROOT / "references" / "references.bib"
OUT = ROOT / "build" / "ber_source"
OLD_PATH = r"\bibliography{../../references/references}"
NEW_PATH = r"\bibliography{references}"


def main():
    source = MAIN.read_text(encoding="utf-8")
    if source.count(OLD_PATH) != 1:
        raise ValueError("Expected exactly one original bibliography path")
    if not BIB.is_file():
        raise FileNotFoundError(BIB)
    if OUT.exists():
        shutil.rmtree(OUT)
    OUT.mkdir(parents=True)
    flattened = source.replace(OLD_PATH, NEW_PATH)
    if r"\input{" in flattened or r"\include{" in flattened:
        raise ValueError("Unexpected external LaTeX file dependency")
    (OUT / "main.tex").write_text(flattened, encoding="utf-8")
    shutil.copyfile(BIB, OUT / "references.bib")
    if (OUT / "main.tex").read_text(encoding="utf-8").replace(
        NEW_PATH, OLD_PATH
    ) != source:
        raise AssertionError("Scientific content changed during path rebasing")
    print("BER provisional source package: build/ber_source/")
    print("Files: main.tex, references.bib; pending author/novelty clearance")


if __name__ == "__main__":
    main()
