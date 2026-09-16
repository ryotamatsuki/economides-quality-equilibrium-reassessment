import Mathlib

/-!
Targeted formal-verification core for the complete-equilibrium project.

Boundary: this file certifies proof-critical algebra/order consequences used by the
maximal-location pure quality-equilibrium characterization and Stage-7 welfare
claims. It does NOT formalize the consumer continuum, derive the price equilibrium
from primitive demand, define Nash equilibrium, or prove that the encoded mutual
best-response equations are economically exhaustive. Those objects are certified
analytically at Stages 4/4A and remain outside this formal core.
-/

noncomputable section

namespace CompleteEquilibriumFormal

open Real

-- Exact thresholds used in the paper.
def lambdaC : ℝ := 4 / 27
def lambdaCS : ℝ := 4 / 21
def lambdaM : ℝ := 2 / 9
def lambdaE : ℝ := (11 + Real.sqrt 13) / 54
def beta : ℝ := (3 / 2 : ℝ) * (Real.sqrt 2 - 1)
def continuumDmax : ℝ := 6 - 3 * Real.sqrt 2

lemma sqrt13_sq : (Real.sqrt 13 : ℝ) ^ 2 = 13 := by
  have h : (0 : ℝ) ≤ 13 := by norm_num
  simpa using Real.sq_sqrt h

lemma sqrt2_sq : (Real.sqrt 2 : ℝ) ^ 2 = 2 := by
  have h : (0 : ℝ) ≤ 2 := by norm_num
  simpa using Real.sq_sqrt h

lemma sqrt13_lt_four : (Real.sqrt 13 : ℝ) < 4 := by
  have hs := sqrt13_sq
  have hn : (0 : ℝ) ≤ Real.sqrt 13 := Real.sqrt_nonneg 13
  nlinarith

lemma sqrt13_gt_one : (1 : ℝ) < Real.sqrt 13 := by
  have hs := sqrt13_sq
  have hn : (0 : ℝ) ≤ Real.sqrt 13 := Real.sqrt_nonneg 13
  nlinarith

lemma sqrt2_bounds : (1 : ℝ) < Real.sqrt 2 ∧ Real.sqrt 2 < 3 / 2 := by
  constructor
  · have hs := sqrt2_sq
    have hn : (0 : ℝ) ≤ Real.sqrt 2 := Real.sqrt_nonneg 2
    nlinarith
  · have hs := sqrt2_sq
    have hn : (0 : ℝ) ≤ Real.sqrt 2 := Real.sqrt_nonneg 2
    nlinarith

-- The upper multiplicity threshold is the economically relevant larger root.
theorem lambdaE_polynomial_root :
    27 * lambdaE ^ 2 - 11 * lambdaE + 1 = 0 := by
  have hs := sqrt13_sq
  unfold lambdaE
  field_simp
  nlinarith

theorem core_threshold_order :
    lambdaC < lambdaCS ∧ lambdaCS < lambdaM ∧ lambdaM < lambdaE ∧
      lambdaE < 11 / 36 := by
  have h13lo := sqrt13_gt_one
  have h13hi := sqrt13_lt_four
  unfold lambdaC lambdaCS lambdaM lambdaE
  constructor
  · norm_num
  constructor
  · norm_num
  constructor
  · nlinarith
  · nlinarith

-- Mutual regular-branch first-order conditions.
theorem mutual_regular_difference_identity (lam a₁ a₂ : ℝ) :
    ((9 * lam - 1) * a₁ + a₂ - 3) -
      (a₁ + (9 * lam - 1) * a₂ - 3) =
        (9 * lam - 2) * (a₁ - a₂) := by
  ring

theorem mutual_regular_symmetry {lam a₁ a₂ : ℝ}
    (h₁ : (9 * lam - 1) * a₁ + a₂ = 3)
    (h₂ : a₁ + (9 * lam - 1) * a₂ = 3)
    (hne : lam ≠ lambdaM) :
    a₁ = a₂ := by
  have hprod : (9 * lam - 2) * (a₁ - a₂) = 0 := by
    nlinarith [mutual_regular_difference_identity lam a₁ a₂]
  have hcoef : 9 * lam - 2 ≠ 0 := by
    intro hz
    apply hne
    unfold lambdaM
    linarith
  have hdiff : a₁ - a₂ = 0 := (mul_eq_zero.mp hprod).resolve_left hcoef
  linarith

