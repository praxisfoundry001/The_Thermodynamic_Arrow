/-
STRUCTURAL FLOW — ARROW OF TIME
ARROW COROLLARY CONTRACT AND ADAPTER v0.3

BUILD ROLE
----------
Append this entire file directly BELOW an unchanged compatible
Structural Flow Universal Kernel in the Lean browser.

No import line is used.

SCOPE LOCK — THIS UNIVERSE AS PRESENTED
---------------------------------------
This contract is intentionally scope-locked to the physically realized universe
as described by current empirical physics, at the declared cosmological /
thermodynamic scope under adjudication.

It does NOT claim:
  * one Arrow for every mathematically admissible solution;
  * one Arrow for every hypothetical universe;
  * one Arrow for every possible future physical ontology;
  * one Arrow for every disconnected branch, region, or scope;
  * Density alone universally entails a thermodynamic Arrow;
  * PAA derives thermodynamic entropy increase;
  * a particular successor macrostate, trajectory, fluctuation, or outcome is
    prescribed;
  * an asymmetric cosmological boundary condition is derived by Structural Flow;
  * the physical origin of that boundary condition is closed by this contract.

HUMAN / PHYSICS AUTHORITY
-------------------------
Humans and domain physics adjudicate whether, at the declared scope:
  * the claim concerns this universe as physically presented;
  * an asymmetric macrohistory boundary / root condition is physically admitted;
  * a realized descendant macrohistory is physically admitted;
  * the relevant thermodynamic asymmetry is physically admitted;
  * local thermodynamic orientations are lawfully recognized as the same;
  * those recognized orientations coherently hold as one Arrow over the scope.

Lean does not infer any of those physical facts.

STRUCTURAL CLAIM UNDER TEST
---------------------------
Once an admitted boundary participates in a realized successor lineage, a lawful
PAA translation forbids a free reset of that lineage. A later warranted
continuation must remain on an accounted successor line rather than silently
source itself from an erased pre-successor condition.

For this universe as presented, if the physics-owned entry burdens above are
DISCHARGED and the Structural Flow translation burdens conform, the singular
thermodynamic Arrow at that declared scope is treated as a structural corollary
of the admitted realized architecture, not as an additional future-driving
object.

WHY THE BOUNDARY WAS ASYMMETRIC remains a downstream domain burden and may stay
OPEN without blocking structural conformance of the Arrow Corollary.

MACHINE POSTURE
---------------
The Universal Kernel is expected to remain unchanged.
A clean elaboration establishes only that this scoped contract and its witness
routes are formally coherent against the compatible kernel.
-/

namespace StructuralFlow
namespace ArrowCorollary

universe u

/-!
===============================================================================
PART I — PAA-SHAPED REALIZED MACROHISTORY LINEAGE
===============================================================================
-/

/--
A minimal scoped macrohistory anchor.

`boundary` is the admitted boundary / root macrocondition for the physical
macrohistory under review.

`firstSuccessor` is the first successor condition used by this contract's PAA
translation. The contract does NOT claim that the boundary itself was produced
by an earlier SF Authorization passage.

Instead, the first admitted physical transition under review is translated as
the Authorization-style change `boundary -> firstSuccessor`, after which PAA
constrains later continuation claims to accounted successor lineage.
-/
structure Macrohistory (State : Type u) where
  boundary : State
  firstSuccessor : State
  changed : firstSuccessor ≠ boundary
  successor : PAA.Successor State
  firstPassage : successor boundary firstSuccessor

/-- The first admitted physical successor passage represented as a PAA anchor. -/
def paaAnchor {State : Type u}
    (h : Macrohistory State) : PAA.AuthorizationRecord State where
  pre := h.boundary
  post := h.firstSuccessor
  changed := h.changed

/--
A source is rooted in the admitted macrohistory when the admitted first passage
from the boundary exists and the source lies on an accounted successor line from
the first successor.
-/
def RootedDescendant {State : Type u}
    (h : Macrohistory State)
    (q : State) : Prop :=
  h.successor h.boundary h.firstSuccessor
  ∧ PAA.AccountedReachable h.successor h.firstSuccessor q

/-- A warrant relation is boundary-answerable when it respects the kernel PAA guard. -/
def BoundaryAnswerableWarrant {State : Type u}
    (h : Macrohistory State)
    (Warrant : PAA.ContinuationClaim State → Prop) : Prop :=
  PAA.RespectsPAA (paaAnchor h) h.successor Warrant

