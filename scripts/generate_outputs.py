"""Generate deterministic manuscript-ready parameter-region outputs."""
from pathlib import Path
from fractions import Fraction

TABLE = Path("tables/parameter_regions.tex")
CSV = Path("figures/parameter_regions.csv")
TABLE.parent.mkdir(parents=True, exist_ok=True)
CSV.parent.mkdir(parents=True, exist_ok=True)

regions = [
    (Fraction(1, 9), Fraction(4, 27), "reported symmetric profile is not a quality-stage Nash equilibrium"),
    (Fraction(4, 27), Fraction(4, 21), "symmetric and certified exclusion equilibria coexist; exclusion has higher W and PS but lower CS"),
    (Fraction(4, 21), Fraction(2, 9), "symmetric and certified exclusion equilibria coexist; exclusion has higher W, PS, and CS"),
]

lines = [
    r"\\begin{tabular}{lll}",
    r"\\hline",
    r"Region & Status & Welfare comparison \\\",
    r"\\hline",
    r"$(1/9,4/27)$ & symmetric profile fails & profile comparison only \\\",
    r"$[4/27,4/21)$ & coexistence & $W_E>W_S,\;PS_E>PS_S,\;CS_E<CS_S$ \\\",
    r"$[4/21,2/9)$ & coexistence & $W_E>W_S,\;PS_E>PS_S,\;CS_E>CS_S$ \\\",
    r"\\hline",
    r"\\end{tabular}",
]
TABLE.write_text("\n".join(lines) + "\n", encoding="utf-8")

csv_lines = ["lower,upper,interpretation"]
for lo, hi, label in regions:
    csv_lines.append(f"{float(lo):.12f},{float(hi):.12f},{label}")
CSV.write_text("\n".join(csv_lines) + "\n", encoding="utf-8")

print(f"generated {TABLE}")
print(f"generated {CSV}")
