import Mathlib

/-!
Formal verification core for ECONOMIDES-THEORY-FREEZE-2026-09-10-v1.

Boundary: the frozen reduced-form endpoint price continuation and its induced
piecewise quality payoffs are encoded here. The complete consumer continuum,
full three-stage game, and P1 full-history SPNE nonexistence argument are not.
-/

noncomputable section

namespace EconomidesFormal

-- P2: correction-producing global deviation.
def symmetricProfit (lam : ℝ) : ℝ :=
  (1 / 2 : ℝ) - 1 / (18 * lam)

def exclusionBestProfit (lam : ℝ) : ℝ :=
  1 / (6 * lam) - 1

theorem p2_gain_formula (lam : ℝ) (hlam : lam ≠ 0) :
    exclusionBestProfit lam - symmetricProfit lam =
      (4 - 27 * lam) / (18 * lam) := by
  unfold exclusionBestProfit symmetricProfit
  field_simp [hlam] <;> ring

theorem p2_profitable_deviation {lam : ℝ}
    (hlam : 0 < lam) (hcrit : lam < 4 / 27) :
    0 < exclusionBestProfit lam - symmetricProfit lam := by
  rw [p2_gain_formula lam (ne_of_gt hlam)]
  exact div_pos (by nlinarith) (by positivity)

theorem p2_boundary_tie :
    exclusionBestProfit (4 / 27 : ℝ) = symmetricProfit (4 / 27 : ℝ) := by
  norm_num [exclusionBestProfit, symmetricProfit]

-- Frozen endpoint price-continuation square checks.
theorem endpoint_price_square_1 (delta : ℝ) :
    (1 / 2 : ℝ) * (1 + delta / 3) ^ 2 -
      ((1 - delta / 3) + delta - 1) = (delta - 3) ^ 2 / 18 := by
  ring

theorem endpoint_price_square_2 (delta : ℝ) :
    (1 / 2 : ℝ) * (1 - delta / 3) ^ 2 -
      ((1 + delta / 3) - delta - 1) = (delta + 3) ^ 2 / 18 := by
  ring

-- P3, first best response: opponent quality zero.
def interiorAgainstZero (lam a : ℝ) : ℝ :=
  (1 / 2 : ℝ) * (1 + a / 3) ^ 2 - lam * a ^ 2 / 2

def exclusionAgainstZero (lam a : ℝ) : ℝ :=
  a - 1 - lam * a ^ 2 / 2

def payoffAgainstZero (lam a : ℝ) : ℝ :=
  if a ≤ 3 then interiorAgainstZero lam a else exclusionAgainstZero lam a

theorem exclusion_zero_gap (lam a : ℝ) (hlam : lam ≠ 0) :
    exclusionAgainstZero lam (1 / lam) - exclusionAgainstZero lam a =
      (a * lam - 1) ^ 2 / (2 * lam) := by
  unfold exclusionAgainstZero
  field_simp [hlam] <;> ring

theorem exclusion_zero_le_best {lam a : ℝ} (hlam : 0 < lam) :
    exclusionAgainstZero lam a ≤ exclusionAgainstZero lam (1 / lam) := by
  have hgap := exclusion_zero_gap lam a (ne_of_gt hlam)
  have hnonneg : 0 ≤ (a * lam - 1) ^ 2 / (2 * lam) :=
    div_nonneg (sq_nonneg (a * lam - 1)) (by positivity)
  linarith

theorem interior_zero_gap (lam a : ℝ) (hlam : lam ≠ 0) :
    exclusionAgainstZero lam (1 / lam) - interiorAgainstZero lam a =
      (lam * (a - 3) * (a * (9 * lam - 1) + 27 * lam - 9) +
        9 * (3 * lam - 1) ^ 2) / (18 * lam) := by
  unfold exclusionAgainstZero interiorAgainstZero
  field_simp [hlam] <;> ring

