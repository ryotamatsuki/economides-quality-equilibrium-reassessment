import Mathlib

namespace Economides

/-!
# Economides (1989) reassessment — proof-critical formal core

This file formalizes the algebraic and order-theoretic core used by the frozen
maximal-location correction. It does not derive the continuum demand system,
prove that the encoded piecewise price continuation is the Nash price
correspondence, formalize the complete three-stage game, or formalize the modern
pure-SPNE nonexistence observation. Those economic/globality objects remain the
independently certified Stage-4A inputs.

The formal object below starts from the certified reduced endpoint payoff and
checks the threshold algebra, global quality-deviation inequalities, the two
asymmetric best-response inequalities over all nonnegative qualities, and the
welfare/consumer-surplus identities.
-/

noncomputable def symQuality (lam : ℝ) : ℝ := 1 / (3 * lam)
noncomputable def exclusionQuality (lam : ℝ) : ℝ := 1 / lam

noncomputable def regularProfit (lam rival a : ℝ) : ℝ :=
  (1 / 2) * (1 + (a - rival) / 3)^2 - lam * a^2 / 2

noncomputable def lowExclusionProfit (lam a : ℝ) : ℝ :=
  - lam * a^2 / 2

noncomputable def highExclusionProfit (lam rival a : ℝ) : ℝ :=
  a - rival - 1 - lam * a^2 / 2

/-- Complete reduced endpoint quality payoff induced by the certified price continuation. -/
noncomputable def reducedQualityPayoff (lam rival a : ℝ) : ℝ :=
  if a - rival ≤ -3 then
    lowExclusionProfit lam a
  else if a - rival ≤ 3 then
    regularProfit lam rival a
  else
    highExclusionProfit lam rival a

/-! ## P2: exact global-deviation threshold -/

theorem quality_gap_identity (lam : ℝ) (hlam : lam ≠ 0) :
    exclusionQuality lam - symQuality lam = 2 / (3 * lam) := by
  simp [exclusionQuality, symQuality]
  field_simp [hlam]
  ring

theorem quality_gap_gt_three (lam : ℝ)
    (hlam : 0 < lam) (hupper : lam < 2 / 9) :
    3 < exclusionQuality lam - symQuality lam := by
  rw [quality_gap_identity lam (ne_of_gt hlam)]
  have hden : 0 < 3 * lam := by positivity
  apply (lt_div_iff₀ hden).2
  nlinarith

theorem sym_quality_lt_three (lam : ℝ)
    (hlower : 1 / 9 < lam) :
    symQuality lam < 3 := by
  have hlam : 0 < lam := by nlinarith
  change 1 / (3 * lam) < 3
  have hden : 0 < 3 * lam := by positivity
  exact (div_lt_iff₀ hden).2 (by nlinarith)

theorem candidate_profit_closed (lam : ℝ) (hlam : lam ≠ 0) :
    regularProfit lam (symQuality lam) (symQuality lam) =
      1 / 2 - 1 / (18 * lam) := by
  simp [regularProfit, symQuality]
  field_simp [hlam]
  ring

theorem exclusion_deviation_profit_closed (lam : ℝ) (hlam : lam ≠ 0) :
    highExclusionProfit lam (symQuality lam) (exclusionQuality lam) =
      1 / (6 * lam) - 1 := by
  simp [highExclusionProfit, symQuality, exclusionQuality]
  field_simp [hlam]
  ring

theorem p2_deviation_gain_identity (lam : ℝ) (hlam : lam ≠ 0) :
    highExclusionProfit lam (symQuality lam) (exclusionQuality lam) -
      regularProfit lam (symQuality lam) (symQuality lam) =
      (4 - 27 * lam) / (18 * lam) := by
  rw [candidate_profit_closed lam hlam, exclusion_deviation_profit_closed lam hlam]
  field_simp [hlam]
  ring

