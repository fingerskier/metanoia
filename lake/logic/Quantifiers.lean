-- ============================================================================
-- MattLib.Logic.Quantifiers — Universal and Existential Quantifiers
-- ============================================================================
-- Now we move from propositions to predicates — statements about THINGS.
--
-- Key tactics you'll learn:
--   intro x      — "let x be arbitrary" (for ∀ goals)
--   use t        — "the witness is t" (for ∃ goals)
--   obtain       — destructure existential hypotheses
--   specialize   — apply a ∀ to a specific value
-- ============================================================================

namespace MattLib.Logic.Quantifiers

-- ──────────────────────────────────────────────
-- § 1. Universal Quantifier (∀)
-- ──────────────────────────────────────────────

-- 1.1 If everything is P, and everything P is Q, then everything is Q
-- Difficulty: ★★
theorem forall_imp {α : Type} (P Q : α → Prop)
    (h : ∀ x, P x → Q x) (hp : ∀ x, P x) : ∀ x, Q x := by
  sorry

-- 1.2 ∀ distributes over ∧
-- Difficulty: ★★
theorem forall_and {α : Type} (P Q : α → Prop)
    (h : ∀ x, P x ∧ Q x) : (∀ x, P x) ∧ (∀ x, Q x) := by
  sorry

-- ──────────────────────────────────────────────
-- § 2. Existential Quantifier (∃)
-- ──────────────────────────────────────────────

-- 2.1 There exists a natural number greater than 3
-- Difficulty: ★
-- Hint: use `use 4` to provide the witness
theorem exists_gt_three : ∃ n : Nat, n > 3 := by
  sorry

-- 2.2 If P x holds for some specific x, then ∃ x, P x
-- Difficulty: ★
theorem exists_intro {α : Type} (P : α → Prop) (a : α) (h : P a) : ∃ x, P x := by
  sorry

-- 2.3 If ∃ x, P x ∧ Q x, then ∃ x, P x
-- Difficulty: ★★
-- Hint: use `obtain ⟨x, hpx, hqx⟩ := h` to destructure
theorem exists_and_left {α : Type} (P Q : α → Prop)
    (h : ∃ x, P x ∧ Q x) : ∃ x, P x := by
  sorry

-- 2.4 ∃ distributes over ∨ (one direction)
-- Difficulty: ★★★
theorem exists_or_distrib {α : Type} (P Q : α → Prop)
    (h : ∃ x, P x ∨ Q x) : (∃ x, P x) ∨ (∃ x, Q x) := by
  sorry

-- ──────────────────────────────────────────────
-- § 3. Mixing ∀ and ∃
-- ──────────────────────────────────────────────

-- 3.1 ∀∃ to ∃∀ does NOT hold in general, but this weaker version does:
-- If ∀ x, P x, then ∃ x, P x (assuming the type is nonempty)
-- Difficulty: ★★
theorem forall_implies_exists {α : Type} [Nonempty α] (P : α → Prop)
    (h : ∀ x, P x) : ∃ x, P x := by
  sorry

-- 3.2 Negation of ∃ is ∀¬
-- Difficulty: ★★★
theorem not_exists_iff_forall_not {α : Type} (P : α → Prop) :
    (¬ ∃ x, P x) ↔ ∀ x, ¬ P x := by
  sorry

end MattLib.Logic.Quantifiers
