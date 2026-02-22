-- Model a three-valued logic (true, false, unknown)
inductive TruthVal where
  | t | f | u

-- Define connectives for this logic
def tvNot : TruthVal → TruthVal
  | .t => .f
  | .f => .t
  | .u => .u  -- not-unknown = unknown

-- Now prove properties of this alternative logic
-- e.g., excluded middle FAILS in this system:
theorem no_excluded_middle_3val : 
    ¬ (∀ p : TruthVal, p = .t ∨ tvNot p = .t) := by
  intro h
  have := h .u
  cases this with
  | inl h => exact absurd h (by decide)
  | inr h => exact absurd h (by decide)
