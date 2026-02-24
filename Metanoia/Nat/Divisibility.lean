-- ============================================================================
-- Metanoia.Nat.Divisibility — Divides, GCD, and Primes
-- ============================================================================
-- Number theory! This module builds toward primes.
-- Great practice for working with existential quantifiers.
-- ============================================================================

namespace Metanoia.Nat.Divisibility

-- ──────────────────────────────────────────────
-- § 1. Divisibility
-- ──────────────────────────────────────────────

-- We define our own "divides" to practice
def divides (d n : Nat) : Prop := ∃ k, n = d * k

-- Notation: we'll write d ∣∣ n to avoid conflict with Lean's built-in
notation:50 d " ∣∣ " n => divides d n

-- 1.1 Everything divides 0
-- Difficulty: ★
-- Hint: `use 0`
theorem divides_zero (d : Nat) : d ∣∣ 0 := by
  sorry

-- 1.2 1 divides everything
-- Difficulty: ★
theorem one_divides (n : Nat) : 1 ∣∣ n := by
  sorry

-- 1.3 Everything divides itself
-- Difficulty: ★
theorem divides_refl (n : Nat) : n ∣∣ n := by
  sorry

-- 1.4 Divisibility is transitive
-- Difficulty: ★★★
-- Hint: unfold the ∃, multiply the witnesses
theorem divides_trans (a b c : Nat) (hab : a ∣∣ b) (hbc : b ∣∣ c) : a ∣∣ c := by
  sorry

-- 1.5 If d divides a and b, then d divides a + b
-- Difficulty: ★★★
theorem divides_add (d a b : Nat) (ha : d ∣∣ a) (hb : d ∣∣ b) : d ∣∣ (a + b) := by
  sorry

-- 1.6 If d divides a and b, then d divides a * n + b
-- Difficulty: ★★★
theorem divides_mul_add (d a b n : Nat) (ha : d ∣∣ a) (hb : d ∣∣ b) :
    d ∣∣ (a * n + b) := by
  sorry

-- ──────────────────────────────────────────────
-- § 2. Even and Odd
-- ──────────────────────────────────────────────

def isEven (n : Nat) : Prop := 2 ∣∣ n
def isOdd (n : Nat) : Prop := ∃ k, n = 2 * k + 1

-- 2.1 Zero is even
-- Difficulty: ★
theorem zero_even : isEven 0 := by
  sorry

-- 2.2 The sum of two even numbers is even
-- Difficulty: ★★★
theorem even_add_even (a b : Nat) (ha : isEven a) (hb : isEven b) :
    isEven (a + b) := by
  sorry

-- 2.3 The product of any number with an even number is even
-- Difficulty: ★★★
theorem mul_even (a b : Nat) (hb : isEven b) : isEven (a * b) := by
  sorry

-- ──────────────────────────────────────────────
-- § 3. Primes (Stretch Goals)
-- ──────────────────────────────────────────────

def isPrime (p : Nat) : Prop :=
  p ≥ 2 ∧ ∀ d : Nat, divides d p → d = 1 ∨ d = p

-- 3.1 2 is prime
-- Difficulty: ★★★★
-- Hint: you need to show for any d, if d divides 2, then d = 1 or d = 2
-- `omega` helps a lot here
theorem two_prime : isPrime 2 := by
  sorry

-- 3.2 3 is prime
-- Difficulty: ★★★★
theorem three_prime : isPrime 3 := by
  sorry

-- 3.3 Infinitude of primes (the big one — come back to this late!)
-- Difficulty: ★★★★★
-- Euclid's proof: take the product of all known primes, add 1,
-- any prime factor of the result is a new prime.
-- theorem infinite_primes : ∀ n : Nat, ∃ p : Nat, isPrime p ∧ p > n := by
--   sorry

end Metanoia.Nat.Divisibility
