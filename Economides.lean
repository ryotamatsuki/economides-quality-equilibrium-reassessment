import Mathlib

/-!
# Formal verification core for ECONOMIDES-THEORY-FREEZE-2026-09-10-v1

This file certifies proof-critical algebra and global best-response inequalities used by
P2/P3/W1/W2/R1.  It deliberately starts from the frozen reduced-form endpoint price
continuation.  It does not claim to formalize the complete three-stage game, demand
correspondence, or the modern full-history SPNE nonexistence result P1.
-/

namespace Economides

/-- Profit at Economides' reported symmetric quality profile, normalized by market mass. -/
def symmetricProfit (λ : ℝ) : ℝ :=
  (1 / 2 : ℝ) - 1 / (18 * λ)

/-- Profit from the exclusionary quality deviation `a=1/λ`, normalized by market mass. -/
def exclusionBestProfit (λ : ℝ) : ℝ :=
  1 / (6 * λ) - 1

/-- P2 exact deviation-gain identity. -/
theorem p2_gain_formula (λ : ℝ) (hλ : λ ≠ 0) :
    exclusionBestProfit λ - symmetricProfit λ = (4 - 27 * λ) / (18 * λ) := by
  field_simp [exclusionBestProfit, symmetricProfit, hλ]
  <;> ring

/-- P2: below `4/27` the exclusionary deviation is strictly profitable. -/
theorem p2_profitable_deviation {λ : ℝ} (hλ : 0 < λ) (hcrit : λ < 4 / 27) :
    0 < exclusionBestProfit λ - symmetricProfit λ := by
  rw [p2_gain_formula λ (ne_of_gt hλ)]
  apply div_pos
  · nlinarith
  · positivity

/-- P2 boundary: at `λ=4/27` the reported action and exclusionary deviation tie. -/
theorem p2_boundary_tie :
    exclusionBestProfit (4 / 27 : ℝ) = symmetricProfit (4 / 27 : ℝ) := by
  norm_num [exclusionBestProfit, symmetricProfit]

/-- Endpoint price-continuation square identity for firm 1. -/
theorem endpoint_price_square_1 (δ : ℝ) :
    (1 / 2 : ℝ) * (1 + δ / 3) ^ 2 - ((1 - δ / 3) + δ - 1) =
      (δ - 3) ^ 2 / 18 := by
  ring

/-- Endpoint price-continuation square identity for firm 2. -/
theorem endpoint_price_square_2 (δ : ℝ) :
    (1 / 2 : ℝ) * (1 - δ / 3) ^ 2 - ((1 + δ / 3) - δ - 1) =
      (δ + 3) ^ 2 / 18 := by
  ring

/-- Interior quality-stage payoff against zero opponent quality. -/
def interiorAgainstZero (λ a : ℝ) : ℝ :=
  (1 / 2 : ℝ) * (1 + a / 3) ^ 2 - λ * a ^ 2 / 2

/-- Exclusion quality-stage payoff against zero opponent quality. -/
def exclusionAgainstZero (λ a : ℝ) : ℝ :=
  a - 1 - λ * a ^ 2 / 2

/-- Frozen piecewise quality payoff against zero opponent quality. -/
def payoffAgainstZero (λ a : ℝ) : ℝ :=
  if a ≤ 3 then interiorAgainstZero λ a else exclusionAgainstZero λ a

/-- Exact square gap on the exclusion branch. -/
theorem exclusion_against_zero_gap (λ a : ℝ) (hλ : λ ≠ 0) :
    exclusionAgainstZero λ (1 / λ) - exclusionAgainstZero λ a =
      (a * λ - 1) ^ 2 / (2 * λ) := by
  field_simp [exclusionAgainstZero, hλ]
  <;> ring

/-- The exclusion branch is globally maximized at `a=1/λ` when `λ>0`. -/
theorem exclusion_against_zero_le_best {λ a : ℝ} (hλ : 0 < λ) :
    exclusionAgainstZero λ a ≤ exclusionAgainstZero λ (1 / λ) := by
  have hgap := exclusion_against_zero_gap λ a (ne_of_gt hλ)
  have hnonneg : 0 ≤ (a * λ - 1) ^ 2 / (2 * λ) := by
    exact div_nonneg (sq_nonneg (a * λ - 1)) (by positivity)
  linarith