theorem interior_zero_le_best {lam a : ℝ}
    (hlo : 1 / 9 < lam) (hhi : lam < 2 / 9) (ha3 : a ≤ 3) :
    interiorAgainstZero lam a ≤ exclusionAgainstZero lam (1 / lam) := by
  have hlam : 0 < lam := by nlinarith
  have hcoef : 0 ≤ 9 * lam - 1 := by nlinarith
  have hmul : a * (9 * lam - 1) ≤ 3 * (9 * lam - 1) :=
    mul_le_mul_of_nonneg_right ha3 hcoef
  have hfac : a * (9 * lam - 1) + 27 * lam - 9 ≤ 0 := by
    nlinarith
  have ha3neg : a - 3 ≤ 0 := by linarith
  have hprod : 0 ≤ (a - 3) * (a * (9 * lam - 1) + 27 * lam - 9) :=
    mul_nonneg_of_nonpos_of_nonpos ha3neg hfac
  have hscaled : 0 ≤ lam * ((a - 3) * (a * (9 * lam - 1) + 27 * lam - 9)) :=
    mul_nonneg (le_of_lt hlam) hprod
  have hsq : 0 ≤ 9 * (3 * lam - 1) ^ 2 := by positivity
  have hnum :
      0 ≤ lam * (a - 3) * (a * (9 * lam - 1) + 27 * lam - 9) +
        9 * (3 * lam - 1) ^ 2 := by
    nlinarith
  have hfrac :
      0 ≤ (lam * (a - 3) * (a * (9 * lam - 1) + 27 * lam - 9) +
        9 * (3 * lam - 1) ^ 2) / (18 * lam) :=
    div_nonneg hnum (by positivity)
  have hgap := interior_zero_gap lam a (ne_of_gt hlam)
  linarith

theorem p3_best_response_to_zero {lam a : ℝ}
    (hlo : 1 / 9 < lam) (hhi : lam < 2 / 9) (_ha : 0 ≤ a) :
    payoffAgainstZero lam a ≤ payoffAgainstZero lam (1 / lam) := by
  have hlam : 0 < lam := by nlinarith
  have hbest : 3 < 1 / lam := by
    apply (lt_div_iff₀ hlam).2
    nlinarith
  unfold payoffAgainstZero
  rw [if_neg (not_le.mpr hbest)]
  by_cases ha3 : a ≤ 3
  · rw [if_pos ha3]
    exact interior_zero_le_best hlo hhi ha3
  · rw [if_neg ha3]
    exact exclusion_zero_le_best hlam

-- P3, second best response: opponent quality 1/lam.
def excludedAgainstHigh (lam a : ℝ) : ℝ :=
  -lam * a ^ 2 / 2

def middleAgainstHigh (lam a : ℝ) : ℝ :=
  (1 / 2 : ℝ) * (1 + (a - 1 / lam) / 3) ^ 2 - lam * a ^ 2 / 2

def reverseAgainstHigh (lam a : ℝ) : ℝ :=
  a - 1 / lam - 1 - lam * a ^ 2 / 2

def payoffAgainstHigh (lam a : ℝ) : ℝ :=
  if a ≤ 1 / lam - 3 then excludedAgainstHigh lam a
  else if a ≤ 1 / lam + 3 then middleAgainstHigh lam a
  else reverseAgainstHigh lam a

theorem excluded_high_le_zero {lam a : ℝ} (hlam : 0 < lam) :
    excludedAgainstHigh lam a ≤ 0 := by
  unfold excludedAgainstHigh
  nlinarith [sq_nonneg a]

theorem middle_lower_boundary (lam : ℝ) (hlam : lam ≠ 0) :
    middleAgainstHigh lam (1 / lam - 3) =
      -(3 * lam - 1) ^ 2 / (2 * lam) := by
  unfold middleAgainstHigh
  field_simp [hlam] <;> ring

theorem middle_boundary_gap (lam a : ℝ) (hlam : lam ≠ 0) :
    middleAgainstHigh lam (1 / lam - 3) - middleAgainstHigh lam a =
      ((a * lam + 3 * lam - 1) *
        (9 * a * lam ^ 2 - a * lam - 27 * lam ^ 2 + 6 * lam + 1)) /
        (18 * lam ^ 2) := by
  unfold middleAgainstHigh
  field_simp [hlam] <;> ring