theorem p2_profitable_below_four_over_twenty_seven (lam : ℝ)
    (hlam : 0 < lam) (hthreshold : lam < 4 / 27) :
    regularProfit lam (symQuality lam) (symQuality lam) <
      highExclusionProfit lam (symQuality lam) (exclusionQuality lam) := by
  have hgain := p2_deviation_gain_identity lam (ne_of_gt hlam)
  have hden : 0 < 18 * lam := by positivity
  have hfrac : 0 < (4 - 27 * lam) / (18 * lam) := by
    exact div_pos (by nlinarith) hden
  nlinarith

theorem p2_knife_edge :
    regularProfit (4 / 27 : ℝ) (symQuality (4 / 27)) (symQuality (4 / 27)) =
      highExclusionProfit (4 / 27) (symQuality (4 / 27)) (exclusionQuality (4 / 27)) := by
  norm_num [regularProfit, highExclusionProfit, symQuality, exclusionQuality]

theorem regular_gap_identity (lam a : ℝ) (hlam : lam ≠ 0) :
    regularProfit lam (symQuality lam) (symQuality lam) -
      regularProfit lam (symQuality lam) a =
      (9 * lam - 1) * (3 * a * lam - 1)^2 / (162 * lam^2) := by
  simp [regularProfit, symQuality]
  field_simp [hlam]
  ring

theorem regular_branch_no_gain (lam a : ℝ)
    (hlower : 1 / 9 < lam) :
    regularProfit lam (symQuality lam) a ≤
      regularProfit lam (symQuality lam) (symQuality lam) := by
  have hlam : 0 < lam := by nlinarith
  have hgap := regular_gap_identity lam a (ne_of_gt hlam)
  have hnum : 0 ≤ (9 * lam - 1) * (3 * a * lam - 1)^2 :=
    mul_nonneg (by nlinarith) (sq_nonneg _)
  have hden : 0 < 162 * lam^2 := by positivity
  have hfrac : 0 ≤ (9 * lam - 1) * (3 * a * lam - 1)^2 / (162 * lam^2) :=
    div_nonneg hnum (le_of_lt hden)
  nlinarith

theorem high_exclusion_gap_identity (lam rival a : ℝ) (hlam : lam ≠ 0) :
    highExclusionProfit lam rival (exclusionQuality lam) -
      highExclusionProfit lam rival a =
      (a * lam - 1)^2 / (2 * lam) := by
  simp [highExclusionProfit, exclusionQuality]
  field_simp [hlam]
  ring

theorem high_exclusion_no_gain (lam rival a : ℝ)
    (hlam : 0 < lam) :
    highExclusionProfit lam rival a ≤
      highExclusionProfit lam rival (exclusionQuality lam) := by
  have hgap := high_exclusion_gap_identity lam rival a (ne_of_gt hlam)
  have hfrac : 0 ≤ (a * lam - 1)^2 / (2 * lam) := by positivity
  nlinarith

theorem best_exclusion_no_gain_above_threshold (lam : ℝ)
    (hlam : 0 < lam) (hthreshold : 4 / 27 ≤ lam) :
    highExclusionProfit lam (symQuality lam) (exclusionQuality lam) ≤
      regularProfit lam (symQuality lam) (symQuality lam) := by
  have hgain := p2_deviation_gain_identity lam (ne_of_gt hlam)
  have hden : 0 < 18 * lam := by positivity
  have hfrac : (4 - 27 * lam) / (18 * lam) ≤ 0 := by
    apply (div_le_iff₀ hden).2
    nlinarith
  nlinarith

theorem reduced_payoff_at_sym (lam : ℝ) :
    reducedQualityPayoff lam (symQuality lam) (symQuality lam) =
      regularProfit lam (symQuality lam) (symQuality lam) := by
  simp [reducedQualityPayoff]

