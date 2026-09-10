import Mathlib

namespace Economides

/-!
# Economides (1989) reassessment — proof-critical formal core

This file formalizes the algebraic and order-theoretic core used by the frozen
maximal-location correction.  It deliberately does **not** derive the continuum
demand system, prove that the encoded piecewise price continuation is the Nash
price correspondence, formalize the complete three-stage game, or formalize the
modern pure-SPNE nonexistence observation.  Those economic/globality objects are
certified analytically and independently at Stage 4A.

The formal object below starts from the certified reduced endpoint payoff:
low-quality exclusion, shared-market pricing, and high-quality exclusion.  Lean
then checks the threshold algebra, the global quality-deviation inequalities,
the two asymmetric best-response inequalities over all nonnegative qualities,
and the welfare/consumer-surplus identities.
-/

/-- Reported symmetric quality at maximal locations. -/
noncomputable def symQuality (λ : ℝ) : ℝ := 1 / (3 * λ)

/-- Quality selected by the high-quality firm in the certified exclusion equilibrium. -/
noncomputable def exclusionQuality (λ : ℝ) : ℝ := 1 / λ

/-- Reduced profit on the shared-market endpoint-price branch. -/
noncomputable def regularProfit (λ rival a : ℝ) : ℝ :=
  (1 / 2) * (1 + (a - rival) / 3)^2 - λ * a^2 / 2

/-- Reduced profit when the firm is excluded by the rival. -/
noncomputable def lowExclusionProfit (λ a : ℝ) : ℝ :=
  - λ * a^2 / 2

/-- Reduced profit when the firm excludes its rival. -/
noncomputable def highExclusionProfit (λ rival a : ℝ) : ℝ :=
  a - rival - 1 - λ * a^2 / 2

/-- Complete reduced endpoint quality payoff induced by the certified price continuation. -/
noncomputable def reducedQualityPayoff (λ rival a : ℝ) : ℝ :=
  if a - rival ≤ -3 then
    lowExclusionProfit λ a
  else if a - rival ≤ 3 then
    regularProfit λ rival a
  else
    highExclusionProfit λ rival a

/-! ## Exact quality-gap and candidate/deviation algebra -/

theorem quality_gap_identity (λ : ℝ) (hλ : λ ≠ 0) :
    exclusionQuality λ - symQuality λ = 2 / (3 * λ) := by
  simp [exclusionQuality, symQuality]
  field_simp [hλ]
  ring

/-- On the original theorem interval the exclusionary action crosses the `+3` price-regime boundary. -/
theorem quality_gap_gt_three (λ : ℝ)
    (hλ : 0 < λ) (hupper : λ < 2 / 9) :
    3 < exclusionQuality λ - symQuality λ := by
  rw [quality_gap_identity λ (ne_of_gt hλ)]
  have hden : 0 < 3 * λ := by positivity
  apply (lt_div_iff₀ hden).2
  nlinarith

/-- The reported quality is below `3` whenever `λ>1/9`; hence a nonnegative deviation cannot enter the low-quality exclusion branch against it. -/
theorem sym_quality_lt_three (λ : ℝ)
    (hlower : 1 / 9 < λ) :
    symQuality λ < 3 := by
  have hλ : 0 < λ := by nlinarith
  simp [symQuality]
  have hden : 0 < 3 * λ := by positivity
  apply (div_lt_iff₀ hden).2
  nlinarith

/-- Closed form of the reported symmetric candidate's reduced profit. -/
theorem candidate_profit_closed (λ : ℝ) (hλ : λ ≠ 0) :
    regularProfit λ (symQuality λ) (symQuality λ) =
      1 / 2 - 1 / (18 * λ) := by
  simp [regularProfit, symQuality]
  field_simp [hλ]
  ring

/-- Closed form of the exclusionary finite deviation's reduced profit. -/
theorem exclusion_deviation_profit_closed (λ : ℝ) (hλ : λ ≠ 0) :
    highExclusionProfit λ (symQuality λ) (exclusionQuality λ) =
      1 / (6 * λ) - 1 := by
  simp [highExclusionProfit, symQuality, exclusionQuality]
  field_simp [hλ]
  ring

