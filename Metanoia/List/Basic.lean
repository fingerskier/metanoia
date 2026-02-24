-- ============================================================================
-- Metanoia.List.Basic — Properties of Lists
-- ============================================================================
-- Lists bridge math and programming. You're proving properties of
-- data structures — the same kind of thing you work with daily in JS,
-- but with mathematical certainty.
--
-- Lists in Lean:
--   inductive List (α : Type) where
--     | nil : List α                        -- []
--     | cons (head : α) (tail : List α)     -- x :: xs
-- ============================================================================

namespace Metanoia.List

-- ──────────────────────────────────────────────
-- § 1. Length
-- ──────────────────────────────────────────────

-- 1.1 Length of empty list is 0
-- Difficulty: ★
theorem length_nil (α : Type) : ([] : List α).length = 0 := by
  sorry

-- 1.2 Length of cons
-- Difficulty: ★
theorem length_cons (α : Type) (x : α) (xs : List α) :
    (x :: xs).length = xs.length + 1 := by
  sorry

-- 1.3 Length of append
-- Difficulty: ★★
theorem length_append (α : Type) (xs ys : List α) :
    (xs ++ ys).length = xs.length + ys.length := by
  sorry

-- ──────────────────────────────────────────────
-- § 2. Append Properties
-- ──────────────────────────────────────────────

-- 2.1 Appending nil on the right is identity
-- Difficulty: ★★
theorem append_nil (α : Type) (xs : List α) : xs ++ [] = xs := by
  sorry

-- 2.2 Append is associative
-- Difficulty: ★★★
theorem append_assoc (α : Type) (xs ys zs : List α) :
    (xs ++ ys) ++ zs = xs ++ (ys ++ zs) := by
  sorry

-- ──────────────────────────────────────────────
-- § 3. Reverse
-- ──────────────────────────────────────────────

-- 3.1 Reversing nil is nil
-- Difficulty: ★
theorem reverse_nil (α : Type) : ([] : List α).reverse = [] := by
  sorry

-- 3.2 Length is preserved by reverse
-- Difficulty: ★★★
theorem length_reverse (α : Type) (xs : List α) :
    xs.reverse.length = xs.length := by
  sorry

-- 3.3 Reverse of reverse is identity (hard!)
-- Difficulty: ★★★★
-- Hint: you may need a helper lemma about reverse and append
theorem reverse_reverse (α : Type) (xs : List α) :
    xs.reverse.reverse = xs := by
  sorry

-- ──────────────────────────────────────────────
-- § 4. Map
-- ──────────────────────────────────────────────

-- 4.1 Map preserves length
-- Difficulty: ★★
theorem length_map (α β : Type) (f : α → β) (xs : List α) :
    (xs.map f).length = xs.length := by
  sorry

-- 4.2 Map distributes over append
-- Difficulty: ★★★
theorem map_append (α β : Type) (f : α → β) (xs ys : List α) :
    (xs ++ ys).map f = xs.map f ++ ys.map f := by
  sorry

-- 4.3 Map composition: map g (map f xs) = map (g ∘ f) xs
-- Difficulty: ★★★
-- This is the functor law!
theorem map_map (α β γ : Type) (f : α → β) (g : β → γ) (xs : List α) :
    (xs.map f).map g = xs.map (g ∘ f) := by
  sorry

-- ──────────────────────────────────────────────
-- § 5. Membership
-- ──────────────────────────────────────────────

-- 5.1 Head is a member
-- Difficulty: ★★
theorem mem_cons_self (α : Type) (x : α) (xs : List α) :
    x ∈ (x :: xs) := by
  sorry

-- 5.2 Membership is preserved by append (left)
-- Difficulty: ★★★
theorem mem_append_left (α : Type) (x : α) (xs ys : List α) 
    (h : x ∈ xs) : x ∈ (xs ++ ys) := by
  sorry

end Metanoia.List