/-- Exact gap decomposition used to dominate the entire interior branch by `a=1/λ`. -/
theorem interior_against_zero_gap (λ a : ℝ) (hλ : λ ≠ 0) :
    exclusionAgainstZero λ (1 / λ) - interiorAgainstZero λ a =
      (λ * (a - 3) * (a * (9 * λ - 1) + 27 * λ - 9) +
        9 * (3 * λ - 1) ^ 2) / (18 * λ) := by
  field_simp [exclusionAgainstZero, interiorAgainstZero, hλ]
  <;> ring

/-- On `1/9<λ<2/9`, every interior-branch action is weakly worse than `a=1/λ`. -/
theorem interior_against_zero_le_best {λ a : ℝ}
    (hlo : 1 / 9 < λ) (hhi : λ < 2 / 9) (ha3 : a ≤ 3) :
    interiorAgainstZero λ a ≤ exclusionAgainstZero λ (1 / λ) := by
  have hλ : 0 < λ := by nlinarith
  have hcoef : 0 ≤ 9 * λ - 1 := by nlinarith
  have hmul : a * (9 * λ - 1) ≤ 3 * (9 * λ - 1) :=
    mul_le_mul_of_nonneg_right ha3 hcoef
  have hfac : a * (9 * λ - 1) + 27 * λ - 9 ≤ 0 := by
    nlinarith
  have ha3neg : a - 3 ≤ 0 := by linarith
  have hprod : 0 ≤ (a - 3) * (a * (9 * λ - 1) + 27 * λ - 9) :=
    mul_nonneg_of_nonpos_of_nonpos ha3neg hfac
  have hscaled : 0 ≤ λ * ((a - 3) * (a * (9 * λ - 1) + 27 * λ - 9)) :=
    mul_nonneg (le_of_lt hλ) hprod
  have hsq : 0 ≤ 9 * (3 * λ - 1) ^ 2 := by positivity
  have hnum :
      0 ≤ λ * (a - 3) * (a * (9 * λ - 1) + 27 * λ - 9) +
        9 * (3 * λ - 1) ^ 2 := by
    nlinarith
  have hfrac :
      0 ≤ (λ * (a - 3) * (a * (9 * λ - 1) + 27 * λ - 9) +
        9 * (3 * λ - 1) ^ 2) / (18 * λ) := by
    exact div_nonneg hnum (by positivity)
  have hgap := interior_against_zero_gap λ a (ne_of_gt hλ)
  linarith

/-- P3 first best-response statement: against zero quality, `1/λ` is a global best response. -/
theorem p3_best_response_to_zero {λ a : ℝ}
    (hlo : 1 / 9 < λ) (hhi : λ < 2 / 9) (ha : 0 ≤ a) :
    payoffAgainstZero λ a ≤ payoffAgainstZero λ (1 / λ) := by
  have hλ : 0 < λ := by nlinarith
  have hbestgt3 : 3 < 1 / λ := by
    apply (lt_div_iff₀ hλ).2
    nlinarith
  unfold payoffAgainstZero
  rw [if_neg (not_le.mpr hbestgt3)]
  by_cases ha3 : a ≤ 3
  · rw [if_pos ha3]
    exact interior_against_zero_le_best hlo hhi ha3
  · rw [if_neg ha3]
    exact exclusion_against_zero_le_best hλ

/-- Payoff when the firm remains excluded against opponent quality `1/λ`. -/
def excludedAgainstHigh (λ a : ℝ) : ℝ :=
  -λ * a ^ 2 / 2

/-- Interior-continuation payoff against opponent quality `1/λ`. -/
def middleAgainstHigh (λ a : ℝ) : ℝ :=
  (1 / 2 : ℝ) * (1 + (a - 1 / λ) / 3) ^ 2 - λ * a ^ 2 / 2