theorem p2_global_best_response_core (lam a : ℝ)
    (hlower : 1 / 9 < lam)
    (hthreshold : 4 / 27 ≤ lam)
    (hupper : lam < 2 / 9)
    (ha : 0 ≤ a) :
    reducedQualityPayoff lam (symQuality lam) a ≤
      reducedQualityPayoff lam (symQuality lam) (symQuality lam) := by
  have hlam : 0 < lam := by nlinarith
  have hA3 : symQuality lam < 3 := sym_quality_lt_three lam hlower
  rw [reduced_payoff_at_sym]
  have hlow : ¬ a - symQuality lam ≤ -3 := by linarith
  by_cases hreg : a - symQuality lam ≤ 3
  · simp [reducedQualityPayoff, hlow, hreg]
    exact regular_branch_no_gain lam a hlower
  · simp [reducedQualityPayoff, hlow, hreg]
    exact le_trans (high_exclusion_no_gain lam (symQuality lam) a hlam)
      (best_exclusion_no_gain_above_threshold lam hlam hthreshold)

theorem p2_reduced_payoff_failure_core (lam : ℝ)
    (hlower : 1 / 9 < lam)
    (hthreshold : lam < 4 / 27) :
    reducedQualityPayoff lam (symQuality lam) (symQuality lam) <
      reducedQualityPayoff lam (symQuality lam) (exclusionQuality lam) := by
  have hlam : 0 < lam := by nlinarith
  have hupper : lam < 2 / 9 := by nlinarith
  have hgap : 3 < exclusionQuality lam - symQuality lam :=
    quality_gap_gt_three lam hlam hupper
  rw [reduced_payoff_at_sym]
  have hlow : ¬ exclusionQuality lam - symQuality lam ≤ -3 := by linarith
  have hreg : ¬ exclusionQuality lam - symQuality lam ≤ 3 := not_le_of_gt hgap
  simp [reducedQualityPayoff, hlow, hreg]
  exact p2_profitable_below_four_over_twenty_seven lam hlam hthreshold

/-! ## P3: asymmetric exclusion best responses -/

theorem regular_zero_le_boundary (lam a : ℝ)
    (hlower : 1 / 9 < lam) (hupper : lam < 2 / 9)
    (ha0 : 0 ≤ a) (ha3 : a ≤ 3) :
    regularProfit lam 0 a ≤ regularProfit lam 0 3 := by
  have hcoef : 0 ≤ 9 * lam - 1 := by nlinarith
  have habound : a * (9 * lam - 1) ≤ 3 * (9 * lam - 1) :=
    mul_le_mul_of_nonneg_right ha3 hcoef
  have hsecond : 9 * a * lam - a + 27 * lam - 9 ≤ 0 := by
    nlinarith
  have hfirst : a - 3 ≤ 0 := by linarith
  have hprod : 0 ≤ (a - 3) * (9 * a * lam - a + 27 * lam - 9) :=
    mul_nonneg_of_nonpos_of_nonpos hfirst hsecond
  have hid :
      regularProfit lam 0 3 - regularProfit lam 0 a =
        (a - 3) * (9 * a * lam - a + 27 * lam - 9) / 18 := by
    simp [regularProfit]
    ring
  have hdiv : 0 ≤ (a - 3) * (9 * a * lam - a + 27 * lam - 9) / 18 :=
    div_nonneg hprod (by norm_num)
  nlinarith [hid]

theorem exclusion_zero_ge_boundary (lam : ℝ)
    (hlam : 0 < lam) :
    regularProfit lam 0 3 ≤
      highExclusionProfit lam 0 (exclusionQuality lam) := by
  have hid :
      highExclusionProfit lam 0 (exclusionQuality lam) - regularProfit lam 0 3 =
        (3 * lam - 1)^2 / (2 * lam) := by
    simp [highExclusionProfit, exclusionQuality, regularProfit]
    field_simp [ne_of_gt hlam]
    ring
  have hnonneg : 0 ≤ (3 * lam - 1)^2 / (2 * lam) := by positivity
  nlinarith