/--
Core lineage theorem.
Every warranted continuation source under the admitted PAA translation remains
rooted in the macrohistory through the first admitted successor passage.

This is provenance / answerability, not unique-outcome selection.
-/
theorem warranted_continuation_is_rooted
    {State : Type u}
    (h : Macrohistory State)
    (Warrant : PAA.ContinuationClaim State → Prop)
    (hPAA : BoundaryAnswerableWarrant h Warrant)
    (c : PAA.ContinuationClaim State)
    (hWarrant : Warrant c) :
    RootedDescendant h c.source := by
  have hValid :
      PAA.SourceValid (paaAnchor h) h.successor c :=
    hPAA c hWarrant
  refine ⟨h.firstPassage, ?_⟩
  simpa [PAA.SourceValid, paaAnchor] using hValid

/-- PAA blocks an unaccounted free reset of the admitted boundary passage. -/
theorem free_boundary_reset_is_blocked
    {State : Type u}
    (h : Macrohistory State)
    (Warrant : PAA.ContinuationClaim State → Prop)
    (hPAA : BoundaryAnswerableWarrant h Warrant) :
    ¬ PAA.FreeResetViolation (paaAnchor h) h.successor Warrant := by
  exact
    PAA.paa_excludes_free_reset
      (paaAnchor h)
      h.successor
      Warrant
      hPAA

/--
The Arrow Corollary is not an absolute-irreversibility theorem.
If an accounted successor line lawfully returns to the boundary-equivalent
source, PAA permits that return.
-/
theorem lawful_return_to_boundary_is_permitted
    {State : Type u}
    (h : Macrohistory State)
    (hReturn :
      PAA.AccountedReachable
        h.successor
        h.firstSuccessor
        h.boundary) :
    PAA.RespectsPAA
      (paaAnchor h)
      h.successor
      (PAA.ExactSourceWarrant h.boundary) := by
  exact
    PAA.lawful_return_to_pre_is_permitted
      (paaAnchor h)
      h.successor
      hReturn

/-!
A finite witness that PAA does not prescribe a unique future.
The constructor names are intentionally neutral to avoid parser/tactic-keyword
collisions when this file is appended beneath a large kernel source.
-/
inductive DemoState where
  | rootState
  | postState
  | branchA
  | branchB
deriving DecidableEq, Repr

def demoSuccessor : PAA.Successor DemoState
  | .rootState, .postState => True
  | .postState, .branchA => True
  | .postState, .branchB => True
  | _, _ => False

def demoHistory : Macrohistory DemoState where
  boundary := .rootState
  firstSuccessor := .postState
  changed := by decide
  successor := demoSuccessor
  firstPassage := by simp [demoSuccessor]

/-- Two distinct successor sources can remain PAA-compatible. -/
theorem multiple_successor_outcomes_remain_available :
    PAA.RespectsPAA
      (paaAnchor demoHistory)
      demoSuccessor
      (fun c =>
        c.source = DemoState.branchA
        ∨ c.source = DemoState.branchB) := by
  have hA :
      PAA.AccountedReachable
        demoSuccessor
        DemoState.postState
        DemoState.branchA := by
    exact
      PAA.AccountedReachable.tail
        (PAA.AccountedReachable.refl DemoState.postState)
        (by simp [demoSuccessor])
  have hB :
      PAA.AccountedReachable
        demoSuccessor
        DemoState.postState
        DemoState.branchB := by
    exact
      PAA.AccountedReachable.tail
        (PAA.AccountedReachable.refl DemoState.postState)
        (by simp [demoSuccessor])
  exact
    PAA.multiple_successor_sources_permitted
      (paaAnchor demoHistory)
      demoSuccessor
      hA
      hB

end ArrowCorollary
end StructuralFlow


/-!
===============================================================================
PART II — ARROW COROLLARY -> PUBLIC UNIVERSAL TRANSLATION CONTRACT ADAPTER
===============================================================================

Purpose
-------
Route the scoped Arrow Corollary through the existing Universal Translation
Contract without modifying the Universal Kernel.

Interpretation rule
-------------------
`NoLawfulTranslation` in a scope-fracture witness means:

  no lawful translation to ONE SINGULAR ARROW at that declared scope.

It does NOT mean:
  * no local thermodynamic asymmetry exists;
  * no local Arrow exists;
  * physics is invalid;
  * every narrower partition fails.
