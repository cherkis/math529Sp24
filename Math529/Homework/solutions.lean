import Mathlib.Tactic
import Mathlib.Data.Real.Basic
import AutograderLib

/-! # Homework 0
You can easily solve the first problem using `linarith`.  See if you can solve it without `linarith` by using concrete theorems and hypotheses. Then the same solution applies to the more general second problem.
 -/

section
variable (a b c d e : ℝ )

@[autograded 5]
theorem problem1 (h₁ : a ≤ b) (h₂ : b < c) (h₃ : c < d) (h₄ : d ≤ e): a < e := by
  linarith
  done

end

section

variable {α : Type*} [PartialOrder α]
variable (a b c d e : α)

@[autograded 5]
theorem problem2 (h₁ : a ≤ b) (h₂ : b < c) (h₃ : c < d) (h₄ : d ≤ e): a < e := by
  apply lt_of_le_of_lt h₁
  apply lt_of_lt_of_le _ h₄
  apply lt_trans h₂  h₃
  done

end
#check LE ℝ