theorem mutual_regular_at_lambdaM_iff (a₁ a₂ : ℝ) :
    ((9 * lambdaM - 1) * a₁ + a₂ = 3 ∧
      a₁ + (9 * lambdaM - 1) * a₂ = 3) ↔
      a₁ + a₂ = 3 := by
  unfold lambdaM
  norm_num

-- A firm that is excluded and chooses strictly positive quality pays a real cost.
def excludedQualityPayoff (lam a : ℝ) : ℝ := -lam * a ^ 2 / 2

theorem excluded_positive_quality_strictly_worse_than_zero {lam a : ℝ}
    (hlam : 0 < lam) (ha : 0 < a) :
    excludedQualityPayoff lam a < excludedQualityPayoff lam 0 := by
  unfold excludedQualityPayoff
  have ha2 : 0 < a ^ 2 := sq_pos_of_pos ha
  nlinarith

-- Named-profile welfare identities.
def welfareS (lam k : ℝ) : ℝ := k - 1 / 4 + 2 / (9 * lam)
def welfareE (lam k : ℝ) : ℝ := k - 1 / 2 + 1 / (2 * lam)
def consumerSurplusS (lam k : ℝ) : ℝ := k + 1 / (3 * lam) - 5 / 4
def consumerSurplusE (_lam k : ℝ) : ℝ := k + 1 / 2
def producerSurplusS (lam : ℝ) : ℝ := 1 - 1 / (9 * lam)
def producerSurplusE (lam : ℝ) : ℝ := 1 / (2 * lam) - 1

theorem welfare_gap_formula (lam k : ℝ) (hlam : lam ≠ 0) :
    welfareE lam k - welfareS lam k = (10 - 9 * lam) / (36 * lam) := by
  unfold welfareE welfareS
  field_simp [hlam]
  ring

theorem cs_gap_formula (lam k : ℝ) (hlam : lam ≠ 0) :
    consumerSurplusE lam k - consumerSurplusS lam k =
      (21 * lam - 4) / (12 * lam) := by
  unfold consumerSurplusE consumerSurplusS
  field_simp [hlam]
  ring

theorem ps_gap_formula (lam : ℝ) (hlam : lam ≠ 0) :
    producerSurplusE lam - producerSurplusS lam =
      (11 - 36 * lam) / (18 * lam) := by
  unfold producerSurplusE producerSurplusS
  field_simp [hlam]
  ring

theorem exclusion_welfare_higher_through_lambdaE {lam k : ℝ}
    (hlam : 0 < lam) (hupper : lam ≤ lambdaE) :
    welfareS lam k < welfareE lam k := by
  have hE : lambdaE < (10 / 9 : ℝ) := by
    have h13 := sqrt13_lt_four
    unfold lambdaE
    nlinarith
  have hgap := welfare_gap_formula lam k (ne_of_gt hlam)
  have hnum : 0 < 10 - 9 * lam := by nlinarith
  have hden : 0 < 36 * lam := by positivity
  have hfrac : 0 < (10 - 9 * lam) / (36 * lam) := div_pos hnum hden
  linarith

theorem exclusion_ps_higher_through_lambdaE {lam : ℝ}
    (hlam : 0 < lam) (hupper : lam ≤ lambdaE) :
    producerSurplusS lam < producerSurplusE lam := by
  have hE : lambdaE < (11 / 36 : ℝ) := by
    exact (core_threshold_order).2.2.2
  have hgap := ps_gap_formula lam (ne_of_gt hlam)
  have hnum : 0 < 11 - 36 * lam := by nlinarith
  have hden : 0 < 18 * lam := by positivity
  have hfrac : 0 < (11 - 36 * lam) / (18 * lam) := div_pos hnum hden
  linarith

-- Continuum welfare at lambda = 2/9.
def continuumCS (k d : ℝ) : ℝ := k + 1 / 4 + d ^ 2 / 36
def continuumPS (d : ℝ) : ℝ := 1 / 2 + d ^ 2 / 18
def continuumW (k d : ℝ) : ℝ := k + 3 / 4 + d ^ 2 / 12

