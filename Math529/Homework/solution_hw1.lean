import Mathlib.Tactic
import AutograderLib
--import Mathlib.Data.Real.Basic


/-! # Homework 1
Write your proofs in convernitonal (on paper) form for each of the problems first.  Then fill in the LEAN proofs below, replacing `sorry`.

You can comment out `import AutograderLib`, while you are writing your solution.
Do not forget to uncomment it, before you save and submit your solution to Gradescope.
-/

@[autograded 5]
theorem problem1 {a b : ℝ} : (∀ ε > 0, a < b + ε) → a ≤ b := by
  contrapose!
  intro hba
  let δ := (a-b)/2
  use δ
  constructor
  . apply div_pos
    linarith
    norm_num
  simp [δ]
  linarith
  done



@[autograded 5]
theorem problem2 {p q r : Prop} : p ∧ ¬ (q ∨ r) ↔ (p ∧ ¬ q) ∧ (p ∧ ¬ r) := by
  constructor
  . rintro ⟨hp, hnqr⟩
    constructor
    <;> use hp
    <;>  intro h
    <;>  apply hnqr
    . left
      exact h
    . right
      exact h
  . rintro ⟨⟨hp,hnq⟩,_,hnr⟩
    use hp
    intro hqor
    rcases hqor with hh | hh
    . exact hnq hh
    exact hnr hh
  done
