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
sorry
