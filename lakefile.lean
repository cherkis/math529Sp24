import Lake
open Lake DSL

package Math529SP24 where
  moreServerOptions := #[
    ⟨`linter.unusedVariables, false⟩, -- ignores unused variables
    ⟨`quotPrecheck, false⟩,
    ⟨`warningAsError, false⟩,
    ⟨`pp.unicode.fun, true⟩  -- pretty-prints `fun a ↦ b`
  ]

lean_lib Library

@[default_target]
lean_lib Math529Sp24 where
  globs := #[.submodules `Math496T]
  moreLeanArgs := #[
    "-Dlinter.unusedVariables=false", -- ignores unused variables
    "-DquotPrecheck=false",
    "-DwarningAsError=false",
    "-Dpp.unicode.fun=true"  -- pretty-prints `fun a ↦ b`
  ]

/-
want also
"-Dpush_neg.use_distrib=true", -- negates ¬(P ∧ Q) to (¬ P ∨ ¬ Q)
but currently only Lean core options can be set in lakefile
-/

require mathlib from git "https://github.com/leanprover-community/mathlib4" @ s!"v{Lean.versionString}"
require autograder from git "https://github.com/robertylewis/lean4-autograder-main" @ "master"
