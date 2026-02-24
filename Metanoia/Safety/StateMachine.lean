-- ============================================================================
-- Metanoia.Safety.StateMachine — Verified Actuator State Machine
-- ============================================================================
-- This is the formalization of your actual control system!
-- We model the actuator states, define valid transitions, and prove
-- the core safety invariant: load and movement are mutually exclusive.
-- ============================================================================

import Metanoia.Safety.Bounded

namespace Metanoia.Safety.StateMachine

open Metanoia.Safety

-- ──────────────────────────────────────────────
-- § 1. System Model
-- ──────────────────────────────────────────────

inductive ActuatorState where
  | idle
  | extending
  | holding        -- locked in position, user pushes isometrically
  | retracting
  | emergencyStop
  deriving DecidableEq, Repr, Inhabited

structure SystemState where
  actuator : ActuatorState
  loadNewtons : Nat
  positionMm : Nat
  deriving Inhabited

-- ──────────────────────────────────────────────
-- § 2. Safety Definitions
-- ──────────────────────────────────────────────

def isMoving (s : SystemState) : Prop :=
  s.actuator = .extending ∨ s.actuator = .retracting

def loadDetected (s : SystemState) : Prop :=
  s.loadNewtons ≥ LOAD_THRESHOLD

-- THE core safety invariant:
-- If load is detected, the actuator must NOT be moving.
-- The user should only push against a stationary surface.
def safe (s : SystemState) : Prop :=
  loadDetected s → ¬ isMoving s

-- ──────────────────────────────────────────────
-- § 3. Valid Transitions
-- ──────────────────────────────────────────────
-- Each constructor encodes a transition that the system is ALLOWED to make.
-- The preconditions (hypotheses) enforce the safety rules.

inductive ValidTransition : SystemState → SystemState → Prop where

  -- Can start extending ONLY if idle and no load
  | beginExtend (s : SystemState)
    (h_idle : s.actuator = .idle)
    (h_no_load : ¬ loadDetected s) :
    ValidTransition s { s with actuator := .extending }

  -- Reached target position → hold
  | reachPosition (s : SystemState)
    (h_ext : s.actuator = .extending) :
    ValidTransition s { s with actuator := .holding }

  -- CRITICAL: load detected while moving → immediate halt
  | loadHalt (s : SystemState)
    (h_moving : isMoving s)
    (h_load : loadDetected s) :
    ValidTransition s { s with actuator := .holding }

  -- Can retract ONLY if holding and no load
  | beginRetract (s : SystemState)
    (h_hold : s.actuator = .holding)
    (h_no_load : ¬ loadDetected s) :
    ValidTransition s { s with actuator := .retracting }

  -- Reached home position → idle
  | finishRetract (s : SystemState)
    (h_ret : s.actuator = .retracting) :
    ValidTransition s { s with actuator := .idle }

  -- Emergency stop is ALWAYS available from any state
  | emergency (s : SystemState) :
    ValidTransition s { s with actuator := .emergencyStop }

  -- Recovery from emergency stop → idle (requires no load)
  | resetFromEmergency (s : SystemState)
    (h_estop : s.actuator = .emergencyStop)
    (h_no_load : ¬ loadDetected s) :
    ValidTransition s { s with actuator := .idle }

-- ──────────────────────────────────────────────
-- § 4. Safety Proofs
-- ──────────────────────────────────────────────

-- 4.1 An idle system with no load is safe
-- Difficulty: ★★
theorem idle_safe (s : SystemState)
    (h_idle : s.actuator = .idle) : safe s := by
  sorry

-- 4.2 A holding system is always safe (regardless of load)
-- Difficulty: ★★
-- Because holding is NOT moving, the invariant is trivially satisfied
theorem holding_safe (s : SystemState)
    (h_hold : s.actuator = .holding) : safe s := by
  sorry

-- 4.3 Emergency stop is always safe
-- Difficulty: ★★
theorem emergency_safe (s : SystemState)
    (h_estop : s.actuator = .emergencyStop) : safe s := by
  sorry

-- 4.4 THE BIG THEOREM: safety is preserved by all valid transitions
-- Difficulty: ★★★★★
-- If the system is currently safe, and we take any valid transition,
-- the resulting system is also safe.
-- This is an induction over the ValidTransition type — one case per constructor.
theorem safety_preserved (s s' : SystemState)
    (h_safe : safe s)
    (h_trans : ValidTransition s s') :
    safe s' := by
  -- Unfold safe: we need to show loadDetected s' → ¬ isMoving s'
  intro h_load h_moving
  -- Case split on which transition happened
  cases h_trans with
  | beginExtend h_idle h_no_load =>
    -- We started extending, requiring no load.
    -- But load didn't change (only actuator changed), so h_load contradicts h_no_load
    sorry
  | reachPosition h_ext =>
    -- New state is .holding, which is NOT moving
    -- h_moving says it IS moving — contradiction
    sorry
  | loadHalt h_moving_prev h_load_prev =>
    -- New state is .holding — same as above
    sorry
  | beginRetract h_hold h_no_load =>
    -- Same logic as beginExtend
    sorry
  | finishRetract h_ret =>
    -- New state is .idle — not moving
    sorry
  | emergency =>
    -- New state is .emergencyStop — not moving
    sorry
  | resetFromEmergency h_estop h_no_load =>
    -- New state is .idle — not moving
    sorry

-- 4.5 Multi-step safety: if we start safe, we stay safe through any
-- sequence of valid transitions
-- Difficulty: ★★★★★
-- Hint: induction on the list of transitions, using safety_preserved
theorem multi_step_safe (states : List SystemState)
    (h_safe_init : safe states.head!)
    (h_valid : ∀ i : Fin (states.length - 1),
      ValidTransition (states[i.val]!) (states[i.val + 1]!)) :
    ∀ s ∈ states, safe s := by
  sorry

-- ──────────────────────────────────────────────
-- § 5. Liveness Properties (Stretch Goals)
-- ──────────────────────────────────────────────

-- 5.1 Emergency stop is reachable from every state
-- Difficulty: ★★★
-- (Already trivially true by the `emergency` constructor)
theorem emergency_always_reachable (s : SystemState) :
    ∃ s', ValidTransition s s' ∧ s'.actuator = .emergencyStop := by
  sorry

-- 5.2 Idle is reachable from emergency stop (given no load)
-- Difficulty: ★★★
theorem can_recover_from_emergency (s : SystemState)
    (h_estop : s.actuator = .emergencyStop)
    (h_no_load : ¬ loadDetected s) :
    ∃ s', ValidTransition s s' ∧ s'.actuator = .idle := by
  sorry

end Metanoia.Safety.StateMachine
