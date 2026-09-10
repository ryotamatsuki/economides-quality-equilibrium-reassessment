"""Generate deterministic manuscript-ready parameter-region outputs."""
from pathlib import Path
from fractions import Fraction

TABLE = Path("tables/parameter_regions.tex")
CSV = Path("figures/parameter_regions.csv")
FIGURE = Path("figures/parameter_regions.tex")
TABLE.parent.mkdir(parents=True, exist_ok=True)
CSV.parent.mkdir(parents=True, exist_ok=True)

regions = [
    (Fraction(1, 9), Fraction(4, 27), "reported symmetric profile is not a quality-stage Nash equilibrium"),
    (Fraction(4, 27), Fraction(4, 21), "symmetric and certified exclusion equilibria coexist; exclusion has higher W and PS but lower CS"),
    (Fraction(4, 21), Fraction(4, 21), "symmetric and certified exclusion equilibria coexist; exclusion has higher W and PS and equal CS"),
    (Fraction(4, 21), Fraction(2, 9), "symmetric and certified exclusion equilibria coexist; exclusion has higher W, PS, and CS"),
]

lines = [
    "\\begin{tabular}{lll}",
    "\\hline",
    "Region & Status & Welfare comparison \\\\",
    "\\hline",
    "$(1/9,4/27)$ & symmetric profile fails & profile comparison only \\\\",
    "$[4/27,4/21)$ & coexistence & $W_E>W_S,\\;PS_E>PS_S,\\;CS_E<CS_S$ \\\\",
    "$\\{4/21\\}$ & coexistence & $W_E>W_S,\\;PS_E>PS_S,\\;CS_E=CS_S$ \\\\",
    "$(4/21,2/9)$ & coexistence & $W_E>W_S,\\;PS_E>PS_S,\\;CS_E>CS_S$ \\\\",
    "\\hline",
    "\\end{tabular}",
]
TABLE.write_text("\n".join(lines) + "\n", encoding="utf-8")

csv_lines = ["lower,upper,interpretation"]
for lo, hi, label in regions:
    csv_lines.append(f"{float(lo):.12f},{float(hi):.12f},{label}")
CSV.write_text("\n".join(csv_lines) + "\n", encoding="utf-8")

# The horizontal coordinate equals 36*lambda, so distances between thresholds
# preserve the actual scale of lambda rather than using equally spaced labels.
x1 = 36 * Fraction(1, 9)
x2 = 36 * Fraction(4, 27)
x3 = 36 * Fraction(4, 21)
x4 = 36 * Fraction(2, 9)


def dec(x: Fraction) -> str:
    return f"{float(x):.6f}"


# Each logical region is drawn on its own row. Open/filled endpoint markers and
# explicit interval notation make boundary membership unambiguous while the
# x-coordinates retain the true relative spacing of the lambda thresholds.
labels = [
    r"$(1/9,4/27)$: symmetric $S$ fails",
    r"$[4/27,4/21)$: coexistence, $CS_E<CS_S$",
    r"$\{4/21\}$: coexistence, $CS_E=CS_S$",
    r"$(4/21,2/9)$: coexistence, $CS_E>CS_S$",
]

fig_lines = [
    r"\begin{tikzpicture}[x=1.25cm,y=1cm]",
    rf"\draw[->] ({dec(x1-Fraction(1,3))},0) -- ({dec(x4+Fraction(1,3))},0) node[right] {{$\lambda$}};",
    rf"\draw ({dec(x1)},0.08) -- ({dec(x1)},-0.08) node[below] {{$1/9$}};",
    rf"\draw ({dec(x2)},0.08) -- ({dec(x2)},-0.08) node[below] {{$4/27$}};",
    rf"\draw ({dec(x3)},0.08) -- ({dec(x3)},-0.08) node[below] {{$4/21$}};",
    rf"\draw ({dec(x4)},0.08) -- ({dec(x4)},-0.08) node[below] {{$2/9$}};",
    rf"\draw[line width=0.7pt] ({dec(x1)},0.55) -- ({dec(x2)},0.55);",
    rf"\draw[fill=white,line width=0.7pt] ({dec(x1)},0.55) circle (1.4pt);",
    rf"\draw[fill=white,line width=0.7pt] ({dec(x2)},0.55) circle (1.4pt);",
    rf"\node[align=center,font=\tiny] at ({dec((x1+x2)/2)},0.91) {{{labels[0]}}};",
    rf"\draw[line width=0.7pt] ({dec(x2)},1.25) -- ({dec(x3)},1.25);",
    rf"\fill ({dec(x2)},1.25) circle (1.4pt);",
    rf"\draw[fill=white,line width=0.7pt] ({dec(x3)},1.25) circle (1.4pt);",
    rf"\node[align=center,font=\tiny] at ({dec((x2+x3)/2)},1.61) {{{labels[1]}}};",
    rf"\fill ({dec(x3)},1.95) circle (1.4pt);",
    rf"\node[align=center,font=\tiny] at ({dec(x3)},2.27) {{{labels[2]}}};",
    rf"\draw[line width=0.7pt] ({dec(x3)},2.65) -- ({dec(x4)},2.65);",
    rf"\draw[fill=white,line width=0.7pt] ({dec(x3)},2.65) circle (1.4pt);",
    rf"\draw[fill=white,line width=0.7pt] ({dec(x4)},2.65) circle (1.4pt);",
    rf"\node[align=center,font=\tiny] at ({dec((x3+x4)/2)},3.01) {{{labels[3]}}};",
    r"\end{tikzpicture}",
]
FIGURE.write_text("\n".join(fig_lines) + "\n", encoding="utf-8")

print(f"generated {TABLE}")
print(f"generated {CSV}")
print(f"generated {FIGURE}")