/-- Reverse-exclusion payoff against opponent quality `1/λ`. -/
def reverseAgainstHigh (λ a : ℝ) : ℝ :=
  a - 1 / λ - 1 - λ * a ^ 2 / 2

/-- Frozen piecewise quality payoff against opponent quality `1/λ`. -/
def payoffAgainstHigh (λ a : ℝ) : ℝ :=
  if a ≤ 1 / λ - 3 then excludedAgainstHigh λ a
  else if a ≤ 1 / λ + 3 then middleAgainstHigh λ a
  else reverseAgainstHigh λ a

/-- The excluded branch never beats zero quality. -/
theorem excluded_against_high_le_zero {λ a : ℝ} (hλ : 0 < λ) :
    excludedAgainstHigh λ a ≤ 0 := by
  have hsq : 0 ≤ a ^ 2 := sq_nonneg a
  have hprod : 0 ≤ λ * a ^ 2 := mul_nonneg (le_of_lt hλ) hsq
  unfold excludedAgainstHigh
  nlinarith

/-- Exact value of the middle branch at its lower boundary. -/
theorem middle_lower_boundary (λ : ℝ) (hλ : λ ≠ 0) :
    middleAgainstHigh λ (1 / λ - 3) = -(3 * λ - 1) ^ 2 / (2 * λ) := by
  field_simp [middleAgainstHigh, hλ]
  <;> ring

/-- Exact monotonicity-gap factorization for the middle branch. -/
theorem middle_boundary_gap (λ a : ℝ) (hλ : λ ≠ 0) :
    middleAgainstHigh λ (1 / λ - 3) - middleAgainstHigh λ a =
      ((a * λ + 3 * λ - 1) *
        (9 * a * λ ^ 2 - a * λ - 27 * λ ^ 2 + 6 * λ + 1)) /
        (18 * λ ^ 2) := by
  field_simp [middleAgainstHigh, hλ]
  <;> ring

/-- On the relevant interval the middle branch is nonpositive once it is feasible. -/
theorem middle_against_high_le_zero {λ a : ℝ}
    (hlo : 1 / 9 < λ) (hhi : λ < 2 / 9) (hamin : 1 / λ - 3 ≤ a) :
    middleAgainstHigh λ a ≤ 0 := by
  have hλ : 0 < λ := by nlinarith
  have hλne : λ ≠ 0 := ne_of_gt hλ
  have hm := mul_le_mul_of_nonneg_right hamin (le_of_lt hλ)
  have hleftid : (1 / λ - 3) * λ = 1 - 3 * λ := by
    field_simp [hλne]
    <;> ring
  rw [hleftid] at hm
  have hfirst : 0 ≤ a * λ + 3 * λ - 1 := by
    nlinarith
  have hcoef : 0 ≤ 9 * λ - 1 := by nlinarith
  have hterm1 : 0 ≤ (9 * λ - 1) * (a * λ + 3 * λ - 1) :=
    mul_nonneg hcoef hfirst
  have hthree : 3 * λ - 1 < 0 := by nlinarith
  have hterm2 : 0 ≤ -18 * λ * (3 * λ - 1) := by
    have : 0 < -18 * λ * (3 * λ - 1) := by positivity
    exact le_of_lt this
  have hfacid :
      9 * a * λ ^ 2 - a * λ - 27 * λ ^ 2 + 6 * λ + 1 =
        (9 * λ - 1) * (a * λ + 3 * λ - 1) - 18 * λ * (3 * λ - 1) := by
    ring
  have hfac :
      0 ≤ 9 * a * λ ^ 2 - a * λ - 27 * λ ^ 2 + 6 * λ + 1 := by
    rw [hfacid]
    nlinarith
  have hprod :
      0 ≤ (a * λ + 3 * λ - 1) *
        (9 * a * λ ^ 2 - a * λ - 27 * λ ^ 2 + 6 * λ + 1) :=
    mul_nonneg hfirst hfac
  have hgapnonneg :
      0 ≤ ((a * λ + 3 * λ - 1) *
        (9 * a * λ ^ 2 - a * λ - 27 * λ ^ 2 + 6 * λ + 1)) /
        (18 * λ ^ 2) := by
    exact div_nonneg hprod (by positivity)
  have hgap := middle_boundary_gap λ a hλne
  have hbase := middle_lower_boundary λ hλne
  have hbasele : middleAgainstHigh λ (1 / λ - 3) ≤ 0 := by
    rw [hbase]
    have hq : 0 ≤ (3 * λ - 1) ^ 2 / (2 * λ) :=
      div_nonneg (sq_nonneg (3 * λ - 1)) (by positivity)
    linarith
  linarith

