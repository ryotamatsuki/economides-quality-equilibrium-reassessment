# Stage 4A — scoped complete pure-quality NE adversarial certificate (2026-11-17)

**Scope:** NEW claim P4 only, Economides (1989) original fixed-endpoint quality-then-price subgame. This does not revise the historical 2026-09-10 v1 certificate on main. Verification actors **AI / COMPUTATION / FORMAL**, never AUTHOR or EXTERNAL HUMAN. Independent *analytical case derivation and exact-rational adversarial program* are separate from the encoded Lean proof, but not a blinded external review.

## Claim and assumptions

Fixed locations (0,1), fully covered uniform population density μ>0, linear location disutility, a_i∈[0,∞), p_i≥0, quadratic sunk quality cost c a_i²/2 and λ=c/μ in (1/9,2/9). Price stage is solved at each quality pair by the **already-certified analytic three-branch continuation**. Let A=1/(3λ), B=1/λ. The entire pure quality Nash set is

- `{(B,0),(0,B)}` for 1/9<λ<4/27;
- `{(B,0),(0,B),(A,A)}` for 4/27≤λ<2/9.

At λ=4/27 symmetric is included; λ=1/9 and 2/9 are not inside this claim. **No location-endogenous, pure SPNE, mixed, or other-λ result is certified here.**

## Independent derivation / global challenge

From clipped demand `s1=max(0,min(1,(1+a-b-p1+p2)/2))` and the previously certified price correspondence, normalized quality profits for own a and rival b are:

```
v(a,b) = -λa²/2                         if a-b ≤ -3
       = [1+(a-b)/3]²/2 - λa²/2       if -3 ≤ a-b ≤ 3
       = a-b-1 - λa²/2                 if a-b ≥ 3.
```

Boundary formulas coincide exactly at ±3; alternative boundaries do not yield extra payoffs. Payoff on the **interior middle branch** has curvature 1/9−λ<0, but this local concavity does not establish a global optimum; the low/high branches must be checked separately.

1. **BR(0)={B}.** For rival quality zero and a≥0, the middle-branch derivative is `(3+(1−9λ)a)/9`, strictly positive on [0,3] because λ<2/9. Its maximum there is at a=3. On the a≥3 high branch, the unique maximizer is B>3. The high-branch value at B exceeds the value at a=3 by `(1−3λ)²/(2λ)>0`; thus B is the sole global best reply.
2. **BR(B)={0}.** Since B>3, choosing a=0 leaves the firm excluded and obtains zero. Any a∈(0,B−3] is excluded and pays positive quality cost, hence strictly loses. On the middle branch a≥B−3, marginal payoff starts strictly negative at the lower boundary, and curvature is strictly negative; profits are therefore strictly negative throughout that branch. The high branch starts at a=B+3, lies strictly to the right of its own unconstrained quadratic optimum B, and its boundary payoff coincides with the negative middle-branch boundary payoff. Hence all positive qualities strictly lose to zero.
3. **Symmetric candidate.** For rival A, low/excluded branch is infeasible at nonnegative own quality because A<3. The middle branch is strictly concave with unique optimum A. The high branch has feasible optimum B because B−A=2/(3λ)>3. The exact gain from B over A is `(4−27λ)/(18λ)`. Thus BR(A) contains A iff λ≥4/27, with a tie {A,B} at equality.
4. **No additional NE.** If both firms choose positive quality and one sells zero output (including a branch boundary), the excluded firm can reduce own quality to zero, remain excluded, and strictly lower sunk cost; contradiction. Therefore both positive quality actions must have strictly positive sales and be inside the smooth price-sharing region. Their interior FOCs are `(9λ−1)a1+a2=3` and `a1+(9λ−1)a2=3`. Subtract: `(9λ−2)(a1−a2)=0`. As λ<2/9, a1=a2=A. Cases with zero quality are exhausted by BR(0) and BR(B); no other pure NE remain.

## Exact automated attacks, not substituted for proof

- Standalone Python script `verification/short_note_independent_audit.py`: checks continuity, derivative and global-deviation identity by SymPy; computes finite global-BR candidates in all three domains without assuming interiority; checks six exact rational λ values and 294 opponent-grid rational cases including the equality threshold. Local execution 2026-11-17: **PASS**. Tests are not a universal proof.
- Lean source `ShortNoteFormal.lean` at commit `7427264fa83280256f188045670d171ae0667d69`: theorem `complete_pure_quality_NE` is a formal iff over **all nonnegative normalized quality deviations**, based on the stated piecewise reduced payoff; supporting `br_zero_iff`, `br_one_iff`, `br_symmetric_iff`, `interior_foc`. `#print axioms` uses standard Lean dependencies only. Workflow `lean-formal-verification` run 44004302052: SUCCESS, exactly that SHA.
- Existing original Stage4A: `theorem_certificates/STAGE4A_CERTIFICATE.md`, covers primitive price continuation and prior P2/P3, explicitly **not** complete quality correspondence; not falsely relabeled as having done so.

## Scope limitations and independent-review provenance

The exact short-note formal iff proves the **encoded reduced quality game**, not derivation of primitive covered demand, downstream complete price equilibrium, or the entire three-stage game. The primitive→piecewise bridge relies on analytic, historical Stage4A evidence. This adversarial analysis is an AI-produced separate argument and independent SymPy code path, **not external peer review or independent AUTHOR reasoning**.

**Scoped Stage4A verdict: `GO — MATHEMATICAL ADVERSARIAL CERTIFICATION PASS (P4 ONLY)`**, within the restricted reduced game and the already certified primitive continuation. No Stage8 authorization is implied; separate Stage7.5A, novelty, and AUTHOR accountability remain required.