/-- Exact `4/27` gain identity. -/
theorem p2_deviation_gain_identity (λ : ℝ) (hλ : λ ≠ 0) :
    highExclusionProfit λ (symQuality λ) (exclusionQuality λ) -
      regularProfit λ (symQuality λ) (symQuality λ) =
      (4 - 27 * λ) / (18 * λ) := by
  rw [candidate_profit_closed λ hλ, exclusion_deviation_profit_closed λ hλ]
  field_simp [hλ]
  ring

/-- Below `4/27` the finite exclusionary deviation strictly beats the reported action. -/
theorem p2_profitable_below_four_over_twenty_seven (λ : ℝ)
    (hλ : 0 < λ) (hthreshold : λ < 4 / 27) :
    regularProfit λ (symQuality λ) (symQuality λ) <
      highExclusionProfit λ (symQuality λ) (exclusionQuality λ) := by
  have hgain := p2_deviation_gain_identity λ (ne_of_gt hλ)
  have hden : 0 < 18 * λ := by positivity
  have hfrac : 0 < (4 - 27 * λ) / (18 * λ) := by
    apply div_pos
    · nlinarith
    · exact hden
  nlinarith

/-- At the knife edge `λ=4/27` the reported and exclusionary actions tie. -/
theorem p2_knife_edge :
    regularProfit (4 / 27) (symQuality (4 / 27)) (symQuality (4 / 27)) =
      highExclusionProfit (4 / 27) (symQuality (4 / 27)) (exclusionQuality (4 / 27)) := by
  have hne : (4 / 27 : ℝ) ≠ 0 := by norm_num
  have hgain := p2_deviation_gain_identity (4 / 27) hne
  norm_num at hgain ⊢
  linarith

/-! ## Global bounds behind Proposition P2 -/

/-- Exact regular-branch loss relative to the reported action. -/
theorem regular_gap_identity (λ a : ℝ) (hλ : λ ≠ 0) :
    regularProfit λ (symQuality λ) (symQuality λ) -
      regularProfit λ (symQuality λ) a =
      (9 * λ - 1) * (3 * a * λ - 1)^2 / (162 * λ^2) := by
  simp [regularProfit, symQuality]
  field_simp [hλ]
  ring

/-- For `λ>1/9`, no action evaluated on the regular branch beats the reported action. -/
theorem regular_branch_no_gain (λ a : ℝ)
    (hlower : 1 / 9 < λ) :
    regularProfit λ (symQuality λ) a ≤
      regularProfit λ (symQuality λ) (symQuality λ) := by
  have hλ : 0 < λ := by nlinarith
  have hgap := regular_gap_identity λ a (ne_of_gt hλ)
  have hnum : 0 ≤ (9 * λ - 1) * (3 * a * λ - 1)^2 := by
    exact mul_nonneg (by nlinarith) (sq_nonneg _)
  have hden : 0 ≤ 162 * λ^2 := by positivity
  have hfrac : 0 ≤ (9 * λ - 1) * (3 * a * λ - 1)^2 / (162 * λ^2) :=
    div_nonneg hnum hden
  nlinarith

/-- The exclusionary branch is globally maximized at `1/λ`. -/
theorem high_exclusion_gap_identity (λ rival a : ℝ) (hλ : λ ≠ 0) :
    highExclusionProfit λ rival (exclusionQuality λ) -
      highExclusionProfit λ rival a =
      (a * λ - 1)^2 / (2 * λ) := by
  simp [highExclusionProfit, exclusionQuality]
  field_simp [hλ]
  ring

/-- For positive `λ`, no high-exclusion action beats `1/λ`. -/
theorem high_exclusion_no_gain (λ rival a : ℝ)
    (hλ : 0 < λ) :
    highExclusionProfit λ rival a ≤
      highExclusionProfit λ rival (exclusionQuality λ) := by
  have hgap := high_exclusion_gap_identity λ rival a (ne_of_gt hλ)
  have hfrac : 0 ≤ (a * λ - 1)^2 / (2 * λ) := by positivity
  nlinarith

