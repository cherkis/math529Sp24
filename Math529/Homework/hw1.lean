import Mathlib.Tactic
import AutograderLib

/-! # Homework 1
Write your proofs in convernitonal (on paper) form for each of the problems first.  Then fill in the LEAN proofs below, replacing `sorry`.

You can comment out `import AutograderLib`, while you are writing your solution.
Do not forget to uncomment it, before you save and submit your solution to Gradescope.
-/

@[autograded 5]
theorem problem1 {a b : ℝ} : (∀ ε > 0, a < b + ε) → a ≤ b := by
sorry



@[autograded 5]
theorem problem2 {p q r : Prop} : p ∧ ¬ (q ∨ r) ↔ (p ∧ ¬ q) ∧ (p ∧ ¬ r) := by
sorry