theorem middle_high_le_zero {lam a : ℝ}
    (hlo : 1 / 9 < lam) (hhi : lam < 2 / 9)
    (hamin : 1 / lam - 3 ≤ a) :
    middleAgainstHigh lam a ≤ 0 := by
  have hlam : 0 < lam := by nlinarith
  have hlamne : lam ≠ 0 := ne_of_gt hlam
  have hm := mul_le_mul_of_nonneg_right hamin (le_of_lt hlam)
  have hleftid : (1 / lam - 3) * lam = 1 - 3 * lam := by
    field_simp [hlamne]
  rw [hleftid] at hm
  have hfirst : 0 ≤ a * lam + 3 * lam - 1 := by nlinarith
  have hcoef : 0 ≤ 9 * lam - 1 := by nlinarith
  have hterm1 : 0 ≤ (9 * lam - 1) * (a * lam + 3 * lam - 1) :=
    mul_nonneg hcoef hfirst
  have hthree : 3 * lam - 1 < 0 := by nlinarith
  have hterm2 : 0 ≤ -18 * lam * (3 * lam - 1) := by nlinarith
  have hfacid :
      9 * a * lam ^ 2 - a * lam - 27 * lam ^ 2 + 6 * lam + 1 =
        (9 * lam - 1) * (a * lam + 3 * lam - 1) -
          18 * lam * (3 * lam - 1) := by
    ring
  have hfac :
      0 ≤ 9 * a * lam ^ 2 - a * lam - 27 * lam ^ 2 + 6 * lam + 1 := by
    rw [hfacid]
    nlinarith
  have hprod :
      0 ≤ (a * lam + 3 * lam - 1) *
        (9 * a * lam ^ 2 - a * lam - 27 * lam ^ 2 + 6 * lam + 1) :=
    mul_nonneg hfirst hfac
  have hgapnonneg :
      0 ≤ ((a * lam + 3 * lam - 1) *
        (9 * a * lam ^ 2 - a * lam - 27 * lam ^ 2 + 6 * lam + 1)) /
        (18 * lam ^ 2) :=
    div_nonneg hprod (by positivity)
  have hgap := middle_boundary_gap lam a hlamne
  have hbase := middle_lower_boundary lam hlamne
  have hbasele : middleAgainstHigh lam (1 / lam - 3) ≤ 0 := by
    rw [hbase]
    exact div_nonpos_of_nonpos_of_nonneg
      (neg_nonpos.mpr (sq_nonneg (3 * lam - 1))) (by positivity)
  linarith

theorem reverse_high_le_zero {lam a : ℝ} (hlam : 0 < lam) :
    reverseAgainstHigh lam a ≤ 0 := by
  have hlamne : lam ≠ 0 := ne_of_gt hlam
  have hid :
      0 - reverseAgainstHigh lam a =
        ((a * lam - 1) ^ 2 + 2 * lam + 1) / (2 * lam) := by
    unfold reverseAgainstHigh
    field_simp [hlamne] <;> ring
  have hnum : 0 < (a * lam - 1) ^ 2 + 2 * lam + 1 := by
    nlinarith [sq_nonneg (a * lam - 1)]
  have hfrac : 0 < ((a * lam - 1) ^ 2 + 2 * lam + 1) / (2 * lam) :=
    div_pos hnum (by positivity)
  linarith

theorem p3_best_response_to_high {lam a : ℝ}
    (hlo : 1 / 9 < lam) (hhi : lam < 2 / 9) (_ha : 0 ≤ a) :
    payoffAgainstHigh lam a ≤ payoffAgainstHigh lam 0 := by
  have hlam : 0 < lam := by nlinarith
  have hbest : 3 < 1 / lam := by
    apply (lt_div_iff₀ hlam).2
    nlinarith
  have hzeroLeft : (0 : ℝ) ≤ 1 / lam - 3 := by linarith
  have hzero : payoffAgainstHigh lam 0 = 0 := by
    unfold payoffAgainstHigh
    rw [if_pos hzeroLeft]
    norm_num [excludedAgainstHigh]
  rw [hzero]
  unfold payoffAgainstHigh
  by_cases hleft : a ≤ 1 / lam - 3
  · rw [if_pos hleft]
    exact excluded_high_le_zero hlam
  · rw [if_neg hleft]
    by_cases hmid : a ≤ 1 / lam + 3
    · rw [if_pos hmid]
      have hamin : 1 / lam - 3 ≤ a := le_of_lt (lt_of_not_ge hleft)
      exact middle_high_le_zero hlo hhi hamin
    · rw [if_neg hmid]
      exact reverse_high_le_zero hlam