theorem br_zero_global_core (lam a : ℝ)
    (hlower : 1 / 9 < lam) (hupper : lam < 2 / 9)
    (ha : 0 ≤ a) :
    reducedQualityPayoff lam 0 a ≤
      reducedQualityPayoff lam 0 (exclusionQuality lam) := by
  have hlam : 0 < lam := by nlinarith
  have hB3 : 3 < exclusionQuality lam := by
    change 3 < 1 / lam
    exact (lt_div_iff₀ hlam).2 (by nlinarith)
  have hB_low : ¬ exclusionQuality lam - 0 ≤ -3 := by linarith
  have hB_reg : ¬ exclusionQuality lam - 0 ≤ 3 := by linarith
  have hBpay : reducedQualityPayoff lam 0 (exclusionQuality lam) =
      highExclusionProfit lam 0 (exclusionQuality lam) := by
    unfold reducedQualityPayoff
    rw [if_neg hB_low, if_neg hB_reg]
  rw [hBpay]
  have hlow : ¬ a - 0 ≤ -3 := by linarith
  by_cases hreg : a - 0 ≤ 3
  · have hpay : reducedQualityPayoff lam 0 a = regularProfit lam 0 a := by
      unfold reducedQualityPayoff
      rw [if_neg hlow, if_pos hreg]
    rw [hpay]
    exact le_trans (regular_zero_le_boundary lam a hlower hupper ha (by linarith))
      (exclusion_zero_ge_boundary lam hlam)
  · have hpay : reducedQualityPayoff lam 0 a = highExclusionProfit lam 0 a := by
      unfold reducedQualityPayoff
      rw [if_neg hlow, if_neg hreg]
    rw [hpay]
    exact high_exclusion_no_gain lam 0 a hlam

theorem regular_high_rival_left_boundary_nonpos (lam : ℝ)
    (hlam : 0 < lam) :
    regularProfit lam (exclusionQuality lam) (exclusionQuality lam - 3) ≤ 0 := by
  have hid :
      regularProfit lam (exclusionQuality lam) (exclusionQuality lam - 3) =
        - lam * (exclusionQuality lam - 3)^2 / 2 := by
    simp [regularProfit]
    ring
  rw [hid]
  have hsquare : 0 ≤ (exclusionQuality lam - 3)^2 := sq_nonneg _
  nlinarith

theorem regular_high_rival_no_gain_from_left (lam a : ℝ)
    (hlower : 1 / 9 < lam) (hupper : lam < 2 / 9)
    (ha : 0 ≤ a)
    (hleft : exclusionQuality lam - 3 ≤ a) :
    regularProfit lam (exclusionQuality lam) a ≤
      regularProfit lam (exclusionQuality lam) (exclusionQuality lam - 3) := by
  have hlam : 0 < lam := by nlinarith
  have hfactor1 : 0 ≤ a * lam + 3 * lam - 1 := by
    have hmul := mul_le_mul_of_nonneg_right hleft (le_of_lt hlam)
    have hBid : exclusionQuality lam * lam = 1 := by
      simp [exclusionQuality, ne_of_gt hlam]
    nlinarith
  have hfactor2a : 0 ≤ a * lam * (9 * lam - 1) := by
    exact mul_nonneg (mul_nonneg ha (le_of_lt hlam)) (by nlinarith)
  have hfactor2b : 0 ≤ (1 - 3 * lam) * (9 * lam + 1) := by
    exact mul_nonneg (by nlinarith) (by nlinarith)
  have hfactor2 : 0 ≤ 9 * a * lam^2 - a * lam - 27 * lam^2 + 6 * lam + 1 := by
    nlinarith
  have hprod : 0 ≤
      (a * lam + 3 * lam - 1) *
        (9 * a * lam^2 - a * lam - 27 * lam^2 + 6 * lam + 1) :=
    mul_nonneg hfactor1 hfactor2
  have hid :
      regularProfit lam (exclusionQuality lam) (exclusionQuality lam - 3) -
        regularProfit lam (exclusionQuality lam) a =
        ((a * lam + 3 * lam - 1) *
          (9 * a * lam^2 - a * lam - 27 * lam^2 + 6 * lam + 1)) /
          (18 * lam^2) := by
    simp [regularProfit, exclusionQuality]
    field_simp [ne_of_gt hlam]
    ring
  have hden : 0 < 18 * lam^2 := by positivity
  have hfrac : 0 ≤
      ((a * lam + 3 * lam - 1) *
        (9 * a * lam^2 - a * lam - 27 * lam^2 + 6 * lam + 1)) /
        (18 * lam^2) := div_nonneg hprod (le_of_lt hden)
  nlinarith

