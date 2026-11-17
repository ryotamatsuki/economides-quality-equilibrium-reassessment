import Mathlib

noncomputable section
namespace ShortNoteFormal

-- Reduced game after the analytically established price continuation.
-- x = lambda * a; payoffs scaled by 18 * lambda^2.
def low (l x : ℝ) : ℝ := -9*l*x^2
def mid (l x y : ℝ) : ℝ := (3*l+x-y)^2-9*l*x^2
def high (l x y : ℝ) : ℝ := 18*l*(x-y-l)-9*l*x^2
def payoff (l x y : ℝ) : ℝ :=
  if x-y ≤ -3*l then low l x else
  if x-y ≤ 3*l then mid l x y else high l x y
def BR (l x y : ℝ) : Prop :=
  0 ≤ x ∧ ∀ z : ℝ, 0 ≤ z → payoff l z y ≤ payoff l x y
def NE (l x y : ℝ) : Prop := BR l x y ∧ BR l y x

theorem lower_cut (l y : ℝ) : low l (y-3*l) = mid l (y-3*l) y := by
  unfold low mid
  ring
theorem upper_cut (l y : ℝ) : mid l (y+3*l) y = high l (y+3*l) y := by
  unfold mid high
  ring
theorem high_gap (l x y : ℝ) : high l 1 y - high l x y = 9*l*(x-1)^2 := by
  unfold high
  ring
theorem zero_rival_mid_gap (l x : ℝ) :
    mid l (3*l) 0 - mid l x 0 = (3*l-x)*(9*l-27*l^2+(1-9*l)*x) := by
  unfold mid
  ring
theorem zero_rival_boundary_gap (l : ℝ) :
    high l 1 0 - mid l (3*l) 0 = 9*l*(3*l-1)^2 := by
  unfold high mid
  ring
theorem high_rival_mid_gap (l x : ℝ) :
    mid l (1-3*l) 1 - mid l x 1 =
      (x-(1-3*l))*((9*l-1)*(x-(1-3*l))+18*l*(1-3*l)) := by
  unfold mid
  ring
theorem high_rival_boundary (l : ℝ) : mid l (1-3*l) 1 = -9*l*(1-3*l)^2 := by
  unfold mid
  ring
theorem high_rival_exclusion_gap (l x : ℝ) : -high l x 1 = 9*l*((x-1)^2+1+2*l) := by
  unfold high
  ring
theorem symmetric_mid_gap (l x : ℝ) :
    mid l (1/3) (1/3) - mid l x (1/3) = (9*l-1)*(x-1/3)^2 := by
  unfold mid
  ring
theorem symmetric_regime_gain (l : ℝ) :
    high l 1 (1/3) - mid l (1/3) (1/3) = l*(4-27*l) := by
  unfold high mid
  ring
theorem local_increment (l x y h : ℝ) :
    mid l (x+h) y - mid l x y =
      2*h*(3*l+(1-9*l)*x-y)+(1-9*l)*h^2 := by
  unfold mid
  ring

lemma payoff_low {l x y : ℝ} (h : x-y ≤ -3*l) :
    payoff l x y = low l x := by simp [payoff,h]
lemma payoff_mid {l x y : ℝ} (h1 : -3*l < x-y) (h2 : x-y ≤ 3*l) :
    payoff l x y = mid l x y := by simp [payoff,not_le.mpr h1,h2]
lemma payoff_high {l x y : ℝ} (hl : 0 < l) (h : 3*l < x-y) :
    payoff l x y = high l x y := by
  have hn : ¬ x-y ≤ -3*l := by linarith
  simp [payoff,hn,not_le.mpr h]

lemma high_strict {l x y : ℝ} (hl : 0 < l) (hx : x ≠ 1) :
    high l x y < high l 1 y := by
  have hp : 0 < (x-1)^2 := sq_pos_of_ne_zero (sub_ne_zero.mpr hx)
  have hm := mul_pos (show 0 < 9*l by positivity) hp
  linarith [high_gap l x y]

