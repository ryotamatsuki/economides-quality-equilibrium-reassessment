# Stage 10A — MANUSCRIPT_BLUEPRINT

Created: 2026-11-17 JST. Status: **PROVISIONAL / AWAITING STAGE 8 + STAGE 9**. No writing authorization or theory freeze is implied. Sources: verified selected E1/E2/E3, role map; local refreeze candidate dated 2026-11-17; verified Lean branch SHA `7427264fa83280256f188045670d171ae0667d69`.

## 0. Research contract

Provisional title: **Quality Differentiation and Market Exclusion: A Note on Economides (1989)**.
Article type: theoretical correction / research note; venue not selected; page budget 6–8 pages as soft editorial diagnostic, subject to actual author and journal requirements.
Original question: *At endpoint locations (0,1), what is the complete set of pure-strategy quality equilibria of Economides's covered linear Hotelling quality–price subgame after price continuation is solved globally?*
Distinct result: for 1/9<λ<2/9 there are always **two asymmetric market-exclusion pure NE**, while the original symmetric candidate is an additional NE iff λ≥4/27. Thus below cutoff it is **symmetric equilibrium** that is absent, not pure quality equilibrium altogether.
Claim scope: original model primitives, fixed endpoint locations, pure strategies and quality-game continuation. **No full three-stage SPNE / endogenous-location solution / mixed equilibrium / welfare or policy claim**. No novelty priority assertion. Close Bunte/Sorenson and earlier internal PR #10 comparison independently before publication.

## 1. Reading order and reader-arrival budget

| Ordered unit | Function and source-move | Target arrival / body vs appendix |
|---|---|---|
| Title/abstract | Single corrected theorem, sharp domain and scope; E1 concise correction | Abstract 100–130 words (soft); avoid welfare and full-SPNE claims |
| §1 Introduction | Name Economides (1989) source result and significance → omitted finite quality deviation → two vs three pure NE → novelty caveat/scope; E1 p.55/E3 p.2871 | Research question, main finding, and what remains unresolved in first 2 paragraphs; ~0.75–1 page |
| §2 Model | Uniform covered consumers, payoff/quality cost, location fixed endpoints, strategy sets and timing, equilibrium target; E2 p.1145/E3 p.2872 | Entire core model before first displayed theorem; ~0.75–1 page |
| §3 Price continuation | Domain-dependent price NE (three branches) and induced quality payoffs; E2 pp.1145–1147 | Show all 3 branches and 1 bridge payoff display; ~0.75–1 page |
| §4 Complete quality-equilibrium characterization | State complete iff theorem, then branch mechanism; show globally profitable deviation and necessity/sufficiency skeleton (E1+E2) | Headline theorem early in section; ~1.5–2.25 pages; full routine case checks in appendix |
| §5 Discussion & conclusion | What endpoint horizontal differentiation does *not* ensure about positive sales; strict scope and no priority claims (E1 p.56/E2 p.1149/E3 p.2874) | ~0.5 page |
| Proof appendix / formal transparency | Full price equilibrium derivation if body tight; complete BR corner/FOC proof; normalization-to-Lean bridge; relevant exact certificate | One compact appendix and a reproduction pointer; no raw Lean code in body |
| References/transparency | Accurate prior-correction credit, AI provenance under actual journal requirements | Late; no invented literature priority |

Avoid old full-paper sequence (welfare/robustness/interpretation/related-literature as separate long sections) and long equation-rich introduction.

## 2. Primitives and mandatory bridge equations

Two firms fixed ℓ1=0, ℓ2=1; z∈[0,1], density μ>0; utility u_i(z)=k+a_i−p_i−|z−ℓ_i|; every consumer buys one unit, no outside option, nonnegative prices and **unbounded nonnegative** qualities; zero marginal cost; quality cost c a_i²/2; λ=c/μ∈(1/9,2/9). Qualities chosen simultaneously, prices chosen simultaneously after both qualities observed. Pure price continuation for every quality pair. δ=a1−a2. Define quality-game NE using **global best responses**.

**BRIDGE 1 — actual clipped demand**:
s1(p1,p2,δ)=max{0,min{1,[1+δ−p1+p2]/2}}, s2=1−s1, firm i normalized price revenue p_i s_i.

**BRIDGE 2 — global price continuation**:
(p1*,p2*)=(0,−δ−1) for δ≤−3;
(1+δ/3,1−δ/3) for |δ|≤3;
(δ−1,0) for δ≥3.
Show how best responses compare full capture and interior; do not extrapolate interior FOCs over all δ.

**BRIDGE 3 — the reduced quality payoff** for own a, rival b:
v(a,b)=−λa²/2 if a−b≤−3;
v(a,b)=[1+(a−b)/3]²/2−λa²/2 if |a−b|≤3;
v(a,b)=a−b−1−λa²/2 if a−b≥3.
Define A=1/(3λ), B=1/λ.

**BRIDGE 4 — the corrected exact theorem**:
NE(λ)={(B,0),(0,B)} for 1/9<λ<4/27;
NE(λ)={(B,0),(0,B),(A,A)} for 4/27≤λ<2/9.
At λ=4/27 symmetric equilibrium survives (weak best response). Both original interval endpoints excluded.

