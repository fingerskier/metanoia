-- MattLib/Nat/Basic.lean
namespace MattLib.Nat

-- Start by proving things about addition from scratch
-- (Lean already has these, but proving them yourself is the point)

-- 9. Zero is a right identity: n + 0 = n

-- 10. Zero is a left identity: 0 + n = n  
-- This one needs induction because addition is defined 
-- recursively on the LEFT argument

-- 11. Successor distributes: n + succ m = succ (n + m)

-- 12. Addition is commutative: m + n = n + m
-- This is a real workout — needs induction and previous lemmas

-- 13. Addition is associative
-- 14. A classic: sum of first n naturals
def sumTo : Nat → Nat
  | 0 => 0
  | n + 1 => (n + 1) + sumTo n
