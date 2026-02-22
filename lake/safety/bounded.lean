-- ============================================================================
-- MattLib.Safety.Bounded — Verified Bounded Values
-- ============================================================================
-- Types that carry their own proof of being within bounds.
-- Directly applicable to your actuator control:
--   load cell readings, force limits, actuator positions.
--
-- The idea: instead of checking bounds at runtime and hoping you
-- didn't miss a case, make out-of-bounds values UNREPRESENTABLE.
-- ============================================================================

namespace MattLib.Safety

-- ──────────────────────────────────────────────
-- § 1. Bounded Natural Numbers
-- ──────────────────────────────────────────────

-- A natural number guaranteed to be within [lo, hi]
structure Bounded (lo hi : Nat) where
  val : Nat
  ge_lo : val ≥ lo
  le_hi : val ≤ hi

-- 1.1 Clamping always produces a valid bounded value
-- Difficulty: ★★
def clamp (lo hi : Nat) (x : Nat) (h : lo ≤ hi) : Bounded lo hi where
  val := max lo (min hi x)
  ge_lo := by sorry
  le_hi := by sorry

-- 1.2 Adding two bounded values gives predictable bounds
-- Difficulty: ★★★
def addBounded (a : Bounded lo1 hi1) (b : Bounded lo2 hi2) :
    Bounded (lo1 + lo2) (hi1 + hi2) where
  val := a.val + b.val
  ge_lo := by sorry
  le_hi := by sorry

-- 1.3 A bounded value is always within the range
-- Difficulty: ★★
theorem bounded_in_range (b : Bounded lo hi) : lo ≤ b.val ∧ b.val ≤ hi := by
  sorry

-- ──────────────────────────────────────────────
-- § 2. Force Limits (Your Domain!)
-- ──────────────────────────────────────────────

-- Force in newtons, bounded by the system's safe operating range
-- For OsteoStrong, let's say 0 to 10000 N
abbrev SafeForce := Bounded 0 10000

-- A load cell reading
structure LoadReading where
  force : Nat          -- newtons
  timestamp : Nat      -- milliseconds

-- The load threshold above which we consider "user is pushing"
def LOAD_THRESHOLD : Nat := 10

def loadDetected (r : LoadReading) : Prop := r.force ≥ LOAD_THRESHOLD

-- 2.1 Zero force means no load detected
-- Difficulty: ★★
theorem no_load_at_zero : ¬ loadDetected ⟨0, 0⟩ := by
  sorry

-- 2.2 Any force ≥ threshold means load IS detected
-- Difficulty: ★★
theorem load_above_threshold (r : LoadReading) (h : r.force ≥ LOAD_THRESHOLD) :
    loadDetected r := by
  sorry

-- ──────────────────────────────────────────────
-- § 3. Position Bounds
-- ──────────────────────────────────────────────

-- Actuator position in mm, bounded by mechanical limits
-- Say 0 to 500 mm of travel
abbrev SafePosition := Bounded 0 500

-- 3.1 Moving by a small delta stays within bounds (if there's room)
-- Difficulty: ★★★★
theorem move_within_bounds (pos : SafePosition) (delta : Nat)
    (h_room : pos.val + delta ≤ 500) :
    ∃ newPos : SafePosition, newPos.val = pos.val + delta := by
  sorry

end MattLib.Safety