**BRIDGE 5 — global-deviation gain**:
v(B,A)−v(A,A)=(4−27λ)/(18λ);
the finite increase in quality crosses |δ|=3 when λ<2/9, and is profitable exactly below 4/27. At λ≥4/27 local max A is globally defensible against entire nonnegative quality domain.

**BRIDGE 6 — exhaustive necessity**:
(a) If a firm is excluded at positive quality, lowering it to zero while remaining excluded strictly saves fixed cost, so no equilibrium with both qualities positive can have exclusion.
(b) Positive qualities + positive shares => interior FOCs (9λ−1)a1+a2=3 and a1+(9λ−1)a2=3; subtracting gives (9λ−2)(a1−a2)=0. On open domain => symmetric candidate (A,A).
(c) The corner cases are fixed by BR(0)={B} and BR(B)={0}. These conditions exclude any additional asymmetric equilibria. BR(A) includes B at cutoff but cannot produce additional profile because BR(B)={0}.
All domains, boundary/corner cases and global comparisons must be visible or cross-referenced. No unsupported statement of uniqueness.

**BRIDGE 7 — formal proof mapping**:
x=λa, y=λb (bijective on a,b≥0 for λ>0); F(x,y)=18λ² v(x/λ,y/λ), scaling positive. Lean `complete_pure_quality_NE` states the iff using normalized (x,y) over arbitrary nonnegative deviations. This checks the *reduced payoff game* P02–P04, not the original continuous-consumer price derivation P01 or full three-stage game.

## 3. Headline proof path / necessary versus sufficient

Price lemma: global price BR on clipped shares, not just smooth interior price FOCs. Treat δ≤−3, |δ|≤3 and δ≥3 separately; capture-vs-interior exact-square checks and zero-price rival best response. Threshold boundaries coincide; no unstated off-path price equilibrium extrapolation.

Quality theorem, sufficiency: BR(0)=B, BR(B)=0 for all original interval values; against symmetric A compare the strictly concave within-market branch max A to feasible capture-branch max B; gain sign gives cutoff including equality. Necessity: excluded positive quality loses to own zero; remaining strictly market-sharing positive profiles satisfy the two FOCs; derive symmetry since λ<2/9; zero-quality profiles reduce to established corner BRs. A proof should not rely on Lean source to explain the necessity path.

**Human-readable derivations** remain mandatory. Place compact theorem statement and decisive bridge equations in body; lengthy branch-polynomial inequalities in Appendix A. No original game expansion and no numerical tests substituted for exact proof.

## 4. Intuition and novelty boundaries

Immediately after theorem in plain language: initially firms split the market and marginal quality investment changes prices/market shares; sufficiently large quality investment makes rival's optimal sales zero. The marginal private return to quality rises at this switch while fixed quality cost rises smoothly. Low λ favors the finite jump to exclusion; higher λ permits symmetry, but it **does not eliminate** the two exclusion equilibria. This is the difference between a **local candidate** and a **global NE classification**, not a welfare ranking or location equilibrium theorem.

Credit the earlier stability critiques (Bunte 1995/1997; Sorenson 1995, reading-depth limitations) without first-to-discover language. Distinguish internal prior PR #10 theorem work from the new Lean certification, and do not double publish the exact same scientific claim. Stage-6 literature scope remains unresolved, Stage-8 author contribution not signed.

## 5. Exhibits / code

**Default: no figures or tables in the body**; display the piecewise price continuation and complete quality NE theorem as equations (proof-critical and more readable than decorative graphics). The E2 payoff-shape plot suggests an optional figure *only if Stage 10B cold reader cannot understand the global branch change*. If generated, one deterministic category chart: x=λ in (1/9,2/9), y=existence of profile (two exclusion branches versus surviving symmetric branch), cutoff λ=4/27 filled, domain boundaries open. Do **not** show endogenous market shares, mixed probabilities, unproved welfare or infeasible endpoints. Code-generated exact data and regression tests mandatory for quantitative exhibits. E3's supplement demonstrates that an appendix figure can carry secondary visualization without crowding the note.

## 6. Cold-reader contract and editorial adversary

From two opening paragraphs a specialist must paraphrase (1) exact original conclusion, (2) the overlooked upstream quality deviation and downstream regime switch, (3) existence of two asymmetric quality equilibria everywhere in the reported interval, (4) symmetric equilibrium iff λ≥4/27, and (5) fixed-endpoint *not full-game* scope. From §2 identify all restrictions and strategy sets. From §4 reconstruct **why** there cannot be other pure equilibria without opening Lean. A communication-only desk-rejection attack will look for confusion between 'symmetric equilibrium does not exist' and 'no pure equilibrium exists', or between 'fixed-location game' and 'full SPNE'; a material ambiguity blocks Stage 11 GO.

## 7. Governance and entry conditions

Stage 10A benchmark preparation: complete selected-source coverage, role-selection comparison and coherence map, with a fully traceable blueprint. However Stage 8 candidate refreeze is **not formally approved**, Stage 9 has only preflight status (not certified GO), and author proof contribution/overlap checks remain pending. Therefore **no canonical Stage-10A GO or Stage-10B authorization** at this moment. After upstream Stage 8/9 entry is actually green, revalidate source access, claim/freeze alignment and reviewer/author constraints; then formally sign the Stage-10A gate before drafting. This blueprint is a preparatory design and cannot override any freeze.
