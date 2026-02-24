-- ====================================================================
-- Metanoia.Nat.Basic — Natural Number Arithmetic
-- ====================================================================
-- Here you'll prove fundamental properties of addition and multiplication.
-- This is where you learn INDUCTION — the most important proof technique.
--
-- In Lean, Nat is defined as:
--   inductive Nat where
--     | zero : Nat
--     | succ (n : Nat) : Nat
--
-- Addition is defined recursively:
--   0 + n = n                    (by definition)
--   (succ m) + n = succ (m + n)  (by definition)
--
-- Key tactics:
--   induction n with             — structural induction
--   | zero => ...                — base case
--   | succ n ih => ...           — inductive step (ih = inductive hypothesis)
--   omega                        — solves linear arithmetic automatically
--   ring                         — solves ring equations automatically
--   simp                         — simplification
-- ============================================================================

namespace Metanoia.Nat

-- ──────────────────────────────────────────────
-- § 1. Addition Properties
-- ──────────────────────────────────────────────

-- 1.1 n + 0 = n (right identity)
-- Difficulty: ★
-- Hint: this is true by DEFINITION of Nat.add. Try `rfl`.
theorem add_zero' (n : Nat) : n + 0 = n := by
  rfl

-- 1.2 0 + n = n (left identity)
-- Difficulty: ★★
-- Hint: this one NEEDS induction! Why? Because + is defined by
-- recursion on the LEFT argument. 0 + n doesn't simplify directly.
theorem zero_add' (n : Nat) : 0 + n = n := by
  sorry

-- 1.3 succ m + n = succ (m + n)
-- Difficulty: ★
theorem succ_add' (m n : Nat) : Nat.succ m + n = Nat.succ (m + n) := by
  sorry

-- 1.4 m + succ n = succ (m + n)
-- Difficulty: ★★
theorem add_succ' (m n : Nat) : m + Nat.succ n = Nat.succ (m + n) := by
  sorry

-- 1.5 Addition is commutative: m + n = n + m
-- Difficulty: ★★★
-- This is a real milestone. You'll need induction and previous lemmas.
theorem add_comm' (m n : Nat) : m + n = n + m := by
  sorry

-- 1.6 Addition is associative: (a + b) + c = a + (b + c)
-- Difficulty: ★★★
theorem add_assoc' (a b c : Nat) : a + b + c = a + (b + c) := by
  sorry

-- ──────────────────────────────────────────────
-- § 2. Multiplication Properties
-- ──────────────────────────────────────────────

-- 2.1 n * 0 = 0
-- Difficulty: ★
theorem mul_zero' (n : Nat) : n * 0 = 0 := by
  sorry

-- 2.2 0 * n = 0
-- Difficulty: ★★
theorem zero_mul' (n : Nat) : 0 * n = 0 := by
  sorry

-- 2.3 n * 1 = n
-- Difficulty: ★★
theorem mul_one' (n : Nat) : n * 1 = n := by
  sorry

-- 2.4 1 * n = n
-- Difficulty: ★★
theorem one_mul' (n : Nat) : 1 * n = n := by
  sorry

-- 2.5 Multiplication distributes over addition (left)
-- Difficulty: ★★★
-- n * (m + k) = n * m + n * k
theorem mul_add' (n m k : Nat) : n * (m + k) = n * m + n * k := by
  sorry

-- 2.6 Multiplication is commutative
-- Difficulty: ★★★★
-- This is a boss fight. You'll need several helper lemmas.
theorem mul_comm' (m n : Nat) : m * n = n * m := by
  sorry

-- ──────────────────────────────────────────────
-- § 3. Ordering
-- ──────────────────────────────────────────────

-- 3.1 Every natural number is ≥ 0
-- Difficulty: ★
theorem zero_le' (n : Nat) : 0 ≤ n := by
  sorry

-- 3.2 If a ≤ b and b ≤ c then a ≤ c
-- Difficulty: ★★
-- Hint: `omega` can handle this, but try doing it by hand first
theorem le_trans' (a b c : Nat) (hab : a ≤ b) (hbc : b ≤ c) : a ≤ c := by
  sorry

-- 3.3 n ≤ n + m
-- Difficulty: ★★
theorem le_add_right' (n m : Nat) : n ≤ n + m := by
  sorry

end Metanoia.Nat