/-- At and above `4/27`, the best high-exclusion deviation does not beat the reported action. -/
theorem best_exclusion_no_gain_above_threshold (λ : ℝ)
    (hλ : 0 < λ) (hthreshold : 4 / 27 ≤ λ) :
    highExclusionProfit λ (symQuality λ) (exclusionQuality λ) ≤
      regularProfit λ (symQuality λ) (symQuality λ) := by
  have hgain := p2_deviation_gain_identity λ (ne_of_gt hλ)
  have hden : 0 < 18 * λ := by positivity
  have hfrac : (4 - 27 * λ) / (18 * λ) ≤ 0 := by
    apply (div_le_iff₀ hden).2
    nlinarith
  nlinarith

/-- The reduced endpoint payoff at the reported action is its regular-branch profit. -/
theorem reduced_payoff_at_sym (λ : ℝ) :
    reducedQualityPayoff λ (symQuality λ) (symQuality λ) =
      regularProfit λ (symQuality λ) (symQuality λ) := by
  simp [reducedQualityPayoff]
  norm_num

/-- Within the coexistence region, the reported action is a global best response in the complete encoded reduced payoff. -/
theorem p2_global_best_response_core (λ a : ℝ)
    (hlower : 1 / 9 < λ)
    (hthreshold : 4 / 27 ≤ λ)
    (hupper : λ < 2 / 9)
    (ha : 0 ≤ a) :
    reducedQualityPayoff λ (symQuality λ) a ≤
      reducedQualityPayoff λ (symQuality λ) (symQuality λ) := by
  have hλ : 0 < λ := by nlinarith
  have hA3 : symQuality λ < 3 := sym_quality_lt_three λ hlower
  rw [reduced_payoff_at_sym]
  have hlow : ¬ a - symQuality λ ≤ -3 := by
    linarith
  by_cases hreg : a - symQuality λ ≤ 3
  · simp [reducedQualityPayoff, hlow, hreg]
    exact regular_branch_no_gain λ a hlower
  · have hhigh : 3 < a - symQuality λ := lt_of_not_ge hreg
    simp [reducedQualityPayoff, hlow, hreg]
    exact le_trans (high_exclusion_no_gain λ (symQuality λ) a hλ)
      (best_exclusion_no_gain_above_threshold λ hλ hthreshold)

/-- The strict sub-threshold deviation is also a strict improvement in the complete encoded reduced payoff. -/
theorem p2_reduced_payoff_failure_core (λ : ℝ)
    (hlower : 1 / 9 < λ)
    (hthreshold : λ < 4 / 27) :
    reducedQualityPayoff λ (symQuality λ) (symQuality λ) <
      reducedQualityPayoff λ (symQuality λ) (exclusionQuality λ) := by
  have hλ : 0 < λ := by nlinarith
  have hupper : λ < 2 / 9 := by nlinarith
  have hgap : 3 < exclusionQuality λ - symQuality λ :=
    quality_gap_gt_three λ hλ hupper
  rw [reduced_payoff_at_sym]
  have hlow : ¬ exclusionQuality λ - symQuality λ ≤ -3 := by linarith
  have hreg : ¬ exclusionQuality λ - symQuality λ ≤ 3 := not_le_of_gt hgap
  simp [reducedQualityPayoff, hlow, hreg]
  exact p2_profitable_below_four_over_twenty_seven λ hλ hthreshold

/-! ## Global best response to zero: `BR(0)` contains `1/λ` -/

