# Stage11 — Independent Mathematical & Reviewer-Verifiability Audit

Input: exact PR15 `paper/short_note/main.tex` at `cdad5fad4207d0284ca1c2c2c48fb87c7797c546`. Secondary analytic reference: Stage4A scoped P4 certificate. Reviewer path: reconstruct utility allocation and price-quality deviations without opening Lean or using the stored stage10a role-selection map as a proof.

## A. Source → theorem chain

1. **Consumers** §2 eq (utility): firm1 utility minus firm2 is `a1-a2-p1+p2+1-2z`. A consumer chooses firm1 iff `z <= (1+δ-p1+p2)/2`, giving §2 clipped demand eq (demand).
2. **Prices** §3 eq (prices), Appendix A: middle price equilibrium from both-price first-order equations; branches for δ outside ±3 use full market capture with zero weaker-firm price. Finite price deviations against middle candidate evaluated with exact square gaps, including boundary.
3. **Quality reduced payoff** §3 eq (payoff): `p_i*s_i - λ*a_i²/2` after global price continuation. Value continuous at δ=±3, slope not continuous. This avoids illegitimate interior FOC extrapolation.
4. **Corner conditions** §4 eq (cornerBR), Appendix B: global BR(0)={B} and BR(B)={0}. Two asymmetric pure quality NE exist.
5. **No other nonsymmetric profiles** §4 eq (FOC): a firm with positive quality and zero sales could reduce a to 0; for mutually selling profiles, positive qualities permit FOCs. Their difference is `(9λ-2)(a1-a2)=0`; λ<2/9 forces symmetry.
6. **Remaining symmetric candidate** §4 eq (gain): global capture-versus-sharing comparison `(4-27λ)/(18λ)` determines λ=4/27 threshold, inclusive for symmetric at tie. Combined with (4) and (5), this proves an iff NE list.
7. **Formal mapping** Appendix C: x=λa,y=λb and strictly positive factor `18λ²` preserve reduced-game best responses; full primitive price game not encoded; no inference about original location SPNE.

No proof-critical mathematics needs a source-code guess. **Analytic reviewer-verifiability: PASS for P4** in the declared original fixed-location payoff, without treating finite tests as a theorem.

## B. Adversarial cases (direct utility/payoff tests)

| Test | Input | Result |
|---|---|---|
| two-sided interior | δ=-2,0,2 | direct consumer shares (1/6,1/2,5/6) at proposed price candidates |
| weak firm fully excluded | δ=-6,-3,3,6 | demand clipping and price boundary yield market share 0 or 1 |
| alternative price search | 121 price candidates per player, δ=-6,-3,-2,0,2,3,6 | no profitable deviation above 0.0015 numerical tolerance |
| quality cost below cutoff | λ=1/8 | capture gain=5/18>0; symmetric not NE |
| exact coexistence cutoff | λ=4/27 | capture gain=0, symmetric and exclusion NE coexist |
| above cutoff | λ=1/6 | capture gain=-1/6<0; symmetric survives and exclusions persist |
| quality strategy cap attack | λ=1/6, a<=2 | B=6 infeasible; theorem not robust to quality caps (outside adopted model) |

Direct utility calculations use independently recomputed consumer preferences, not `ShortNoteFormal.lean`; they are coarse falsification scans and establish no universal property. The model-specific proof remains analytic Stage4A/Stage7.5A.

## C. Separate source-to-claim logic

Original Economides (1989) reported a three-stage result. The manuscript is strongest when the Intro explicitly spells out why an upstream candidate with locations fixed at endpoints must satisfy stage-2 optimality. A profitable quality deviation refutes *that proposed path*; a fixed-endpoint reduced-game NE is not itself a full-game SPNE. This is **one major editorial bridge**, not a mathematical contradiction in the P4 theorem. See EDITORIAL_REFEREE_REPORT.md.

## D. CI provenance and coverage

GitHub reproducibility Actions run 44018818159 at source SHA `cdad5fad4207d0284ca1c2c2c48fb87c7797c546`: **SUCCESS**. This includes pinned Lean build; symbolic and numerical checks; pytest (including Stage10B source structural tests); new provisional short-note LaTeX compilation; unresolved citations/references gate; and PDF artifact `stage10b-provisional-short-note-pdf`. A successful LaTeX build is not a visual/typographic referee reading; the PDF artifact itself was not visually inspected in this audit.

Review outcome: `PROOF RECONSTRUCTION PASS WITH ONE EDITORIAL SOURCE-BRIDGE REVISION`. No mathematical Stage4A regression detected; novelty risk remains unresolved.