theorem p3_asymmetric_exclusion_core {lam : ℝ}
    (hlo : 1 / 9 < lam) (hhi : lam < 2 / 9) :
    (∀ a : ℝ, 0 ≤ a → payoffAgainstZero lam a ≤ payoffAgainstZero lam (1 / lam)) ∧
    (∀ a : ℝ, 0 ≤ a → payoffAgainstHigh lam a ≤ payoffAgainstHigh lam 0) := by
  constructor
  · intro a ha
    exact p3_best_response_to_zero hlo hhi ha
  · intro a ha
    exact p3_best_response_to_high hlo hhi ha

-- W1/W2: named-profile welfare and consumer-surplus identities.
def welfareS (lam k : ℝ) : ℝ :=
  k - 1 / 4 + 2 / (9 * lam)

def welfareE (lam k : ℝ) : ℝ :=
  k - 1 / 2 + 1 / (2 * lam)

theorem w1_gap_formula (lam k : ℝ) (hlam : lam ≠ 0) :
    welfareE lam k - welfareS lam k = (10 - 9 * lam) / (36 * lam) := by
  unfold welfareE welfareS
  field_simp [hlam] <;> ring

theorem w1_exclusion_welfare_higher {lam k : ℝ}
    (hlo : 1 / 9 < lam) (hhi : lam < 2 / 9) :
    welfareS lam k < welfareE lam k := by
  have hlam : 0 < lam := by nlinarith
  have hgap := w1_gap_formula lam k (ne_of_gt hlam)
  have hfrac : 0 < (10 - 9 * lam) / (36 * lam) :=
    div_pos (by nlinarith) (by positivity)
  linarith

def consumerSurplusS (lam k : ℝ) : ℝ :=
  k + 1 / (3 * lam) - 5 / 4

def consumerSurplusE (_lam k : ℝ) : ℝ :=
  k + 1 / 2

theorem w2_cs_gap_formula (lam k : ℝ) (hlam : lam ≠ 0) :
    consumerSurplusE lam k - consumerSurplusS lam k =
      (21 * lam - 4) / (12 * lam) := by
  unfold consumerSurplusE consumerSurplusS
  field_simp [hlam] <;> ring

theorem w2_cs_negative_below {lam k : ℝ}
    (hlam : 0 < lam) (hcrit : lam < 4 / 21) :
    consumerSurplusE lam k < consumerSurplusS lam k := by
  have hgap := w2_cs_gap_formula lam k (ne_of_gt hlam)
  have hfrac : (21 * lam - 4) / (12 * lam) < 0 :=
    div_neg_of_neg_of_pos (by nlinarith) (by positivity)
  linarith

theorem w2_cs_boundary (k : ℝ) :
    consumerSurplusE (4 / 21 : ℝ) k = consumerSurplusS (4 / 21 : ℝ) k := by
  unfold consumerSurplusE consumerSurplusS
  ring

theorem w2_cs_positive_above {lam k : ℝ} (hcrit : 4 / 21 < lam) :
    consumerSurplusS lam k < consumerSurplusE lam k := by
  have hlam : 0 < lam := by nlinarith
  have hgap := w2_cs_gap_formula lam k (ne_of_gt hlam)
  have hfrac : 0 < (21 * lam - 4) / (12 * lam) :=
    div_pos (by nlinarith) (by positivity)
  linarith

-- R1: exact linear-transport rescaling of the P2 threshold core.
def scaledP2Gain (lam t : ℝ) : ℝ :=
  (4 - 27 * (lam * t)) / (18 * (lam * t))

theorem r1_scaled_gain_positive {lam t : ℝ}
    (hlam : 0 < lam) (ht : 0 < t) (hcrit : lam * t < 4 / 27) :
    0 < scaledP2Gain lam t := by
  unfold scaledP2Gain
  exact div_pos (by nlinarith) (by positivity)

theorem r1_scaled_gain_zero {lam t : ℝ}
    (_hlam : 0 < lam) (_ht : 0 < t) (hcrit : lam * t = 4 / 27) :
    scaledP2Gain lam t = 0 := by
  unfold scaledP2Gain
  rw [hcrit]
  norm_num

#print axioms p2_profitable_deviation
#print axioms p3_asymmetric_exclusion_core
#print axioms w1_exclusion_welfare_higher
#print axioms w2_cs_negative_below
#print axioms w2_cs_positive_above
#print axioms r1_scaled_gain_positive

end EconomidesFormal