/-- On `[0,3]`, the regular payoff against zero is maximized at the boundary `3` when `λ<2/9`. -/
theorem regular_zero_le_boundary (λ a : ℝ)
    (hlower : 1 / 9 < λ) (hupper : λ < 2 / 9)
    (ha0 : 0 ≤ a) (ha3 : a ≤ 3) :
    regularProfit λ 0 a ≤ regularProfit λ 0 3 := by
  have hcoef : 0 ≤ 9 * λ - 1 := by nlinarith
  have habound : a * (9 * λ - 1) ≤ 3 * (9 * λ - 1) :=
    mul_le_mul_of_nonneg_right ha3 hcoef
  have hsecond : 9 * a * λ - a + 27 * λ - 9 ≤ 0 := by
    nlinarith
  have hfirst : a - 3 ≤ 0 := by linarith
  have hprod : 0 ≤ (a - 3) * (9 * a * λ - a + 27 * λ - 9) :=
    mul_nonneg_of_nonpos_of_nonpos hfirst hsecond
  have hid :
      regularProfit λ 0 3 - regularProfit λ 0 a =
        (a - 3) * (9 * a * λ - a + 27 * λ - 9) / 18 := by
    simp [regularProfit]
    ring
  rw [hid]
  exact div_nonneg hprod (by norm_num)

/-- The optimal exclusion payoff against zero weakly exceeds the regular payoff at the regime boundary. -/
theorem exclusion_zero_ge_boundary (λ : ℝ)
    (hλ : 0 < λ) :
    regularProfit λ 0 3 ≤
      highExclusionProfit λ 0 (exclusionQuality λ) := by
  have hid :
      highExclusionProfit λ 0 (exclusionQuality λ) - regularProfit λ 0 3 =
        (3 * λ - 1)^2 / (2 * λ) := by
    simp [highExclusionProfit, exclusionQuality, regularProfit]
    field_simp [ne_of_gt hλ]
    ring
  have hnonneg : 0 ≤ (3 * λ - 1)^2 / (2 * λ) := by positivity
  nlinarith

/-- For every nonnegative quality, the complete reduced payoff against zero is maximized by `1/λ`. -/
theorem br_zero_global_core (λ a : ℝ)
    (hlower : 1 / 9 < λ) (hupper : λ < 2 / 9)
    (ha : 0 ≤ a) :
    reducedQualityPayoff λ 0 a ≤
      reducedQualityPayoff λ 0 (exclusionQuality λ) := by
  have hλ : 0 < λ := by nlinarith
  have hB3 : 3 < exclusionQuality λ := by
    have hgap := quality_gap_gt_three λ hλ hupper
    have hApos : 0 < symQuality λ := by
      simp [symQuality]
      positivity
    linarith
  have hB_low : ¬ exclusionQuality λ - 0 ≤ -3 := by linarith
  have hB_reg : ¬ exclusionQuality λ - 0 ≤ 3 := by linarith
  simp [reducedQualityPayoff, hB_low, hB_reg]
  have hlow : ¬ a - 0 ≤ -3 := by linarith
  by_cases hreg : a - 0 ≤ 3
  · simp [reducedQualityPayoff, hlow, hreg]
    exact le_trans (regular_zero_le_boundary λ a hlower hupper ha (by linarith))
      (exclusion_zero_ge_boundary λ hλ)
  · simp [reducedQualityPayoff, hlow, hreg]
    exact high_exclusion_no_gain λ 0 a hλ

/-! ## Global best response to `1/λ`: zero quality -/

/-- The left boundary of the regular branch against `1/λ` has the excluded payoff and is nonpositive. -/
theorem regular_high_rival_left_boundary_nonpos (λ : ℝ)
    (hλ : 0 < λ) :
    regularProfit λ (exclusionQuality λ) (exclusionQuality λ - 3) ≤ 0 := by
  have hid :
      regularProfit λ (exclusionQuality λ) (exclusionQuality λ - 3) =
        - λ * (exclusionQuality λ - 3)^2 / 2 := by
    simp [regularProfit]
    ring
  rw [hid]
  have hsquare : 0 ≤ (exclusionQuality λ - 3)^2 := sq_nonneg _
  nlinarith