===============================================================================
-/

namespace StructuralFlow
namespace ArrowCorollaryPublicKernelAdapter

open UniversalTranslationContract
open ArrowCorollary

inductive ObjectBurden where
  | paaLineageTranslation
  | realizedConsequenceDirectionPreserved
  | recognitionRoutePreserved
  | coherenceRoutePreserved
  | noUniqueFutureFirewall
  | noExtraArrowDriverRequired
  | scopePartitionFirewall
deriving DecidableEq, Repr

inductive DomainBurden where
  | thisUniverseAsPresentedScope
  | asymmetricBoundaryAdmission
  | realizedMacrohistoryAdmission
  | thermodynamicAsymmetryAdmission
  | commonOrientationRecognitionAdmission
  | scopeCoherenceAdmission
  | boundaryOriginExplanation
  deriving DecidableEq, Repr

/-! --------------------------------------------------------------------------
Contract registry
---------------------------------------------------------------------------- -/

def coreState : CoreBurden → Disposition :=
  fun _ => .discharged

def objectRequired (_ : ObjectBurden) : Prop := True

def objectState : ObjectBurden → Disposition :=
  fun _ => .discharged

def domainEntryRequired : DomainBurden → Prop
  | .thisUniverseAsPresentedScope => True
  | .asymmetricBoundaryAdmission => True
  | .realizedMacrohistoryAdmission => True
  | .thermodynamicAsymmetryAdmission => True
  | .commonOrientationRecognitionAdmission => True
  | .scopeCoherenceAdmission => True
  | .boundaryOriginExplanation => False

def domainDownstreamRequired : DomainBurden → Prop
  | .thisUniverseAsPresentedScope => False
  | .asymmetricBoundaryAdmission => False
  | .realizedMacrohistoryAdmission => False
  | .thermodynamicAsymmetryAdmission => False
  | .commonOrientationRecognitionAdmission => False
  | .scopeCoherenceAdmission => False
  | .boundaryOriginExplanation => True

/--
Admitted physical-input witness state.

This is a CONDITIONAL witness packet. It represents the case where humans /
physics have adjudicated every Arrow-entry burden as DISCHARGED.

The physical origin of the asymmetric boundary remains OPEN and is explicitly
registered as a downstream burden that does not block structural conformance.
-/
def admittedDomainState : DomainBurden → Disposition
  | .thisUniverseAsPresentedScope => .discharged
  | .asymmetricBoundaryAdmission => .discharged
  | .realizedMacrohistoryAdmission => .discharged
  | .thermodynamicAsymmetryAdmission => .discharged
  | .commonOrientationRecognitionAdmission => .discharged
  | .scopeCoherenceAdmission => .discharged
  | .boundaryOriginExplanation => .open

noncomputable def mkWorld
    (oState : ObjectBurden → Disposition)
    (dState : DomainBurden → Disposition) :
    UniversalTranslationContract.World ObjectBurden DomainBurden where

  coreState := coreState
  coreEvidence := fun b state => state = coreState b
  coreWarrant := by
    intro b
    rfl

  objectRequired := objectRequired
  objectState := oState
  objectEvidence := fun b state => state = oState b
  objectWarrant := by
    intro b _
    rfl

  domainEntryRequired := domainEntryRequired
  domainDownstreamRequired := domainDownstreamRequired
  domainRoleDisjoint := by
    intro b
    cases b <;>
      simp [domainEntryRequired, domainDownstreamRequired]

  domainState := dState
  domainEvidence := fun b state => state = dState b
  domainWarrant := by
    intro b _
    rfl

noncomputable def admittedWorld :
    UniversalTranslationContract.World ObjectBurden DomainBurden :=
  mkWorld objectState admittedDomainState

/-! --------------------------------------------------------------------------
Primary conditional closure
---------------------------------------------------------------------------- -/

theorem admittedWorld_structuralConforms :
    UniversalTranslationContract.StructuralConforms admittedWorld := by
  refine ⟨?_, ?_, ?_⟩
  · intro c
    rfl
  · intro o _hRequired
    rfl
  · intro d hRequired
    cases d with
    | thisUniverseAsPresentedScope => rfl
    | asymmetricBoundaryAdmission => rfl
    | realizedMacrohistoryAdmission => rfl
    | thermodynamicAsymmetryAdmission => rfl
    | commonOrientationRecognitionAdmission => rfl
    | scopeCoherenceAdmission => rfl
    | boundaryOriginExplanation =>
        change domainEntryRequired
          DomainBurden.boundaryOriginExplanation at hRequired
        simp [domainEntryRequired] at hRequired

