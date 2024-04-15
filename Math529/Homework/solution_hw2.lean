import Library.Basic
import Mathlib.Tactic
import AutograderLib
import Mathlib.Topology.Instances.Real

set_option warningAsError false

open Set Filter Topology

/-! # Homework 2
Write your proofs in convernitonal (on paper) form for each of the problems first.  Then fill in the LEAN proofs below, replacing `sorry`.

You can __comment out__ `import AutograderLib`, while you are writing your solution.
Do not forget to __uncomment it__, before you save and submit your solution to Gradescope.
-/

-- Some functions you might find useful:
#check Nat.cast_nonneg      -- Nat.cast_nonneg (n : ℕ) : 0 ≤ ↑n
#check Nat.cast_add_one_pos -- Nat.cast_add_one_pos (n : ℕ) : 0 < ↑n + 1
#check Nat.cast_le -- Nat.cast_le {m n : ℕ} : ↑m ≤ ↑n ↔ m ≤ n
#check Nat.ceil

#check Metric.tendsto_atTop -- Metric.tendsto_atTop : Tendsto u atTop (𝓝 a) ↔ ∀ ε > 0, ∃ N, ∀ n ≥ N, dist (u n) a < ε


@[autograded 10]
theorem problem1 : Tendsto (fun x : ℕ ↦ (x : ℝ) / (x+1)) atTop (𝓝 1)
:= by
  have hsimp (x : ℕ) : (x:ℝ)/(x+1) = 1 - 1/(x+1) := by calc
    (x:ℝ) / (x + 1) = (x+1 -1)/(x+1) := by ring
              _ = (x+1)/(x+1) - 1 / (x + 1) := by apply sub_div
              _ = 1 - 1 / (x+1) := by
               rw [div_self _]
               intro h
               rw [← eq_neg_iff_add_eq_zero] at h
               let hh : 0 ≤ (x:ℝ) := Nat.cast_nonneg x
               linarith
  rw [Metric.tendsto_atTop]
  intro ε hε
  dsimp [dist]
  use (Nat.ceil ε⁻¹)
  intro n hn
  simp [hsimp]
  rw [abs_of_pos (by apply inv_pos.mpr;apply Nat.cast_add_one_pos)]
  apply inv_lt_of_inv_lt hε
  apply lt_of_le_of_lt (Nat.le_ceil ε⁻¹)
  apply lt_of_le_of_lt (by apply Nat.cast_le.mpr; apply hn) (by apply lt_add_one)