/-- On the regular branch against `1/λ`, profit weakly decreases from the left regime boundary. -/
theorem regular_high_rival_no_gain_from_left (λ a : ℝ)
    (hlower : 1 / 9 < λ) (hupper : λ < 2 / 9)
    (ha : 0 ≤ a)
    (hleft : exclusionQuality λ - 3 ≤ a) :
    regularProfit λ (exclusionQuality λ) a ≤
      regularProfit λ (exclusionQuality λ) (exclusionQuality λ - 3) := by
  have hλ : 0 < λ := by nlinarith
  have hfactor1 : 0 ≤ a * λ + 3 * λ - 1 := by
    have hmul := mul_le_mul_of_nonneg_right hleft (le_of_lt hλ)
    have hBid : exclusionQuality λ * λ = 1 := by
      simp [exclusionQuality, ne_of_gt hλ]
    nlinarith
  have hfactor2a : 0 ≤ a * λ * (9 * λ - 1) := by
    have haλ : 0 ≤ a * λ := mul_nonneg ha (le_of_lt hλ)
    have hcoef : 0 ≤ 9 * λ - 1 := by nlinarith
    exact mul_nonneg haλ hcoef
  have hfactor2b : 0 ≤ (1 - 3 * λ) * (9 * λ + 1) := by
    have h1 : 0 ≤ 1 - 3 * λ := by nlinarith
    have h2 : 0 ≤ 9 * λ + 1 := by nlinarith
    exact mul_nonneg h1 h2
  have hfactor2 : 0 ≤ 9 * a * λ^2 - a * λ - 27 * λ^2 + 6 * λ + 1 := by
    nlinarith
  have hprod : 0 ≤
      (a * λ + 3 * λ - 1) *
        (9 * a * λ^2 - a * λ - 27 * λ^2 + 6 * λ + 1) :=
    mul_nonneg hfactor1 hfactor2
  have hid :
      regularProfit λ (exclusionQuality λ) a -
        regularProfit λ (exclusionQuality λ) (exclusionQuality λ - 3) =
        - ((a * λ + 3 * λ - 1) *
          (9 * a * λ^2 - a * λ - 27 * λ^2 + 6 * λ + 1)) /
          (18 * λ^2) := by
    simp [regularProfit, exclusionQuality]
    field_simp [ne_of_gt hλ]
    ring
  have hden : 0 < 18 * λ^2 := by positivity
  have hnonpos :
      - ((a * λ + 3 * λ - 1) *
        (9 * a * λ^2 - a * λ - 27 * λ^2 + 6 * λ + 1)) /
        (18 * λ^2) ≤ 0 := by
    apply (div_le_iff₀ hden).2
    nlinarith
  nlinarith [hid]

/-- The high-exclusion branch against `1/λ` is negative from its entry boundary onward. -/
theorem high_high_rival_nonpos (λ a : ℝ)
    (hλ : 0 < λ)
    (hright : exclusionQuality λ + 3 ≤ a) :
    highExclusionProfit λ (exclusionQuality λ) a ≤ 0 := by
  let B := exclusionQuality λ
  have hfirst : 0 ≤ a * λ - 3 * λ - 1 := by
    have hmul := mul_le_mul_of_nonneg_right hright (le_of_lt hλ)
    have hBid : B * λ = 1 := by
      dsimp [B]
      simp [exclusionQuality, ne_of_gt hλ]
    nlinarith
  have hsecond : 0 ≤ a * λ + 3 * λ - 1 := by
    nlinarith
  have hprod : 0 ≤ (a * λ - 3 * λ - 1) * (a * λ + 3 * λ - 1) :=
    mul_nonneg hfirst hsecond
  have hgap :
      highExclusionProfit λ B (B + 3) - highExclusionProfit λ B a =
        (a * λ - 3 * λ - 1) * (a * λ + 3 * λ - 1) / (2 * λ) := by
    dsimp [B]
    simp [highExclusionProfit, exclusionQuality]
    field_simp [ne_of_gt hλ]
    ring
  have hgap_nonneg : 0 ≤
      (a * λ - 3 * λ - 1) * (a * λ + 3 * λ - 1) / (2 * λ) := by
    exact div_nonneg hprod (by positivity)
  have hboundary : highExclusionProfit λ B (B + 3) < 0 := by
    have hid : highExclusionProfit λ B (B + 3) =
        - (9 * λ^2 + 2 * λ + 1) / (2 * λ) := by
      dsimp [B]
      simp [highExclusionProfit, exclusionQuality]
      field_simp [ne_of_gt hλ]
      ring
    rw [hid]
    have hnum : 0 < 9 * λ^2 + 2 * λ + 1 := by positivity
    have hden : 0 < 2 * λ := by positivity
    have hfrac : 0 < (9 * λ^2 + 2 * λ + 1) / (2 * λ) := div_pos hnum hden
    linarith
  nlinarith [hgap]