lemma zero_strict {l x : ℝ} (hlo : 1/9 < l) (hhi : l < 2/9)
    (hx : 0 ≤ x) (hne : x ≠ 1) : payoff l x 0 < payoff l 1 0 := by
  have hl : 0 < l := by linarith
  rw [payoff_high hl (show 3*l < (1:ℝ)-0 by linarith)]
  by_cases hc : x ≤ 3*l
  · rw [payoff_mid (show -3*l < x-0 by linarith) (by linarith)]
    have hco : 0 < 9*l-1 := by linarith
    have hm := mul_le_mul_of_nonneg_right hc (le_of_lt hco)
    have hfact : 0 ≤ 9*l-27*l^2+(1-9*l)*x := by
      nlinarith [hm, mul_pos hl (show 0 < 2-9*l by linarith)]
    have hm2 := mul_nonneg (sub_nonneg.mpr hc) hfact
    have hpos : 0 < (3*l-1)^2 := sq_pos_of_ne_zero (by linarith)
    have hm3 := mul_pos (show 0 < 9*l by positivity) hpos
    linarith [zero_rival_mid_gap l x,zero_rival_boundary_gap l]
  · rw [payoff_high hl (by linarith)]
    exact high_strict hl hne

theorem br_zero_iff {l : ℝ} (hlo : 1/9 < l) (hhi : l < 2/9) (x : ℝ) :
    BR l x 0 ↔ x=1 := by
  constructor
  · intro h
    by_contra hn
    have hh := h.2 1 (by norm_num)
    exact (not_lt_of_ge hh) (zero_strict hlo hhi h.1 hn)
  · rintro rfl
    refine ⟨by norm_num, ?_⟩
    intro z hz
    by_cases hn : z=1
    · simp [hn]
    · exact le_of_lt (zero_strict hlo hhi hz hn)

lemma one_strict {l x : ℝ} (hlo : 1/9 < l) (hhi : l < 2/9)
    (hx : 0 < x) : payoff l x 1 < payoff l 0 1 := by
  have hl : 0 < l := by linarith
  have hb : 0 < 1-3*l := by linarith
  rw [payoff_low (show (0:ℝ)-1 ≤ -3*l by linarith)]
  norm_num [low]
  by_cases hleft : x-1 ≤ -3*l
  · rw [payoff_low hleft]
    unfold low
    have h := mul_pos (show 0 < 9*l by positivity) (sq_pos_of_pos hx)
    linarith
  · by_cases hmid : x-1 ≤ 3*l
    · rw [payoff_mid (lt_of_not_ge hleft) hmid]
      have hd : 0 ≤ x-(1-3*l) := by linarith
      have hco : 0 ≤ 9*l-1 := by linarith
      have hp := mul_nonneg hco hd
      have hp2 := mul_nonneg (show 0 ≤ 18*l by positivity) (le_of_lt hb)
      have hfac : 0 ≤ (9*l-1)*(x-(1-3*l))+18*l*(1-3*l) := add_nonneg hp hp2
      have hg := mul_nonneg hd hfac
      have ht := mul_pos (show 0 < 9*l by positivity) (sq_pos_of_pos hb)
      linarith [high_rival_mid_gap l x,high_rival_boundary l]
    · rw [payoff_high hl (lt_of_not_ge hmid)]
      have ht : 0 < (x-1)^2+1+2*l := by nlinarith [sq_nonneg (x-1)]
      have hp := mul_pos (show 0 < 9*l by positivity) ht
      linarith [high_rival_exclusion_gap l x]

theorem br_one_iff {l : ℝ} (hlo : 1/9 < l) (hhi : l < 2/9) (x : ℝ) :
    BR l x 1 ↔ x=0 := by
  constructor
  · intro h
    by_contra hn
    have hp : 0 < x := lt_of_le_of_ne h.1 (Ne.symm hn)
    exact (not_lt_of_ge (h.2 0 (by norm_num))) (one_strict hlo hhi hp)
  · rintro rfl
    refine ⟨by norm_num, ?_⟩
    intro z hz
    by_cases hn : z=0
    · simp [hn]
    · exact le_of_lt (one_strict hlo hhi (lt_of_le_of_ne hz (Ne.symm hn)))

