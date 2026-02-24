-- ============================================================================
-- Metanoia.Nat.Induction — Classic Induction Proofs
-- ============================================================================
-- Now that you know the basics of induction, here are some famous results.
-- These are "real math" — things you'd see in a discrete math textbook.
-- ============================================================================

namespace Metanoia.Nat.Induction

-- ──────────────────────────────────────────────
-- § 1. Summation Formulas
-- ──────────────────────────────────────────────

-- Sum of first n natural numbers
def sumTo : Nat → Nat
  | 0 => 0
  | n + 1 => (n + 1) + sumTo n

-- 1.1 Gauss's formula: sum of 1..n = n(n+1)/2
-- Difficulty: ★★★
-- We prove 2 * sumTo n = n * (n + 1) to avoid division
-- Hint: `omega` is very helpful in the inductive step
theorem gauss_sum (n : Nat) : 2 * sumTo n = n * (n + 1) := by
  induction n with
  | zero => rfl
  | succ n ih =>
    simp [sumTo]
    sorry  -- work it out from ih

-- Sum of first n squares
def sumSquares : Nat → Nat
  | 0 => 0
  | n + 1 => (n + 1) * (n + 1) + sumSquares n

-- 1.2 Sum of squares formula: 6 * sumSquares n = n * (n+1) * (2n+1)
-- Difficulty: ★★★★
theorem sum_squares_formula (n : Nat) :
    6 * sumSquares n = n * (n + 1) * (2 * n + 1) := by
  sorry

-- ──────────────────────────────────────────────
-- § 2. Fibonacci
-- ──────────────────────────────────────────────

def fib : Nat → Nat
  | 0 => 0
  | 1 => 1
  | n + 2 => fib (n + 1) + fib n

-- 2.1 fib is monotonically nondecreasing (for n ≥ 1)
-- Difficulty: ★★★★
theorem fib_mono (n : Nat) : fib n ≤ fib (n + 1) := by
  sorry

-- 2.2 fib grows: fib (n+1) ≥ n for small n
-- (The real bound is exponential, but this is a starter)
-- Difficulty: ★★★
theorem fib_ge_one (n : Nat) (h : n ≥ 1) : fib n ≥ 1 := by
  sorry

-- ──────────────────────────────────────────────
-- § 3. Powers and Exponentiation
-- ──────────────────────────────────────────────

-- 3.1 2^n > n for all n
-- Difficulty: ★★★★
-- This is a classic — proves exponentials dominate linear functions
theorem two_pow_gt (n : Nat) : 2 ^ n > n := by
  sorry

-- 3.2 x^(m+n) = x^m * x^n
-- Difficulty: ★★★
theorem pow_add (x m n : Nat) : x ^ (m + n) = x ^ m * x ^ n := by
  sorry

-- ──────────────────────────────────────────────
-- § 4. Strong Induction
-- ──────────────────────────────────────────────

-- Regular induction: assume P(n), prove P(n+1)
-- Strong induction: assume P(k) for ALL k < n, prove P(n)
-- Lean supports this via `Nat.strongRecOn` or well-founded recursion

-- 4.1 Every natural number ≥ 2 is either prime or has a prime factor
-- Difficulty: ★★★★★ (stretch goal!)
-- This needs strong induction and is a real challenge.
-- Come back to this after you've done the Divisibility module.

end Metanoia.Nat.Induction
