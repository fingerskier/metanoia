-- MattLib/Music/Interval.lean
namespace MattLib.Music

-- An interval as a frequency ratio
structure Interval where
  num : Nat  
  den : Nat
  den_pos : den > 0

def octave : Interval := ⟨2, 1, by omega⟩
def fifth : Interval := ⟨3, 2, by omega⟩
def fourth : Interval := ⟨4, 3, by omega⟩
def majorThird : Interval := ⟨5, 4, by omega⟩

-- Stacking intervals = multiplying ratios

-- 23. A fourth + a fifth = an octave
-- (4/3 × 3/2 = 2/1)

-- 24. The Pythagorean comma: 12 fifths ≠ 7 octaves
-- 3^12 / 2^12 ≠ 2^7  →  531441 ≠ 524288
-- This is WHY equal temperament exists!

end MattLib.Music
