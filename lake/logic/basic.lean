-- ============================================================================
-- MattLib.Logic.Basic — Propositional Logic
-- ============================================================================
-- START HERE. These are the simplest possible proofs.
-- Each one teaches you a core tactic.
--
-- Key tactics you'll learn:
--   intro    — "assume the hypothesis"
--   exact    — "this term is exactly the proof"
--   apply    — "use this implication to reduce the goal"
--   cases    — "split into cases"
--   constructor — "prove both halves" (for ∧)
--   left/right  — "pick a side" (for ∨)
--
-- The VS Code infoview panel (Ctrl+Shift+Enter) is your best friend.
-- It shows the proof state after each tactic.
-- ============================================================================

namespace MattLib.Logic

-- ──────────────────────────────────────────────
-- § 1. Implication (→)
-- ──────────────────────────────────────────────

-- 1.1 Identity: P implies P
-- Difficulty: ★
-- Hint: you already have a proof of P, just hand it over
theorem imp_self (P : Prop) : P → P := by
  sorry

-- 1.2 Modus ponens: if P→Q and P, then Q
-- Difficulty: ★
-- Hint: apply the implication to the proof of P
theorem modus_ponens (P Q : Prop) : (P → Q) → P → Q := by
  sorry

-- 1.3 Hypothetical syllogism: P→Q and Q→R gives P→R
-- Difficulty: ★★
-- Hint: intro all your hypotheses, then chain the implications
theorem syllogism (P Q R : Prop) : (P → Q) → (Q → R) → P → R := by
  sorry

-- 1.4 Implication is transitive (same as syllogism but good practice)
-- Difficulty: ★★
theorem imp_trans (P Q R : Prop) (hpq : P → Q) (hqr : Q → R) : P → R := by
  sorry

-- ──────────────────────────────────────────────
-- § 2. Conjunction (∧)
-- ──────────────────────────────────────────────

-- 2.1 And introduction: given P and Q separately, produce P ∧ Q
-- Difficulty: ★
-- Hint: use `constructor` to split the goal, or use ⟨_, _⟩ syntax
theorem and_intro (P Q : Prop) (hp : P) (hq : Q) : P ∧ Q := by
  sorry

-- 2.2 And elimination (left): extract P from P ∧ Q
-- Difficulty: ★
-- Hint: use `cases h with | intro left right => ...` or `h.1`
theorem and_left (P Q : Prop) (h : P ∧ Q) : P := by
  sorry

-- 2.3 And elimination (right)
-- Difficulty: ★
theorem and_right (P Q : Prop) (h : P ∧ Q) : Q := by
  sorry

-- 2.4 And is commutative
-- Difficulty: ★★
-- Hint: destructure the input, reconstruct in opposite order
theorem and_comm' (P Q : Prop) : P ∧ Q → Q ∧ P := by
  sorry

-- 2.5 And is associative
-- Difficulty: ★★
theorem and_assoc' (P Q R : Prop) : (P ∧ Q) ∧ R → P ∧ (Q ∧ R) := by
  sorry

-- ──────────────────────────────────────────────
-- § 3. Disjunction (∨)
-- ──────────────────────────────────────────────

-- 3.1 Or introduction (left): P gives P ∨ Q
-- Difficulty: ★
-- Hint: use `left` or `Or.inl`
theorem or_inl (P Q : Prop) (hp : P) : P ∨ Q := by
  sorry

-- 3.2 Or introduction (right)
-- Difficulty: ★
theorem or_inr (P Q : Prop) (hq : Q) : P ∨ Q := by
  sorry

-- 3.3 Or is commutative
-- Difficulty: ★★
-- Hint: cases on the hypothesis, then use left/right
theorem or_comm' (P Q : Prop) : P ∨ Q → Q ∨ P := by
  sorry

-- 3.4 Or elimination: if P→R and Q→R and P∨Q, then R
-- Difficulty: ★★
theorem or_elim (P Q R : Prop) (hpr : P → R) (hqr : Q → R) (hpq : P ∨ Q) : R := by
  sorry

-- ──────────────────────────────────────────────
-- § 4. Negation (¬)
-- ──────────────────────────────────────────────
-- Remember: ¬P is DEFINED as P → False
-- So `intro h` on a ¬P goal gives you `h : P` and goal `False`

-- 4.1 Modus tollens: P→Q and ¬Q gives ¬P
-- Difficulty: ★★
-- Hint: unfold what ¬ means. You need to show P → False.
theorem modus_tollens (P Q : Prop) (hpq : P → Q) (hnq : ¬Q) : ¬P := by
  sorry

-- 4.2 Contradiction: P and ¬P gives anything
-- Difficulty: ★★
-- Hint: apply ¬P to P to get False, then False gives anything
theorem absurd' (P Q : Prop) (hp : P) (hnp : ¬P) : Q := by
  sorry

-- 4.3 Contrapositive: (P → Q) → (¬Q → ¬P)
-- Difficulty: ★★
theorem contrapositive (P Q : Prop) : (P → Q) → (¬Q → ¬P) := by
  sorry

-- 4.4 ¬False is provable (True)
-- Difficulty: ★
theorem not_false' : ¬False := by
  sorry

-- ──────────────────────────────────────────────
-- § 5. Iff (↔)
-- ──────────────────────────────────────────────
-- P ↔ Q means (P → Q) ∧ (Q → P)

-- 5.1 Iff is reflexive
-- Difficulty: ★
theorem iff_refl (P : Prop) : P ↔ P := by
  sorry

-- 5.2 Iff is symmetric
-- Difficulty: ★★
theorem iff_symm (P Q : Prop) : (P ↔ Q) → (Q ↔ P) := by
  sorry

-- 5.3 Iff is transitive
-- Difficulty: ★★★
theorem iff_trans (P Q R : Prop) : (P ↔ Q) → (Q ↔ R) → (P ↔ R) := by
  sorry

-- ──────────────────────────────────────────────
-- § 6. De Morgan's Laws
-- ──────────────────────────────────────────────

-- 6.1 ¬(P ∨ Q) → ¬P ∧ ¬Q
-- Difficulty: ★★★
theorem not_or_implies_and_not (P Q : Prop) : ¬(P ∨ Q) → ¬P ∧ ¬Q := by
  sorry

-- 6.2 ¬P ∧ ¬Q → ¬(P ∨ Q)
-- Difficulty: ★★★
theorem and_not_implies_not_or (P Q : Prop) : ¬P ∧ ¬Q → ¬(P ∨ Q) := by
  sorry

-- 6.3 ¬P ∨ ¬Q → ¬(P ∧ Q)
-- Difficulty: ★★★
theorem or_not_implies_not_and (P Q : Prop) : ¬P ∨ ¬Q → ¬(P ∧ Q) := by
  sorry

-- NOTE: The reverse direction ¬(P ∧ Q) → ¬P ∨ ¬Q requires classical logic.
-- You'll prove it in Classical.lean!

end MattLib.Logic