theorem br_symmetric_iff {l : ℝ} (hlo : 1/9 < l) (hhi : l < 2/9) :
    BR l (1/3) (1/3) ↔ 4/27 ≤ l := by
  have hl : 0 < l := by linarith
  have hs : payoff l (1/3) (1/3) = mid l (1/3) (1/3) :=
    payoff_mid (by linarith) (by linarith)
  have h1 : payoff l 1 (1/3) = high l 1 (1/3) :=
    payoff_high hl (by linarith)
  constructor
  · intro hb
    have hh := hb.2 1 (by norm_num)
    rw [h1,hs] at hh
    by_contra hn
    have hp := mul_pos hl (show 0 < 4-27*l by linarith)
    linarith [symmetric_regime_gain l]
  · intro hc
    refine ⟨by norm_num, ?_⟩
    intro z hz
    rw [hs]
    by_cases hlow : z-1/3 ≤ -3*l
    · rw [payoff_low hlow]
      unfold low mid
      have hp := mul_nonneg (show 0 ≤ 9*l by positivity) (sq_nonneg z)
      have hv := mul_pos hl (show 0 < 9*l-1 by linarith)
      nlinarith
    · by_cases hmid : z-1/3 ≤ 3*l
      · rw [payoff_mid (lt_of_not_ge hlow) hmid]
        have hp := mul_nonneg (show 0 ≤ 9*l-1 by linarith) (sq_nonneg (z-1/3))
        linarith [symmetric_mid_gap l z]
      · rw [payoff_high hl (lt_of_not_ge hmid)]
        have hp := mul_nonneg (show 0 ≤ 9*l by positivity) (sq_nonneg (z-1))
        have hg := mul_nonpos_of_nonneg_of_nonpos (le_of_lt hl) (show 4-27*l ≤ 0 by linarith)
        linarith [high_gap l z (1/3),symmetric_regime_gain l]

theorem excluded_not_BR {l x y : ℝ}
    (hl : 0 < l) (hx : 0 < x) (hex : x-y ≤ -3*l) : ¬ BR l x y := by
  intro hb
  have hy : (0:ℝ)-y ≤ -3*l := by linarith
  have hz := hb.2 0 (by norm_num)
  rw [payoff_low hex, payoff_low hy] at hz
  have hp := mul_pos (show 0 < 9*l by positivity) (sq_pos_of_pos hx)
  unfold low at hz
  nlinarith

-- Local optimality on the open middle branch: two small feasible deviations.
lemma interior_foc {l x y : ℝ} (hlo : 1/9 < l) (hb : BR l x y)
    (hx : 0 < x) (hleft : -3*l < x-y) (hright : x-y < 3*l) :
    (9*l-1)*x+y = 3*l := by
  let d : ℝ := 3*l+(1-9*l)*x-y
  have hc : 0 < 9*l-1 := by linarith
  have hcur := payoff_mid hleft (le_of_lt hright)
  have hdz : d=0 := by
    by_contra hn
    have hd : 0 < |d| := abs_pos.mpr hn
    let e : ℝ := min (x/2) (min ((x-y+3*l)/2) (min ((3*l-(x-y))/2) (|d|/(9*l-1))))
    have he : 0 < e := by
      dsimp [e]
      exact lt_min (by linarith) (lt_min (by linarith) (lt_min (by linarith) (div_pos hd hc)))
    have he1 : e ≤ x/2 := min_le_left _ _
    have he2 : e ≤ (x-y+3*l)/2 := le_trans (min_le_right _ _) (min_le_left _ _)
    have he3 : e ≤ (3*l-(x-y))/2 :=
      le_trans (min_le_right _ _) (le_trans (min_le_right _ _) (min_le_left _ _))
    have he4 : e ≤ |d|/(9*l-1) :=
      le_trans (min_le_right _ _) (le_trans (min_le_right _ _) (min_le_right _ _))
    have hm : e*(9*l-1) ≤ |d| := (le_div_iff₀ hc).mp he4
    rcases lt_or_gt_of_ne hn with hneg | hpos
    · have hh := hb.2 (x-e) (by linarith)
      rw [payoff_mid (show -3*l < x-e-y by linarith) (show x-e-y ≤ 3*l by linarith),hcur] at hh
      rw [abs_of_neg hneg] at hm
      have hgain : 0 < e*(-2*d-(9*l-1)*e) := mul_pos he (by linarith)
      have hid : mid l (x-e) y-mid l x y = e*(-2*d-(9*l-1)*e) := by
        dsimp [d]
        unfold mid
        ring
      linarith
    · have hh := hb.2 (x+e) (by linarith)
      rw [payoff_mid (show -3*l < x+e-y by linarith) (show x+e-y ≤ 3*l by linarith),hcur] at hh
      rw [abs_of_pos hpos] at hm
      have hgain : 0 < e*(2*d-(9*l-1)*e) := mul_pos he (by linarith)
      have hid : mid l (x+e) y-mid l x y = e*(2*d-(9*l-1)*e) := by
        dsimp [d]
        unfold mid
        ring
      linarith
  dsimp [d] at hdz
  linarith