theorem boundary_origin_remains_open :
    UniversalTranslationContract.DomainBurdenOpen admittedWorld := by
  exact
    ⟨DomainBurden.boundaryOriginExplanation,
     by
       simp
         [admittedWorld,
          mkWorld,
          domainDownstreamRequired],
     by
       simp
         [admittedWorld,
          mkWorld,
          admittedDomainState]⟩

/--
Main machine checkpoint:
conditional Arrow structural conformance can coexist with an OPEN explanation
of why the asymmetric physical boundary exists.
-/
theorem arrow_corollary_conditional_machine_checkpoint :
    UniversalTranslationContract.StructuralConforms admittedWorld
    ∧ UniversalTranslationContract.DomainBurdenOpen admittedWorld
    ∧ PAA.RespectsPAA
        (ArrowCorollary.paaAnchor ArrowCorollary.demoHistory)
        ArrowCorollary.demoSuccessor
        (fun c =>
          c.source = ArrowCorollary.DemoState.branchA
          ∨ c.source = ArrowCorollary.DemoState.branchB) := by
  exact
    ⟨admittedWorld_structuralConforms,
     boundary_origin_remains_open,
     ArrowCorollary.multiple_successor_outcomes_remain_available⟩

/-! --------------------------------------------------------------------------
Witness 1 — physical boundary admission OPEN -> NOT YET ADJUDICABLE
---------------------------------------------------------------------------- -/

def boundaryOpenDomainState : DomainBurden → Disposition
  | .asymmetricBoundaryAdmission => .open
  | .boundaryOriginExplanation => .open
  | _ => .discharged

noncomputable def boundaryOpenWorld :=
  mkWorld objectState boundaryOpenDomainState

def boundaryAdmissionOpen :
    UniversalTranslationContract.KnownOpen boundaryOpenWorld :=
  UniversalTranslationContract.KnownOpen.domainEntry
    DomainBurden.asymmetricBoundaryAdmission
    (by
      simp
        [boundaryOpenWorld,
         mkWorld,
         domainEntryRequired])
    (by
      simp
        [boundaryOpenWorld,
         mkWorld,
         boundaryOpenDomainState])

theorem boundaryOpenWorld_has_no_known_failure :
    ¬ Nonempty
      (UniversalTranslationContract.KnownFailure boundaryOpenWorld) := by
  intro h
  rcases h with ⟨failure⟩
  cases failure with
  | core burden failed =>
      cases burden <;>
        simp [boundaryOpenWorld, mkWorld, coreState] at failed
  | object burden _ failed =>
      cases burden <;>
        simp [boundaryOpenWorld, mkWorld, objectState] at failed
  | domainEntry burden _ failed =>
      cases burden <;>
        simp
          [boundaryOpenWorld,
           mkWorld,
           boundaryOpenDomainState]
          at failed

theorem boundary_open_is_not_yet_adjudicable :
    UniversalTranslationContract.NotYetAdjudicable boundaryOpenWorld := by
  exact
    ⟨boundaryOpenWorld_has_no_known_failure,
     ⟨boundaryAdmissionOpen⟩⟩

/-! --------------------------------------------------------------------------
Witness 2 — physical boundary admission VIOLATED -> NO LAWFUL ARROW TRANSLATION
---------------------------------------------------------------------------- -/

def boundaryViolatedDomainState : DomainBurden → Disposition
  | .asymmetricBoundaryAdmission => .violated
  | .boundaryOriginExplanation => .open
  | _ => .discharged

noncomputable def boundaryViolatedWorld :=
  mkWorld objectState boundaryViolatedDomainState

def boundaryAdmissionFailure :
    UniversalTranslationContract.KnownFailure boundaryViolatedWorld :=
  UniversalTranslationContract.KnownFailure.domainEntry
    DomainBurden.asymmetricBoundaryAdmission
    (by
      simp
        [boundaryViolatedWorld,
         mkWorld,
         domainEntryRequired])
    (by
      simp
        [boundaryViolatedWorld,
         mkWorld,
         boundaryViolatedDomainState])

theorem boundary_violation_blocks_arrow_translation :
    UniversalTranslationContract.NoLawfulTranslation
      boundaryViolatedWorld := by
  exact ⟨boundaryAdmissionFailure⟩

