-- ============================================================================
-- Metanoia.Algebra.Group — Group Theory from Scratch
-- ============================================================================
-- This is where abstract algebra begins. You'll define what a group IS
-- and derive consequences from the axioms alone.
--
-- A group (G, ·, e, ⁻¹) satisfies:
--   1. Associativity: (a · b) · c = a · (b · c)
--   2. Left identity: e · a = a
--   3. Left inverse: a⁻¹ · a = e
--
-- From JUST these three, you can derive right identity, right inverse,
-- uniqueness of identity, cancellation laws, and more.
-- That's the beauty of abstract algebra.
-- ============================================================================

namespace Metanoia.Algebra

-- Our own group definition (not using Mathlib's)
class MyGroup (G : Type) where
  op : G → G → G          -- the group operation
  e : G                    -- identity element
  inv : G → G             -- inverse
  op_assoc : ∀ a b c : G, op (op a b) c = op a (op b c)
  e_op : ∀ a : G, op e a = a
  inv_op : ∀ a : G, op (inv a) a = e

-- Convenient notation within this namespace
scoped infixl:70 " ⊙ " => MyGroup.op
scoped prefix:max "ι" => MyGroup.inv

-- ──────────────────────────────────────────────
-- § 1. Basic Consequences of the Axioms
-- ──────────────────────────────────────────────

variable {G : Type} [MyGroup G]

-- 1.1 Right identity: a ⊙ e = a
-- Difficulty: ★★★★
-- This is surprisingly tricky! You only have LEFT identity as an axiom.
-- Hint: consider a⁻¹ ⊙ a, and use associativity creatively
theorem op_e (a : G) : a ⊙ MyGroup.e = a := by
  sorry

-- 1.2 Right inverse: a ⊙ a⁻¹ = e
-- Difficulty: ★★★★
-- Same situation — you only have left inverse
theorem op_inv (a : G) : a ⊙ (ι a) = MyGroup.e := by
  sorry

-- 1.3 Inverse of inverse: (a⁻¹)⁻¹ = a
-- Difficulty: ★★★
-- Hint: show that a acts as a left inverse for a⁻¹
theorem inv_inv (a : G) : ι (ι a) = a := by
  sorry

-- 1.4 Inverse of product: (a ⊙ b)⁻¹ = b⁻¹ ⊙ a⁻¹
-- Difficulty: ★★★★
-- Note the order reversal! (Like taking off socks and shoes)
theorem inv_op_rev (a b : G) : ι (a ⊙ b) = (ι b) ⊙ (ι a) := by
  sorry

-- 1.5 Left cancellation: a ⊙ b = a ⊙ c → b = c
-- Difficulty: ★★★
theorem left_cancel (a b c : G) (h : a ⊙ b = a ⊙ c) : b = c := by
  sorry

-- 1.6 Right cancellation: b ⊙ a = c ⊙ a → b = c
-- Difficulty: ★★★
theorem right_cancel (a b c : G) (h : b ⊙ a = c ⊙ a) : b = c := by
  sorry

-- 1.7 Identity is unique: if e' ⊙ a = a for all a, then e' = e
-- Difficulty: ★★★
theorem identity_unique (e' : G) (h : ∀ a : G, e' ⊙ a = a) :
    e' = MyGroup.e := by
  sorry

-- ──────────────────────────────────────────────
-- § 2. Examples of Groups
-- ──────────────────────────────────────────────

-- 2.1 The integers under addition form a group
-- Difficulty: ★★★
-- (Uses Int, not Nat, since Nat has no inverses!)
instance : MyGroup Int where
  op := (· + ·)
  e := 0
  inv := (- ·)
  op_assoc := by sorry
  e_op := by sorry
  inv_op := by sorry

-- 2.2 The trivial group: a single element
-- Difficulty: ★★
instance : MyGroup Unit where
  op := fun _ _ => ()
  e := ()
  inv := fun _ => ()
  op_assoc := by sorry
  e_op := by sorry
  inv_op := by sorry

-- ──────────────────────────────────────────────
-- § 3. Subgroups and Homomorphisms (Stretch)
-- ──────────────────────────────────────────────

-- A group homomorphism preserves the operation
structure Homomorphism (G H : Type) [MyGroup G] [MyGroup H] where
  f : G → H
  preserves_op : ∀ a b : G, f (a ⊙ b) = f a ⊙ f b

-- 3.1 A homomorphism sends identity to identity
-- Difficulty: ★★★★
theorem hom_preserves_identity (G H : Type) [MyGroup G] [MyGroup H]
    (φ : Homomorphism G H) : φ.f MyGroup.e = MyGroup.e := by
  sorry

-- 3.2 A homomorphism preserves inverses
-- Difficulty: ★★★★
theorem hom_preserves_inv (G H : Type) [MyGroup G] [MyGroup H]
    (φ : Homomorphism G H) (a : G) : φ.f (ι a) = ι (φ.f a) := by
  sorry

end Metanoia.Algebra