theorem regular_symmetry {l x y : ℝ}
    (hlo : 1/9 < l) (hhi : l < 2/9)
    (hx : (9*l-1)*x+y = 3*l) (hy : (9*l-1)*y+x = 3*l) :
    x=1/3 ∧ y=1/3 := by
  have hp : (9*l-2)*(x-y)=0 := by nlinarith [hx,hy]
  have hn : 9*l-2 ≠ 0 := by linarith
  have hd := (mul_eq_zero.mp hp).resolve_left hn
  have hsame : x=y := by linarith
  have hprod : l*(3*x-1)=0 := by rw [← hsame] at hx; nlinarith
  have hxx := (mul_eq_zero.mp hprod).resolve_left (show l ≠ 0 by linarith)
  constructor <;> linarith

theorem complete_pure_quality_NE {l : ℝ}
    (hlo : 1/9 < l) (hhi : l < 2/9) (x y : ℝ) :
    NE l x y ↔ (x=1 ∧ y=0) ∨ (x=0 ∧ y=1) ∨
      (4/27 ≤ l ∧ x=1/3 ∧ y=1/3) := by
  have hl : 0 < l := by linarith
  constructor
  · rintro ⟨hb1,hb2⟩
    by_cases hx : x=0
    · subst x
      exact Or.inr (Or.inl ⟨rfl,(br_zero_iff hlo hhi y).mp hb2⟩)
    by_cases hy : y=0
    · subst y
      exact Or.inl ⟨(br_zero_iff hlo hhi x).mp hb1,rfl⟩
    have xp : 0 < x := lt_of_le_of_ne hb1.1 (Ne.symm hx)
    have yp : 0 < y := lt_of_le_of_ne hb2.1 (Ne.symm hy)
    have h1 : -3*l < x-y := by
      by_contra! hh
      exact excluded_not_BR hl xp hh hb1
    have h2 : -3*l < y-x := by
      by_contra! hh
      exact excluded_not_BR hl yp hh hb2
    have fx := interior_foc hlo hb1 xp h1 (by linarith)
    have fy := interior_foc hlo hb2 yp h2 (by linarith)
    obtain ⟨sx,sy⟩ := regular_symmetry hlo hhi fx fy
    rw [sx,sy] at hb1
    exact Or.inr (Or.inr ⟨(br_symmetric_iff hlo hhi).mp hb1,sx,sy⟩)
  · rintro (⟨rfl,rfl⟩ | ⟨rfl,rfl⟩ | ⟨hc,rfl,rfl⟩)
    · exact ⟨(br_zero_iff hlo hhi 1).mpr rfl,(br_one_iff hlo hhi 0).mpr rfl⟩
    · exact ⟨(br_one_iff hlo hhi 0).mpr rfl,(br_zero_iff hlo hhi 1).mpr rfl⟩
    · exact ⟨(br_symmetric_iff hlo hhi).mpr hc,(br_symmetric_iff hlo hhi).mpr hc⟩

#print axioms br_zero_iff
#print axioms br_one_iff
#print axioms br_symmetric_iff
#print axioms interior_foc
#print axioms complete_pure_quality_NE
end ShortNoteFormal