/-! --------------------------------------------------------------------------
Witness 3 — realized macrohistory admission VIOLATED -> NO LAWFUL TRANSLATION
---------------------------------------------------------------------------- -/

def lineageViolatedDomainState : DomainBurden → Disposition
  | .realizedMacrohistoryAdmission => .violated
  | .boundaryOriginExplanation => .open
  | _ => .discharged

noncomputable def lineageViolatedWorld :=
  mkWorld objectState lineageViolatedDomainState

def lineageAdmissionFailure :
    UniversalTranslationContract.KnownFailure lineageViolatedWorld :=
  UniversalTranslationContract.KnownFailure.domainEntry
    DomainBurden.realizedMacrohistoryAdmission
    (by
      simp
        [lineageViolatedWorld,
         mkWorld,
         domainEntryRequired])
    (by
      simp
        [lineageViolatedWorld,
         mkWorld,
         lineageViolatedDomainState])

theorem lineage_violation_blocks_arrow_translation :
    UniversalTranslationContract.NoLawfulTranslation
      lineageViolatedWorld := by
  exact ⟨lineageAdmissionFailure⟩

/-! --------------------------------------------------------------------------
Witness 4 — PAA translation VIOLATED -> NO LAWFUL TRANSLATION
---------------------------------------------------------------------------- -/

def paaViolatedObjectState : ObjectBurden → Disposition
  | .paaLineageTranslation => .violated
  | _ => .discharged

noncomputable def paaViolatedWorld :=
  mkWorld paaViolatedObjectState admittedDomainState

def paaTranslationFailure :
    UniversalTranslationContract.KnownFailure paaViolatedWorld :=
  UniversalTranslationContract.KnownFailure.object
    ObjectBurden.paaLineageTranslation
    (by simp [paaViolatedWorld, mkWorld, objectRequired])
    (by simp [paaViolatedWorld, mkWorld, paaViolatedObjectState])

theorem paa_violation_blocks_arrow_translation :
    UniversalTranslationContract.NoLawfulTranslation paaViolatedWorld := by
  exact ⟨paaTranslationFailure⟩

/-! --------------------------------------------------------------------------
Witness 5 — explicit prove-me-wrong seat for NO EXTRA ARROW DRIVER REQUIRED
---------------------------------------------------------------------------- -/

/--
Interpretation of `noExtraArrowDriverRequired`:

Hold fixed the admitted physical/domain Arrow conditions and every other live
Structural Flow translation burden at the declared scope. The burden is
VIOLATED only if physics / human adjudication establishes a physically adequate
same-scope case in which ONE thermodynamic Arrow nevertheless fails unless an
additional irreducible Arrow-maintaining or future-driving object, process, or
mechanism is introduced whose necessary job is not already carried by the
admitted physical description or by the live structural translation.

Renaming ordinary admitted dynamics, entropy production, decoherence,
stochastic evolution, or any other already-described physics as an "Arrow
driver" does not by itself violate this burden.
-/
def extraArrowDriverViolatedObjectState : ObjectBurden → Disposition
  | .noExtraArrowDriverRequired => .violated
  | _ => .discharged

/--
All physical/domain entry conditions remain exactly as in `admittedWorld`; only
the object burden `noExtraArrowDriverRequired` is changed to VIOLATED.
-/
noncomputable def extraArrowDriverViolatedWorld :=
  mkWorld extraArrowDriverViolatedObjectState admittedDomainState

def extraArrowDriverRequirementFailure :
    UniversalTranslationContract.KnownFailure
      extraArrowDriverViolatedWorld :=
  UniversalTranslationContract.KnownFailure.object
    ObjectBurden.noExtraArrowDriverRequired
    (by
      simp
        [extraArrowDriverViolatedWorld,
         mkWorld,
         objectRequired])
    (by
      simp
        [extraArrowDriverViolatedWorld,
         mkWorld,
         extraArrowDriverViolatedObjectState])

/--
Explicit falsifier route for the object claim.

If a qualifying same-scope counterexample is adjudicated and therefore
`noExtraArrowDriverRequired` is VIOLATED while the other admitted conditions
remain fixed, the present Arrow Corollary does not lawfully translate for that
case. This theorem does not assert that such a counterexample exists.
-/
theorem extra_arrow_driver_counterexample_blocks_arrow_translation :
    UniversalTranslationContract.NoLawfulTranslation
      extraArrowDriverViolatedWorld := by
  exact ⟨extraArrowDriverRequirementFailure⟩