/-- The reverse-exclusion branch is strictly below zero for `λ>0`. -/
theorem reverse_against_high_le_zero {λ a : ℝ} (hλ : 0 < λ) :
    reverseAgainstHigh λ a ≤ 0 := by
  have hλne : λ ≠ 0 := ne_of_gt hλ
  have hid :
      0 - reverseAgainstHigh λ a =
        ((a * λ - 1) ^ 2 + 2 * λ + 1) / (2 * λ) := by
    field_simp [reverseAgainstHigh, hλne]
    <;> ring
  have hnum : 0 < (a * λ - 1) ^ 2 + 2 * λ + 1 := by
    nlinarith [sq_nonneg (a * λ - 1)]
  have hfrac : 0 < ((a * λ - 1) ^ 2 + 2 * λ + 1) / (2 * λ) :=
    div_pos hnum (by positivity)
  linarith

/-- P3 second best-response statement: against quality `1/λ`, zero is a global best response. -/
theorem p3_best_response_to_high {λ a : ℝ}
    (hlo : 1 / 9 < λ) (hhi : λ < 2 / 9) (ha : 0 ≤ a) :
    payoffAgainstHigh λ a ≤ payoffAgainstHigh λ 0 := by
  have hλ : 0 < λ := by nlinarith
  have hbestgt3 : 3 < 1 / λ := by
    apply (lt_div_iff₀ hλ).2
    nlinarith
  have hzeroLeft : (0 : ℝ) ≤ 1 / λ - 3 := by linarith
  have hzero : payoffAgainstHigh λ 0 = 0 := by
    simp [payoffAgainstHigh, hzeroLeft, excludedAgainstHigh]
  rw [hzero]
  unfold payoffAgainstHigh
  by_cases hleft : a ≤ 1 / λ - 3
  · rw [if_pos hleft]
    exact excluded_against_high_le_zero hλ
  · rw [if_neg hleft]
    by_cases hmid : a ≤ 1 / λ + 3
    · rw [if_pos hmid]
      have hamin : 1 / λ - 3 ≤ a := by
        exact le_of_lt (lt_of_not_ge hleft)
      exact middle_against_high_le_zero hlo hhi hamin
    · rw [if_neg hmid]
      exact reverse_against_high_le_zero hλ

/-- P3: both best-response inequalities hold on the full nonnegative quality domain. -/
theorem p3_asymmetric_exclusion_core {λ : ℝ}
    (hlo : 1 / 9 < λ) (hhi : λ < 2 / 9) :
    (∀ a : ℝ, 0 ≤ a → payoffAgainstZero λ a ≤ payoffAgainstZero λ (1 / λ)) ∧
    (∀ a : ℝ, 0 ≤ a → payoffAgainstHigh λ a ≤ payoffAgainstHigh λ 0) := by
  constructor
  · intro a ha
    exact p3_best_response_to_zero hlo hhi ha
  · intro a ha
    exact p3_best_response_to_high hlo hhi ha

/-- Total welfare at the reported symmetric profile. -/
def welfareS (λ k : ℝ) : ℝ :=
  k - 1 / 4 + 2 / (9 * λ)

/-- Total welfare at either certified exclusion profile. -/
def welfareE (λ k : ℝ) : ℝ :=
  k - 1 / 2 + 1 / (2 * λ)

/-- W1 exact welfare-gap identity. -/
theorem w1_gap_formula (λ k : ℝ) (hλ : λ ≠ 0) :
    welfareE λ k - welfareS λ k = (10 - 9 * λ) / (36 * λ) := by
  field_simp [welfareE, welfareS, hλ]
  <;> ring