/-- Against the high-quality action `1/λ`, every nonnegative quality yields weakly nonpositive reduced payoff. -/
theorem br_high_global_core (λ a : ℝ)
    (hlower : 1 / 9 < λ) (hupper : λ < 2 / 9)
    (ha : 0 ≤ a) :
    reducedQualityPayoff λ (exclusionQuality λ) a ≤ 0 := by
  have hλ : 0 < λ := by nlinarith
  by_cases hlow : a - exclusionQuality λ ≤ -3
  · simp [reducedQualityPayoff, hlow, lowExclusionProfit]
    have hsquare : 0 ≤ a^2 := sq_nonneg a
    nlinarith
  · have hleft : exclusionQuality λ - 3 < a := by linarith
    by_cases hreg : a - exclusionQuality λ ≤ 3
    · simp [reducedQualityPayoff, hlow, hreg]
      exact le_trans
        (regular_high_rival_no_gain_from_left λ a hlower hupper ha (le_of_lt hleft))
        (regular_high_rival_left_boundary_nonpos λ hλ)
    · have hright : exclusionQuality λ + 3 < a := by linarith
      simp [reducedQualityPayoff, hlow, hreg]
      exact high_high_rival_nonpos λ a hλ (le_of_lt hright)

/-- Zero quality earns exactly zero against `1/λ` on the low-quality exclusion branch. -/
theorem reduced_payoff_zero_against_high (λ : ℝ)
    (hλ : 0 < λ) (hupper : λ < 2 / 9) :
    reducedQualityPayoff λ (exclusionQuality λ) 0 = 0 := by
  have hB3 : 3 < exclusionQuality λ := by
    have hgap := quality_gap_gt_three λ hλ hupper
    have hApos : 0 < symQuality λ := by
      simp [symQuality]
      positivity
    linarith
  have hlow : 0 - exclusionQuality λ ≤ -3 := by linarith
  simp [reducedQualityPayoff, hlow, lowExclusionProfit]

/-- Formal best-response core for the asymmetric exclusion equilibrium. -/
theorem asymmetric_best_response_core (λ a : ℝ)
    (hlower : 1 / 9 < λ) (hupper : λ < 2 / 9)
    (ha : 0 ≤ a) :
    reducedQualityPayoff λ 0 a ≤
        reducedQualityPayoff λ 0 (exclusionQuality λ) ∧
      reducedQualityPayoff λ (exclusionQuality λ) a ≤
        reducedQualityPayoff λ (exclusionQuality λ) 0 := by
  constructor
  · exact br_zero_global_core λ a hlower hupper ha
  · rw [reduced_payoff_zero_against_high λ (by nlinarith) hupper]
    exact br_high_global_core λ a hlower hupper ha

/-! ## Price-branch boundary consistency -/

noncomputable def regularPrice1 (δ : ℝ) : ℝ := 1 + δ / 3
noncomputable def regularPrice2 (δ : ℝ) : ℝ := 1 - δ / 3
noncomputable def highExclusionPrice1 (δ : ℝ) : ℝ := δ - 1
noncomputable def lowExclusionPrice2 (δ : ℝ) : ℝ := -δ - 1

theorem price_branches_match_at_plus_three :
    regularPrice1 3 = highExclusionPrice1 3 ∧ regularPrice2 3 = 0 := by
  constructor <;> norm_num [regularPrice1, regularPrice2, highExclusionPrice1]

theorem price_branches_match_at_minus_three :
    regularPrice1 (-3) = 0 ∧ regularPrice2 (-3) = lowExclusionPrice2 (-3) := by
  constructor <;> norm_num [regularPrice1, regularPrice2, lowExclusionPrice2]

