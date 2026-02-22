-- MattLib/Safety/Bounded.lean
namespace MattLib.Safety

-- A value that's guaranteed to be within bounds
structure Bounded (lo hi : Int) where
  val : Int
  ge_lo : val ≥ lo
  le_hi : val ≤ hi

-- 25. Clamping always produces a bounded value

-- 26. Adding two bounded values has predictable bounds

-- This is directly applicable to your load cell readings,
-- actuator positions, force limits...

end MattLib.Safety