/-- Completing-square form for the high-exclusion payoff against rival `1/lam`. -/
theorem high_against_high_complete_square (lam a : ℝ) (hlam : lam ≠ 0) :
    highExclusionProfit lam (exclusionQuality lam) a =
      - (a * lam - 1)^2 / (2 * lam) - 1 / (2 * lam) - 1 := by
  simp [highExclusionProfit, exclusionQuality]
  field_simp [hlam]
  ring

theorem high_against_high_nonpos (lam a : ℝ)
    (hlam : 0 < lam) :
    highExclusionProfit lam (exclusionQuality lam) a ≤ 0 := by
  rw [high_against_high_complete_square lam a (ne_of_gt hlam)]
  have hfirst : - (a * lam - 1)^2 / (2 * lam) ≤ 0 := by positivity
  have hsecond : - 1 / (2 * lam) < 0 := by positivity
  linarith

theorem br_high_global_core (lam a : ℝ)
    (hlower : 1 / 9 < lam) (hupper : lam < 2 / 9)
    (ha : 0 ≤ a) :
    reducedQualityPayoff lam (exclusionQuality lam) a ≤ 0 := by
  have hlam : 0 < lam := by nlinarith
  by_cases hlow : a - exclusionQuality lam ≤ -3
  · have hpay : reducedQualityPayoff lam (exclusionQuality lam) a =
        lowExclusionProfit lam a := by
      unfold reducedQualityPayoff
      rw [if_pos hlow]
    rw [hpay]
    unfold lowExclusionProfit
    have hsquare : 0 ≤ a^2 := sq_nonneg a
    nlinarith
  · have hleft : exclusionQuality lam - 3 < a := by linarith
    by_cases hreg : a - exclusionQuality lam ≤ 3
    · have hpay : reducedQualityPayoff lam (exclusionQuality lam) a =
          regularProfit lam (exclusionQuality lam) a := by
        unfold reducedQualityPayoff
        rw [if_neg hlow, if_pos hreg]
      rw [hpay]
      exact le_trans
        (regular_high_rival_no_gain_from_left lam a hlower hupper ha (le_of_lt hleft))
        (regular_high_rival_left_boundary_nonpos lam hlam)
    · have hpay : reducedQualityPayoff lam (exclusionQuality lam) a =
          highExclusionProfit lam (exclusionQuality lam) a := by
        unfold reducedQualityPayoff
        rw [if_neg hlow, if_neg hreg]
      rw [hpay]
      exact high_against_high_nonpos lam a hlam

theorem reduced_payoff_zero_against_high (lam : ℝ)
    (hlam : 0 < lam) (hupper : lam < 2 / 9) :
    reducedQualityPayoff lam (exclusionQuality lam) 0 = 0 := by
  have hB3 : 3 < exclusionQuality lam := by
    change 3 < 1 / lam
    exact (lt_div_iff₀ hlam).2 (by nlinarith)
  have hlow : 0 - exclusionQuality lam ≤ -3 := by linarith
  unfold reducedQualityPayoff
  rw [if_pos hlow]
  norm_num [lowExclusionProfit]

theorem asymmetric_best_response_core (lam a : ℝ)
    (hlower : 1 / 9 < lam) (hupper : lam < 2 / 9)
    (ha : 0 ≤ a) :
    reducedQualityPayoff lam 0 a ≤
        reducedQualityPayoff lam 0 (exclusionQuality lam) ∧
      reducedQualityPayoff lam (exclusionQuality lam) a ≤
        reducedQualityPayoff lam (exclusionQuality lam) 0 := by
  constructor
  · exact br_zero_global_core lam a hlower hupper ha
  · rw [reduced_payoff_zero_against_high lam (by nlinarith) hupper]
    exact br_high_global_core lam a hlower hupper ha

/-! ## Endpoint price-branch boundary consistency -/

