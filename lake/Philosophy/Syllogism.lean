-- ============================================================================
-- MattLib.Philosophy.Syllogism — Aristotelian Logic in Lean
-- ============================================================================
-- Aristotle identified valid argument forms 2400 years ago.
-- Let's formalize them and prove they're valid.
--
-- A syllogism has:
--   - A major premise (general rule)
--   - A minor premise (specific case)
--   - A conclusion
--
-- There are 24 valid forms. We'll do the most famous ones.
-- ============================================================================

namespace MattLib.Philosophy

-- We work with a universe of "things" and predicates on them
variable {Thing : Type}

-- ──────────────────────────────────────────────
-- § 1. The Four Categorical Propositions
-- ──────────────────────────────────────────────
-- A: All S are P          ∀ x, S x → P x
-- E: No S are P           ∀ x, S x → ¬ P x
-- I: Some S are P         ∃ x, S x ∧ P x
-- O: Some S are not P     ∃ x, S x ∧ ¬ P x

-- ──────────────────────────────────────────────
-- § 2. First Figure Syllogisms
-- ──────────────────────────────────────────────

-- BARBARA (AAA-1): The most famous syllogism
-- All M are P.  All S are M.  Therefore, all S are P.
-- "All men are mortal. Socrates is a man. Therefore Socrates is mortal."
-- Difficulty: ★★
theorem barbara (S M P : Thing → Prop)
    (major : ∀ x, M x → P x)
    (minor : ∀ x, S x → M x) :
    ∀ x, S x → P x := by
  sorry

-- CELARENT (EAE-1):
-- No M are P.  All S are M.  Therefore, no S are P.
-- Difficulty: ★★
theorem celarent (S M P : Thing → Prop)
    (major : ∀ x, M x → ¬ P x)
    (minor : ∀ x, S x → M x) :
    ∀ x, S x → ¬ P x := by
  sorry

-- DARII (AII-1):
-- All M are P.  Some S are M.  Therefore, some S are P.
-- Difficulty: ★★★
theorem darii (S M P : Thing → Prop)
    (major : ∀ x, M x → P x)
    (minor : ∃ x, S x ∧ M x) :
    ∃ x, S x ∧ P x := by
  sorry

-- FERIO (EIO-1):
-- No M are P.  Some S are M.  Therefore, some S are not P.
-- Difficulty: ★★★
theorem ferio (S M P : Thing → Prop)
    (major : ∀ x, M x → ¬ P x)
    (minor : ∃ x, S x ∧ M x) :
    ∃ x, S x ∧ ¬ P x := by
  sorry

-- ──────────────────────────────────────────────
-- § 3. Second Figure Syllogisms
-- ──────────────────────────────────────────────

-- CESARE (EAE-2):
-- No P are M.  All S are M.  Therefore, no S are P.
-- Difficulty: ★★★
theorem cesare (S M P : Thing → Prop)
    (major : ∀ x, P x → ¬ M x)
    (minor : ∀ x, S x → M x) :
    ∀ x, S x → ¬ P x := by
  sorry

-- CAMESTRES (AEE-2):
-- All P are M.  No S are M.  Therefore, no S are P.
-- Difficulty: ★★★
theorem camestres (S M P : Thing → Prop)
    (major : ∀ x, P x → M x)
    (minor : ∀ x, S x → ¬ M x) :
    ∀ x, S x → ¬ P x := by
  sorry

-- ──────────────────────────────────────────────
-- § 4. Invalid Syllogisms (Fallacies!)
-- ──────────────────────────────────────────────
-- These CANNOT be proven. Try and see why!
-- Demonstrating that Lean rejects bad arguments is just as
-- valuable as proving good ones.

-- AFFIRMING THE CONSEQUENT (invalid!)
-- All M are P.  x is P.  Therefore x is M.
-- "All dogs are animals. This is an animal. Therefore this is a dog."
-- Difficulty: ★★ (to understand WHY it fails)
-- Uncomment and try — you'll get stuck, which is the point!
-- theorem affirming_consequent (M P : Thing → Prop) (x : Thing)
--     (major : M x → P x)
--     (minor : P x) :
--     M x := by
--   sorry  -- unprovable! P x doesn't give you M x

-- UNDISTRIBUTED MIDDLE (invalid!)
-- Some M are P.  Some S are M.  Therefore some S are P.
-- The M's that are P might be DIFFERENT from the M's that are S.
-- theorem undistributed_middle (S M P : Thing → Prop)
--     (major : ∃ x, M x ∧ P x)
--     (minor : ∃ x, S x ∧ M x) :
--     ∃ x, S x ∧ P x := by
--   sorry  -- unprovable!

-- ──────────────────────────────────────────────
-- § 5. Beyond Syllogisms
-- ──────────────────────────────────────────────

-- HYPOTHETICAL SYLLOGISM: If P then Q. If Q then R. Therefore if P then R.
-- Difficulty: ★★
theorem hypothetical_syllogism (P Q R : Prop)
    (h1 : P → Q) (h2 : Q → R) : P → R := by
  sorry

-- DISJUNCTIVE SYLLOGISM: P or Q. Not P. Therefore Q.
-- Difficulty: ★★
theorem disjunctive_syllogism (P Q : Prop)
    (h1 : P ∨ Q) (h2 : ¬P) : Q := by
  sorry

-- CONSTRUCTIVE DILEMMA: P→Q. R→S. P∨R. Therefore Q∨S.
-- Difficulty: ★★★
theorem constructive_dilemma (P Q R S : Prop)
    (h1 : P → Q) (h2 : R → S) (h3 : P ∨ R) : Q ∨ S := by
  sorry

-- REDUCTIO AD ABSURDUM: If assuming P leads to False, then ¬P.
-- Difficulty: ★★
theorem reductio (P : Prop) (h : P → False) : ¬P := by
  sorry

-- ──────────────────────────────────────────────
-- § 6. The Naturalistic Fallacy (Formalized)
-- ──────────────────────────────────────────────
-- "X is natural, therefore X is good" — this is a logical gap.
-- We can SHOW it's a gap by demonstrating that no proof exists
-- without an additional axiom bridging "natural" and "good."

-- Notice: this theorem REQUIRES the bridge axiom.
-- Without it, the conclusion doesn't follow.
-- The bridge axiom IS the thing being smuggled in by the fallacy.
theorem natural_implies_good_WITH_bridge
    (natural good : Thing → Prop)
    (bridge : ∀ x, natural x → good x)  -- the smuggled premise!
    (x : Thing) (h : natural x) : good x := by
  sorry

-- Exercise for reflection: try removing the bridge axiom.
-- You'll find it's impossible to prove — that's the formalized fallacy.

end MattLib.Philosophy