/-- W1: the certified exclusion profile has strictly higher total welfare on the frozen interval. -/
theorem w1_exclusion_welfare_higher {λ k : ℝ}
    (hlo : 1 / 9 < λ) (hhi : λ < 2 / 9) :
    welfareS λ k < welfareE λ k := by
  have hλ : 0 < λ := by nlinarith
  have hgap := w1_gap_formula λ k (ne_of_gt hλ)
  have hnum : 0 < 10 - 9 * λ := by nlinarith
  have hfrac : 0 < (10 - 9 * λ) / (36 * λ) := div_pos hnum (by positivity)
  linarith

/-- Consumer surplus at the reported symmetric profile. -/
def consumerSurplusS (λ k : ℝ) : ℝ :=
  k + 1 / (3 * λ) - 5 / 4

/-- Consumer surplus at either certified exclusion profile. -/
def consumerSurplusE (_λ k : ℝ) : ℝ :=
  k + 1 / 2

/-- W2 exact consumer-surplus difference. -/
theorem w2_cs_gap_formula (λ k : ℝ) (hλ : λ ≠ 0) :
    consumerSurplusE λ k - consumerSurplusS λ k = (21 * λ - 4) / (12 * λ) := by
  field_simp [consumerSurplusE, consumerSurplusS, hλ]
  <;> ring

/-- W2: consumer-surplus difference is negative below `4/21`. -/
theorem w2_cs_negative_below {λ k : ℝ} (hλ : 0 < λ) (hcrit : λ < 4 / 21) :
    consumerSurplusE λ k < consumerSurplusS λ k := by
  have hgap := w2_cs_gap_formula λ k (ne_of_gt hλ)
  have hnum : 21 * λ - 4 < 0 := by nlinarith
  have hfrac : (21 * λ - 4) / (12 * λ) < 0 := div_neg_of_neg_of_pos hnum (by positivity)
  linarith

/-- W2 boundary equality at `4/21`. -/
theorem w2_cs_boundary (k : ℝ) :
    consumerSurplusE (4 / 21 : ℝ) k = consumerSurplusS (4 / 21 : ℝ) k := by
  norm_num [consumerSurplusE, consumerSurplusS]

/-- W2: consumer-surplus difference is positive above `4/21`. -/
theorem w2_cs_positive_above {λ k : ℝ} (hλ : 4 / 21 < λ) :
    consumerSurplusS λ k < consumerSurplusE λ k := by
  have hλpos : 0 < λ := by nlinarith
  have hgap := w2_cs_gap_formula λ k (ne_of_gt hλpos)
  have hnum : 0 < 21 * λ - 4 := by nlinarith
  have hfrac : 0 < (21 * λ - 4) / (12 * λ) := div_pos hnum (by positivity)
  linarith

/-- R1 scaled deviation-gain core under linear transport coefficient `t`. -/
def scaledP2Gain (λ t : ℝ) : ℝ :=
  (4 - 27 * (λ * t)) / (18 * (λ * t))

/-- R1: `λ t < 4/27` implies a positive scaled exclusionary gain. -/
theorem r1_scaled_gain_positive {λ t : ℝ}
    (hλ : 0 < λ) (ht : 0 < t) (hcrit : λ * t < 4 / 27) :
    0 < scaledP2Gain λ t := by
  unfold scaledP2Gain
  apply div_pos
  · nlinarith
  · positivity

/-- R1 boundary: scaled gain is zero at `λ t = 4/27`. -/
theorem r1_scaled_gain_zero {λ t : ℝ}
    (hλ : 0 < λ) (ht : 0 < t) (hcrit : λ * t = 4 / 27) :
    scaledP2Gain λ t = 0 := by
  unfold scaledP2Gain
  rw [hcrit]
  norm_num

#print axioms p2_profitable_deviation
#print axioms p3_asymmetric_exclusion_core
#print axioms w1_exclusion_welfare_higher
#print axioms w2_cs_negative_below
#print axioms w2_cs_positive_above
#print axioms r1_scaled_gain_positive

end Economides
