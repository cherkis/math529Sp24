import AutograderLib
import Mathlib.Tactic

/-! # Homework 1
To begin with let prove the basic properties of ∧, ∨, and ¬.
-/

section

variable (P Q R : Prop)

-- Commutativity
@[autograded 5]
theorem problem1 : P ∧ Q ↔ Q ∧ P := by
  constructor
  . intro ⟨hp,hq⟩; exact ⟨hq,hp⟩
  . intro ⟨hq,hp⟩; exact ⟨hp,hq⟩
  done

@[autograded 5]
theorem problem2 : P ∨ Q ↔ Q ∨ P := by
  constructor
  . rintro (hp | hq)
    right
    exact hp
    left
    exact hq
  . rintro (hq | hp)
    right
    exact hq
    left
    exact hp
  done

 -- Associativity
@[autograded 5]
theorem problem3 : (P ∧ Q) ∧ R ↔ Q ∧ (P ∧ R) := by
  constructor
  . rintro ⟨⟨hp, hq⟩, hr⟩
    exact ⟨hq,hp,hr⟩
  . rintro ⟨hq,hp,hr⟩
    exact ⟨⟨hp,hq⟩,hr⟩
  done

@[autograded 5]
theorem problem4 : (P ∨ Q) ∨ R ↔ Q ∨ (P ∨ R) := by
  constructor
  . rintro ((hp | hq) | hr)
    . right; left; exact hp
    . left; exact hq
    . right; right; exact hr
  . rintro (hq | hp | hr)
    . left; right; exact hq
    . left; left; exact hp
    . right; exact hr
  done

-- Distributivity of ∧ over ∨
@[autograded 5]
theorem problem5 : P ∧ (Q ∨ R) ↔ (P ∧ Q) ∨ (P ∧ R) := by
  constructor
  rintro ⟨hp,hq | hr⟩
  . left; exact ⟨hp,hq⟩
  . right; exact ⟨hp,hr⟩
  rintro (⟨hp,hq⟩ | ⟨hp, hr⟩)
  . constructor; exact hp; left; exact hq
  . constructor; exact hp; right; exact hr
  done

-- Distributivity of ∨ over ∧
@[autograded 5]
theorem problem6 : P ∨ (Q ∧ R) ↔ (P ∨ Q) ∧ (P ∨ R) := by
  constructor
  rintro (hp | ⟨hq,hr⟩)
  . constructor
    left; exact hp
    left; exact hp
  . constructor
    right; exact hq
    right; exact hr
  rintro ⟨hp | hq, hp' | hr⟩
  . left; exact hp
  . left; exact hp
  . left; exact hp'
  . right; exact ⟨hq,hr⟩
  done

@[autograded 5]
theorem problem7 : P ∧ ¬ Q → ¬ (P → Q) := by
  intro ⟨hp,nq⟩ h
  apply nq
  apply h
  exact hp
  done

@[autograded 5]
theorem problem8 : ∀ S : Prop, ¬ P → (P → S) := by
  intro hs np hp
  contradiction
  done

-- This might require some logical thinking first
@[autograded 5]
theorem problem9 : ∃ Q, ∀ P, P ∨ Q ↔ Q := by
  use True
  intro P
  constructor
  . intro h; trivial
  . intro h; right; exact h
  done

@[autograded 5]
theorem problem10 : ∃ Q, ∀ P, P ∨ Q ↔ P := by
  use False
  intro P
  constructor
  . rintro (hp | f)
    exact hp
    contradiction
  . intro hp
    left
    exact hp
  done


end
