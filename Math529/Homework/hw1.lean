import Mathlib.Tactic
import AutograderLib

/-! # Homework 1
-/

@[autograded 5]
theorem problem1 {a b : ℝ} : (∀ ε > 0, a < b + ε) → a ≤ b := by
sorry



@[autograded 5]
theorem problem2 {p q r : Prop} : p ∧ ¬ (q ∨ r) ↔ (p ∧ ¬ q) ∧ (p ∧ ¬ r) := by
sorry