/-! --------------------------------------------------------------------------
Witness 6 — scope coherence fracture -> NO ONE SINGULAR ARROW AT THAT SCOPE
---------------------------------------------------------------------------- -/

def scopeFractureDomainState : DomainBurden → Disposition
  | .scopeCoherenceAdmission => .violated
  | .boundaryOriginExplanation => .open
  | _ => .discharged

noncomputable def scopeFractureWorld :=
  mkWorld objectState scopeFractureDomainState

def scopeCoherenceFailure :
    UniversalTranslationContract.KnownFailure scopeFractureWorld :=
  UniversalTranslationContract.KnownFailure.domainEntry
    DomainBurden.scopeCoherenceAdmission
    (by
      simp
        [scopeFractureWorld,
         mkWorld,
         domainEntryRequired])
    (by
      simp
        [scopeFractureWorld,
         mkWorld,
         scopeFractureDomainState])

/--
Interpretation: no lawful translation to ONE singular Arrow at this declared
scope. Narrower coherent partitions may still admit their own Arrow Corollary.
-/
theorem scope_fracture_blocks_single_arrow_translation :
    UniversalTranslationContract.NoLawfulTranslation scopeFractureWorld := by
  exact ⟨scopeCoherenceFailure⟩

/-! --------------------------------------------------------------------------
Consolidated witness checkpoint
---------------------------------------------------------------------------- -/

theorem arrow_corollary_contract_and_adapter_machine_checkpoint :
    (
      UniversalTranslationContract.StructuralConforms admittedWorld
      ∧ UniversalTranslationContract.DomainBurdenOpen admittedWorld
    )
    ∧ UniversalTranslationContract.NotYetAdjudicable boundaryOpenWorld
    ∧ UniversalTranslationContract.NoLawfulTranslation boundaryViolatedWorld
    ∧ UniversalTranslationContract.NoLawfulTranslation lineageViolatedWorld
    ∧ UniversalTranslationContract.NoLawfulTranslation paaViolatedWorld
    ∧ UniversalTranslationContract.NoLawfulTranslation
        extraArrowDriverViolatedWorld
    ∧ UniversalTranslationContract.NoLawfulTranslation scopeFractureWorld
    := by
  exact
    ⟨⟨admittedWorld_structuralConforms,
       boundary_origin_remains_open⟩,
     boundary_open_is_not_yet_adjudicable,
     boundary_violation_blocks_arrow_translation,
     lineage_violation_blocks_arrow_translation,
     paa_violation_blocks_arrow_translation,
     extra_arrow_driver_counterexample_blocks_arrow_translation,
     scope_fracture_blocks_single_arrow_translation⟩

/-!
MACHINE-FACING COMPRESSION
--------------------------
SCOPE: THIS UNIVERSE AS PRESENTED, DECLARED PHYSICAL SCOPE ONLY
+
ASYMMETRIC BOUNDARY: PHYSICS / HUMAN ADMISSION
+
REALIZED MACROHISTORY: PHYSICS / HUMAN ADMISSION
+
THERMODYNAMIC ASYMMETRY: PHYSICS / HUMAN ADMISSION
+
PAA LINEAGE: EXISTING KERNEL ROUTE
+
COMMON ORIENTATION RECOGNITION: REQUIRED DOMAIN ENTRY
+
SCOPE COHERENCE: REQUIRED DOMAIN ENTRY
+
EXTRA ARROW DRIVER: NOT REQUIRED WHEN THE CLOSED CONDITIONS HOLD
+
PROVE-ME-WRONG SEAT: IF A SAME-SCOPE PHYSICAL COUNTEREXAMPLE REQUIRES A NEW
IRREDUCIBLE ARROW-MAINTAINING / FUTURE-DRIVING JOB WHILE ALL OTHER ADMITTED
CONDITIONS REMAIN FIXED, `noExtraArrowDriverRequired` IS VIOLATED AND THE
PRESENT ARROW TRANSLATION FAILS FOR THAT CASE
+
UNIQUE FUTURE: NOT REQUIRED
+
BOUNDARY ORIGIN EXPLANATION: DOWNSTREAM AND MAY REMAIN OPEN
+
KERNEL CHANGE: NONE PROPOSED
-/

end ArrowCorollaryPublicKernelAdapter
end StructuralFlow
