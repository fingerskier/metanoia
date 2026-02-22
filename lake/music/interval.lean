-- ============================================================================
-- MattLib.Music.Interval — Music Theory in Lean
-- ============================================================================
-- Formalizing the mathematics of music. Intervals are frequency ratios,
-- stacking intervals is multiplication, and the Pythagorean comma is
-- a provable theorem about why perfect tuning is impossible.
--
-- As a songwriter, you'll appreciate that these aren't abstract exercises —
-- they're the mathematical reasons your guitar sounds the way it does.
-- ============================================================================

namespace MattLib.Music

-- ──────────────────────────────────────────────
-- § 1. Intervals as Ratios
-- ──────────────────────────────────────────────

-- An interval is a ratio of two positive natural numbers
structure Interval where
  num : Nat
  den : Nat
  num_pos : num > 0
  den_pos : den > 0

-- Equality of intervals (same ratio)
def Interval.eq_ratio (a b : Interval) : Prop :=
  a.num * b.den = b.num * a.den

-- The fundamental intervals in just intonation
def unison : Interval := ⟨1, 1, by omega, by omega⟩
def octave : Interval := ⟨2, 1, by omega, by omega⟩
def fifth : Interval := ⟨3, 2, by omega, by omega⟩
def fourth : Interval := ⟨4, 3, by omega, by omega⟩
def majorThird : Interval := ⟨5, 4, by omega, by omega⟩
def minorThird : Interval := ⟨6, 5, by omega, by omega⟩
def majorSixth : Interval := ⟨5, 3, by omega, by omega⟩

-- ──────────────────────────────────────────────
-- § 2. Stacking Intervals
-- ──────────────────────────────────────────────

-- Stacking = multiplying ratios (going up by interval a then b)
def stack (a b : Interval) : Interval where
  num := a.num * b.num
  den := a.den * b.den
  num_pos := Nat.mul_pos a.num_pos b.num_pos
  den_pos := Nat.mul_pos a.den_pos b.den_pos

-- Inversion = flipping the ratio (going down instead of up)
def invert (a : Interval) : Interval where
  num := a.den
  den := a.num
  num_pos := a.den_pos
  den_pos := a.num_pos

-- Stack n copies of the same interval
def stackN (i : Interval) : Nat → Interval
  | 0 => unison
  | n + 1 => stack i (stackN i n)

-- ──────────────────────────────────────────────
-- § 3. Theorems About Intervals
-- ──────────────────────────────────────────────

-- 3.1 Stacking with unison changes nothing
-- Difficulty: ★★
theorem stack_unison_right (a : Interval) :
    (stack a unison).eq_ratio a := by
  unfold stack unison Interval.eq_ratio
  simp
  sorry

-- 3.2 A fourth + a fifth = an octave
-- Difficulty: ★★★
-- 4/3 × 3/2 = 12/6, and 2/1 = 2/1, so 12 × 1 = 2 × 6 ✓
theorem fourth_plus_fifth_eq_octave :
    (stack fourth fifth).eq_ratio octave := by
  unfold stack fourth fifth octave Interval.eq_ratio
  -- This should reduce to 12 * 1 = 2 * 6
  sorry

-- 3.3 A major third + a minor third = a fifth
-- Difficulty: ★★★
-- 5/4 × 6/5 = 30/20, and 3/2 → 30 × 2 = 3 × 20 ✓
theorem major_minor_third_eq_fifth :
    (stack majorThird minorThird).eq_ratio fifth := by
  sorry

-- 3.4 Inverting an interval and stacking gives unison
-- Difficulty: ★★★
theorem stack_invert (a : Interval) :
    (stack a (invert a)).eq_ratio unison := by
  sorry

-- ──────────────────────────────────────────────
-- § 4. The Pythagorean Comma
-- ──────────────────────────────────────────────
-- This is the BIG result. 12 perfect fifths ≠ 7 octaves.
-- 3^12 / 2^12 ≠ 2^7 / 1
-- 531441 / 4096 ≠ 128 / 1
-- 531441 × 1 ≠ 128 × 4096
-- 531441 ≠ 524288  ✓ They differ!
--
-- This is WHY equal temperament exists. You can't have all
-- perfect fifths AND close the circle of fifths. Something
-- has to give. Every tuning system is a compromise.

-- 4.1 12 fifths is NOT 7 octaves
-- Difficulty: ★★★
-- This should be decidable by computation
theorem pythagorean_comma :
    ¬ (stackN fifth 12).eq_ratio (stackN octave 7) := by
  unfold stackN stack fifth octave unison Interval.eq_ratio
  simp
  sorry  -- should reduce to ¬ (531441 * 1 = 128 * 4096), i.e. 531441 ≠ 524288

-- 4.2 The syntonic comma: 4 fifths ≠ 2 octaves + major third
-- This is the other famous comma in music theory
-- Difficulty: ★★★
theorem syntonic_comma :
    ¬ (stackN fifth 4).eq_ratio (stack (stackN octave 2) majorThird) := by
  sorry

-- ──────────────────────────────────────────────
-- § 5. Scale Construction (Stretch Goals)
-- ──────────────────────────────────────────────

-- A scale is a list of intervals from the root
def Scale := List Interval

-- Major scale in just intonation (relative to root)
def majorScale : Scale := [
  unison,                             -- 1:  C
  ⟨9, 8, by omega, by omega⟩,        -- 2:  D  (9/8)
  majorThird,                         -- 3:  E  (5/4)
  fourth,                             -- 4:  F  (4/3)
  fifth,                              -- 5:  G  (3/2)
  majorSixth,                         -- 6:  A  (5/3)
  ⟨15, 8, by omega, by omega⟩,       -- 7:  B  (15/8)
  octave                              -- 8:  C' (2/1)
]

-- 5.1 The major scale has 8 notes (including octave)
-- Difficulty: ★
theorem major_scale_length : majorScale.length = 8 := by
  sorry

end MattLib.Music