/-! ## Welfare / consumer-surplus proof-critical algebra -/

noncomputable def welfareSym (λ k : ℝ) : ℝ := k - 1 / 4 + 2 / (9 * λ)
noncomputable def welfareExclusion (λ k : ℝ) : ℝ := k - 1 / 2 + 1 / (2 * λ)
noncomputable def consumerSurplusSym (λ k : ℝ) : ℝ := k + 1 / (3 * λ) - 5 / 4
noncomputable def consumerSurplusExclusion (k : ℝ) : ℝ := k + 1 / 2
noncomputable def producerSurplusSym (λ : ℝ) : ℝ := 1 - 1 / (9 * λ)
noncomputable def producerSurplusExclusion (λ : ℝ) : ℝ := 1 / (2 * λ) - 1

theorem welfare_gap_identity (λ k : ℝ) (hλ : λ ≠ 0) :
    welfareExclusion λ k - welfareSym λ k = (10 - 9 * λ) / (36 * λ) := by
  simp [welfareExclusion, welfareSym]
  field_simp [hλ]
  ring

theorem cs_gap_identity (λ k : ℝ) (hλ : λ ≠ 0) :
    consumerSurplusExclusion k - consumerSurplusSym λ k =
      (21 * λ - 4) / (12 * λ) := by
  simp [consumerSurplusExclusion, consumerSurplusSym]
  field_simp [hλ]
  ring

theorem ps_gap_identity (λ : ℝ) (hλ : λ ≠ 0) :
    producerSurplusExclusion λ - producerSurplusSym λ =
      (11 - 36 * λ) / (18 * λ) := by
  simp [producerSurplusExclusion, producerSurplusSym]
  field_simp [hλ]
  ring

theorem cs_equal_at_four_over_twenty_one (k : ℝ) :
    consumerSurplusExclusion k = consumerSurplusSym (4 / 21) k := by
  have hne : (4 / 21 : ℝ) ≠ 0 := by norm_num
  have hgap := cs_gap_identity (4 / 21) k hne
  norm_num at hgap ⊢
  linarith

theorem cs_lower_below_four_over_twenty_one (λ k : ℝ)
    (hλ : 0 < λ) (hthreshold : λ < 4 / 21) :
    consumerSurplusExclusion k < consumerSurplusSym λ k := by
  have hgap := cs_gap_identity λ k (ne_of_gt hλ)
  have hden : 0 < 12 * λ := by positivity
  have hfrac : (21 * λ - 4) / (12 * λ) < 0 := by
    apply (div_neg_iff).2
    exact Or.inl ⟨by nlinarith, hden⟩
  nlinarith

theorem cs_higher_above_four_over_twenty_one (λ k : ℝ)
    (hλ : 0 < λ) (hthreshold : 4 / 21 < λ) :
    consumerSurplusSym λ k < consumerSurplusExclusion k := by
  have hgap := cs_gap_identity λ k (ne_of_gt hλ)
  have hden : 0 < 12 * λ := by positivity
  have hfrac : 0 < (21 * λ - 4) / (12 * λ) := by
    exact div_pos (by nlinarith) hden
  nlinarith

/-- Exact frozen numerical counterexample at `λ=1/8`. -/
theorem exact_counterexample_one_eighth :
    regularProfit (1 / 8) (symQuality (1 / 8)) (symQuality (1 / 8)) = 1 / 18 ∧
    highExclusionProfit (1 / 8) (symQuality (1 / 8)) (exclusionQuality (1 / 8)) = 1 / 3 ∧
    highExclusionProfit (1 / 8) (symQuality (1 / 8)) (exclusionQuality (1 / 8)) -
      regularProfit (1 / 8) (symQuality (1 / 8)) (symQuality (1 / 8)) = 5 / 18 := by
  norm_num [regularProfit, highExclusionProfit, symQuality, exclusionQuality]

#print axioms p2_reduced_payoff_failure_core
#print axioms p2_global_best_response_core
#print axioms asymmetric_best_response_core
#print axioms welfare_gap_identity
#print axioms cs_equal_at_four_over_twenty_one

end Economides
