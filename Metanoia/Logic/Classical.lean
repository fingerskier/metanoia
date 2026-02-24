-- ============================================================================
-- Metanoia.Logic.Classical — Classical Logic
-- ============================================================================
-- Everything so far has been constructive/intuitionistic logic — proofs that
-- actually CONSTRUCT the thing they claim exists.
--
-- Classical logic adds the law of excluded middle: P ∨ ¬P for any P.
-- This lets you do proof by contradiction and double negation elimination.
--
-- Philosophically interesting: constructivists reject these!
-- In Lean, classical reasoning requires `open Classical`.
--
-- Key tactics:
--   by_contra h   — "assume the negation, derive contradiction"
--   by_cases h : P — "split into P true vs P false"
-- ============================================================================

namespace Metanoia.Logic.Classical

open Classical

-- ──────────────────────────────────────────────
-- § 1. Excluded Middle and Its Consequences
-- ──────────────────────────────────────────────

-- 1.1 Double negation elimination: ¬¬P → P
-- Difficulty: ★★
-- Hint: `by_contra` assumes ¬P, you have ¬¬P, contradiction
-- Note: this is UNPROVABLE without classical logic!
theorem dne (P : Prop) : ¬¬P → P := by
  sorry

-- 1.2 The missing De Morgan: ¬(P ∧ Q) → ¬P ∨ ¬Q
-- Difficulty: ★★★
-- Hint: use `by_cases` on P
theorem not_and_implies_or_not (P Q : Prop) : ¬(P ∧ Q) → ¬P ∨ ¬Q := by
  sorry

-- 1.3 P → Q is equivalent to ¬P ∨ Q (classically)
-- Difficulty: ★★★
theorem imp_iff_not_or (P Q : Prop) : (P → Q) ↔ (¬P ∨ Q) := by
  sorry

-- 1.4 Peirce's law: ((P → Q) → P) → P
-- Difficulty: ★★★★
-- This is a classic challenge. Unprovable constructively.
theorem peirce (P Q : Prop) : ((P → Q) → P) → P := by
  sorry

-- ──────────────────────────────────────────────
-- § 2. Proof by Contradiction
-- ──────────────────────────────────────────────

-- 2.1 If ¬P → False, then P
-- Difficulty: ★★
theorem by_contradiction' (P : Prop) (h : ¬P → False) : P := by
  sorry

-- 2.2 There's no largest natural number
-- Difficulty: ★★★
theorem no_largest_nat : ¬ ∃ n : Nat, ∀ m : Nat, m ≤ n := by
  sorry

end Metanoia.Logic.Classical