noncomputable def regularPrice1 (delta : ℝ) : ℝ := 1 + delta / 3
noncomputable def regularPrice2 (delta : ℝ) : ℝ := 1 - delta / 3
noncomputable def highExclusionPrice1 (delta : ℝ) : ℝ := delta - 1
noncomputable def lowExclusionPrice2 (delta : ℝ) : ℝ := -delta - 1

theorem price_branches_match_at_plus_three :
    regularPrice1 3 = highExclusionPrice1 3 ∧ regularPrice2 3 = 0 := by
  constructor <;> norm_num [regularPrice1, regularPrice2, highExclusionPrice1]

theorem price_branches_match_at_minus_three :
    regularPrice1 (-3) = 0 ∧ regularPrice2 (-3) = lowExclusionPrice2 (-3) := by
  constructor <;> norm_num [regularPrice1, regularPrice2, lowExclusionPrice2]

/-! ## Welfare and surplus algebra -/

noncomputable def welfareSym (lam k : ℝ) : ℝ := k - 1 / 4 + 2 / (9 * lam)
noncomputable def welfareExclusion (lam k : ℝ) : ℝ := k - 1 / 2 + 1 / (2 * lam)
noncomputable def consumerSurplusSym (lam k : ℝ) : ℝ := k + 1 / (3 * lam) - 5 / 4
noncomputable def consumerSurplusExclusion (k : ℝ) : ℝ := k + 1 / 2
noncomputable def producerSurplusSym (lam : ℝ) : ℝ := 1 - 1 / (9 * lam)
noncomputable def producerSurplusExclusion (lam : ℝ) : ℝ := 1 / (2 * lam) - 1

theorem welfare_gap_identity (lam k : ℝ) (hlam : lam ≠ 0) :
    welfareExclusion lam k - welfareSym lam k = (10 - 9 * lam) / (36 * lam) := by
  simp [welfareExclusion, welfareSym]
  field_simp [hlam]
  ring

theorem cs_gap_identity (lam k : ℝ) (hlam : lam ≠ 0) :
    consumerSurplusExclusion k - consumerSurplusSym lam k =
      (21 * lam - 4) / (12 * lam) := by
  simp [consumerSurplusExclusion, consumerSurplusSym]
  field_simp [hlam]
  ring

theorem ps_gap_identity (lam : ℝ) (hlam : lam ≠ 0) :
    producerSurplusExclusion lam - producerSurplusSym lam =
      (11 - 36 * lam) / (18 * lam) := by
  simp [producerSurplusExclusion, producerSurplusSym]
  field_simp [hlam]
  ring

theorem cs_equal_at_four_over_twenty_one (k : ℝ) :
    consumerSurplusExclusion k = consumerSurplusSym (4 / 21) k := by
  norm_num [consumerSurplusExclusion, consumerSurplusSym]
  ring

theorem cs_lower_below_four_over_twenty_one (lam k : ℝ)
    (hlam : 0 < lam) (hthreshold : lam < 4 / 21) :
    consumerSurplusExclusion k < consumerSurplusSym lam k := by
  have hgap := cs_gap_identity lam k (ne_of_gt hlam)
  have hden : 0 < 12 * lam := by positivity
  have hfrac : (21 * lam - 4) / (12 * lam) < 0 := by
    exact div_neg_of_neg_of_pos (by nlinarith) hden
  nlinarith

theorem cs_higher_above_four_over_twenty_one (lam k : ℝ)
    (hlam : 0 < lam) (hthreshold : 4 / 21 < lam) :
    consumerSurplusSym lam k < consumerSurplusExclusion k := by
  have hgap := cs_gap_identity lam k (ne_of_gt hlam)
  have hden : 0 < 12 * lam := by positivity
  have hfrac : 0 < (21 * lam - 4) / (12 * lam) :=
    div_pos (by nlinarith) hden
  nlinarith

theorem exact_counterexample_one_eighth :
    regularProfit (1 / 8 : ℝ) (symQuality (1 / 8)) (symQuality (1 / 8)) = 1 / 18 ∧
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