def exclusionCSAtM (k : ℝ) : ℝ := k + 1 / 2
def exclusionPSAtM : ℝ := 5 / 4
def exclusionWAtM (k : ℝ) : ℝ := k + 7 / 4

theorem continuumDmax_sq_lt_twelve : continuumDmax ^ 2 < 12 := by
  have hs := sqrt2_sq
  have hb := sqrt2_bounds
  unfold continuumDmax
  nlinarith

theorem continuumDmax_nonneg : 0 ≤ continuumDmax := by
  have hb := sqrt2_bounds
  unfold continuumDmax
  nlinarith

theorem continuum_abs_bound_implies_sq_lt_twelve {d : ℝ}
    (hd : |d| ≤ continuumDmax) : d ^ 2 < 12 := by
  have hD0 := continuumDmax_nonneg
  have habs0 : 0 ≤ |d| := abs_nonneg d
  have hsq : |d| ^ 2 ≤ continuumDmax ^ 2 := by
    nlinarith
  have hdabs : d ^ 2 = |d| ^ 2 := by
    rw [sq_abs]
  rw [hdabs]
  have hD := continuumDmax_sq_lt_twelve
  linarith

theorem exclusion_welfare_dominates_continuum {k d : ℝ}
    (hd : |d| ≤ continuumDmax) :
    continuumW k d < exclusionWAtM k := by
  have hd2 := continuum_abs_bound_implies_sq_lt_twelve hd
  unfold continuumW exclusionWAtM
  nlinarith

theorem exclusion_cs_dominates_continuum {k d : ℝ}
    (hd : |d| ≤ continuumDmax) :
    continuumCS k d < exclusionCSAtM k := by
  have hd2 := continuum_abs_bound_implies_sq_lt_twelve hd
  unfold continuumCS exclusionCSAtM
  nlinarith

theorem exclusion_ps_dominates_continuum {d : ℝ}
    (hd : |d| ≤ continuumDmax) :
    continuumPS d < exclusionPSAtM := by
  have hd2 := continuum_abs_bound_implies_sq_lt_twelve hd
  unfold continuumPS exclusionPSAtM
  nlinarith

-- Planner-threshold algebra. These certify the sign switches of the reduced
-- planner objectives, not the economic derivation of those planner objectives.
def fixedLocationPlannerReduced (lam x : ℝ) : ℝ :=
  (x ^ 2 + (1 - x) ^ 2) / 2 * (1 / lam - 1)

def firstBestReduced (lam x : ℝ) : ℝ :=
  (x ^ 2 + (1 - x) ^ 2) * (1 / (2 * lam) - 1 / 4)

theorem fixed_location_coefficient_sign {lam : ℝ} (hlam : 0 < lam) :
    (0 < 1 / lam - 1 ↔ lam < 1) := by
  constructor
  · intro h
    have := (lt_div_iff₀ hlam).mpr (show lam < 1 from by nlinarith)
    nlinarith
  · intro h
    have hinv : 1 < 1 / lam := by
      exact (lt_div_iff₀ hlam).2 h
    linarith

theorem first_best_coefficient_sign {lam : ℝ} (hlam : 0 < lam) :
    (0 < 1 / (2 * lam) - 1 / 4 ↔ lam < 2) := by
  constructor
  · intro h
    have h2 : 0 < 2 * lam := by positivity
    have hineq : lam < 2 := by
      have hpos : 0 < 1 / (2 * lam) - 1 / 4 := h
      field_simp [ne_of_gt hlam] at hpos
      nlinarith
    exact hineq
  · intro h
    have h2 : 0 < 2 * lam := by positivity
    have hpos : 0 < 1 / (2 * lam) - 1 / 4 := by
      apply sub_pos.mpr
      rw [lt_div_iff₀ h2]
      nlinarith
    exact hpos

-- Exact t>0 dimensionless rescaling identities for threshold statements.
theorem linear_transport_threshold_rescaling {lam t theta : ℝ}
    (ht : 0 < t) (hdef : theta = lam * t) :
    (theta < lambdaC ↔ lam * t < lambdaC) ∧
    (theta = lambdaM ↔ lam * t = lambdaM) ∧
    (theta ≤ lambdaE ↔ lam * t ≤ lambdaE) := by
  subst theta
  simp

end CompleteEquilibriumFormal
