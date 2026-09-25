/-
STRUCTURAL FLOW UNIVERSAL KERNEL v1.0
Lean 4 theorem kernel

Semantic authority
------------------
Structural Flow TOE — Universal Canon and Interaction Interface v1.3.

Role
----
This file is the public, open, machine-checkable Structural Flow universal theorem
kernel for downstream artifacts.

A clean Lean elaboration means that all encoded theorem statements in this file
are accepted together at their declared formal scopes.

It does NOT mean:
  * Lean has empirically validated Structural Flow;
  * every earned human-semantic SF theorem has been formalized;
  * domain-owned premises, mechanisms, evidence rules, or empirical predicates
    become universal merely because a downstream proof uses them;
  * the declared model / signature language cannot be challenged;
  * later counterexamples or newly earned universal structure cannot reopen or
    extend the kernel;
  * metaphysical uniqueness beyond the stated scope has been proved.

Public theorem families
-----------------------
  1. Entropy / no-free-immunity
  2. Foundational hinge separation:
       Persistence -> Boundary -> Cascade -> Authorization
  3. Foundational first-break / five-regime closure
  4. Austerity / no-hidden-primitive audit
  5. Six-face primitive-signature closure
  6. Primitive minimality as least-sufficient commitment structure
  7. C0 -> foundational burden bridge
  8. Post-Authorization Answerability (PAA)
  9. Recognition
 10. Coherence (current executable machine scope is pairwise where encoded)
 11. Failure-Side Discrimination
 12. Canon Three
 13. +3 Sieve
 14. Universal Density
 15. Density Translation
 16. Strong Equationhood
 17. Duality Discrimination
 18. Ladder
 19. H readout
 20. F readout
 21. L readout
 22. Universal Translation Contract
 23. Cross-Domain Translation Composition

Downstream use
--------------
A downstream artifact may incorporate or import this theorem base, define its own
scoped objects, premises, evidence contracts, and domain burdens, instantiate the
applicable universal SF structures, and discharge its proof burdens in Lean.

Independently sovereign domain artifacts may close their own translation seats
separately and may later close a directed cross-domain bridge under the same
universal translation / composition theorem grammar.

Release status
--------------
The executable theorem code in this v1.0 file is unchanged from the locally
machine-clean public-kernel checkpoint tested under Lean 4.34.0. Only this leading
release header has been cleaned for v1.0.
-/
namespace StructuralFlow
namespace Entropy

/-
Structural Flow Foundational Formalization — Entropy Kernel v0.5

Historical derivation authority: Structural Flow T.O.E. v1.64
Current semantic authority: Structural Flow TOE — Universal Canon and Interaction Interface (current compatible governing release).
Source theorem: Field Notes From The Substrate — Translations no. 9:
                Entropy, Derived
                  machine-source snapshot: v1.2
                  current public artifact: v1.8
Target: Lean 4
Historical machine provenance: previously clean standalone Lean pass; later incorporated into predecessor consolidated machine work.

Purpose
-------
Machine-translate the logical-scope burden behind Structural Entropy without
encoding structural immunity failure as an axiom.

This file targets the following source claims:
1. Eventfulness does not entail Persistence.
2. Persistence establishes availability, not free immunity.
3. No individual canonical hinge capacity entails immunity merely by being
   achieved.
4. Completion of the canonical capacity package does not entail immunity
   without an additional bridge.

Formal strategy
---------------
Non-entailment is established by explicit countermodel. The machine is not
asked to accept a prose rule saying that "no bridge was supplied." Instead,
the relevant universal entailments are stated and then refuted by models in
which the antecedent succeeds while the stronger conclusion fails.

Scope note
----------
Each Model tracks ONE interaction-produced distinction. `admissible` describes
possible continuations in the declared model space, not realized future
history. A reachable state is therefore a possibility-space witness, not a
prediction that the universe will realize that continuation.

Anti-smuggling note — Entropy module only
-------------------------------------------
The six capacity constructors below are the CURRENT ACCEPTED canonical capacity
vocabulary used as premises by the Entropy theorem. This Entropy module does NOT
infer hinge, failure-regime, or Chance-face cardinality from that datatype.

Those are separate burdens handled later in THIS public kernel:
* FailureClosure proves the current four-hinge first-break partition and
  no sixth irreducible first-break regime inside that architecture.
* SixFaceClosure proves six-face primitive-signature closure at declared scope.

Therefore this local Entropy-module warning must not be read as a scope limit
on the public kernel as a whole.
-/



/--
Canonical capacities used by the current hinge grammar.

These names are imported vocabulary for the Entropy audit only:
Persistence   -> availability
Boundary      -> discrimination
Cascade       -> inheritance
Authorization -> incorporation
Recognition   -> recognition
Coherence     -> coherence
-/
inductive Capacity
  | availability
  | discrimination
  | inheritance
  | incorporation
  | recognition
  | coherence
  deriving DecidableEq

/--
A minimal admissible-continuation model for one tracked interaction-produced
distinction.
-/
structure Model where
  State : Type
  admissible : State → State → Prop
  occurred : State → Prop
  capacity : Capacity → State → Prop

/-- Reflexive-transitive reachability through admissible continuations. -/
inductive Reachable (M : Model) : M.State → M.State → Prop
  | refl (s : M.State) : Reachable M s s
  | tail {s t u : M.State} :
      Reachable M s t → M.admissible t u → Reachable M s u

/-- Eventfulness at the selected state. -/
def OccurrenceAt (M : Model) (s : M.State) : Prop :=
  M.occurred s

/--
A canonical capacity is realized beyond s when there is a DISTINCT admissibly
reachable continuation in which that capacity is present.
-/
def CapacityRealizedAt (M : Model) (c : Capacity) (s : M.State) : Prop :=
  ∃ t : M.State, Reachable M s t ∧ t ≠ s ∧ M.capacity c t

/-- Persistence is realization of the availability capacity beyond production. -/
def PersistenceAt (M : Model) (s : M.State) : Prop :=
  CapacityRealizedAt M Capacity.availability s

/--
Canonical capacity-package completion: one distinct reachable continuation
realizes every capacity currently used by the canonical hinge grammar.

This is intentionally a conjunction-at-one-witness burden. It does NOT assert
that the capacity list is exhaustive of every possible future SF capacity.
-/
def CanonicalCapacityPackageAt (M : Model) (s : M.State) : Prop :=
  ∃ t : M.State,
    Reachable M s t ∧
    t ≠ s ∧
    ∀ c : Capacity, M.capacity c t

/--
Structural immunity at s: availability of the tracked distinction is secured
throughout the entire admissibly reachable continuation class from s.
-/
def StructuralImmunityAt (M : Model) (s : M.State) : Prop :=
  ∀ t : M.State,
    Reachable M s t → M.capacity Capacity.availability t

/-! ## Universal entailments tested by the Entropy theorem -/

/-- The universal entailment denied by source Lemma 1. -/
def OccurrenceEntailsPersistence : Prop :=
  ∀ (M : Model) (s : M.State),
    OccurrenceAt M s → PersistenceAt M s

/-- Schema: realization of capacity c universally entails structural immunity. -/
def CapacityEntailsImmunity (c : Capacity) : Prop :=
  ∀ (M : Model) (s : M.State),
    CapacityRealizedAt M c s → StructuralImmunityAt M s

/-- The Persistence-specific form denied by source Lemma 2. -/
def PersistenceEntailsImmunity : Prop :=
  ∀ (M : Model) (s : M.State),
    PersistenceAt M s → StructuralImmunityAt M s

/-- The universal entailment denied by source Lemma 4. -/
def CanonicalPackageEntailsImmunity : Prop :=
  ∀ (M : Model) (s : M.State),
    CanonicalCapacityPackageAt M s → StructuralImmunityAt M s

/-! ## Countermodel A: Eventfulness without Persistence -/

/--
There is an occurrence, but no distinct admissible continuation. Availability
at the occurrence itself does not count as Persistence because Persistence
requires availability beyond production.
-/
def eventOnlyModel : Model where
  State := Unit
  admissible := fun _ _ => False
  occurred := fun _ => True
  capacity := fun c _ =>
    match c with
    | Capacity.availability => True
    | _ => False

/-- Eventfulness holds in the event-only model. -/
theorem event_only_occurs : OccurrenceAt eventOnlyModel () := by
  simp [OccurrenceAt, eventOnlyModel]

/-- Persistence does not hold in the event-only model. -/
theorem event_only_has_no_persistence : ¬ PersistenceAt eventOnlyModel () := by
  intro h
  rcases h with ⟨t, _hReach, hDistinct, _hAvailable⟩
  cases t
  exact hDistinct rfl

/--
Source Lemma 1, machine form:
Eventfulness does not universally entail Persistence.
-/
theorem occurrence_does_not_entail_persistence :
    ¬ OccurrenceEntailsPersistence := by
  intro hEntails
  have hPersistence : PersistenceAt eventOnlyModel () :=
    hEntails eventOnlyModel () event_only_occurs
  exact event_only_has_no_persistence hPersistence

/-! ## Countermodel B: Full canonical success without structural immunity -/

inductive EntropyAuditState
  | produced
  | achieved
  | lost
  deriving DecidableEq

open EntropyAuditState

/-- Admissible continuation graph: produced → achieved → lost. -/
def auditAdmissible : EntropyAuditState → EntropyAuditState → Prop
  | produced, achieved => True
  | achieved, lost => True
  | _, _ => False

/-- The tracked interaction occurs at the production state. -/
def auditOccurred : EntropyAuditState → Prop
  | produced => True
  | _ => False

/--
At `achieved`, every current canonical capacity is realized. Availability also
holds at production. At `lost`, availability fails.
-/
def auditCapacity : Capacity → EntropyAuditState → Prop
  | Capacity.availability, produced => True
  | _, achieved => True
  | _, lost => False
  | _, produced => False

def auditModel : Model where
  State := EntropyAuditState
  admissible := auditAdmissible
  occurred := auditOccurred
  capacity := auditCapacity

/-- The achieved state is admissibly reachable from production. -/
theorem achieved_reachable : Reachable auditModel produced achieved := by
  exact Reachable.tail
    (M := auditModel)
    (s := produced)
    (t := produced)
    (u := achieved)
    (Reachable.refl (M := auditModel) produced)
    (show auditAdmissible produced achieved from True.intro)

/-- The lost state is admissibly reachable from production. -/
theorem lost_reachable : Reachable auditModel produced lost := by
  exact Reachable.tail
    (M := auditModel)
    (s := produced)
    (t := achieved)
    (u := lost)
    achieved_reachable
    (show auditAdmissible achieved lost from True.intro)

/-- The achieved continuation is genuinely distinct from production. -/
theorem achieved_ne_produced : achieved ≠ produced := by
  intro h
  cases h

/-- Every imported canonical capacity holds at the achieved state. -/
theorem every_capacity_holds_at_achieved (c : Capacity) :
    auditModel.capacity c achieved := by
  change auditCapacity c achieved
  cases c <;> exact True.intro

/-- Every imported canonical capacity is realized in the audit model. -/
theorem every_capacity_realized (c : Capacity) :
    CapacityRealizedAt auditModel c produced := by
  exact ⟨achieved, achieved_reachable, achieved_ne_produced,
    every_capacity_holds_at_achieved c⟩

/-- Persistence succeeds in the audit model. -/
theorem persistence_succeeds : PersistenceAt auditModel produced := by
  exact every_capacity_realized Capacity.availability

/-- The full current canonical capacity package succeeds in the audit model. -/
theorem canonical_package_succeeds :
    CanonicalCapacityPackageAt auditModel produced := by
  exact ⟨achieved, achieved_reachable, achieved_ne_produced,
    every_capacity_holds_at_achieved⟩

/-- Structural immunity fails in the same model. -/
theorem immunity_fails : ¬ StructuralImmunityAt auditModel produced := by
  intro hImmune
  have hAvailableLost :
      auditModel.capacity Capacity.availability lost :=
    hImmune lost lost_reachable
  change False at hAvailableLost
  exact hAvailableLost

/--
Source Lemma 2, machine form:
Persistence does not universally entail structural immunity.
-/
theorem persistence_does_not_entail_immunity :
    ¬ PersistenceEntailsImmunity := by
  intro hEntails
  have hImmune : StructuralImmunityAt auditModel produced :=
    hEntails auditModel produced persistence_succeeds
  exact immunity_fails hImmune

/--
Source Lemma 3, machine schema:
No individual imported canonical capacity universally entails structural
immunity merely by being realized.
-/
theorem no_individual_capacity_entails_immunity (c : Capacity) :
    ¬ CapacityEntailsImmunity c := by
  intro hEntails
  have hImmune : StructuralImmunityAt auditModel produced :=
    hEntails auditModel produced (every_capacity_realized c)
  exact immunity_fails hImmune

/-- Named projections of the Lemma 3 schema for audit readability. -/
theorem boundary_capacity_does_not_entail_immunity :
    ¬ CapacityEntailsImmunity Capacity.discrimination :=
  no_individual_capacity_entails_immunity Capacity.discrimination

theorem cascade_capacity_does_not_entail_immunity :
    ¬ CapacityEntailsImmunity Capacity.inheritance :=
  no_individual_capacity_entails_immunity Capacity.inheritance

theorem authorization_capacity_does_not_entail_immunity :
    ¬ CapacityEntailsImmunity Capacity.incorporation :=
  no_individual_capacity_entails_immunity Capacity.incorporation

theorem recognition_capacity_does_not_entail_immunity :
    ¬ CapacityEntailsImmunity Capacity.recognition :=
  no_individual_capacity_entails_immunity Capacity.recognition

theorem coherence_capacity_does_not_entail_immunity :
    ¬ CapacityEntailsImmunity Capacity.coherence :=
  no_individual_capacity_entails_immunity Capacity.coherence

/--
Source Lemma 4, machine form:
Completion of the current canonical capacity package does not universally
entail structural immunity.
-/
theorem canonical_package_does_not_entail_immunity :
    ¬ CanonicalPackageEntailsImmunity := by
  intro hEntails
  have hImmune : StructuralImmunityAt auditModel produced :=
    hEntails auditModel produced canonical_package_succeeds
  exact immunity_fails hImmune

/--
Structural Entropy machine core.

This packages the four source burdens as non-entailment results. It does NOT
claim that structural immunity is impossible. A separately added premise or
proved bridge may entail immunity in a narrower model class. The result here is
only that the tested antecedents do not entail immunity over the declared model
class by themselves.
-/
theorem structural_entropy_machine_core :
    (¬ OccurrenceEntailsPersistence) ∧
    (¬ PersistenceEntailsImmunity) ∧
    (∀ c : Capacity, ¬ CapacityEntailsImmunity c) ∧
    (¬ CanonicalPackageEntailsImmunity) := by
  exact ⟨
    occurrence_does_not_entail_persistence,
    persistence_does_not_entail_immunity,
    no_individual_capacity_entails_immunity,
    canonical_package_does_not_entail_immunity
  ⟩

/-!
Reopening rule represented formally
-----------------------------------
The source theorem explicitly remains open to an additional bridge. This file
therefore does NOT prove `¬ StructuralImmunityAt M s` from canonical success in
all models. It proves only failure of the universal entailments above.

A later theory may add an explicit premise/bridge B and prove, for a restricted
model class:

  canonical package + B -> structural immunity

Such a theorem would not contradict this file unless B were itself derivable
from exactly the premises already represented here.
-/

end Entropy


namespace HingeSeparation

/-
Structural Flow Foundational Formalization — Hinge Separation Kernel v0.1

Historical derivation authority: Structural Flow T.O.E. v1.64
Current semantic authority: Structural Flow TOE — Universal Canon and Interaction Interface (current compatible governing release).
Target: Lean 4
Historical machine provenance: previously clean standalone Lean pass; later incorporated into predecessor consolidated machine work.

Purpose
-------
Formalize the current foundational hinge segment at the minimum burden needed
for prerequisite order and adjacent-hinge non-absorption:

  Persistence -> Boundary -> Cascade -> Authorization
  available   -> discriminated -> inherited -> incorporated

This HingeSeparation module does NOT by itself prove that these four hinges are
exhaustive and does NOT by itself prove the five-regime failure-space closure.
Those burdens are handled later in the FailureClosure module of this same
public kernel. This module tests only:

1. each later hinge requires the preceding hinge under the declared formal
   definitions; and
2. each preceding hinge can succeed while the adjacent later hinge fails.

The three separating states correspond to the TOE claims:

  P ∧ ¬B
  P ∧ B ∧ ¬C
  P ∧ B ∧ C ∧ ¬A

Anti-smuggling rule
-------------------
The later hinge is defined by the additional structural witness named in the
TOE, not by a bare Boolean label:

Persistence   : retained availability of an interaction-produced update.
Boundary      : retained availability + operative relational cut that
                discriminates the retained update.
Cascade       : Boundary + a producing interaction + a distinct further
                interaction receiving the update as input.
Authorization : Cascade + a bounded carrier whose supplied condition is
                altered by the inherited update and whose altered condition
                remains supplied without continued presentation of that update.

Therefore the separating-model proofs test whether the additional burden can
fail while the prior burden remains satisfied.
-/



/--
A minimal structural passage model for one tracked interaction-produced update.
The fields correspond only to the foundational P/B/C/A burden.
-/
structure HingeModel where
  Update : Type
  Interaction : Type
  Carrier : Type
  Condition : Type
  Cut : Type

  /-- Persistence-facing retained availability. -/
  retained : Update → Prop

  /-- Boundary-facing relational cut and discrimination. -/
  cutActive : Cut → Prop
  discriminates : Cut → Update → Prop

  /-- Cascade-facing production and inherited-input relation. -/
  produces : Interaction → Update → Prop
  receivesAsInput : Interaction → Update → Prop

  /-- Authorization-facing bounded carrier and condition transition. -/
  bounded : Carrier → Prop
  presentedTo : Carrier → Update → Prop
  suppliesBefore : Carrier → Condition → Prop
  alteredBy : Update → Condition → Condition → Prop
  suppliesAfter : Carrier → Condition → Prop
  holdsWithoutPresentation : Carrier → Update → Condition → Prop

/--
Persistence: the tracked interaction-produced update remains structurally
available beyond production at the passage under test.
-/
def Persistence (M : HingeModel) (u : M.Update) : Prop :=
  M.retained u

/--
Boundary: retained carry is discriminated through an operative relational cut.
-/
def Boundary (M : HingeModel) (u : M.Update) : Prop :=
  Persistence M u ∧
  ∃ cut : M.Cut,
    M.cutActive cut ∧ M.discriminates cut u

/--
Cascade: a produced update crosses into a distinct further interaction as
inherited input.
-/
def Cascade (M : HingeModel) (u : M.Update) : Prop :=
  Boundary M u ∧
  ∃ i1 i2 : M.Interaction,
    M.produces i1 u ∧
    i1 ≠ i2 ∧
    M.receivesAsInput i2 u

/--
Authorization: inherited update alters the condition supplied by a bounded
carrier, and the altered condition remains supplied without continued active
presentation of the update merely to keep that condition supplied.
-/
def Authorization (M : HingeModel) (u : M.Update) : Prop :=
  Cascade M u ∧
  ∃ carrier : M.Carrier,
  ∃ p p' : M.Condition,
    M.bounded carrier ∧
    M.presentedTo carrier u ∧
    M.suppliesBefore carrier p ∧
    M.alteredBy u p p' ∧
    p' ≠ p ∧
    M.suppliesAfter carrier p' ∧
    M.holdsWithoutPresentation carrier u p'

/-! ## Prerequisite direction -/

/-- Boundary carries Persistence as prerequisite. -/
theorem boundary_requires_persistence
    (M : HingeModel) (u : M.Update) :
    Boundary M u → Persistence M u := by
  intro h
  exact h.1

/-- Cascade carries Boundary as prerequisite. -/
theorem cascade_requires_boundary
    (M : HingeModel) (u : M.Update) :
    Cascade M u → Boundary M u := by
  intro h
  exact h.1

/-- Authorization carries Cascade as prerequisite. -/
theorem authorization_requires_cascade
    (M : HingeModel) (u : M.Update) :
    Authorization M u → Cascade M u := by
  intro h
  exact h.1

/-- Authorization therefore also carries Boundary. -/
theorem authorization_requires_boundary
    (M : HingeModel) (u : M.Update) :
    Authorization M u → Boundary M u := by
  intro h
  exact cascade_requires_boundary M u h.1

/-- Authorization therefore also carries Persistence. -/
theorem authorization_requires_persistence
    (M : HingeModel) (u : M.Update) :
    Authorization M u → Persistence M u := by
  intro h
  exact boundary_requires_persistence M u
    (cascade_requires_boundary M u h.1)

/-! ## Concrete witness vocabulary -/

inductive DemoUpdate
  | u

inductive DemoInteraction
  | i1
  | i2

inductive DemoCarrier
  | k

inductive DemoCondition
  | p
  | pPrime

inductive DemoCut
  | cut

open DemoUpdate DemoInteraction DemoCarrier DemoCondition DemoCut

/-- Shared exact production relation for Cascade-success models. -/
def demoProduces : DemoInteraction → DemoUpdate → Prop
  | i1, u => True
  | _, _ => False

/-- Shared exact inherited-input relation for Cascade-success models. -/
def demoReceives : DemoInteraction → DemoUpdate → Prop
  | i2, u => True
  | _, _ => False

/-- Shared exact pre-Authorization carrier condition. -/
def demoBefore : DemoCarrier → DemoCondition → Prop
  | k, p => True
  | _, _ => False

/-- Shared exact post-Authorization carrier condition. -/
def demoAfter : DemoCarrier → DemoCondition → Prop
  | k, pPrime => True
  | _, _ => False

/-- Shared exact update-conditioned carrier alteration. -/
def demoAltered : DemoUpdate → DemoCondition → DemoCondition → Prop
  | u, p, pPrime => True
  | _, _, _ => False

/-- Shared exact successful post-update hold without continued presentation. -/
def demoStable : DemoCarrier → DemoUpdate → DemoCondition → Prop
  | k, u, pPrime => True
  | _, _, _ => False

/-! ## Separating model 1: P ∧ ¬B -/

/-- Persistence succeeds; no operative discriminating cut exists. -/
def persistenceOnlyModel : HingeModel where
  Update := DemoUpdate
  Interaction := DemoInteraction
  Carrier := DemoCarrier
  Condition := DemoCondition
  Cut := DemoCut
  retained := fun _ => True
  cutActive := fun _ => False
  discriminates := fun _ _ => False
  produces := fun _ _ => False
  receivesAsInput := fun _ _ => False
  bounded := fun _ => False
  presentedTo := fun _ _ => False
  suppliesBefore := fun _ _ => False
  alteredBy := fun _ _ _ => False
  suppliesAfter := fun _ _ => False
  holdsWithoutPresentation := fun _ _ _ => False

theorem persistence_only_has_persistence :
    Persistence persistenceOnlyModel u := by
  exact True.intro

theorem persistence_only_has_no_boundary :
    ¬ Boundary persistenceOnlyModel u := by
  intro h
  rcases h with ⟨_hP, cutWitness, hActive, _hDisc⟩
  change False at hActive
  exact hActive

/-- Machine witness for P ∧ ¬B. -/
theorem separating_state_P_not_B :
    Persistence persistenceOnlyModel u ∧
    ¬ Boundary persistenceOnlyModel u := by
  exact ⟨persistence_only_has_persistence, persistence_only_has_no_boundary⟩

/-! ## Separating model 2: P ∧ B ∧ ¬C -/

/-- Persistence and Boundary succeed; no producing interaction exists. -/
def boundaryOnlyModel : HingeModel where
  Update := DemoUpdate
  Interaction := DemoInteraction
  Carrier := DemoCarrier
  Condition := DemoCondition
  Cut := DemoCut
  retained := fun _ => True
  cutActive := fun _ => True
  discriminates := fun _ _ => True
  produces := fun _ _ => False
  receivesAsInput := fun _ _ => False
  bounded := fun _ => False
  presentedTo := fun _ _ => False
  suppliesBefore := fun _ _ => False
  alteredBy := fun _ _ _ => False
  suppliesAfter := fun _ _ => False
  holdsWithoutPresentation := fun _ _ _ => False

theorem boundary_only_has_boundary :
    Boundary boundaryOnlyModel u := by
  exact ⟨True.intro, cut, True.intro, True.intro⟩

theorem boundary_only_has_no_cascade :
    ¬ Cascade boundaryOnlyModel u := by
  intro h
  rcases h with ⟨_hB, iFirst, iSecond, hProduces, _hDistinct, _hReceives⟩
  change False at hProduces
  exact hProduces

/-- Machine witness for P ∧ B ∧ ¬C. -/
theorem separating_state_P_B_not_C :
    Persistence boundaryOnlyModel u ∧
    Boundary boundaryOnlyModel u ∧
    ¬ Cascade boundaryOnlyModel u := by
  exact ⟨boundary_requires_persistence boundaryOnlyModel u boundary_only_has_boundary,
    boundary_only_has_boundary,
    boundary_only_has_no_cascade⟩

/-! ## Separating model 3: P ∧ B ∧ C ∧ ¬A -/

/--
Persistence, Boundary, and Cascade succeed. The carrier-facing alteration facts
are available, but the altered condition is NOT self-held without continued
presentation, so Authorization fails.
-/
def cascadeOnlyModel : HingeModel where
  Update := DemoUpdate
  Interaction := DemoInteraction
  Carrier := DemoCarrier
  Condition := DemoCondition
  Cut := DemoCut
  retained := fun _ => True
  cutActive := fun _ => True
  discriminates := fun _ _ => True
  produces := demoProduces
  receivesAsInput := demoReceives
  bounded := fun _ => True
  presentedTo := fun _ _ => True
  suppliesBefore := demoBefore
  alteredBy := demoAltered
  suppliesAfter := demoAfter
  holdsWithoutPresentation := fun _ _ _ => False

theorem i1_ne_i2 : i1 ≠ i2 := by
  intro h
  cases h

theorem cascade_only_has_cascade :
    Cascade cascadeOnlyModel u := by
  refine ⟨?_, i1, i2, ?_, i1_ne_i2, ?_⟩
  · exact ⟨True.intro, cut, True.intro, True.intro⟩
  · exact True.intro
  · exact True.intro

theorem cascade_only_has_no_authorization :
    ¬ Authorization cascadeOnlyModel u := by
  intro h
  rcases h with
    ⟨_hC, carrier, pBefore, pAfter,
      _hBounded, _hPresented, _hBefore, _hAltered,
      _hChanged, _hAfter, hStable⟩
  change False at hStable
  exact hStable

/-- Machine witness for P ∧ B ∧ C ∧ ¬A. -/
theorem separating_state_P_B_C_not_A :
    Persistence cascadeOnlyModel u ∧
    Boundary cascadeOnlyModel u ∧
    Cascade cascadeOnlyModel u ∧
    ¬ Authorization cascadeOnlyModel u := by
  have hC : Cascade cascadeOnlyModel u := cascade_only_has_cascade
  have hB : Boundary cascadeOnlyModel u := cascade_requires_boundary cascadeOnlyModel u hC
  have hP : Persistence cascadeOnlyModel u := boundary_requires_persistence cascadeOnlyModel u hB
  exact ⟨hP, hB, hC, cascade_only_has_no_authorization⟩

/-! ## Satisfiability model: all four foundational hinges can succeed -/

/-- Full local success model for the declared P/B/C/A definitions. -/
def fullSuccessModel : HingeModel where
  Update := DemoUpdate
  Interaction := DemoInteraction
  Carrier := DemoCarrier
  Condition := DemoCondition
  Cut := DemoCut
  retained := fun _ => True
  cutActive := fun _ => True
  discriminates := fun _ _ => True
  produces := demoProduces
  receivesAsInput := demoReceives
  bounded := fun _ => True
  presentedTo := fun _ _ => True
  suppliesBefore := demoBefore
  alteredBy := demoAltered
  suppliesAfter := demoAfter
  holdsWithoutPresentation := demoStable

theorem pPrime_ne_p : pPrime ≠ p := by
  intro h
  cases h

theorem full_success_has_authorization :
    Authorization fullSuccessModel u := by
  refine ⟨?_, k, p, pPrime, ?_, ?_, ?_, ?_, pPrime_ne_p, ?_, ?_⟩
  · refine ⟨?_, i1, i2, ?_, i1_ne_i2, ?_⟩
    · exact ⟨True.intro, cut, True.intro, True.intro⟩
    · exact True.intro
    · exact True.intro
  · exact True.intro
  · exact True.intro
  · exact True.intro
  · exact True.intro
  · exact True.intro
  · exact True.intro

/-- The declared four-hinge package is jointly satisfiable. -/
theorem foundational_hinge_package_is_satisfiable :
    Persistence fullSuccessModel u ∧
    Boundary fullSuccessModel u ∧
    Cascade fullSuccessModel u ∧
    Authorization fullSuccessModel u := by
  have hA : Authorization fullSuccessModel u := full_success_has_authorization
  have hC : Cascade fullSuccessModel u := authorization_requires_cascade fullSuccessModel u hA
  have hB : Boundary fullSuccessModel u := cascade_requires_boundary fullSuccessModel u hC
  have hP : Persistence fullSuccessModel u := boundary_requires_persistence fullSuccessModel u hB
  exact ⟨hP, hB, hC, hA⟩

/-! ## Explicit non-entailment statements -/

def PersistenceEntailsBoundary : Prop :=
  ∀ (M : HingeModel) (u : M.Update),
    Persistence M u → Boundary M u

def BoundaryEntailsCascade : Prop :=
  ∀ (M : HingeModel) (u : M.Update),
    Boundary M u → Cascade M u

def CascadeEntailsAuthorization : Prop :=
  ∀ (M : HingeModel) (u : M.Update),
    Cascade M u → Authorization M u

/-- Persistence does not universally entail Boundary. -/
theorem persistence_does_not_entail_boundary :
    ¬ PersistenceEntailsBoundary := by
  intro hEntails
  have hBoundary : Boundary persistenceOnlyModel u :=
    hEntails persistenceOnlyModel u persistence_only_has_persistence
  exact persistence_only_has_no_boundary hBoundary

/-- Boundary does not universally entail Cascade. -/
theorem boundary_does_not_entail_cascade :
    ¬ BoundaryEntailsCascade := by
  intro hEntails
  have hCascade : Cascade boundaryOnlyModel u :=
    hEntails boundaryOnlyModel u boundary_only_has_boundary
  exact boundary_only_has_no_cascade hCascade

/-- Cascade does not universally entail Authorization. -/
theorem cascade_does_not_entail_authorization :
    ¬ CascadeEntailsAuthorization := by
  intro hEntails
  have hAuthorization : Authorization cascadeOnlyModel u :=
    hEntails cascadeOnlyModel u cascade_only_has_cascade
  exact cascade_only_has_no_authorization hAuthorization

/--
Combined local machine result for the current hinge-separation burden.
This is non-absorption, not exhaustion.
-/
theorem foundational_adjacent_hinges_are_nonabsorbed :
    (¬ PersistenceEntailsBoundary) ∧
    (¬ BoundaryEntailsCascade) ∧
    (¬ CascadeEntailsAuthorization) := by
  exact ⟨persistence_does_not_entail_boundary,
    boundary_does_not_entail_cascade,
    cascade_does_not_entail_authorization⟩

end HingeSeparation


namespace FailureClosure

/-!
Structural Flow — Foundational Failure Closure — PUBLIC THEOREM MODULE
Historical derivation line: kernel v0.2 Lean candidate.

Purpose
-------
Strengthen the already-passing first-break partition into an explicit
"no sixth irreducible first-break regime" result at the declared foundational
scope:

  Persistence -> Boundary -> Cascade -> Authorization

The file does NOT define a five-constructor `FailureRegime` datatype and infer
closure by counting constructors. Instead it:

1. represents the independently declared prerequisite capacities as propositions;
2. derives a numerical first-break depth from those capacities;
3. proves that each of the five named regimes occupies one distinct depth;
4. defines an irreducible first-break candidate as a nonempty, well-formed,
   foundational-failure predicate whose instances are homogeneous in first-break
   depth;
5. proves that every such candidate is contained in one of the five already-named
   regimes;
6. proves that a candidate spanning distinct first-break depths is not irreducible
   in this sense and is therefore compound at the first-break level.

Scope / reopening rule
----------------------
This is closure relative to the current four-hinge foundational architecture and
its independently earned two-surface Persistence distinction:

  no establishment / established then lost under load.

A genuinely new necessary foundational capacity changes the architecture and
reopens this theorem. This file is not designed to rule such a capacity out by
fiat.
-/



structure RouteSnapshot where
  produced : Prop
  persistenceEstablished : Prop
  persistenceCarriesUnderLoad : Prop
  boundaryDiscriminates : Prop
  cascadeInherits : Prop
  authorizationIncorporates : Prop

structure WellFormedRoute (s : RouteSnapshot) : Prop where
  loadCarry_requires_establishment :
    s.persistenceCarriesUnderLoad -> s.persistenceEstablished
  boundary_requires_loadCarry :
    s.boundaryDiscriminates -> s.persistenceCarriesUnderLoad
  cascade_requires_boundary :
    s.cascadeInherits -> s.boundaryDiscriminates
  authorization_requires_cascade :
    s.authorizationIncorporates -> s.cascadeInherits

def FoundationalFailure (s : RouteSnapshot) : Prop :=
  s.produced ∧ ¬ s.authorizationIncorporates

def Dissolution (s : RouteSnapshot) : Prop :=
  s.produced ∧ ¬ s.persistenceEstablished

def Shear (s : RouteSnapshot) : Prop :=
  s.produced ∧
  s.persistenceEstablished ∧
  ¬ s.persistenceCarriesUnderLoad

def Drift (s : RouteSnapshot) : Prop :=
  s.produced ∧
  s.persistenceCarriesUnderLoad ∧
  ¬ s.boundaryDiscriminates

def Echo (s : RouteSnapshot) : Prop :=
  s.produced ∧
  s.boundaryDiscriminates ∧
  ¬ s.cascadeInherits

def Lock (s : RouteSnapshot) : Prop :=
  s.produced ∧
  s.cascadeInherits ∧
  ¬ s.authorizationIncorporates

/--
Derived first-break depth.

0 = retained availability never establishes
1 = retained availability establishes but does not carry under relevant load
2 = load-bearing retention survives but Boundary discrimination fails
3 = Boundary succeeds but Cascade inheritance fails
4 = Cascade succeeds but Authorization incorporation fails
5 = Authorization succeeds: no foundational first-break failure remains

The numbers are outputs of the independently stated capacity tests. They are not
introduced as five primitive regime objects.
-/
noncomputable def firstBreakDepth (s : RouteSnapshot) : Nat := by
  classical
  exact
    if s.persistenceEstablished then
      if s.persistenceCarriesUnderLoad then
        if s.boundaryDiscriminates then
          if s.cascadeInherits then
            if s.authorizationIncorporates then 5 else 4
          else 3
        else 2
      else 1
    else 0

/-- Existing first-break exhaustion, retained as the bridge from route failure to
named regime predicates. -/
theorem foundational_failure_exhaustion
    (s : RouteSnapshot)
    (_wf : WellFormedRoute s)
    (hfail : FoundationalFailure s) :
    Dissolution s ∨ Shear s ∨ Drift s ∨ Echo s ∨ Lock s := by
  rcases hfail with ⟨hProduced, hNotAuth⟩
  by_cases hPE : s.persistenceEstablished
  · by_cases hPL : s.persistenceCarriesUnderLoad
    · by_cases hB : s.boundaryDiscriminates
      · by_cases hC : s.cascadeInherits
        · right
          right
          right
          right
          exact ⟨hProduced, hC, hNotAuth⟩
        · right
          right
          right
          left
          exact ⟨hProduced, hB, hC⟩
      · right
        right
        left
        exact ⟨hProduced, hPL, hB⟩
    · right
      left
      exact ⟨hProduced, hPE, hPL⟩
  · left
    exact ⟨hProduced, hPE⟩

/-! Named regimes occupy distinct derived first-break depths. -/

theorem dissolution_depth
    (s : RouteSnapshot)
    (h : Dissolution s) :
    firstBreakDepth s = 0 := by
  rcases h with ⟨_, hNotPE⟩
  simp [firstBreakDepth, hNotPE]

theorem shear_depth
    (s : RouteSnapshot)
    (h : Shear s) :
    firstBreakDepth s = 1 := by
  rcases h with ⟨_, hPE, hNotLoad⟩
  simp [firstBreakDepth, hPE, hNotLoad]

theorem drift_depth
    (s : RouteSnapshot)
    (wf : WellFormedRoute s)
    (h : Drift s) :
    firstBreakDepth s = 2 := by
  rcases h with ⟨_, hLoad, hNotBoundary⟩
  have hPE : s.persistenceEstablished :=
    wf.loadCarry_requires_establishment hLoad
  simp [firstBreakDepth, hPE, hLoad, hNotBoundary]

theorem echo_depth
    (s : RouteSnapshot)
    (wf : WellFormedRoute s)
    (h : Echo s) :
    firstBreakDepth s = 3 := by
  rcases h with ⟨_, hBoundary, hNotCascade⟩
  have hLoad : s.persistenceCarriesUnderLoad :=
    wf.boundary_requires_loadCarry hBoundary
  have hPE : s.persistenceEstablished :=
    wf.loadCarry_requires_establishment hLoad
  simp [firstBreakDepth, hPE, hLoad, hBoundary, hNotCascade]

theorem lock_depth
    (s : RouteSnapshot)
    (wf : WellFormedRoute s)
    (h : Lock s) :
    firstBreakDepth s = 4 := by
  rcases h with ⟨_, hCascade, hNotAuth⟩
  have hBoundary : s.boundaryDiscriminates :=
    wf.cascade_requires_boundary hCascade
  have hLoad : s.persistenceCarriesUnderLoad :=
    wf.boundary_requires_loadCarry hBoundary
  have hPE : s.persistenceEstablished :=
    wf.loadCarry_requires_establishment hLoad
  simp [firstBreakDepth, hPE, hLoad, hBoundary, hCascade, hNotAuth]

/-! Exact characterization of the derived depth values.

These lemmas deliberately exhaust the finite truth-pattern space of the five
capacity propositions used by `firstBreakDepth`. This avoids hiding any
additional inference inside simplification of a partially evaluated `if` tree.
-/

theorem depth_zero_iff
    (s : RouteSnapshot) :
    firstBreakDepth s = 0 ↔ ¬ s.persistenceEstablished := by
  classical
  by_cases hPE : s.persistenceEstablished <;>
  by_cases hLoad : s.persistenceCarriesUnderLoad <;>
  by_cases hBoundary : s.boundaryDiscriminates <;>
  by_cases hCascade : s.cascadeInherits <;>
  by_cases hAuth : s.authorizationIncorporates <;>
  simp [firstBreakDepth, hPE, hLoad, hBoundary, hCascade, hAuth]

theorem depth_one_iff
    (s : RouteSnapshot) :
    firstBreakDepth s = 1 ↔
      s.persistenceEstablished ∧ ¬ s.persistenceCarriesUnderLoad := by
  classical
  by_cases hPE : s.persistenceEstablished <;>
  by_cases hLoad : s.persistenceCarriesUnderLoad <;>
  by_cases hBoundary : s.boundaryDiscriminates <;>
  by_cases hCascade : s.cascadeInherits <;>
  by_cases hAuth : s.authorizationIncorporates <;>
  simp [firstBreakDepth, hPE, hLoad, hBoundary, hCascade, hAuth]

theorem depth_two_iff
    (s : RouteSnapshot) :
    firstBreakDepth s = 2 ↔
      s.persistenceEstablished ∧
      s.persistenceCarriesUnderLoad ∧
      ¬ s.boundaryDiscriminates := by
  classical
  by_cases hPE : s.persistenceEstablished <;>
  by_cases hLoad : s.persistenceCarriesUnderLoad <;>
  by_cases hBoundary : s.boundaryDiscriminates <;>
  by_cases hCascade : s.cascadeInherits <;>
  by_cases hAuth : s.authorizationIncorporates <;>
  simp [firstBreakDepth, hPE, hLoad, hBoundary, hCascade, hAuth]

theorem depth_three_iff
    (s : RouteSnapshot) :
    firstBreakDepth s = 3 ↔
      s.persistenceEstablished ∧
      s.persistenceCarriesUnderLoad ∧
      s.boundaryDiscriminates ∧
      ¬ s.cascadeInherits := by
  classical
  by_cases hPE : s.persistenceEstablished <;>
  by_cases hLoad : s.persistenceCarriesUnderLoad <;>
  by_cases hBoundary : s.boundaryDiscriminates <;>
  by_cases hCascade : s.cascadeInherits <;>
  by_cases hAuth : s.authorizationIncorporates <;>
  simp [firstBreakDepth, hPE, hLoad, hBoundary, hCascade, hAuth]

theorem depth_four_iff
    (s : RouteSnapshot) :
    firstBreakDepth s = 4 ↔
      s.persistenceEstablished ∧
      s.persistenceCarriesUnderLoad ∧
      s.boundaryDiscriminates ∧
      s.cascadeInherits ∧
      ¬ s.authorizationIncorporates := by
  classical
  by_cases hPE : s.persistenceEstablished <;>
  by_cases hLoad : s.persistenceCarriesUnderLoad <;>
  by_cases hBoundary : s.boundaryDiscriminates <;>
  by_cases hCascade : s.cascadeInherits <;>
  by_cases hAuth : s.authorizationIncorporates <;>
  simp [firstBreakDepth, hPE, hLoad, hBoundary, hCascade, hAuth]

theorem depth_five_iff
    (s : RouteSnapshot) :
    firstBreakDepth s = 5 ↔
      s.persistenceEstablished ∧
      s.persistenceCarriesUnderLoad ∧
      s.boundaryDiscriminates ∧
      s.cascadeInherits ∧
      s.authorizationIncorporates := by
  classical
  by_cases hPE : s.persistenceEstablished <;>
  by_cases hLoad : s.persistenceCarriesUnderLoad <;>
  by_cases hBoundary : s.boundaryDiscriminates <;>
  by_cases hCascade : s.cascadeInherits <;>
  by_cases hAuth : s.authorizationIncorporates <;>
  simp [firstBreakDepth, hPE, hLoad, hBoundary, hCascade, hAuth]

/-! Converse direction: a foundational failure at each derived depth is exactly
inside the corresponding existing regime predicate. -/

theorem depth_zero_is_dissolution
    (s : RouteSnapshot)
    (hfail : FoundationalFailure s)
    (hDepth : firstBreakDepth s = 0) :
    Dissolution s := by
  rcases hfail with ⟨hProduced, _⟩
  have hNotPE : ¬ s.persistenceEstablished :=
    (depth_zero_iff s).mp hDepth
  exact ⟨hProduced, hNotPE⟩

theorem depth_one_is_shear
    (s : RouteSnapshot)
    (hfail : FoundationalFailure s)
    (hDepth : firstBreakDepth s = 1) :
    Shear s := by
  rcases hfail with ⟨hProduced, _⟩
  rcases (depth_one_iff s).mp hDepth with ⟨hPE, hNotLoad⟩
  exact ⟨hProduced, hPE, hNotLoad⟩

theorem depth_two_is_drift
    (s : RouteSnapshot)
    (hfail : FoundationalFailure s)
    (hDepth : firstBreakDepth s = 2) :
    Drift s := by
  rcases hfail with ⟨hProduced, _⟩
  rcases (depth_two_iff s).mp hDepth with ⟨_, hLoad, hNotBoundary⟩
  exact ⟨hProduced, hLoad, hNotBoundary⟩

theorem depth_three_is_echo
    (s : RouteSnapshot)
    (hfail : FoundationalFailure s)
    (hDepth : firstBreakDepth s = 3) :
    Echo s := by
  rcases hfail with ⟨hProduced, _⟩
  rcases (depth_three_iff s).mp hDepth with
    ⟨_, _, hBoundary, hNotCascade⟩
  exact ⟨hProduced, hBoundary, hNotCascade⟩

theorem depth_four_is_lock
    (s : RouteSnapshot)
    (hfail : FoundationalFailure s)
    (hDepth : firstBreakDepth s = 4) :
    Lock s := by
  rcases hfail with ⟨hProduced, _⟩
  rcases (depth_four_iff s).mp hDepth with
    ⟨_, _, _, hCascade, hNotAuth⟩
  exact ⟨hProduced, hCascade, hNotAuth⟩

/-- Any current foundational failure has derived first-break depth strictly below
5. Depth 5 is the success side where Authorization incorporation holds. -/
theorem foundational_failure_depth_lt_five
    (s : RouteSnapshot)
    (wf : WellFormedRoute s)
    (hfail : FoundationalFailure s) :
    firstBreakDepth s < 5 := by
  have hClass := foundational_failure_exhaustion s wf hfail
  rcases hClass with hD | hS | hR | hE | hL
  · simp [dissolution_depth s hD]
  · simp [shear_depth s hS]
  · simp [drift_depth s wf hR]
  · simp [echo_depth s wf hE]
  · simp [lock_depth s wf hL]

/--
An irreducible first-break candidate at the current scope.

`homogeneous` encodes the first-break criterion itself: one irreducible regime
cannot contain failures whose earliest broken foundational burden occurs at
multiple derived depths. Such a mixed predicate is compound at this level.
-/
structure FirstBreakCandidate (R : RouteSnapshot -> Prop) : Prop where
  nonempty : ∃ s, R s
  failure : ∀ s, R s -> FoundationalFailure s
  wellFormed : ∀ s, R s -> WellFormedRoute s
  homogeneous :
    ∀ s t, R s -> R t -> firstBreakDepth s = firstBreakDepth t

/--
Core closure theorem.

Every nonempty irreducible first-break candidate inside the present architecture
collapses into one of the five existing regime classes: every instance of the
candidate is contained in that existing regime predicate.

This is stronger than saying each individual failure can be labeled. It says a
putative sixth irreducible predicate cannot occupy a new first-break class while
remaining inside the same architecture and classification rule.
-/
theorem irreducible_candidate_collapses_to_existing_regime
    (R : RouteSnapshot -> Prop)
    (c : FirstBreakCandidate R) :
    (∀ s, R s -> Dissolution s) ∨
    (∀ s, R s -> Shear s) ∨
    (∀ s, R s -> Drift s) ∨
    (∀ s, R s -> Echo s) ∨
    (∀ s, R s -> Lock s) := by
  rcases c.nonempty with ⟨w, hw⟩
  have hWFail : FoundationalFailure w := c.failure w hw
  have hWWf : WellFormedRoute w := c.wellFormed w hw
  have hClass := foundational_failure_exhaustion w hWWf hWFail
  rcases hClass with hD | hS | hR | hE | hL
  · left
    intro s hs
    have hDepthW : firstBreakDepth w = 0 := dissolution_depth w hD
    have hDepthS : firstBreakDepth s = 0 := by
      calc
        firstBreakDepth s = firstBreakDepth w := c.homogeneous s w hs hw
        _ = 0 := hDepthW
    exact depth_zero_is_dissolution s (c.failure s hs) hDepthS
  · right
    left
    intro s hs
    have hDepthW : firstBreakDepth w = 1 := shear_depth w hS
    have hDepthS : firstBreakDepth s = 1 := by
      calc
        firstBreakDepth s = firstBreakDepth w := c.homogeneous s w hs hw
        _ = 1 := hDepthW
    exact depth_one_is_shear s (c.failure s hs) hDepthS
  · right
    right
    left
    intro s hs
    have hDepthW : firstBreakDepth w = 2 := drift_depth w hWWf hR
    have hDepthS : firstBreakDepth s = 2 := by
      calc
        firstBreakDepth s = firstBreakDepth w := c.homogeneous s w hs hw
        _ = 2 := hDepthW
    exact depth_two_is_drift s (c.failure s hs) hDepthS
  · right
    right
    right
    left
    intro s hs
    have hDepthW : firstBreakDepth w = 3 := echo_depth w hWWf hE
    have hDepthS : firstBreakDepth s = 3 := by
      calc
        firstBreakDepth s = firstBreakDepth w := c.homogeneous s w hs hw
        _ = 3 := hDepthW
    exact depth_three_is_echo s (c.failure s hs) hDepthS
  · right
    right
    right
    right
    intro s hs
    have hDepthW : firstBreakDepth w = 4 := lock_depth w hWWf hL
    have hDepthS : firstBreakDepth s = 4 := by
      calc
        firstBreakDepth s = firstBreakDepth w := c.homogeneous s w hs hw
        _ = 4 := hDepthW
    exact depth_four_is_lock s (c.failure s hs) hDepthS

/-- If a proposed predicate contains two current failure instances at genuinely
different first-break depths, it cannot be one irreducible first-break regime.
At this classification level it is compound. -/
theorem cross_depth_predicate_is_not_irreducible
    (R : RouteSnapshot -> Prop)
    (s t : RouteSnapshot)
    (hs : R s)
    (ht : R t)
    (hDifferent : firstBreakDepth s ≠ firstBreakDepth t) :
    ¬ FirstBreakCandidate R := by
  intro c
  exact hDifferent (c.homogeneous s t hs ht)

/-- Public-facing closure statement for the present architecture. -/
theorem no_sixth_irreducible_first_break_regime_inside_current_architecture
    (R : RouteSnapshot -> Prop)
    (c : FirstBreakCandidate R) :
    (∀ s, R s -> Dissolution s) ∨
    (∀ s, R s -> Shear s) ∨
    (∀ s, R s -> Drift s) ∨
    (∀ s, R s -> Echo s) ∨
    (∀ s, R s -> Lock s) := by
  exact irreducible_candidate_collapses_to_existing_regime R c

end FailureClosure


namespace Austerity

/-
Structural Flow — Austerity / No-Hidden-Primitive Kernel v0.1
Historical module provenance: Lean 4 candidate at original derivation.

Historical derivation authority:
  Structural Flow T.O.E. v1.64
Current semantic authority:
  Structural Flow TOE — Universal Canon and Interaction Interface (current compatible governing release).
  Six Faces of Chance:
    Permissive
    Eventful
    Permits Retry
    Does Not Guarantee Persistence
    Non-Teleological
    Austere

Purpose:
  Machine-audit the special job of the Austere face without defining a finite
  catalogue of possible hidden primitives.

Key design:
  `Extra` is an arbitrary type supplied from outside this kernel.
  The kernel does NOT enumerate time, memory, law, symmetry, probability,
  geometry, observerhood, or any other possible added primitive content.
  Any proposed additional primitive-level commitment can be represented by
  an arbitrary `e : Extra`.

  Austerity then means:
      no `Extra` commitment is carried primitively.

  This lets us prove:
    1. the canonical primitive is Austere;
    2. any candidate with the five positive/non-guarantee faces plus any extra
       primitive commitment is strictly richer than the canonical primitive;
    3. any Austere candidate carrying those same five faces is commitment-
       equivalent to the canonical primitive;
    4. Austerity is exactly the absence of an extra primitive commitment.

Scope:
  This is a primitive-signature/minimality audit.
  It does not yet prove the complete six-face closure theorem by itself.
  If a proposed seventh face cannot be represented as either one of the five
  stated primitive commitments or an additional primitive commitment `Extra`,
  that challenges the declared primitive-signature language and reopens the
  closure burden rather than being excluded by this file.
-/

universe u



/-- A primitive specification carries the five non-Austerity face commitments,
    plus an open-ended family of possible additional primitive commitments. -/
structure PrimitiveSpec (Extra : Type u) where
  permissive : Prop
  eventful : Prop
  permitsRetry : Prop
  doesNotGuaranteePersistence : Prop
  nonTeleological : Prop
  extra : Extra → Prop

/-- Commitment vocabulary. `extra e` is deliberately open-ended. -/
inductive Commitment (Extra : Type u) where
  | permissive
  | eventful
  | permitsRetry
  | doesNotGuaranteePersistence
  | nonTeleological
  | extra (e : Extra)

/-- Does primitive specification `p` carry commitment `c`? -/
def Commits {Extra : Type u} (p : PrimitiveSpec Extra) :
    Commitment Extra → Prop
  | .permissive => p.permissive
  | .eventful => p.eventful
  | .permitsRetry => p.permitsRetry
  | .doesNotGuaranteePersistence => p.doesNotGuaranteePersistence
  | .nonTeleological => p.nonTeleological
  | .extra e => p.extra e

/-- The five stated commitments other than the global Austerity foreclosure. -/
def CarriesFive {Extra : Type u} (p : PrimitiveSpec Extra) : Prop :=
  p.permissive ∧
  p.eventful ∧
  p.permitsRetry ∧
  p.doesNotGuaranteePersistence ∧
  p.nonTeleological

/-- Austerity: no additional primitive commitment is carried. -/
def Austere {Extra : Type u} (p : PrimitiveSpec Extra) : Prop :=
  ∀ e, ¬ p.extra e

/-- Commitment inclusion: every primitive commitment of `p` is also carried by `q`. -/
def LeCommit {Extra : Type u} (p q : PrimitiveSpec Extra) : Prop :=
  ∀ c, Commits p c → Commits q c

/-- `richer` carries everything `base` carries and at least something not carried back. -/
def StrictlyRicher {Extra : Type u}
    (richer base : PrimitiveSpec Extra) : Prop :=
  LeCommit base richer ∧ ¬ LeCommit richer base

/-- Canonical five-face content with no hidden primitive commitments. -/
def chanceCore (Extra : Type u) : PrimitiveSpec Extra where
  permissive := True
  eventful := True
  permitsRetry := True
  doesNotGuaranteePersistence := True
  nonTeleological := True
  extra := fun _ => False

theorem chanceCore_carriesFive (Extra : Type u) :
    CarriesFive (chanceCore Extra) := by
  simp [CarriesFive, chanceCore]

theorem chanceCore_austere (Extra : Type u) :
    Austere (chanceCore Extra) := by
  intro e h
  exact h

/-- Austerity is exactly the absence of any extra primitive commitment. -/
theorem austere_iff_no_extra {Extra : Type u} (p : PrimitiveSpec Extra) :
    Austere p ↔ ¬ ∃ e, p.extra e := by
  constructor
  · intro hA hExtra
    rcases hExtra with ⟨e, he⟩
    exact hA e he
  · intro hNo e he
    apply hNo
    exact ⟨e, he⟩

/-- Any specification carrying the five stated faces carries at least everything
    carried by the canonical core. -/
theorem chanceCore_le_of_carriesFive
    {Extra : Type u} {p : PrimitiveSpec Extra}
    (hFive : CarriesFive p) :
    LeCommit (chanceCore Extra) p := by
  intro c hc
  rcases hFive with ⟨hPerm, hEvent, hRetry, hNoPersist, hNonTel⟩
  cases c with
  | permissive =>
      exact hPerm
  | eventful =>
      exact hEvent
  | permitsRetry =>
      exact hRetry
  | doesNotGuaranteePersistence =>
      exact hNoPersist
  | nonTeleological =>
      exact hNonTel
  | extra e =>
      exact False.elim hc

/-- Any Austere specification carries no commitment absent from the canonical core. -/
theorem le_chanceCore_of_austere
    {Extra : Type u} {p : PrimitiveSpec Extra}
    (hA : Austere p) :
    LeCommit p (chanceCore Extra) := by
  intro c hc
  cases c with
  | permissive =>
      exact True.intro
  | eventful =>
      exact True.intro
  | permitsRetry =>
      exact True.intro
  | doesNotGuaranteePersistence =>
      exact True.intro
  | nonTeleological =>
      exact True.intro
  | extra e =>
      exact hA e hc

/-- If a candidate carries the five stated faces and adds any primitive
    commitment, it is strictly richer than the canonical Chance core. -/
theorem extra_primitive_makes_candidate_strictly_richer
    {Extra : Type u} {p : PrimitiveSpec Extra}
    (hFive : CarriesFive p)
    (hExtra : ∃ e, p.extra e) :
    StrictlyRicher p (chanceCore Extra) := by
  constructor
  · exact chanceCore_le_of_carriesFive hFive
  · intro hBack
    rcases hExtra with ⟨e, he⟩
    have hCoreExtra : Commits (chanceCore Extra) (.extra e) :=
      hBack (.extra e) he
    exact hCoreExtra

/-- Austerity blocks every proposed extra primitive commitment, no matter what
    the externally supplied type `Extra` contains. -/
theorem austerity_blocks_arbitrary_extra
    {Extra : Type u} {p : PrimitiveSpec Extra}
    (hA : Austere p) :
    ∀ e : Extra, ¬ p.extra e :=
  hA

/-- Five-face agreement plus Austerity yields commitment equivalence to the
    canonical core. No hidden primitive content remains. -/
theorem five_plus_austere_commitment_equivalent_to_core
    {Extra : Type u} {p : PrimitiveSpec Extra}
    (hFive : CarriesFive p)
    (hA : Austere p) :
    ∀ c, Commits p c ↔ Commits (chanceCore Extra) c := by
  intro c
  constructor
  · exact le_chanceCore_of_austere hA c
  · exact chanceCore_le_of_carriesFive hFive c

/-- If a candidate carries any extra primitive commitment, it is not Austere. -/
theorem any_extra_breaks_austerity
    {Extra : Type u} {p : PrimitiveSpec Extra}
    (hExtra : ∃ e, p.extra e) :
    ¬ Austere p := by
  intro hA
  rcases hExtra with ⟨e, he⟩
  exact hA e he

end Austerity


namespace SixFaceClosure

/-
Structural Flow — Six-Face Signature Closure Kernel v0.1
Historical module provenance: Lean 4 candidate at original derivation.

Historical derivation authority:
  Structural Flow T.O.E. v1.64
Current semantic authority:
  Structural Flow TOE — Universal Canon and Interaction Interface (current compatible governing release).
  Chance contains exactly six non-optional faces:
    1. Permissive
    2. Eventful
    3. Permits Retry
    4. Does Not Guarantee Persistence
    5. Non-Teleological
    6. Austere

Purpose:
  Machine-audit the exact "six faces" burden without proving closure by
  merely defining a six-constructor enumeration.

Architecture of the proof:
  * The first five faces are treated as independently necessary primitive
    commitments.
  * Austerity is not a sixth ordinary positive commitment. It is the global
    closure condition: no additional primitive commitment is carried.
  * `Extra` remains an arbitrary externally supplied type. Therefore no finite
    catalogue of possible hidden primitives is built into the theorem.
  * A "seventh independent primitive face" is represented extensionally as
    any extra primitive commitment beyond the five stated commitments.
  * The theorem proves that such a seventh independent commitment is
    incompatible with Austerity.
  * Conversely, five-face agreement plus Austerity is commitment-equivalent
    to the canonical Chance signature.

What this does NOT claim:
  * It does not prove that no derived, meta-level, explanatory, or redundant
    property can ever be stated about Chance.
  * It does not define every conceivable English predicate over the primitive.
  * It closes only the declared primitive-signature burden:
      five independent primitive commitments + the global no-extra condition.
  * If a challenger produces a purported seventh "face" that is neither one of
    the five primitive commitments nor an additional primitive commitment,
    its status must be adjudicated as derived/meta/redundant or the signature
    language must be reopened.
-/

universe u



/-- The five primitive-level commitments other than the global Austerity closure. -/
structure FiveFaces where
  permissive : Prop
  eventful : Prop
  permitsRetry : Prop
  doesNotGuaranteePersistence : Prop
  nonTeleological : Prop

/-- A full primitive candidate carries the five named commitments plus an
    open-ended family of possible additional primitive commitments. -/
structure PrimitiveCandidate (Extra : Type u) where
  core : FiveFaces
  extra : Extra → Prop

/-- The five current faces all hold. -/
def CarriesFive {Extra : Type u} (p : PrimitiveCandidate Extra) : Prop :=
  p.core.permissive ∧
  p.core.eventful ∧
  p.core.permitsRetry ∧
  p.core.doesNotGuaranteePersistence ∧
  p.core.nonTeleological

/-- Austerity is the global primitive-signature closure condition. -/
def Austere {Extra : Type u} (p : PrimitiveCandidate Extra) : Prop :=
  ∀ e : Extra, ¬ p.extra e

/-- Canonical Chance signature: all five named commitments, no extra primitive content. -/
def chanceSignature (Extra : Type u) : PrimitiveCandidate Extra where
  core := {
    permissive := True
    eventful := True
    permitsRetry := True
    doesNotGuaranteePersistence := True
    nonTeleological := True
  }
  extra := fun _ => False

theorem canonical_carries_five (Extra : Type u) :
    CarriesFive (chanceSignature Extra) := by
  simp [CarriesFive, chanceSignature]

theorem canonical_is_austere (Extra : Type u) :
    Austere (chanceSignature Extra) := by
  intro e he
  exact he

/-
Nonredundancy witnesses.

Each witness preserves the other four core commitments and Austerity while
negating exactly one named face. These are not intended as physical universes;
they are logical separating assignments demonstrating that no one of the five
named primitive commitments is entailed merely by the other four + Austerity.
-/

def withoutPermissive (Extra : Type u) : PrimitiveCandidate Extra where
  core := {
    permissive := False
    eventful := True
    permitsRetry := True
    doesNotGuaranteePersistence := True
    nonTeleological := True
  }
  extra := fun _ => False

def withoutEventful (Extra : Type u) : PrimitiveCandidate Extra where
  core := {
    permissive := True
    eventful := False
    permitsRetry := True
    doesNotGuaranteePersistence := True
    nonTeleological := True
  }
  extra := fun _ => False

def withoutRetry (Extra : Type u) : PrimitiveCandidate Extra where
  core := {
    permissive := True
    eventful := True
    permitsRetry := False
    doesNotGuaranteePersistence := True
    nonTeleological := True
  }
  extra := fun _ => False

def withGuaranteedPersistence (Extra : Type u) : PrimitiveCandidate Extra where
  core := {
    permissive := True
    eventful := True
    permitsRetry := True
    doesNotGuaranteePersistence := False
    nonTeleological := True
  }
  extra := fun _ => False

def withTeleology (Extra : Type u) : PrimitiveCandidate Extra where
  core := {
    permissive := True
    eventful := True
    permitsRetry := True
    doesNotGuaranteePersistence := True
    nonTeleological := False
  }
  extra := fun _ => False

theorem permissive_not_entailed_by_other_four_plus_austerity
    (Extra : Type u) :
    (withoutPermissive Extra).core.eventful ∧
    (withoutPermissive Extra).core.permitsRetry ∧
    (withoutPermissive Extra).core.doesNotGuaranteePersistence ∧
    (withoutPermissive Extra).core.nonTeleological ∧
    Austere (withoutPermissive Extra) ∧
    ¬ (withoutPermissive Extra).core.permissive := by
  simp [withoutPermissive, Austere]

theorem eventful_not_entailed_by_other_four_plus_austerity
    (Extra : Type u) :
    (withoutEventful Extra).core.permissive ∧
    (withoutEventful Extra).core.permitsRetry ∧
    (withoutEventful Extra).core.doesNotGuaranteePersistence ∧
    (withoutEventful Extra).core.nonTeleological ∧
    Austere (withoutEventful Extra) ∧
    ¬ (withoutEventful Extra).core.eventful := by
  simp [withoutEventful, Austere]

theorem retry_not_entailed_by_other_four_plus_austerity
    (Extra : Type u) :
    (withoutRetry Extra).core.permissive ∧
    (withoutRetry Extra).core.eventful ∧
    (withoutRetry Extra).core.doesNotGuaranteePersistence ∧
    (withoutRetry Extra).core.nonTeleological ∧
    Austere (withoutRetry Extra) ∧
    ¬ (withoutRetry Extra).core.permitsRetry := by
  simp [withoutRetry, Austere]

theorem no_guaranteed_persistence_not_entailed_by_other_four_plus_austerity
    (Extra : Type u) :
    (withGuaranteedPersistence Extra).core.permissive ∧
    (withGuaranteedPersistence Extra).core.eventful ∧
    (withGuaranteedPersistence Extra).core.permitsRetry ∧
    (withGuaranteedPersistence Extra).core.nonTeleological ∧
    Austere (withGuaranteedPersistence Extra) ∧
    ¬ (withGuaranteedPersistence Extra).core.doesNotGuaranteePersistence := by
  simp [withGuaranteedPersistence, Austere]

theorem nonteleology_not_entailed_by_other_four_plus_austerity
    (Extra : Type u) :
    (withTeleology Extra).core.permissive ∧
    (withTeleology Extra).core.eventful ∧
    (withTeleology Extra).core.permitsRetry ∧
    (withTeleology Extra).core.doesNotGuaranteePersistence ∧
    Austere (withTeleology Extra) ∧
    ¬ (withTeleology Extra).core.nonTeleological := by
  simp [withTeleology, Austere]

/-- A proposed seventh INDEPENDENT primitive face is represented as an
    additional primitive commitment. Austerity excludes every such commitment,
    regardless of what `Extra` contains. -/
theorem no_seventh_independent_primitive_face_under_austerity
    {Extra : Type u} {p : PrimitiveCandidate Extra}
    (hA : Austere p) :
    ¬ ∃ e : Extra, p.extra e := by
  intro h
  rcases h with ⟨e, he⟩
  exact hA e he

/-- If an extra primitive commitment exists, Austerity is false. -/
theorem seventh_independent_commitment_reopens_austerity
    {Extra : Type u} {p : PrimitiveCandidate Extra}
    (hExtra : ∃ e : Extra, p.extra e) :
    ¬ Austere p := by
  intro hA
  exact no_seventh_independent_primitive_face_under_austerity hA hExtra

/-- Commitment equivalence at primitive-signature scope:
    any candidate with the five named commitments + Austerity carries exactly
    the same primitive commitments as the canonical Chance signature. -/
inductive PrimitiveCommitment (Extra : Type u) where
  | permissive
  | eventful
  | permitsRetry
  | doesNotGuaranteePersistence
  | nonTeleological
  | extra (e : Extra)

def Commits {Extra : Type u}
    (p : PrimitiveCandidate Extra) : PrimitiveCommitment Extra → Prop
  | .permissive => p.core.permissive
  | .eventful => p.core.eventful
  | .permitsRetry => p.core.permitsRetry
  | .doesNotGuaranteePersistence => p.core.doesNotGuaranteePersistence
  | .nonTeleological => p.core.nonTeleological
  | .extra e => p.extra e

theorem five_plus_austerity_exactly_matches_canonical_signature
    {Extra : Type u} {p : PrimitiveCandidate Extra}
    (hFive : CarriesFive p)
    (hA : Austere p) :
    ∀ c : PrimitiveCommitment Extra,
      Commits p c ↔ Commits (chanceSignature Extra) c := by
  intro c
  rcases hFive with ⟨hPerm, hEvent, hRetry, hNoPersist, hNonTel⟩
  cases c with
  | permissive =>
      simp [Commits, chanceSignature, hPerm]
  | eventful =>
      simp [Commits, chanceSignature, hEvent]
  | permitsRetry =>
      simp [Commits, chanceSignature, hRetry]
  | doesNotGuaranteePersistence =>
      simp [Commits, chanceSignature, hNoPersist]
  | nonTeleological =>
      simp [Commits, chanceSignature, hNonTel]
  | extra e =>
      constructor
      · intro he
        exact False.elim (hA e he)
      · intro he
        exact False.elim he

/-- Six-face signature closure at declared primitive scope.

    The five named primitive commitments are separately necessary/nonredundant
    (shown by the witnesses above), and Austerity globally excludes every
    additional independent primitive commitment.

    Therefore a candidate satisfying the current six-face burden has exactly
    the canonical primitive-signature commitments and no seventh independent
    primitive face inside this declared signature architecture. -/
theorem six_face_signature_closure
    {Extra : Type u} {p : PrimitiveCandidate Extra}
    (hFive : CarriesFive p)
    (hA : Austere p) :
    (∀ c : PrimitiveCommitment Extra,
      Commits p c ↔ Commits (chanceSignature Extra) c)
    ∧
    ¬ ∃ e : Extra, p.extra e := by
  constructor
  · exact five_plus_austerity_exactly_matches_canonical_signature hFive hA
  · exact no_seventh_independent_primitive_face_under_austerity hA

end SixFaceClosure


namespace PrimitiveMinimality

/-
Structural Flow — Primitive Minimality Kernel v0.1
Historical module provenance: Lean 4 candidate at original derivation.

Historical derivation authority:
  Structural Flow T.O.E. v1.64
Current semantic authority:
  Structural Flow TOE — Universal Canon and Interaction Interface (current compatible governing release).
  Structural Flow Closure Card v1.4
  Primitive closure claim:
    Chance / non-guarantee is the minimal structural primitive sufficient
    for the universal Structural Flow grammar within declared scope.

Purpose:
  Machine-audit primitive minimality as an order-theoretic "least sufficient"
  claim over primitive commitments.

Anti-smuggling design:
  * The primitive is NOT declared minimal by fiat.
  * Candidates may carry arbitrary additional primitive commitments through
    an externally supplied type `Extra`.
  * Sufficiency requires the five positive/specific primitive commitments
    already established by the six-face audit:
        Permissive
        Eventful
        Permits Retry
        Does Not Guarantee Persistence
        Non-Teleological
    Austerity is then the global no-extra condition, not an extra positive
    commitment.
  * Commitment inclusion defines "no richer than".
  * The canonical Chance signature carries the five required commitments and
    no extras.
  * We prove it is LEAST among all sufficient candidates.
  * Any sufficient candidate with an extra primitive commitment is strictly
    richer.
  * Any sufficient candidate with no extras is commitment-equivalent to
    Chance.
  * A candidate omitting any required commitment is not sufficient.

Scope / honesty boundary:
  This theorem is relative to the declared primitive-signature language and
  sufficiency burden. It does not prove metaphysical uniqueness across every
  conceivable ontology. A proposed primitive whose relevant commitments cannot
  be represented in this signature language challenges the formalization scope
  and reopens primitive closure rather than being excluded by definition.
-/

universe u



/-- Open-ended primitive commitment vocabulary. -/
inductive Commitment (Extra : Type u) where
  | permissive
  | eventful
  | permitsRetry
  | doesNotGuaranteePersistence
  | nonTeleological
  | extra (e : Extra)

/-- A candidate primitive specification. -/
structure PrimitiveCandidate (Extra : Type u) where
  permissive : Prop
  eventful : Prop
  permitsRetry : Prop
  doesNotGuaranteePersistence : Prop
  nonTeleological : Prop
  extra : Extra → Prop

/-- Which primitive commitments does a candidate carry? -/
def Commits {Extra : Type u} (p : PrimitiveCandidate Extra) :
    Commitment Extra → Prop
  | .permissive => p.permissive
  | .eventful => p.eventful
  | .permitsRetry => p.permitsRetry
  | .doesNotGuaranteePersistence => p.doesNotGuaranteePersistence
  | .nonTeleological => p.nonTeleological
  | .extra e => p.extra e

/-- Candidate `p` is no richer than candidate `q` when every commitment of `p`
    is also carried by `q`. -/
def LeCommit {Extra : Type u}
    (p q : PrimitiveCandidate Extra) : Prop :=
  ∀ c, Commits p c → Commits q c

/-- Commitment equivalence. -/
def CommitmentEquivalent {Extra : Type u}
    (p q : PrimitiveCandidate Extra) : Prop :=
  LeCommit p q ∧ LeCommit q p

/-- Strict richness: `richer` contains all commitments of `base` and at least
    one commitment not carried back by `base`. -/
def StrictlyRicher {Extra : Type u}
    (richer base : PrimitiveCandidate Extra) : Prop :=
  LeCommit base richer ∧ ¬ LeCommit richer base

/-- The declared primitive sufficiency burden:
    all five specific Chance commitments must be carried.
    A candidate may carry MORE and still be sufficient, but then it may fail
    minimality. -/
def Sufficient {Extra : Type u} (p : PrimitiveCandidate Extra) : Prop :=
  p.permissive ∧
  p.eventful ∧
  p.permitsRetry ∧
  p.doesNotGuaranteePersistence ∧
  p.nonTeleological

/-- Austerity: no additional primitive commitments. -/
def Austere {Extra : Type u} (p : PrimitiveCandidate Extra) : Prop :=
  ∀ e : Extra, ¬ p.extra e

/-- Canonical Chance signature. -/
def chance (Extra : Type u) : PrimitiveCandidate Extra where
  permissive := True
  eventful := True
  permitsRetry := True
  doesNotGuaranteePersistence := True
  nonTeleological := True
  extra := fun _ => False

/-- Least-sufficient means sufficient and no richer than every other sufficient
    candidate. This is stronger than merely being one minimal element. -/
def LeastSufficient {Extra : Type u}
    (p : PrimitiveCandidate Extra) : Prop :=
  Sufficient p ∧
  ∀ q : PrimitiveCandidate Extra, Sufficient q → LeCommit p q

theorem chance_is_sufficient (Extra : Type u) :
    Sufficient (chance Extra) := by
  simp [Sufficient, chance]

theorem chance_is_austere (Extra : Type u) :
    Austere (chance Extra) := by
  intro e he
  exact he

/-- Core order lemma:
    every sufficient candidate carries every commitment carried by Chance. -/
theorem chance_le_every_sufficient
    {Extra : Type u}
    (q : PrimitiveCandidate Extra)
    (hq : Sufficient q) :
    LeCommit (chance Extra) q := by
  intro c hc
  rcases hq with ⟨hPerm, hEvent, hRetry, hNoPersist, hNonTel⟩
  cases c with
  | permissive =>
      exact hPerm
  | eventful =>
      exact hEvent
  | permitsRetry =>
      exact hRetry
  | doesNotGuaranteePersistence =>
      exact hNoPersist
  | nonTeleological =>
      exact hNonTel
  | extra e =>
      exact False.elim hc

/-- Primitive minimality in the strongest order-theoretic form available here:
    Chance is the least sufficient primitive signature. -/
theorem chance_is_least_sufficient (Extra : Type u) :
    LeastSufficient (chance Extra) := by
  constructor
  · exact chance_is_sufficient Extra
  · intro q hq
    exact chance_le_every_sufficient q hq

/-- Any sufficient primitive candidate that adds at least one extra primitive
    commitment is strictly richer than Chance. -/
theorem sufficient_plus_extra_is_strictly_richer
    {Extra : Type u}
    {q : PrimitiveCandidate Extra}
    (hq : Sufficient q)
    (hExtra : ∃ e : Extra, q.extra e) :
    StrictlyRicher q (chance Extra) := by
  constructor
  · exact chance_le_every_sufficient q hq
  · intro hBack
    rcases hExtra with ⟨e, he⟩
    have hChanceExtra : Commits (chance Extra) (.extra e) :=
      hBack (.extra e) he
    exact hChanceExtra

/-- If a sufficient candidate is Austere, it carries nothing beyond Chance and
    is commitment-equivalent to Chance. -/
theorem sufficient_plus_austere_is_equivalent
    {Extra : Type u}
    {q : PrimitiveCandidate Extra}
    (hq : Sufficient q)
    (hA : Austere q) :
    CommitmentEquivalent q (chance Extra) := by
  constructor
  · intro c hc
    cases c with
    | permissive =>
        exact True.intro
    | eventful =>
        exact True.intro
    | permitsRetry =>
        exact True.intro
    | doesNotGuaranteePersistence =>
        exact True.intro
    | nonTeleological =>
        exact True.intro
    | extra e =>
        exact False.elim (hA e hc)
  · exact chance_le_every_sufficient q hq

/-
Weaker / null-side sufficiency failures.
These prove that removing any one required core commitment leaves the declared
primitive sufficiency class.
-/

theorem missing_permissive_not_sufficient
    {Extra : Type u}
    {q : PrimitiveCandidate Extra}
    (h : ¬ q.permissive) :
    ¬ Sufficient q := by
  intro hs
  exact h hs.1

theorem missing_eventful_not_sufficient
    {Extra : Type u}
    {q : PrimitiveCandidate Extra}
    (h : ¬ q.eventful) :
    ¬ Sufficient q := by
  intro hs
  exact h hs.2.1

theorem missing_retry_not_sufficient
    {Extra : Type u}
    {q : PrimitiveCandidate Extra}
    (h : ¬ q.permitsRetry) :
    ¬ Sufficient q := by
  intro hs
  exact h hs.2.2.1

theorem missing_no_guaranteed_persistence_not_sufficient
    {Extra : Type u}
    {q : PrimitiveCandidate Extra}
    (h : ¬ q.doesNotGuaranteePersistence) :
    ¬ Sufficient q := by
  intro hs
  exact h hs.2.2.2.1

theorem missing_nonteleology_not_sufficient
    {Extra : Type u}
    {q : PrimitiveCandidate Extra}
    (h : ¬ q.nonTeleological) :
    ¬ Sufficient q := by
  intro hs
  exact h hs.2.2.2.2

/-- Explicit null candidate. -/
def nullPrimitive (Extra : Type u) : PrimitiveCandidate Extra where
  permissive := False
  eventful := False
  permitsRetry := False
  doesNotGuaranteePersistence := False
  nonTeleological := False
  extra := fun _ => False

theorem null_is_not_sufficient (Extra : Type u) :
    ¬ Sufficient (nullPrimitive Extra) := by
  simp [Sufficient, nullPrimitive]

/-- Any least-sufficient candidate is commitment-equivalent to Chance.
    Therefore "distinct but equally minimal" candidates collapse to the same
    primitive burden at this signature scope. -/
theorem least_sufficient_unique_up_to_commitment_equivalence
    {Extra : Type u}
    {q : PrimitiveCandidate Extra}
    (hq : LeastSufficient q) :
    CommitmentEquivalent q (chance Extra) := by
  rcases hq with ⟨hqSuff, hLeast⟩
  constructor
  · exact hLeast (chance Extra) (chance_is_sufficient Extra)
  · exact chance_le_every_sufficient q hqSuff

/-- Exhaustion/classification theorem for sufficient rivals:
    every sufficient candidate is either commitment-equivalent to Chance
    (no extra primitive content) or strictly richer than Chance
    (some extra primitive content). -/
theorem every_sufficient_rival_equivalent_or_richer
    {Extra : Type u}
    (q : PrimitiveCandidate Extra)
    (hq : Sufficient q) :
    CommitmentEquivalent q (chance Extra) ∨
    StrictlyRicher q (chance Extra) := by
  classical
  by_cases hExtra : ∃ e : Extra, q.extra e
  · right
    exact sufficient_plus_extra_is_strictly_richer hq hExtra
  · left
    apply sufficient_plus_austere_is_equivalent hq
    intro e he
    apply hExtra
    exact ⟨e, he⟩

/-- Compact primitive closure theorem at declared signature scope. -/
theorem primitive_minimality_closure
    (Extra : Type u) :
    LeastSufficient (chance Extra)
    ∧
    (∀ q : PrimitiveCandidate Extra,
      Sufficient q →
      CommitmentEquivalent q (chance Extra) ∨
      StrictlyRicher q (chance Extra)) := by
  constructor
  · exact chance_is_least_sufficient Extra
  · intro q hq
    exact every_sufficient_rival_equivalent_or_richer q hq

end PrimitiveMinimality

/-!
Consolidated checkpoint
-----------------------
If this file elaborates with no proof errors, all six previously separated
machine-audit layers above survive together in one Lean environment.

No additional theorem is asserted here merely from their conjunction.
-/



/-!
UPSTREAM C0 -> FOUNDATIONAL BURDEN BRIDGE
----------------------------------------
This module addresses the remaining upstream formalization burden identified
after the first consolidated audit.

It does NOT define the foundational route as a four-item nested datatype.
It begins from lower passage semantics and machine-checks that:

  * Persistence is live under Chance / C0;
  * Boundary is live after Persistence;
  * Cascade is live after Persistence + Boundary;
  * Authorization is live after Persistence + Boundary + Cascade;
  * the declared endpoint of incorporated carried consequence requires
    Persistence, Boundary, Cascade, and Authorization;
  * removing any one of those capacities blocks that endpoint.

The arrows therefore remain prerequisite / burden-opening relations rather
than deterministic production rules.
-/

namespace C0Bridge

/-- Lower semantic vocabulary for one candidate foundational passage. -/
structure World (Extra : Type u) where
  /- Primitive / Chance-facing facts -/
  interactionPermitted : Prop
  interactionOccurs : Prop
  retryPermitted : Prop
  persistenceGuaranteed : Prop
  outcomePreferred : Prop
  extraPrimitive : Extra → Prop

  /- Passage facts below hinge naming -/
  differenceProduced : Prop
  retainedBeyondProduction : Prop
  operativeRelationalCut : Prop
  discriminatedUnderCut : Prop
  distinctFurtherInteraction : Prop
  inheritedAsInput : Prop
  boundedCarrier : Prop
  carrierConditionChanged : Prop
  postUpdateHeldWithoutPresentation : Prop

/-- C0 / Chance at the scope needed for the foundational bridge. -/
def Chance {Extra : Type u} (w : World Extra) : Prop :=
  w.interactionPermitted
  ∧ w.interactionOccurs
  ∧ w.retryPermitted
  ∧ ¬ w.persistenceGuaranteed
  ∧ ¬ w.outcomePreferred
  ∧ ∀ e : Extra, ¬ w.extraPrimitive e

/-
The four capacities are defined from lower semantic passage facts.
They are intentionally NOT nested definitions.
-/

/-- Persistence capacity: interaction-produced difference remains available. -/
def Persistence {Extra : Type u} (w : World Extra) : Prop :=
  w.differenceProduced ∧ w.retainedBeyondProduction

/-- Boundary capacity: retained carry is discriminated through an operative cut. -/
def Boundary {Extra : Type u} (w : World Extra) : Prop :=
  w.retainedBeyondProduction
  ∧ w.operativeRelationalCut
  ∧ w.discriminatedUnderCut

/-- Cascade capacity: a produced update becomes inherited input to a distinct
    further interaction. -/
def Cascade {Extra : Type u} (w : World Extra) : Prop :=
  w.differenceProduced
  ∧ w.distinctFurtherInteraction
  ∧ w.inheritedAsInput

/-- Authorization capacity: inherited update changes the bounded carrier-
    supported condition and the post-update condition remains supplied without
    continued active presentation merely to keep it so. -/
def Authorization {Extra : Type u} (w : World Extra) : Prop :=
  w.inheritedAsInput
  ∧ w.boundedCarrier
  ∧ w.carrierConditionChanged
  ∧ w.postUpdateHeldWithoutPresentation

/-- The Closure Card's declared foundational target, stated at the lower
    semantic vocabulary rather than by saying "P ∧ B ∧ C ∧ A". -/
def IncorporatedCarriedConsequence {Extra : Type u} (w : World Extra) : Prop :=
  w.differenceProduced
  ∧ w.retainedBeyondProduction
  ∧ w.operativeRelationalCut
  ∧ w.discriminatedUnderCut
  ∧ w.distinctFurtherInteraction
  ∧ w.inheritedAsInput
  ∧ w.boundedCarrier
  ∧ w.carrierConditionChanged
  ∧ w.postUpdateHeldWithoutPresentation

/-- A capacity is live under C0 when C0-compatible success and failure
    witnesses both exist. -/
def LiveUnderChance {Extra : Type u}
    (cap : World Extra → Prop) : Prop :=
  (∃ w : World Extra, Chance w ∧ cap w)
  ∧
  (∃ w : World Extra, Chance w ∧ ¬ cap w)

/-- Given prior successful jobs, the next job is live when both a success
    continuation and a prior-success/current-failure continuation exist under
    the same primitive grammar. -/
def LiveAfter {Extra : Type u}
    (prior next : World Extra → Prop) : Prop :=
  (∃ w : World Extra, Chance w ∧ prior w ∧ next w)
  ∧
  (∃ w : World Extra, Chance w ∧ prior w ∧ ¬ next w)

/-
Canonical separating witnesses.
These are logical models of the declared semantics, not claims that every
physical system literally has Boolean-valued fields.
-/

def eventOnly (Extra : Type u) : World Extra where
  interactionPermitted := True
  interactionOccurs := True
  retryPermitted := True
  persistenceGuaranteed := False
  outcomePreferred := False
  extraPrimitive := fun _ => False

  differenceProduced := True
  retainedBeyondProduction := False
  operativeRelationalCut := False
  discriminatedUnderCut := False
  distinctFurtherInteraction := False
  inheritedAsInput := False
  boundedCarrier := False
  carrierConditionChanged := False
  postUpdateHeldWithoutPresentation := False

def persistenceOnly (Extra : Type u) : World Extra where
  interactionPermitted := True
  interactionOccurs := True
  retryPermitted := True
  persistenceGuaranteed := False
  outcomePreferred := False
  extraPrimitive := fun _ => False

  differenceProduced := True
  retainedBeyondProduction := True
  operativeRelationalCut := False
  discriminatedUnderCut := False
  distinctFurtherInteraction := False
  inheritedAsInput := False
  boundedCarrier := False
  carrierConditionChanged := False
  postUpdateHeldWithoutPresentation := False

def persistenceBoundary (Extra : Type u) : World Extra where
  interactionPermitted := True
  interactionOccurs := True
  retryPermitted := True
  persistenceGuaranteed := False
  outcomePreferred := False
  extraPrimitive := fun _ => False

  differenceProduced := True
  retainedBeyondProduction := True
  operativeRelationalCut := True
  discriminatedUnderCut := True
  distinctFurtherInteraction := False
  inheritedAsInput := False
  boundedCarrier := False
  carrierConditionChanged := False
  postUpdateHeldWithoutPresentation := False

def persistenceBoundaryCascade (Extra : Type u) : World Extra where
  interactionPermitted := True
  interactionOccurs := True
  retryPermitted := True
  persistenceGuaranteed := False
  outcomePreferred := False
  extraPrimitive := fun _ => False

  differenceProduced := True
  retainedBeyondProduction := True
  operativeRelationalCut := True
  discriminatedUnderCut := True
  distinctFurtherInteraction := True
  inheritedAsInput := True
  boundedCarrier := True
  carrierConditionChanged := False
  postUpdateHeldWithoutPresentation := False

def fullRoute (Extra : Type u) : World Extra where
  interactionPermitted := True
  interactionOccurs := True
  retryPermitted := True
  persistenceGuaranteed := False
  outcomePreferred := False
  extraPrimitive := fun _ => False

  differenceProduced := True
  retainedBeyondProduction := True
  operativeRelationalCut := True
  discriminatedUnderCut := True
  distinctFurtherInteraction := True
  inheritedAsInput := True
  boundedCarrier := True
  carrierConditionChanged := True
  postUpdateHeldWithoutPresentation := True

/-
Basic witness facts.
-/

theorem chance_eventOnly (Extra : Type u) :
    Chance (eventOnly Extra) := by
  simp [Chance, eventOnly]

theorem chance_persistenceOnly (Extra : Type u) :
    Chance (persistenceOnly Extra) := by
  simp [Chance, persistenceOnly]

theorem chance_persistenceBoundary (Extra : Type u) :
    Chance (persistenceBoundary Extra) := by
  simp [Chance, persistenceBoundary]

theorem chance_persistenceBoundaryCascade (Extra : Type u) :
    Chance (persistenceBoundaryCascade Extra) := by
  simp [Chance, persistenceBoundaryCascade]

theorem chance_fullRoute (Extra : Type u) :
    Chance (fullRoute Extra) := by
  simp [Chance, fullRoute]

/-
C0 does not guarantee Persistence.
Persistence is therefore the first live load-bearing burden after occurrence.
-/

theorem persistence_is_live_under_chance (Extra : Type u) :
    LiveUnderChance (Persistence : World Extra → Prop) := by
  constructor
  · exact ⟨persistenceOnly Extra, chance_persistenceOnly Extra, by
      simp [Persistence, persistenceOnly]⟩
  · exact ⟨eventOnly Extra, chance_eventOnly Extra, by
      simp [Persistence, eventOnly]⟩

/-
After Persistence succeeds, Boundary is live but not guaranteed.
-/

def PriorP {Extra : Type u} (w : World Extra) : Prop :=
  Persistence w

theorem boundary_is_live_after_persistence (Extra : Type u) :
    LiveAfter (PriorP : World Extra → Prop) Boundary := by
  constructor
  · exact ⟨persistenceBoundary Extra, chance_persistenceBoundary Extra, by
      simp [PriorP, Persistence, persistenceBoundary], by
      simp [Boundary, persistenceBoundary]⟩
  · exact ⟨persistenceOnly Extra, chance_persistenceOnly Extra, by
      simp [PriorP, Persistence, persistenceOnly], by
      simp [Boundary, persistenceOnly]⟩

/-
After Persistence + Boundary succeed, Cascade is live but not guaranteed.
-/

def PriorPB {Extra : Type u} (w : World Extra) : Prop :=
  Persistence w ∧ Boundary w

theorem cascade_is_live_after_persistence_boundary (Extra : Type u) :
    LiveAfter (PriorPB : World Extra → Prop) Cascade := by
  constructor
  · exact ⟨persistenceBoundaryCascade Extra,
      chance_persistenceBoundaryCascade Extra,
      by simp [PriorPB, Persistence, Boundary, persistenceBoundaryCascade],
      by simp [Cascade, persistenceBoundaryCascade]⟩
  · exact ⟨persistenceBoundary Extra,
      chance_persistenceBoundary Extra,
      by simp [PriorPB, Persistence, Boundary, persistenceBoundary],
      by simp [Cascade, persistenceBoundary]⟩

/-
After Persistence + Boundary + Cascade succeed, Authorization is live but not
guaranteed.
-/

def PriorPBC {Extra : Type u} (w : World Extra) : Prop :=
  Persistence w ∧ Boundary w ∧ Cascade w

theorem authorization_is_live_after_persistence_boundary_cascade
    (Extra : Type u) :
    LiveAfter (PriorPBC : World Extra → Prop) Authorization := by
  constructor
  · exact ⟨fullRoute Extra,
      chance_fullRoute Extra,
      by simp [PriorPBC, Persistence, Boundary, Cascade, fullRoute],
      by simp [Authorization, fullRoute]⟩
  · exact ⟨persistenceBoundaryCascade Extra,
      chance_persistenceBoundaryCascade Extra,
      by simp [PriorPBC, Persistence, Boundary, Cascade,
        persistenceBoundaryCascade],
      by simp [Authorization, persistenceBoundaryCascade]⟩

/-
Endpoint necessity:
the foundational target requires all four capacities.
This is not because the endpoint was defined as P∧B∧C∧A; it was defined in
the lower semantic vocabulary above.
-/

theorem endpoint_requires_persistence
    {Extra : Type u} {w : World Extra}
    (h : IncorporatedCarriedConsequence w) :
    Persistence w := by
  exact ⟨h.1, h.2.1⟩

theorem endpoint_requires_boundary
    {Extra : Type u} {w : World Extra}
    (h : IncorporatedCarriedConsequence w) :
    Boundary w := by
  exact ⟨h.2.1, h.2.2.1, h.2.2.2.1⟩

theorem endpoint_requires_cascade
    {Extra : Type u} {w : World Extra}
    (h : IncorporatedCarriedConsequence w) :
    Cascade w := by
  exact ⟨h.1, h.2.2.2.2.1, h.2.2.2.2.2.1⟩

theorem endpoint_requires_authorization
    {Extra : Type u} {w : World Extra}
    (h : IncorporatedCarriedConsequence w) :
    Authorization w := by
  exact ⟨h.2.2.2.2.2.1,
    h.2.2.2.2.2.2.1,
    h.2.2.2.2.2.2.2.1,
    h.2.2.2.2.2.2.2.2⟩

theorem endpoint_requires_all_four
    {Extra : Type u} {w : World Extra}
    (h : IncorporatedCarriedConsequence w) :
    Persistence w ∧ Boundary w ∧ Cascade w ∧ Authorization w := by
  exact ⟨
    endpoint_requires_persistence h,
    endpoint_requires_boundary h,
    endpoint_requires_cascade h,
    endpoint_requires_authorization h
  ⟩

/-
Removal form:
if any one necessary capacity is absent, the declared endpoint cannot hold.
-/

theorem no_endpoint_without_persistence
    {Extra : Type u} {w : World Extra}
    (hNo : ¬ Persistence w) :
    ¬ IncorporatedCarriedConsequence w := by
  intro hEnd
  exact hNo (endpoint_requires_persistence hEnd)

theorem no_endpoint_without_boundary
    {Extra : Type u} {w : World Extra}
    (hNo : ¬ Boundary w) :
    ¬ IncorporatedCarriedConsequence w := by
  intro hEnd
  exact hNo (endpoint_requires_boundary hEnd)

theorem no_endpoint_without_cascade
    {Extra : Type u} {w : World Extra}
    (hNo : ¬ Cascade w) :
    ¬ IncorporatedCarriedConsequence w := by
  intro hEnd
  exact hNo (endpoint_requires_cascade hEnd)

theorem no_endpoint_without_authorization
    {Extra : Type u} {w : World Extra}
    (hNo : ¬ Authorization w) :
    ¬ IncorporatedCarriedConsequence w := by
  intro hEnd
  exact hNo (endpoint_requires_authorization hEnd)

/-
The successful route is coherent with C0 and reaches the target.
This prevents the burden architecture from being vacuous.
-/

theorem fullRoute_reaches_endpoint (Extra : Type u) :
    Chance (fullRoute Extra)
    ∧ IncorporatedCarriedConsequence (fullRoute Extra) := by
  constructor
  · exact chance_fullRoute Extra
  · simp [IncorporatedCarriedConsequence, fullRoute]

/-
Consolidated upstream bridge.

This is the formal version of the TOE's non-guarantee grammar:
  C0 does not dictate later success.
  It makes Persistence live.
  Persistence success leaves Boundary live.
  P+B success leaves Cascade live.
  P+B+C success leaves Authorization live.
  The declared endpoint requires all four jobs.

The theorem deliberately does NOT claim that any one successful stage produces
the next.
-/

theorem c0_to_foundational_burden_bridge (Extra : Type u) :
    LiveUnderChance (Persistence : World Extra → Prop)
    ∧ LiveAfter (PriorP : World Extra → Prop) Boundary
    ∧ LiveAfter (PriorPB : World Extra → Prop) Cascade
    ∧ LiveAfter (PriorPBC : World Extra → Prop) Authorization
    ∧ (∀ w : World Extra,
        IncorporatedCarriedConsequence w →
        Persistence w ∧ Boundary w ∧ Cascade w ∧ Authorization w) := by
  exact ⟨
    persistence_is_live_under_chance Extra,
    boundary_is_live_after_persistence Extra,
    cascade_is_live_after_persistence_boundary Extra,
    authorization_is_live_after_persistence_boundary_cascade Extra,
    by
      intro w h
      exact endpoint_requires_all_four h
  ⟩

end C0Bridge



/-!
POST-AUTHORIZATION ANSWERABILITY — CLEAN STANDALONE IMPORT
----------------------------------------------------------
Source: SF_PAA_Kernel_v0.2.lean
Status before consolidation: clean Lean pass, run twice.

PAA remains a corollary / validity guard, not a hinge.
-/

namespace PAA

/-- Minimal record extracted from a successful Authorization passage:
    the carrier-supported condition changed from `pre` to `post`. -/
structure AuthorizationRecord (State : Type u) where
  pre : State
  post : State
  changed : post ≠ pre

/-- One lawfully accounted successor passage. This relation is deliberately
    uninterpreted: a domain may supply its own lawful successor mechanism. -/
abbrev Successor (State : Type u) := State → State → Prop

/-- Reflexive-transitive closure of accounted successor passage.
    No metric time, clock, or duration is introduced. -/
inductive AccountedReachable {State : Type u}
    (step : Successor State) : State → State → Prop
  | refl (s : State) : AccountedReachable step s s
  | tail {a b c : State} :
      AccountedReachable step a b →
      step b c →
      AccountedReachable step a c

/-- A purported continuation names the condition from which it claims to
    continue the authorized lineage. Other claim content is intentionally
    outside PAA's universal minimum. -/
structure ContinuationClaim (State : Type u) where
  source : State

/-- The PAA source guard: a claimed continuation source must lie on an
    explicitly accounted lineage beginning at the authorized post-state. -/
def SourceValid {State : Type u}
    (a : AuthorizationRecord State)
    (step : Successor State)
    (c : ContinuationClaim State) : Prop :=
  AccountedReachable step a.post c.source

/-- PAA constrains an arbitrary warrant relation.
    It says only: whatever is warranted as a continuation must satisfy the
    source-lineage guard.

    It does NOT say every source-valid claim is warranted. -/
def RespectsPAA {State : Type u}
    (a : AuthorizationRecord State)
    (step : Successor State)
    (Warrant : ContinuationClaim State → Prop) : Prop :=
  ∀ c, Warrant c → SourceValid a step c

/-- A free reset is a warranted claim sourced from the pre-Authorization
    condition even though no accounted lineage returns from the post-state to
    that pre-state. -/
def FreeResetViolation {State : Type u}
    (a : AuthorizationRecord State)
    (step : Successor State)
    (Warrant : ContinuationClaim State → Prop) : Prop :=
  ∃ c : ContinuationClaim State,
    Warrant c
    ∧ c.source = a.pre
    ∧ ¬ AccountedReachable step a.post a.pre

/-- PAA excludes a free reset. -/
theorem paa_excludes_free_reset
    {State : Type u}
    (a : AuthorizationRecord State)
    (step : Successor State)
    (Warrant : ContinuationClaim State → Prop)
    (hPAA : RespectsPAA a step Warrant) :
    ¬ FreeResetViolation a step Warrant := by
  intro h
  rcases h with ⟨c, hW, hSource, hNoReturn⟩
  have hValid : SourceValid a step c := hPAA c hW
  unfold SourceValid at hValid
  rw [hSource] at hValid
  exact hNoReturn hValid

/-- Directly sourcing from the authorized post-state satisfies the source
    guard without requiring another successor passage. -/
theorem post_state_is_source_valid
    {State : Type u}
    (a : AuthorizationRecord State)
    (step : Successor State) :
    SourceValid a step ⟨a.post⟩ := by
  exact AccountedReachable.refl a.post

/-- Any directly accounted successor of the authorized post-state satisfies
    the source guard. -/
theorem direct_successor_is_source_valid
    {State : Type u}
    (a : AuthorizationRecord State)
    (step : Successor State)
    {q : State}
    (hStep : step a.post q) :
    SourceValid a step ⟨q⟩ := by
  exact AccountedReachable.tail
    (AccountedReachable.refl a.post) hStep

/-- Any transitively accounted successor is source-valid. -/
theorem accounted_successor_is_source_valid
    {State : Type u}
    (a : AuthorizationRecord State)
    (step : Successor State)
    {q : State}
    (hReach : AccountedReachable step a.post q) :
    SourceValid a step ⟨q⟩ := by
  exact hReach

/-- Exact-source warrant is a convenient probe relation for independence
    tests. -/
def ExactSourceWarrant {State : Type u}
    (q : State) : ContinuationClaim State → Prop :=
  fun c => c.source = q

/-- If a source is accounted-reachable, warranting only claims sourced there
    respects PAA. -/
theorem exact_valid_source_respects_paa
    {State : Type u}
    (a : AuthorizationRecord State)
    (step : Successor State)
    {q : State}
    (hReach : AccountedReachable step a.post q) :
    RespectsPAA a step (ExactSourceWarrant q) := by
  intro c hW
  unfold ExactSourceWarrant at hW
  unfold SourceValid
  rw [hW]
  exact hReach

/-- PAA does not require continuation. A warrant relation that warrants no
    continuation claims satisfies PAA. -/
theorem no_continuation_required
    {State : Type u}
    (a : AuthorizationRecord State)
    (step : Successor State) :
    RespectsPAA a step (fun _ => False) := by
  intro c h
  contradiction

/-- PAA does not prohibit a lawful return to the pre-Authorization condition.
    If an accounted path returns there, a claim sourced there may pass the PAA
    source guard. This blocks an irreversibility reading. -/
theorem lawful_return_to_pre_is_permitted
    {State : Type u}
    (a : AuthorizationRecord State)
    (step : Successor State)
    (hReturn : AccountedReachable step a.post a.pre) :
    RespectsPAA a step (ExactSourceWarrant a.pre) := by
  exact exact_valid_source_respects_paa a step hReturn

/-- A free-reset source is not PAA-compatible when no accounted path returns
    from the authorized post-state to the pre-state. -/
theorem unaccounted_return_to_pre_defeats_paa
    {State : Type u}
    (a : AuthorizationRecord State)
    (step : Successor State)
    (hNoReturn : ¬ AccountedReachable step a.post a.pre) :
    ¬ RespectsPAA a step (ExactSourceWarrant a.pre) := by
  intro hPAA
  let c : ContinuationClaim State := ⟨a.pre⟩
  have hW : ExactSourceWarrant a.pre c := by
    rfl
  have hValid : SourceValid a step c := hPAA c hW
  exact hNoReturn hValid

/-- PAA can leave more than one distinct continuation source admissible.
    It therefore does not select a unique future. -/
theorem multiple_successor_sources_permitted
    {State : Type u}
    (a : AuthorizationRecord State)
    (step : Successor State)
    {q₁ q₂ : State}
    (h₁ : AccountedReachable step a.post q₁)
    (h₂ : AccountedReachable step a.post q₂) :
    RespectsPAA a step
      (fun c => c.source = q₁ ∨ c.source = q₂) := by
  intro c hW
  rcases hW with hLeft | hRight
  · unfold SourceValid
    rw [hLeft]
    exact h₁
  · unfold SourceValid
    rw [hRight]
    exact h₂

/-- PAA does not conserve an arbitrary state-property.
    If an accounted successor `q` lacks a property held by the authorized
    post-state, warranting `q` can still respect PAA. -/
theorem property_loss_is_compatible_with_paa
    {State : Type u}
    (a : AuthorizationRecord State)
    (step : Successor State)
    (Property : State → Prop)
    {q : State}
    (hReach : AccountedReachable step a.post q)
    (_hPost : Property a.post)
    (_hLost : ¬ Property q) :
    RespectsPAA a step (ExactSourceWarrant q) := by
  exact exact_valid_source_respects_paa a step hReach

/-- PAA does not require identity with the authorized post-state.
    A distinct accounted successor may be the source of a PAA-compatible
    continuation. -/
theorem changed_successor_is_compatible_with_paa
    {State : Type u}
    (a : AuthorizationRecord State)
    (step : Successor State)
    {q : State}
    (_hChangedAgain : q ≠ a.post)
    (hReach : AccountedReachable step a.post q) :
    RespectsPAA a step (ExactSourceWarrant q) := by
  exact exact_valid_source_respects_paa a step hReach

/-- The maximal set admitted by the PAA source-lineage guard.
    Calling it "maximal" here does NOT mean PAA warrants all of these claims;
    it means no PAA-respecting warrant may include a claim outside this set. -/
def LineageAdmissible {State : Type u}
    (a : AuthorizationRecord State)
    (step : Successor State) :
    ContinuationClaim State → Prop :=
  fun c => SourceValid a step c

/-- The source guard itself respects PAA. -/
theorem lineage_admissible_respects_paa
    {State : Type u}
    (a : AuthorizationRecord State)
    (step : Successor State) :
    RespectsPAA a step (LineageAdmissible a step) := by
  intro c h
  exact h

/-- Every PAA-respecting warrant relation is pointwise contained in the
    lineage-admissible set. This is the precise guard-only result:
    source-validity is necessary, not sufficient, for warrant. -/
theorem every_paa_warrant_is_lineage_admissible
    {State : Type u}
    (a : AuthorizationRecord State)
    (step : Successor State)
    (Warrant : ContinuationClaim State → Prop)
    (hPAA : RespectsPAA a step Warrant) :
    ∀ c, Warrant c → LineageAdmissible a step c := by
  intro c hW
  exact hPAA c hW

/-- Authorization's changed post-state does not make every later continuation
    assertion valid. If no accounted path returns to `pre`, the "continue from
    pre anyway" warrant violates PAA while the Authorization record itself
    remains intact. -/
theorem authorization_does_not_warrant_free_reset
    {State : Type u}
    (a : AuthorizationRecord State)
    (step : Successor State)
    (hNoReturn : ¬ AccountedReachable step a.post a.pre) :
    ¬ RespectsPAA a step (ExactSourceWarrant a.pre) := by
  exact unaccounted_return_to_pre_defeats_paa a step hNoReturn

/-- Consolidated PAA audit result. -/
theorem paa_machine_closure
    {State : Type u}
    (a : AuthorizationRecord State)
    (step : Successor State) :
    RespectsPAA a step (fun _ => False)
    ∧ SourceValid a step ⟨a.post⟩
    ∧ (∀ (Warrant : ContinuationClaim State → Prop),
        RespectsPAA a step Warrant →
        ∀ c, Warrant c → LineageAdmissible a step c) := by
  exact ⟨
    no_continuation_required a step,
    post_state_is_source_valid a step,
    by
      intro Warrant hPAA c hW
      exact every_paa_warrant_is_lineage_admissible
        a step Warrant hPAA c hW
  ⟩

end PAA

/-!
RECOGNITION — CLEAN STANDALONE IMPORT
-------------------------------------
Source: SF_Recognition_Kernel_v0.3.lean
Status before consolidation: clean Lean pass, run twice.

Recognition is downstream of Authorization and distinct from PAA.
-/

namespace Recognition

/-
Recognition reuses the public PAA lineage contract directly.
No parallel successor / reachability vocabulary is introduced here.
-/

/-- Lower-semantic world for one declared Recognition task. -/
structure World
    (State Surface Content Presentation : Type u) where
  /- successful Authorization anchor -/
  pre : State
  post : State
  changed : post ≠ pre

  /- PAA-compatible source-lineage probe -/
  successor : PAA.Successor State
  continuationSource : State

  /- authorized binding at the origin -/
  content : Content
  origin : Surface
  target : Surface
  sourcePresentation : Presentation
  targetPresentation : Presentation

  /- lower local semantics -/
  located : Surface → Presentation → Prop
  binds : Presentation → Content → Prop
  lawfulVariation : Surface → Surface → Prop
  transport : Surface → Surface → Presentation → Presentation → Prop


/-- The authorized content is present as a binding at the origin surface. -/
def AuthorizedAtOrigin
    {State Surface Content Presentation : Type u}
    (w : World State Surface Content Presentation) : Prop :=
  w.located w.origin w.sourcePresentation
  ∧ w.binds w.sourcePresentation w.content

/-- Minimal upstream PAA source-lineage compatibility for the probe claim. -/
def PAACompatible
    {State Surface Content Presentation : Type u}
    (w : World State Surface Content Presentation) : Prop :=
  PAA.AccountedReachable w.successor w.post w.continuationSource

/-- Recognition capacity at one declared local-variation task.
    It is intentionally stated from lower semantics rather than as
    "same content" by name alone. -/
def Recognizes
    {State Surface Content Presentation : Type u}
    (w : World State Surface Content Presentation) : Prop :=
  w.origin ≠ w.target
  ∧ w.lawfulVariation w.origin w.target
  ∧ w.located w.target w.targetPresentation
  ∧ w.transport
      w.origin w.target w.sourcePresentation w.targetPresentation
  ∧ w.binds w.targetPresentation w.content

/-- Upstream condition before the Recognition burden is discharged. -/
def UpstreamReady
    {State Surface Content Presentation : Type u}
    (w : World State Surface Content Presentation) : Prop :=
  AuthorizedAtOrigin w ∧ PAACompatible w

/-- The declared endpoint, stated in lower semantics rather than by naming
    Recognition. -/
def SameBindingTransportEndpoint
    {State Surface Content Presentation : Type u}
    (w : World State Surface Content Presentation) : Prop :=
  AuthorizedAtOrigin w
  ∧ (
      w.origin ≠ w.target
      ∧ w.lawfulVariation w.origin w.target
      ∧ w.located w.target w.targetPresentation
      ∧ w.transport
          w.origin w.target w.sourcePresentation w.targetPresentation
      ∧ w.binds w.targetPresentation w.content
    )

/-- Generic liveness test: the prior condition admits both success and failure
    of the next burden. -/
def LiveAfter {α : Type u}
    (prior next : α → Prop) : Prop :=
  (∃ x, prior x ∧ next x)
  ∧
  (∃ x, prior x ∧ ¬ next x)

/-
Finite witness vocabulary.
-/

inductive TestState
  | pre
  | post

inductive TestSurface
  | origin
  | target

inductive TestContent
  | alpha
  | beta

inductive TestPresentation
  | source
  | target

abbrev TestWorld :=
  World TestState TestSurface TestContent TestPresentation

def noStep : PAA.Successor TestState :=
  fun _ _ => False

def locatedBoth : TestSurface → TestPresentation → Prop
  | .origin, .source => True
  | .target, .target => True
  | _, _ => False

def lawfulLocalVariation : TestSurface → TestSurface → Prop
  | .origin, .target => True
  | _, _ => False

def transportSourceToTarget :
    TestSurface → TestSurface →
    TestPresentation → TestPresentation → Prop
  | .origin, .target, .source, .target => True
  | _, _, _, _ => False

def noTransport :
    TestSurface → TestSurface →
    TestPresentation → TestPresentation → Prop :=
  fun _ _ _ _ => False

/-- Same binding content under two distinct local presentations. -/
def sameBinding :
    TestPresentation → TestContent → Prop
  | .source, .alpha => True
  | .target, .alpha => True
  | _, _ => False

/-- Binding identity drifts at the target presentation. -/
def driftBinding :
    TestPresentation → TestContent → Prop
  | .source, .alpha => True
  | .target, .beta => True
  | _, _ => False

def recognitionSuccess :
    World TestState TestSurface TestContent TestPresentation where
  pre := .pre
  post := .post
  changed := by simp
  successor := noStep
  continuationSource := .post
  content := .alpha
  origin := .origin
  target := .target
  sourcePresentation := .source
  targetPresentation := .target
  located := locatedBoth
  binds := sameBinding
  lawfulVariation := lawfulLocalVariation
  transport := transportSourceToTarget

/-- Identity candidate survives locally, but lawful carry/comparison is absent. -/
def transportFailure :
    World TestState TestSurface TestContent TestPresentation where
  pre := .pre
  post := .post
  changed := by simp
  successor := noStep
  continuationSource := .post
  content := .alpha
  origin := .origin
  target := .target
  sourcePresentation := .source
  targetPresentation := .target
  located := locatedBoth
  binds := sameBinding
  lawfulVariation := lawfulLocalVariation
  transport := noTransport

/-- Carry/comparison exists, but target binding identity has drifted. -/
def identityDrift :
    World TestState TestSurface TestContent TestPresentation where
  pre := .pre
  post := .post
  changed := by simp
  successor := noStep
  continuationSource := .post
  content := .alpha
  origin := .origin
  target := .target
  sourcePresentation := .source
  targetPresentation := .target
  located := locatedBoth
  binds := driftBinding
  lawfulVariation := lawfulLocalVariation
  transport := transportSourceToTarget

/-
Upstream readiness facts.
-/

theorem success_authorized :
    AuthorizedAtOrigin recognitionSuccess := by
  simp [AuthorizedAtOrigin, recognitionSuccess, locatedBoth, sameBinding]

theorem transportFailure_authorized :
    AuthorizedAtOrigin transportFailure := by
  simp [AuthorizedAtOrigin, transportFailure, locatedBoth, sameBinding]

theorem identityDrift_authorized :
    AuthorizedAtOrigin identityDrift := by
  simp [AuthorizedAtOrigin, identityDrift, locatedBoth, driftBinding]

theorem success_paa_compatible :
    PAACompatible recognitionSuccess := by
  unfold PAACompatible
  exact PAA.AccountedReachable.refl TestState.post

theorem transportFailure_paa_compatible :
    PAACompatible transportFailure := by
  unfold PAACompatible
  exact PAA.AccountedReachable.refl TestState.post

theorem identityDrift_paa_compatible :
    PAACompatible identityDrift := by
  unfold PAACompatible
  exact PAA.AccountedReachable.refl TestState.post

theorem success_upstream_ready :
    UpstreamReady recognitionSuccess := by
  exact ⟨success_authorized, success_paa_compatible⟩

theorem transportFailure_upstream_ready :
    UpstreamReady transportFailure := by
  exact ⟨transportFailure_authorized, transportFailure_paa_compatible⟩

theorem identityDrift_upstream_ready :
    UpstreamReady identityDrift := by
  exact ⟨identityDrift_authorized, identityDrift_paa_compatible⟩

/-
Recognition success and the two dual failures.
-/

theorem recognitionSuccess_recognizes :
    Recognizes recognitionSuccess := by
  simp [Recognizes, recognitionSuccess, lawfulLocalVariation,
    locatedBoth, transportSourceToTarget, sameBinding]

theorem transportFailure_does_not_recognize :
    ¬ Recognizes transportFailure := by
  simp [Recognizes, transportFailure, lawfulLocalVariation,
    locatedBoth, noTransport, sameBinding]

theorem identityDrift_does_not_recognize :
    ¬ Recognizes identityDrift := by
  simp [Recognizes, identityDrift, lawfulLocalVariation,
    locatedBoth, transportSourceToTarget, driftBinding]

/-- Recognition is live after Authorization with PAA-compatible lineage:
    upstream success leaves both Recognition success and Recognition failure
    available. -/
theorem recognition_is_live_after_upstream :
    LiveAfter
      (UpstreamReady : TestWorld → Prop)
      (Recognizes : TestWorld → Prop) := by
  constructor
  · exact ⟨recognitionSuccess,
      success_upstream_ready,
      recognitionSuccess_recognizes⟩
  · exact ⟨transportFailure,
      transportFailure_upstream_ready,
      transportFailure_does_not_recognize⟩

/-- Authorization plus PAA compatibility does not entail Recognition. -/
theorem authorization_paa_do_not_entail_recognition :
    ∃ w : TestWorld,
      UpstreamReady w ∧ ¬ Recognizes w := by
  exact ⟨transportFailure,
    transportFailure_upstream_ready,
    transportFailure_does_not_recognize⟩

/-
Endpoint necessity.
-/

theorem endpoint_requires_authorized_origin
    {State Surface Content Presentation : Type u}
    {w : World State Surface Content Presentation}
    (h : SameBindingTransportEndpoint w) :
    AuthorizedAtOrigin w := by
  exact h.1

theorem endpoint_requires_recognition
    {State Surface Content Presentation : Type u}
    {w : World State Surface Content Presentation}
    (h : SameBindingTransportEndpoint w) :
    Recognizes w := by
  exact h.2

theorem recognized_authorized_content_reaches_endpoint
    {State Surface Content Presentation : Type u}
    {w : World State Surface Content Presentation}
    (hA : AuthorizedAtOrigin w)
    (hR : Recognizes w) :
    SameBindingTransportEndpoint w := by
  exact ⟨hA, hR⟩

/-
Removal tests.
-/

theorem no_endpoint_without_transport
    {State Surface Content Presentation : Type u}
    {w : World State Surface Content Presentation}
    (hNo :
      ¬ w.transport
          w.origin w.target w.sourcePresentation w.targetPresentation) :
    ¬ SameBindingTransportEndpoint w := by
  intro hEnd
  have hR : Recognizes w := endpoint_requires_recognition hEnd
  rcases hR with ⟨_hDistinct, _hVariation, _hLocated, hTransport, _hBinding⟩
  exact hNo hTransport

theorem no_endpoint_without_target_same_binding
    {State Surface Content Presentation : Type u}
    {w : World State Surface Content Presentation}
    (hNo : ¬ w.binds w.targetPresentation w.content) :
    ¬ SameBindingTransportEndpoint w := by
  intro hEnd
  have hR : Recognizes w := endpoint_requires_recognition hEnd
  rcases hR with ⟨_hDistinct, _hVariation, _hLocated, _hTransport, hBinding⟩
  exact hNo hBinding

theorem no_endpoint_without_lawful_variation
    {State Surface Content Presentation : Type u}
    {w : World State Surface Content Presentation}
    (hNo : ¬ w.lawfulVariation w.origin w.target) :
    ¬ SameBindingTransportEndpoint w := by
  intro hEnd
  have hR : Recognizes w := endpoint_requires_recognition hEnd
  rcases hR with ⟨_hDistinct, hVariation, _hLocated, _hTransport, _hBinding⟩
  exact hNo hVariation

/-
Anti-collapse and duality witnesses.
-/

/-- Recognition does not require literal equality of local presentations. -/
theorem recognition_allows_distinct_presentations :
    Recognizes recognitionSuccess
    ∧ recognitionSuccess.sourcePresentation
        ≠ recognitionSuccess.targetPresentation := by
  constructor
  · exact recognitionSuccess_recognizes
  · simp [recognitionSuccess]

/-- The capacity-face is independent: same target binding can remain available
    while Recognition fails because no lawful transport/comparison exists. -/
theorem same_binding_without_transport_is_not_recognition :
    transportFailure.binds
      transportFailure.targetPresentation transportFailure.content
    ∧ ¬ Recognizes transportFailure := by
  constructor
  · simp [transportFailure, sameBinding]
  · exact transportFailure_does_not_recognize

/-- The constraint-face is independent: lawful transport/comparison can exist
    while Recognition fails because the target presentation binds different
    content. -/
theorem transport_without_same_binding_is_not_recognition :
    identityDrift.transport
      identityDrift.origin identityDrift.target
      identityDrift.sourcePresentation identityDrift.targetPresentation
    ∧ ¬ Recognizes identityDrift := by
  constructor
  · simp [identityDrift, transportSourceToTarget]
  · exact identityDrift_does_not_recognize

/-- Consolidated Recognition audit. -/
theorem recognition_machine_closure :
    LiveAfter
      (UpstreamReady : TestWorld → Prop)
      (Recognizes : TestWorld → Prop)
    ∧ SameBindingTransportEndpoint recognitionSuccess
    ∧ (∃ w : TestWorld,
        UpstreamReady w ∧ ¬ Recognizes w)
    ∧ (Recognizes recognitionSuccess
        ∧ recognitionSuccess.sourcePresentation
            ≠ recognitionSuccess.targetPresentation) := by
  constructor
  · exact recognition_is_live_after_upstream
  constructor
  · exact recognized_authorized_content_reaches_endpoint
      success_authorized recognitionSuccess_recognizes
  constructor
  · exact authorization_paa_do_not_entail_recognition
  · exact recognition_allows_distinct_presentations

end Recognition

/-!
COHERENCE — CLEAN STANDALONE IMPORT
-----------------------------------
Source: SF_Coherence_Kernel_v0.1.lean
Status before consolidation: clean Lean pass, run twice.

Coherence is downstream of Recognition and does not import domain-specific
stationary-action, isotropy, or sphere realizers into the universal minimum.
-/

namespace Coherence

/-- Machine-readable declaration of the executable Coherence scope in this
    public-kernel release. The human semantic object remains Coherence; the
    currently machine-certified minimum is pairwise / binary. -/
inductive ExecutableScope where
  | pairwise
  deriving DecidableEq, Repr

/-- Current executable Coherence scope for this release. -/
def currentExecutableScope : ExecutableScope := .pairwise

/-- Lower-semantic world for one declared pairwise Coherence task. -/
structure World
    (Piece Whole Invariant : Type u) where
  local₁ : Piece
  local₂ : Piece

  recognized : Piece → Prop
  compatible : Piece → Piece → Prop

  candidateWhole : Whole
  fits : Whole → Piece → Prop
  heldAsOne : Whole → Prop

  carriesInvariant : Piece → Invariant → Prop
  wholeOwnsInvariant : Whole → Invariant → Prop

/-- Upstream condition: distinct local pieces are already recognized and
    mutually compatible. This deliberately gives compatibility every benefit
    before the Coherence burden is asked. -/
def RecognizedCompatible
    {Piece Whole Invariant : Type u}
    (w : World Piece Whole Invariant) : Prop :=
  w.local₁ ≠ w.local₂
  ∧ w.recognized w.local₁
  ∧ w.recognized w.local₂
  ∧ w.compatible w.local₁ w.local₂
  ∧ w.compatible w.local₂ w.local₁

/-- Constraint-face component: the admitted local pieces fit the same
    candidate whole. -/
def GlobalFit
    {Piece Whole Invariant : Type u}
    (w : World Piece Whole Invariant) : Prop :=
  w.fits w.candidateWhole w.local₁
  ∧ w.fits w.candidateWhole w.local₂

/-- Shared-invariant component:
    at least one invariant is carried by both local pieces and owned by the
    same candidate whole. -/
def SharedInvariant
    {Piece Whole Invariant : Type u}
    (w : World Piece Whole Invariant) : Prop :=
  ∃ i : Invariant,
    w.carriesInvariant w.local₁ i
    ∧ w.carriesInvariant w.local₂ i
    ∧ w.wholeOwnsInvariant w.candidateWhole i

/-- Current machine-certified pairwise Coherence minimum. -/
def Coheres
    {Piece Whole Invariant : Type u}
    (w : World Piece Whole Invariant) : Prop :=
  w.heldAsOne w.candidateWhole
  ∧ GlobalFit w
  ∧ SharedInvariant w

/-- Endpoint stated in lower semantics rather than as "Recognized ∧ Coheres"
    by definition alone. -/
def JointWholeHoldEndpoint
    {Piece Whole Invariant : Type u}
    (w : World Piece Whole Invariant) : Prop :=
  RecognizedCompatible w
  ∧ w.heldAsOne w.candidateWhole
  ∧ w.fits w.candidateWhole w.local₁
  ∧ w.fits w.candidateWhole w.local₂
  ∧ ∃ i : Invariant,
      w.carriesInvariant w.local₁ i
      ∧ w.carriesInvariant w.local₂ i
      ∧ w.wholeOwnsInvariant w.candidateWhole i

/-- Generic burden liveness after an upstream condition. -/
def LiveAfter {α : Type u}
    (prior next : α → Prop) : Prop :=
  (∃ x, prior x ∧ next x)
  ∧
  (∃ x, prior x ∧ ¬ next x)

/-
Finite witness vocabulary.
-/

inductive TestPiece
  | left
  | right

inductive TestWhole
  | omega

inductive TestInvariant
  | shared
  | leftOnly
  | rightOnly

abbrev TestWorld :=
  World TestPiece TestWhole TestInvariant

def recognizedBoth : TestPiece → Prop
  | .left => True
  | .right => True

def compatiblePair : TestPiece → TestPiece → Prop
  | .left, .right => True
  | .right, .left => True
  | _, _ => False

def fitsBoth : TestWhole → TestPiece → Prop
  | .omega, .left => True
  | .omega, .right => True

def fitsLeftOnly : TestWhole → TestPiece → Prop
  | .omega, .left => True
  | .omega, .right => False

def wholeHeld : TestWhole → Prop
  | .omega => True

def wholeNotHeld : TestWhole → Prop
  | .omega => False

def sharedCarriage : TestPiece → TestInvariant → Prop
  | .left, .shared => True
  | .right, .shared => True
  | _, _ => False

def splitCarriage : TestPiece → TestInvariant → Prop
  | .left, .leftOnly => True
  | .right, .rightOnly => True
  | _, _ => False

def wholeOwnsAll : TestWhole → TestInvariant → Prop :=
  fun _ _ => True

/-- Full Coherence success. -/
def coherenceSuccess : TestWorld where
  local₁ := .left
  local₂ := .right
  recognized := recognizedBoth
  compatible := compatiblePair
  candidateWhole := .omega
  fits := fitsBoth
  heldAsOne := wholeHeld
  carriesInvariant := sharedCarriage
  wholeOwnsInvariant := wholeOwnsAll

/-- Recognition and compatibility survive; global fit and shared invariant
    survive; the capacity-face fails because no whole is held as one. -/
def fragmented : TestWorld where
  local₁ := .left
  local₂ := .right
  recognized := recognizedBoth
  compatible := compatiblePair
  candidateWhole := .omega
  fits := fitsBoth
  heldAsOne := wholeNotHeld
  carriesInvariant := sharedCarriage
  wholeOwnsInvariant := wholeOwnsAll

/-- The whole shell is held and shared invariant content exists, but one local
    piece does not fit the one global hold. -/
def fitFailure : TestWorld where
  local₁ := .left
  local₂ := .right
  recognized := recognizedBoth
  compatible := compatiblePair
  candidateWhole := .omega
  fits := fitsLeftOnly
  heldAsOne := wholeHeld
  carriesInvariant := sharedCarriage
  wholeOwnsInvariant := wholeOwnsAll

/-- Whole-hold and global fit survive, but the pieces carry disjoint invariant
    content: no invariant is genuinely shared across the whole. -/
def invariantFailure : TestWorld where
  local₁ := .left
  local₂ := .right
  recognized := recognizedBoth
  compatible := compatiblePair
  candidateWhole := .omega
  fits := fitsBoth
  heldAsOne := wholeHeld
  carriesInvariant := splitCarriage
  wholeOwnsInvariant := wholeOwnsAll

/-
Upstream readiness.
-/

theorem success_recognized_compatible :
    RecognizedCompatible coherenceSuccess := by
  simp [RecognizedCompatible, coherenceSuccess,
    recognizedBoth, compatiblePair]

theorem fragmented_recognized_compatible :
    RecognizedCompatible fragmented := by
  simp [RecognizedCompatible, fragmented,
    recognizedBoth, compatiblePair]

theorem fitFailure_recognized_compatible :
    RecognizedCompatible fitFailure := by
  simp [RecognizedCompatible, fitFailure,
    recognizedBoth, compatiblePair]

theorem invariantFailure_recognized_compatible :
    RecognizedCompatible invariantFailure := by
  simp [RecognizedCompatible, invariantFailure,
    recognizedBoth, compatiblePair]

/-
Success components.
-/

theorem success_global_fit :
    GlobalFit coherenceSuccess := by
  simp [GlobalFit, coherenceSuccess, fitsBoth]

theorem success_shared_invariant :
    SharedInvariant coherenceSuccess := by
  refine ⟨TestInvariant.shared, ?_, ?_, ?_⟩
  · simp [coherenceSuccess, sharedCarriage]
  · simp [coherenceSuccess, sharedCarriage]
  · simp [coherenceSuccess, wholeOwnsAll]

theorem coherenceSuccess_coheres :
    Coheres coherenceSuccess := by
  exact ⟨
    by simp [coherenceSuccess, wholeHeld],
    success_global_fit,
    success_shared_invariant
  ⟩

/-
Failure components.
-/

theorem fragmented_not_coherent :
    ¬ Coheres fragmented := by
  intro h
  exact (by
    simpa [fragmented, wholeNotHeld] using h.1)

theorem fitFailure_not_global_fit :
    ¬ GlobalFit fitFailure := by
  simp [GlobalFit, fitFailure, fitsLeftOnly]

theorem fitFailure_not_coherent :
    ¬ Coheres fitFailure := by
  intro h
  exact fitFailure_not_global_fit h.2.1

theorem invariantFailure_no_shared_invariant :
    ¬ SharedInvariant invariantFailure := by
  intro h
  rcases h with ⟨i, hLeft, hRight, _hOwned⟩
  cases i <;> simp [invariantFailure, splitCarriage] at hLeft hRight

theorem invariantFailure_not_coherent :
    ¬ Coheres invariantFailure := by
  intro h
  exact invariantFailure_no_shared_invariant h.2.2

/-
Recognition-ready structure does not entail Coherence.
-/

theorem coherence_is_live_after_recognized_compatible :
    LiveAfter
      (RecognizedCompatible : TestWorld → Prop)
      (Coheres : TestWorld → Prop) := by
  constructor
  · exact ⟨coherenceSuccess,
      success_recognized_compatible,
      coherenceSuccess_coheres⟩
  · exact ⟨fragmented,
      fragmented_recognized_compatible,
      fragmented_not_coherent⟩

theorem recognized_compatible_does_not_entail_coherence :
    ∃ w : TestWorld,
      RecognizedCompatible w ∧ ¬ Coheres w := by
  exact ⟨fragmented,
    fragmented_recognized_compatible,
    fragmented_not_coherent⟩

/-
Anti-collapse / load-bearing tests.
-/

/-- Pairwise compatibility plus even global fit and a shared invariant is not
    enough if the whole itself is not held as one. -/
theorem compatibility_and_fit_do_not_replace_whole_hold :
    RecognizedCompatible fragmented
    ∧ GlobalFit fragmented
    ∧ SharedInvariant fragmented
    ∧ ¬ Coheres fragmented := by
  constructor
  · exact fragmented_recognized_compatible
  constructor
  · simp [GlobalFit, fragmented, fitsBoth]
  constructor
  · refine ⟨TestInvariant.shared, ?_, ?_, ?_⟩
    · simp [fragmented, sharedCarriage]
    · simp [fragmented, sharedCarriage]
    · simp [fragmented, wholeOwnsAll]
  · exact fragmented_not_coherent

/-- Whole-hold alone does not replace the constraint-face. -/
theorem whole_hold_without_global_fit_is_not_coherence :
    fitFailure.heldAsOne fitFailure.candidateWhole
    ∧ SharedInvariant fitFailure
    ∧ ¬ Coheres fitFailure := by
  constructor
  · simp [fitFailure, wholeHeld]
  constructor
  · refine ⟨TestInvariant.shared, ?_, ?_, ?_⟩
    · simp [fitFailure, sharedCarriage]
    · simp [fitFailure, sharedCarriage]
    · simp [fitFailure, wholeOwnsAll]
  · exact fitFailure_not_coherent

/-- Whole-hold plus global fit still does not replace shared invariant content. -/
theorem whole_hold_and_fit_without_shared_invariant_is_not_coherence :
    invariantFailure.heldAsOne invariantFailure.candidateWhole
    ∧ GlobalFit invariantFailure
    ∧ ¬ SharedInvariant invariantFailure
    ∧ ¬ Coheres invariantFailure := by
  constructor
  · simp [invariantFailure, wholeHeld]
  constructor
  · simp [GlobalFit, invariantFailure, fitsBoth]
  constructor
  · exact invariantFailure_no_shared_invariant
  · exact invariantFailure_not_coherent

/-- Coherence does not collapse distinct local pieces into literal identity. -/
theorem coherence_preserves_local_distinction :
    Coheres coherenceSuccess
    ∧ coherenceSuccess.local₁ ≠ coherenceSuccess.local₂ := by
  constructor
  · exact coherenceSuccess_coheres
  · simp [coherenceSuccess]

/-
Endpoint necessity and removal.
-/

theorem endpoint_requires_recognized_compatible
    {Piece Whole Invariant : Type u}
    {w : World Piece Whole Invariant}
    (h : JointWholeHoldEndpoint w) :
    RecognizedCompatible w := by
  exact h.1

theorem endpoint_requires_coherence
    {Piece Whole Invariant : Type u}
    {w : World Piece Whole Invariant}
    (h : JointWholeHoldEndpoint w) :
    Coheres w := by
  rcases h with ⟨_hReady, hHeld, hFit1, hFit2, hShared⟩
  exact ⟨hHeld, ⟨hFit1, hFit2⟩, hShared⟩

theorem recognized_coherence_reaches_endpoint
    {Piece Whole Invariant : Type u}
    {w : World Piece Whole Invariant}
    (hReady : RecognizedCompatible w)
    (hCo : Coheres w) :
    JointWholeHoldEndpoint w := by
  rcases hCo with ⟨hHeld, hFit, hShared⟩
  exact ⟨hReady, hHeld, hFit.1, hFit.2, hShared⟩

theorem no_endpoint_without_whole_hold
    {Piece Whole Invariant : Type u}
    {w : World Piece Whole Invariant}
    (hNo : ¬ w.heldAsOne w.candidateWhole) :
    ¬ JointWholeHoldEndpoint w := by
  intro hEnd
  exact hNo hEnd.2.1

theorem no_endpoint_without_global_fit
    {Piece Whole Invariant : Type u}
    {w : World Piece Whole Invariant}
    (hNo : ¬ GlobalFit w) :
    ¬ JointWholeHoldEndpoint w := by
  intro hEnd
  have hCo : Coheres w := endpoint_requires_coherence hEnd
  exact hNo hCo.2.1

theorem no_endpoint_without_shared_invariant
    {Piece Whole Invariant : Type u}
    {w : World Piece Whole Invariant}
    (hNo : ¬ SharedInvariant w) :
    ¬ JointWholeHoldEndpoint w := by
  intro hEnd
  have hCo : Coheres w := endpoint_requires_coherence hEnd
  exact hNo hCo.2.2

/-- Success witness for the lower-semantic endpoint. -/
theorem coherenceSuccess_reaches_endpoint :
    JointWholeHoldEndpoint coherenceSuccess := by
  exact recognized_coherence_reaches_endpoint
    success_recognized_compatible coherenceSuccess_coheres

/-- Consolidated pairwise executable Coherence audit. -/
theorem coherence_machine_closure :
    LiveAfter
      (RecognizedCompatible : TestWorld → Prop)
      (Coheres : TestWorld → Prop)
    ∧ JointWholeHoldEndpoint coherenceSuccess
    ∧ (∃ w : TestWorld,
        RecognizedCompatible w ∧ ¬ Coheres w)
    ∧ (Coheres coherenceSuccess
        ∧ coherenceSuccess.local₁ ≠ coherenceSuccess.local₂) := by
  constructor
  · exact coherence_is_live_after_recognized_compatible
  constructor
  · exact coherenceSuccess_reaches_endpoint
  constructor
  · exact recognized_compatible_does_not_entail_coherence
  · exact coherence_preserves_local_distinction

end Coherence


/-!
UNIVERSAL CONSOLIDATION CHECKPOINT
----------------------------------
The promoted v0.6 source preserves the previously clean universal stack and
adds the already-clean Failure-Side Discrimination inference layer:

  C0 / Chance
  -> foundational burden bridge
  -> Persistence / Boundary / Cascade / Authorization
  -> Entropy / no-free-immunity
  -> foundational first-break / five-regime closure
  -> Austerity / six-face closure / primitive minimality
  -> PAA (non-hinge continuation-validity corollary)
  -> Recognition
  -> Coherence
  -> Failure-Side Discrimination (scope-bound inference rule)

No theorem is inferred merely from adjacency in this list. Failure-Side
Discrimination remains downstream method: it operates only after its earning
burdens have been supplied.
-/

end StructuralFlow


/-!
===============================================================================
FAILURE-SIDE DISCRIMINATION — PUBLIC THEOREM MODULE
===============================================================================

Historical derivation line: consolidated kernel attempt v0.2.
Historical derivation authority:
  Structural Flow T.O.E. v1.64
  Failure-Side Discrimination Theorem v1.2
Current semantic authority:
  Structural Flow TOE — Universal Canon and Interaction Interface (current compatible governing release).

Machine dependency:
  StructuralFlow.FailureClosure

v0.2 repair
-----------
The v0.1 attempt over-tightened the relation between downstream object failure
and the foundational five-regime kernel.

A downstream object can fail while the foundational route through Authorization
remains intact. Recognition / Coherence-side failures are the obvious case.
The TOE also permits compound failure profiles composed of already represented
failure shapes.

Therefore v0.2 does NOT require:
  object-level non-holding -> actual foundational RouteSnapshot failure.

Instead:

1. object-level failure signature is represented independently by `matches`;
2. object-level exhaustion / no remainder remains an explicitly earned premise;
3. a separate regime-articulation layer maps failure cases to one or more
   *shape witnesses* in the already-closed foundational regime space;
4. the existing `FailureClosure` kernel proves that every such witness reduces
   to Dissolution, Shear, Drift, Echo, or Lock;
5. no theorem identifies the object failure signature with any one Failure
   Regime.

This follows the TOE earning sequence more faithfully:
  structural legibility
  -> candidate failure statement
  -> five-regime articulation
  -> closed exhaustion
  -> no remainder
  -> adjacent / substitute / non-absorption pressure
  -> object-location discrimination.

Scope
-----
This module machine-tests the logical core *after* the human/domain earning
burdens have been supplied.

It does not:
* choose the correct object level or scope;
* derive `eligible`, `held`, or `matches`;
* define failure as `not held`;
* define eligibility from `held ∨ matches`;
* claim that one regime is one object signature;
* require an actual before/after failure passage;
* add a sixth Failure Regime;
* replace domain expertise or empirical adjudication.

`Case` is abstract. A downstream Case may contain a configuration, transition,
history, path, provenance, comparison record, or any other evidence package
needed by the declared object.
-/

namespace StructuralFlow
namespace FailureDiscrimination

universe u

/--
Regime-shape articulation for an independently specified object-level failure
signature.

`shapeWitness x s` means only:
  route snapshot `s` is being used as an articulation witness for some
  foundational failure shape present in object-level case `x`.

It does NOT mean:
  `s` is the actual foundational state of the candidate object in case `x`.

The relation permits multiple witnesses for one case, so compound signatures
can articulate through more than one already-closed failure shape.
-/
structure RegimeArticulation
    {Case : Type u}
    (eligible fails : Case → Prop) where
  shapeWitness :
    Case → FailureClosure.RouteSnapshot → Prop

  witnessCaseInScope :
    ∀ x s, shapeWitness x s → eligible x

  witnessWellFormed :
    ∀ x s, shapeWitness x s →
      FailureClosure.WellFormedRoute s

  witnessIsFoundationalFailureShape :
    ∀ x s, shapeWitness x s →
      FailureClosure.FoundationalFailure s

  matchedCaseHasShapeWitness :
    ∀ x, fails x →
      ∃ s, shapeWitness x s

/--
Machine-facing package for an earned object-level failure signature.

`exhaustive` is intentionally independent of `fails` syntax:
the profile has to be earned as covering every admitted non-holding case.
It is not derived merely by naming one of the five Failure Regimes.

The five-regime kernel is carried separately through `articulation`.
-/
structure EarnedSignature
    {Case : Type u}
    (eligible held fails : Case → Prop) where
  heldInScope :
    ∀ x, held x → eligible x

  matchInScope :
    ∀ x, fails x → eligible x

  disjoint :
    ∀ x, held x → ¬ fails x

  /--
  Closed exhaustion / no remainder at the declared object level and scope.
  This must be earned upstream of this machine inference rule.
  -/
  exhaustive :
    ∀ x, eligible x → ¬ held x → fails x

  /-- Block an empty held-condition location. -/
  heldWitness :
    ∃ x, eligible x ∧ held x

  /-- Block an empty failure signature. -/
  failureWitness :
    ∃ x, eligible x ∧ fails x

  /--
  Failure-profile articulation into the already-closed five-regime shape space.
  -/
  articulation :
    RegimeArticulation eligible fails

/--
Every regime-articulation witness is classified by one of the five already
machine-closed foundational Failure Regimes.

This theorem is the firewall:
object signatures may *articulate through* the closed regime space without
becoming regime identities.
-/
theorem articulation_witness_is_existing_failure_regime
    {Case : Type u}
    {eligible fails : Case → Prop}
    (a : RegimeArticulation eligible fails)
    (x : Case)
    (s : FailureClosure.RouteSnapshot)
    (hWitness : a.shapeWitness x s) :
    FailureClosure.Dissolution s ∨
    FailureClosure.Shear s ∨
    FailureClosure.Drift s ∨
    FailureClosure.Echo s ∨
    FailureClosure.Lock s := by
  exact
    FailureClosure.foundational_failure_exhaustion
      s
      (a.witnessWellFormed x s hWitness)
      (a.witnessIsFoundationalFailureShape x s hWitness)

/--
Every matched object-level failure case has at least one articulation witness,
and every such witness lies inside the existing five-regime space.
-/
theorem matched_case_has_existing_regime_articulation
    {Case : Type u}
    {eligible fails : Case → Prop}
    (a : RegimeArticulation eligible fails)
    (x : Case)
    (hMatch : fails x) :
    ∃ s,
      a.shapeWitness x s ∧
      (
        FailureClosure.Dissolution s ∨
        FailureClosure.Shear s ∨
        FailureClosure.Drift s ∨
        FailureClosure.Echo s ∨
        FailureClosure.Lock s
      ) := by
  rcases a.matchedCaseHasShapeWitness x hMatch with ⟨s, hWitness⟩
  exact
    ⟨s, hWitness,
      articulation_witness_is_existing_failure_regime
        a x s hWitness⟩

/--
The earned object-level signature covers every admitted non-holding case.

This is deliberately just the already-earned exhaustion premise exposed as a
named theorem, rather than silently rebuilt from the foundational first-break
classifier.
-/
theorem no_remainder_in_declared_scope
    {Case : Type u}
    {eligible held fails : Case → Prop}
    (e : EarnedSignature eligible held fails)
    (x : Case)
    (hEligible : eligible x)
    (hNotHeld : ¬ held x) :
    fails x := by
  exact e.exhaustive x hEligible hNotHeld

/--
A matched failure case cannot simultaneously be a holding case.
-/
theorem match_implies_not_held
    {Case : Type u}
    {eligible held fails : Case → Prop}
    (e : EarnedSignature eligible held fails)
    (x : Case)
    (hMatch : fails x) :
    ¬ held x := by
  intro hHeld
  exact e.disjoint x hHeld hMatch

/--
Inside the independently declared scope, the earned object-level failure class
is exactly the non-holding side.

The right-to-left direction is not definitional; it uses the explicitly earned
closed-exhaustion premise.
-/
theorem failure_class_iff_not_held_in_scope
    {Case : Type u}
    {eligible held fails : Case → Prop}
    (e : EarnedSignature eligible held fails)
    (x : Case)
    (hEligible : eligible x) :
    fails x ↔ ¬ held x := by
  constructor
  · exact match_implies_not_held e x
  · intro hNotHeld
    exact e.exhaustive x hEligible hNotHeld

/--
Failure-side complement form of the held condition.

Classical reasoning is made explicit here: from complete disjoint/exhaustive
partitioning of an admitted case, not matching the failure class yields holding.
-/
theorem held_iff_not_failure_class_in_scope
    {Case : Type u}
    {eligible held fails : Case → Prop}
    (e : EarnedSignature eligible held fails)
    (x : Case)
    (hEligible : eligible x) :
    held x ↔ ¬ fails x := by
  classical
  constructor
  · exact e.disjoint x
  · intro hNotMatch
    by_cases hHeld : held x
    · exact hHeld
    · exact False.elim
        (hNotMatch (e.exhaustive x hEligible hHeld))

/--
Two candidates occupy the same machine-level object-location inside one fixed
declared scope when they classify exactly the same admitted cases as holding.

This is extensional held-condition equivalence, not candidate-name identity.
-/
def SameLocation
    {Case : Type u}
    (eligible held₁ held₂ : Case → Prop) : Prop :=
  ∀ x, eligible x → (held₁ x ↔ held₂ x)

/--
Two object-level failure signatures are extensionally the same within one fixed
declared scope when they classify exactly the same admitted cases as failures.
-/
def SameFailureClass
    {Case : Type u}
    (eligible matches₁ matches₂ : Case → Prop) : Prop :=
  ∀ x, eligible x → (matches₁ x ↔ matches₂ x)

/--
Core machine form of the Failure-Side Discrimination Theorem.

If two structurally earned object signatures live over the same independently
declared scope and are extensionally the same failure class, then they
discriminate the same held-condition location.

This formalizes:
  what uniquely fails locates what uniquely holds
after exhaustion / no remainder has been earned.
-/
theorem same_earned_failure_class_discriminates_same_location
    {Case : Type u}
    {eligible held₁ held₂ matches₁ matches₂ : Case → Prop}
    (e₁ : EarnedSignature eligible held₁ matches₁)
    (e₂ : EarnedSignature eligible held₂ matches₂)
    (hSameFailure :
      SameFailureClass eligible matches₁ matches₂) :
    SameLocation eligible held₁ held₂ := by
  intro x hEligible
  have h₁ :=
    held_iff_not_failure_class_in_scope e₁ x hEligible
  have h₂ :=
    held_iff_not_failure_class_in_scope e₂ x hEligible
  have hFailureEq : matches₁ x ↔ matches₂ x :=
    hSameFailure x hEligible
  constructor
  · intro hHeld₁
    have hNotMatch₁ : ¬ matches₁ x := h₁.mp hHeld₁
    have hNotMatch₂ : ¬ matches₂ x := by
      intro hMatch₂
      exact hNotMatch₁ (hFailureEq.mpr hMatch₂)
    exact h₂.mpr hNotMatch₂
  · intro hHeld₂
    have hNotMatch₂ : ¬ matches₂ x := h₂.mp hHeld₂
    have hNotMatch₁ : ¬ matches₁ x := by
      intro hMatch₁
      exact hNotMatch₂ (hFailureEq.mp hMatch₁)
    exact h₁.mpr hNotMatch₁

/--
Special case:
one and the same complete earned failure predicate cannot discriminate two
different held-condition locations over the same declared scope.
-/
theorem one_earned_failure_class_one_location
    {Case : Type u}
    {eligible held₁ held₂ fails : Case → Prop}
    (e₁ : EarnedSignature eligible held₁ fails)
    (e₂ : EarnedSignature eligible held₂ fails) :
    SameLocation eligible held₁ held₂ := by
  apply same_earned_failure_class_discriminates_same_location e₁ e₂
  intro x _hEligible
  exact Iff.rfl

/--
Contrapositive uniqueness form.

Different held-condition locations inside the same fixed scope cannot possess
extensionally the same complete earned failure class there.
-/
theorem different_locations_cannot_share_complete_earned_failure_class
    {Case : Type u}
    {eligible held₁ held₂ matches₁ matches₂ : Case → Prop}
    (e₁ : EarnedSignature eligible held₁ matches₁)
    (e₂ : EarnedSignature eligible held₂ matches₂)
    (hDifferent : ¬ SameLocation eligible held₁ held₂) :
    ¬ SameFailureClass eligible matches₁ matches₂ := by
  intro hSameFailure
  exact hDifferent
    (same_earned_failure_class_discriminates_same_location
      e₁ e₂ hSameFailure)

/--
Non-vacuity is explicit on both sides.
-/
theorem earned_signature_is_nonvacuous
    {Case : Type u}
    {eligible held fails : Case → Prop}
    (e : EarnedSignature eligible held fails) :
    (∃ x, eligible x ∧ held x) ∧
    (∃ y, eligible y ∧ fails y) := by
  exact ⟨e.heldWitness, e.failureWitness⟩

/--
Every earned object-level failure case has an articulation into the already
closed five-regime shape space.

This does not claim one-to-one mapping, and compound signatures may possess
multiple witnesses.
-/
theorem earned_failure_case_stays_inside_closed_regime_space
    {Case : Type u}
    {eligible held fails : Case → Prop}
    (e : EarnedSignature eligible held fails)
    (x : Case)
    (hMatch : fails x) :
    ∃ s,
      e.articulation.shapeWitness x s ∧
      (
        FailureClosure.Dissolution s ∨
        FailureClosure.Shear s ∨
        FailureClosure.Drift s ∨
        FailureClosure.Echo s ∨
        FailureClosure.Lock s
      ) := by
  exact
    matched_case_has_existing_regime_articulation
      e.articulation x hMatch

/--
Consolidated v0.2 checkpoint.

The theorem packages:
* object-level no remainder inside declared scope;
* failure/hold complement;
* non-vacuity;
* articulation of each matched failure case through the already-closed
  five-regime shape space.

Object-level exhaustion and regime-space closure remain distinct burdens.
-/
theorem failure_side_discrimination_machine_checkpoint
    {Case : Type u}
    {eligible held fails : Case → Prop}
    (e : EarnedSignature eligible held fails) :
    (∀ x, eligible x → ¬ held x → fails x) ∧
    (∀ x, eligible x → (fails x ↔ ¬ held x)) ∧
    (∀ x, eligible x → (held x ↔ ¬ fails x)) ∧
    (∃ x, eligible x ∧ held x) ∧
    (∃ y, eligible y ∧ fails y) := by
  constructor
  · intro x hEligible hNotHeld
    exact e.exhaustive x hEligible hNotHeld
  constructor
  · intro x hEligible
    exact failure_class_iff_not_held_in_scope e x hEligible
  constructor
  · intro x hEligible
    exact held_iff_not_failure_class_in_scope e x hEligible
  · exact ⟨e.heldWitness, e.failureWitness⟩

end FailureDiscrimination
end StructuralFlow


/-!
===============================================================================
FAILURE-SIDE DISCRIMINATION — SEMANTIC AUDIT ADDENDUM v0.4
===============================================================================

Purpose
-------
This addendum leaves the cleanly passing v0.3 kernel untouched and strengthens
the semantic checkpoint in three ways:

1. It proves the converse discrimination direction required by the TOE's
   statement that object-location and earned failure signature "mutually
   discriminate one another within scope."

2. It makes the meaning of fixed scope explicit as an OBJECT-DISCRIMINATION
   SURFACE: the declared same-level relevant neighbors remain fixed while the
   candidate held condition is tested.

3. It packages the two distinct earning branches:
   * survivor / adjacent-object non-absorption;
   * articulation inside the already-closed five-regime shape space.

Important limit
---------------
This does NOT make Lean decide whether the human/domain investigator declared
the correct or complete adjacent-object inventory.

`relevant` is the supplied declaration of the same-level neighboring structures
that must remain fixed on the adjudication surface.

Likewise, the existing regime articulation layer machine-checks that supplied
shape witnesses stay inside the already-closed five-regime space. It does not
replace the human/domain burden of competently pressure-testing the candidate
through all five named regimes.

The theorem remains an inference rule after the earning sequence, not an
automatic object-production machine.
-/

namespace StructuralFlow
namespace FailureDiscrimination

/--
A fixed object-discrimination surface.

`eligible` is deliberately stronger than "belongs to the broad domain."
It is the admitted comparison surface at one declared structural level/scope on
which all declared relevant adjacent structures remain available.

This is what makes object-level exhaustion honest:
an upstream collapse of a relevant neighbor is not silently counted as the
candidate object's distinctive same-level failure signature.
-/
structure DiscriminationSurface
    (Case Neighbor : Type u) where
  eligible : Case → Prop

  /--
  The investigator's declared same-level relevant adjacent structures.
  Competence/completeness of this declaration remains an upstream earning
  burden; the kernel does not infer it.
  -/
  relevant : Neighbor → Prop

  /-- Does neighbor `n` remain structurally present in case `x`? -/
  neighborHolds : Neighbor → Case → Prop

  /--
  Every admitted case preserves the declared relevant neighbors.
  Thus held/failure comparison occurs while the neighboring discrimination
  surface remains fixed.
  -/
  relevantNeighborsStable :
    ∀ x, eligible x → ∀ n, relevant n → neighborHolds n x

/--
A failure case for an earned signature preserves every declared relevant
neighbor on the discrimination surface.

This is the machine-facing survivor side of the strong-discriminator question:
"Can the candidate fail while the relevant adjacent objects remain?"
-/
theorem failure_preserves_declared_relevant_neighbors
    {Case Neighbor : Type u}
    (surface : DiscriminationSurface Case Neighbor)
    {held fails : Case → Prop}
    (e : EarnedSignature surface.eligible held fails)
    (x : Case)
    (hFail : fails x) :
    ∀ n, surface.relevant n → surface.neighborHolds n x := by
  intro n hRelevant
  have hEligible : surface.eligible x :=
    e.matchInScope x hFail
  exact
    surface.relevantNeighborsStable x hEligible n hRelevant

/--
Non-absorption witness:
because an earned failure class is nonempty, there is an admitted failure case
in which every declared relevant neighbor remains.

This does not prove that the supplied neighbor inventory is complete; it proves
the survivor relation once that inventory has been competently declared.
-/
theorem earned_signature_has_same_level_survivor_witness
    {Case Neighbor : Type u}
    (surface : DiscriminationSurface Case Neighbor)
    {held fails : Case → Prop}
    (e : EarnedSignature surface.eligible held fails) :
    ∃ x,
      fails x ∧
      ∀ n, surface.relevant n → surface.neighborHolds n x := by
  rcases e.failureWitness with ⟨x, _hEligible, hFail⟩
  exact
    ⟨x, hFail,
      failure_preserves_declared_relevant_neighbors
        surface e x hFail⟩

/--
Converse discrimination direction.

For complete earned signatures over the same fixed scope, extensionally the
same held-condition location entails extensionally the same failure class.

Together with
`same_earned_failure_class_discriminates_same_location`,
this formalizes the TOE's "mutually discriminate one another within scope"
language.
-/
theorem same_location_discriminates_same_earned_failure_class
    {Case : Type u}
    {eligible held₁ held₂ fails₁ fails₂ : Case → Prop}
    (e₁ : EarnedSignature eligible held₁ fails₁)
    (e₂ : EarnedSignature eligible held₂ fails₂)
    (hSameLocation :
      SameLocation eligible held₁ held₂) :
    SameFailureClass eligible fails₁ fails₂ := by
  intro x hEligible
  have hFail₁ :=
    failure_class_iff_not_held_in_scope e₁ x hEligible
  have hFail₂ :=
    failure_class_iff_not_held_in_scope e₂ x hEligible
  have hHeldEq : held₁ x ↔ held₂ x :=
    hSameLocation x hEligible
  constructor
  · intro hf₁
    have hn₁ : ¬ held₁ x := hFail₁.mp hf₁
    have hn₂ : ¬ held₂ x := by
      intro hh₂
      exact hn₁ (hHeldEq.mpr hh₂)
    exact hFail₂.mpr hn₂
  · intro hf₂
    have hn₂ : ¬ held₂ x := hFail₂.mp hf₂
    have hn₁ : ¬ held₁ x := by
      intro hh₁
      exact hn₂ (hHeldEq.mp hh₁)
    exact hFail₁.mpr hn₁

/--
Mutual discrimination, cross-candidate form.

Once both candidate signatures have cleared the earned-signature burden over
the same fixed scope:

  same complete failure class
  iff
  same held-condition location.

This is extensional structural discrimination, not wording identity.
-/
theorem same_earned_failure_class_iff_same_location
    {Case : Type u}
    {eligible held₁ held₂ fails₁ fails₂ : Case → Prop}
    (e₁ : EarnedSignature eligible held₁ fails₁)
    (e₂ : EarnedSignature eligible held₂ fails₂) :
    SameFailureClass eligible fails₁ fails₂ ↔
    SameLocation eligible held₁ held₂ := by
  constructor
  · exact
      same_earned_failure_class_discriminates_same_location e₁ e₂
  · exact
      same_location_discriminates_same_earned_failure_class e₁ e₂

/--
Semantic closure checkpoint for one earned signature on a fixed
object-discrimination surface.

This packages the two different closure branches without conflating them:

A. object-level discrimination:
   inside the fixed surface, the complete earned failure class is exactly the
   non-holding side;

B. same-level survivor/non-absorption:
   every failure case preserves all declared relevant neighbors;

C. foundational firewall:
   every supplied failure-shape witness remains inside the already-closed
   Dissolution / Shear / Drift / Echo / Lock space;

D. non-vacuity:
   both hold and failure sides have coherent witnesses.

The articulation clause does not claim that one regime is identical to the
object signature.
-/
theorem failure_side_discrimination_semantic_closure
    {Case Neighbor : Type u}
    (surface : DiscriminationSurface Case Neighbor)
    {held fails : Case → Prop}
    (e : EarnedSignature surface.eligible held fails) :
    (∀ x, surface.eligible x → (fails x ↔ ¬ held x)) ∧
    (∀ x, fails x →
      ∀ n, surface.relevant n → surface.neighborHolds n x) ∧
    (∀ x, fails x →
      ∃ s,
        e.articulation.shapeWitness x s ∧
        (
          FailureClosure.Dissolution s ∨
          FailureClosure.Shear s ∨
          FailureClosure.Drift s ∨
          FailureClosure.Echo s ∨
          FailureClosure.Lock s
        )) ∧
    (∃ x, surface.eligible x ∧ held x) ∧
    (∃ y, surface.eligible y ∧ fails y) := by
  constructor
  · intro x hEligible
    exact failure_class_iff_not_held_in_scope e x hEligible
  constructor
  · intro x hFail
    exact
      failure_preserves_declared_relevant_neighbors
        surface e x hFail
  constructor
  · intro x hFail
    exact
      earned_failure_case_stays_inside_closed_regime_space
        e x hFail
  · exact ⟨e.heldWitness, e.failureWitness⟩

end FailureDiscrimination
end StructuralFlow


/-!
===============================================================================
CANON THREE — PUBLIC THEOREM MODULE
===============================================================================

Historical derivation line: semantic repair / closure attempt v0.5.
Historical derivation authority:
  Canon Three Machine-Closure Freeze Note v0.2

Historical machine antecedent:
  Canon Three Kernel Attempt v0.4 — clean Lean pass twice.

Why v0.5 exists
---------------
The post-pass semantic audit accepted the v0.4 architecture but found two
places where the machine object should better match the frozen human burden:

1. Frontier Fidelity should constrain the complete declared prior-burden
   relation and require the candidate frontier itself to be structurally live.
   A field named merely `prerequisite` could be misread as only an immediate
   graph edge.

2. Regime Fidelity should not be vacuously satisfiable merely because no
   operative boundary was supplied. The frozen human job includes locating the
   operative boundary / cut / object / level / scope / interface.

v0.5 therefore:
* uses `requiredPrior` for the complete declared prior-burden relation;
* adds `live` to the frontier semantics;
* requires at least one located operative boundary;
* preserves all operative boundaries and all genuinely required behaviors;
* adds explicit tests for downstream exploration, non-exercise of conditional
  yield, reap/sow internal non-absorption, and boundary/behavior internal
  non-absorption.

The arbitrary-Q no-fourth theorem remains intentionally scope-bound:
it closes only relative to the independently declared lower-semantic
navigation endpoint. A genuinely missing universal navigation job reopens that
endpoint rather than being excluded by formal vocabulary.
-/

namespace StructuralFlow
namespace CanonThree

universe u

/--
Lower-semantic world for one situated navigation task.

`requiredPrior p b` means p is in the complete declared prerequisite burden of
b at the tested scope. It is NOT restricted to immediate graph adjacency.

`live b` means b is structurally available as an unresolved burden now.

`exploratory b` is deliberately separate from `warrantBearing b`: inquiry may
inspect or speculate beyond the warranted frontier without claiming that work
as earned continuation.
-/
structure World
    (Burden CarryItem Boundary Side : Type u) where
  /- Frontier-facing semantics. -/
  requiredPrior : Burden → Burden → Prop
  resolved : Burden → Prop
  live : Burden → Prop
  warrantBearing : Burden → Prop
  exploratory : Burden → Prop

  /- Carry-facing semantics. -/
  inherited : CarryItem → Prop
  accountedNow : CarryItem → Prop
  yieldIfSuccess : CarryItem → Prop
  accountedConditionalYield : CarryItem → Prop
  yieldExercised : CarryItem → Prop
  passageSucceeds : Prop

  /- Regime-facing semantics. -/
  operativeBoundary : Boundary → Prop
  boundaryPreserved : Boundary → Prop
  requiredBehavior : Boundary → Side → Prop
  behaviorPreserved : Boundary → Side → Prop

/--
Live unresolved frontier:
* b is structurally live now;
* b is unresolved;
* every declared required prior burden is resolved.

No uniqueness, total order, or compulsory action is implied.
-/
def FrontierCandidate
    {Burden CarryItem Boundary Side : Type u}
    (w : World Burden CarryItem Boundary Side)
    (b : Burden) : Prop :=
  w.live b
  ∧ ¬ w.resolved b
  ∧ ∀ p, w.requiredPrior p b → w.resolved p

/--
Frontier Fidelity constrains only warrant-bearing continuation.
Exploratory attention remains outside this restriction.
-/
def FrontierFidelity
    {Burden CarryItem Boundary Side : Type u}
    (w : World Burden CarryItem Boundary Side) : Prop :=
  ∀ b, w.warrantBearing b → FrontierCandidate w b

/-- Reap: inherited structure already carrying the present is accounted now. -/
def ReapFidelity
    {Burden CarryItem Boundary Side : Type u}
    (w : World Burden CarryItem Boundary Side) : Prop :=
  ∀ c, w.inherited c → w.accountedNow c

/--
Sow: every structural yield that would become available if the contemplated
passage succeeds is accounted as conditional yield.

This does not assert success and does not require later exercise.
-/
def SowFidelity
    {Burden CarryItem Boundary Side : Type u}
    (w : World Burden CarryItem Boundary Side) : Prop :=
  ∀ c, w.yieldIfSuccess c → w.accountedConditionalYield c

def CarryFidelity
    {Burden CarryItem Boundary Side : Type u}
    (w : World Burden CarryItem Boundary Side) : Prop :=
  ReapFidelity w ∧ SowFidelity w

/-- At least one operative boundary/regime marker is actually located. -/
def OperativeBoundaryLocated
    {Burden CarryItem Boundary Side : Type u}
    (w : World Burden CarryItem Boundary Side) : Prop :=
  ∃ b, w.operativeBoundary b

/--
Boundary face:
an operative boundary is located and every operative boundary supplied at the
scope is preserved.
-/
def BoundaryFidelity
    {Burden CarryItem Boundary Side : Type u}
    (w : World Burden CarryItem Boundary Side) : Prop :=
  OperativeBoundaryLocated w
  ∧ ∀ b, w.operativeBoundary b → w.boundaryPreserved b

/--
Required-behavior face:
every behavior genuinely required by an operative boundary is preserved.

No pair/existence burden is added beyond what the declared boundary actually
requires.
-/
def RequiredBehaviorFidelity
    {Burden CarryItem Boundary Side : Type u}
    (w : World Burden CarryItem Boundary Side) : Prop :=
  ∀ b s,
    w.operativeBoundary b →
    w.requiredBehavior b s →
    w.behaviorPreserved b s

def RegimeFidelity
    {Burden CarryItem Boundary Side : Type u}
    (w : World Burden CarryItem Boundary Side) : Prop :=
  BoundaryFidelity w ∧ RequiredBehaviorFidelity w

/--
Independent lower-semantic endpoint for lawful situated navigation under
non-guarantee.

The endpoint is written directly from the lower semantics. The Canon functions
are derived groupings over these obligations.
-/
def LawfulSituatedNavigation
    {Burden CarryItem Boundary Side : Type u}
    (w : World Burden CarryItem Boundary Side) : Prop :=
  (∀ b,
      w.warrantBearing b →
      (w.live b
       ∧ ¬ w.resolved b
       ∧ ∀ p, w.requiredPrior p b → w.resolved p))
  ∧
  (∀ c, w.inherited c → w.accountedNow c)
  ∧
  (∀ c, w.yieldIfSuccess c → w.accountedConditionalYield c)
  ∧
  (∃ b, w.operativeBoundary b)
  ∧
  (∀ b, w.operativeBoundary b → w.boundaryPreserved b)
  ∧
  (∀ b s,
      w.operativeBoundary b →
      w.requiredBehavior b s →
      w.behaviorPreserved b s)

/--
The frozen three functions exactly recover the independently stated lower
navigation endpoint at this declared semantic scope.
-/
theorem lawful_navigation_iff_canon_three
    {Burden CarryItem Boundary Side : Type u}
    (w : World Burden CarryItem Boundary Side) :
    LawfulSituatedNavigation w ↔
      FrontierFidelity w ∧ CarryFidelity w ∧ RegimeFidelity w := by
  constructor
  · intro h
    rcases h with
      ⟨hFrontier, hReap, hSow, hLocated, hBoundary, hBehavior⟩
    exact
      ⟨hFrontier, ⟨hReap, hSow⟩, ⟨⟨hLocated, hBoundary⟩, hBehavior⟩⟩
  · intro h
    rcases h with
      ⟨hFrontier, ⟨hReap, hSow⟩, ⟨⟨hLocated, hBoundary⟩, hBehavior⟩⟩
    exact
      ⟨hFrontier, hReap, hSow, hLocated, hBoundary, hBehavior⟩

theorem lawful_navigation_requires_frontier
    {Burden CarryItem Boundary Side : Type u}
    {w : World Burden CarryItem Boundary Side}
    (h : LawfulSituatedNavigation w) :
    FrontierFidelity w := by
  exact (lawful_navigation_iff_canon_three w).mp h |>.1

theorem lawful_navigation_requires_carry
    {Burden CarryItem Boundary Side : Type u}
    {w : World Burden CarryItem Boundary Side}
    (h : LawfulSituatedNavigation w) :
    CarryFidelity w := by
  exact (lawful_navigation_iff_canon_three w).mp h |>.2.1

theorem lawful_navigation_requires_regime
    {Burden CarryItem Boundary Side : Type u}
    {w : World Burden CarryItem Boundary Side}
    (h : LawfulSituatedNavigation w) :
    RegimeFidelity w := by
  exact (lawful_navigation_iff_canon_three w).mp h |>.2.2

/-! --------------------------------------------------------------------------
Finite witness vocabulary
---------------------------------------------------------------------------- -/

inductive DemoBurden
  | prior
  | middle
  | left
  | right
  | later
  deriving DecidableEq

inductive DemoCarry
  | inheritedItem
  | yieldItem
  deriving DecidableEq

inductive DemoBoundary
  | main
  deriving DecidableEq

inductive DemoSide
  | sideA
  | sideB
  deriving DecidableEq

abbrev DemoWorld :=
  World DemoBurden DemoCarry DemoBoundary DemoSide

def demoInherited : DemoCarry → Prop
  | .inheritedItem => True
  | .yieldItem => False

def demoAccountedNow : DemoCarry → Prop
  | .inheritedItem => True
  | .yieldItem => False

def demoYield : DemoCarry → Prop
  | .inheritedItem => False
  | .yieldItem => True

def demoConditionalYield : DemoCarry → Prop
  | .inheritedItem => False
  | .yieldItem => True

def demoOperativeBoundary : DemoBoundary → Prop
  | .main => True

def demoBoundaryPreserved : DemoBoundary → Prop
  | .main => True

def demoRequiredBehavior : DemoBoundary → DemoSide → Prop
  | .main, .sideA => True
  | .main, .sideB => True

def demoBehaviorPreserved : DemoBoundary → DemoSide → Prop
  | .main, .sideA => True
  | .main, .sideB => True

/-- Full lower-semantic success witness. -/
def navigationSuccess : DemoWorld where
  requiredPrior := fun p b =>
    p = .prior ∧ b = .left
  resolved := fun b => b = .prior
  live := fun b => b = .left
  warrantBearing := fun b => b = .left
  exploratory := fun _ => False

  inherited := demoInherited
  accountedNow := demoAccountedNow
  yieldIfSuccess := demoYield
  accountedConditionalYield := demoConditionalYield
  yieldExercised := fun _ => False
  passageSucceeds := True

  operativeBoundary := demoOperativeBoundary
  boundaryPreserved := demoBoundaryPreserved
  requiredBehavior := demoRequiredBehavior
  behaviorPreserved := demoBehaviorPreserved

theorem navigationSuccess_is_lawful :
    LawfulSituatedNavigation navigationSuccess := by
  refine ⟨?_, ?_, ?_, ?_, ?_, ?_⟩
  · simp [navigationSuccess]
  · simp [navigationSuccess, demoInherited, demoAccountedNow]
  · simp [navigationSuccess, demoYield, demoConditionalYield]
  · exact ⟨DemoBoundary.main, by
      simp [navigationSuccess, demoOperativeBoundary]⟩
  · simp [navigationSuccess, demoOperativeBoundary, demoBoundaryPreserved]
  · simp [navigationSuccess, demoOperativeBoundary,
      demoRequiredBehavior, demoBehaviorPreserved]

/-! --------------------------------------------------------------------------
Three-way non-absorption
---------------------------------------------------------------------------- -/

/--
Carry + Regime hold while Frontier fails.

The complete declared prior burden of `later` includes `prior`.
`middle` is marked resolved, but `prior` is not; warranting `later` therefore
cannot hide the unresolved earlier burden.
-/
def frontierFailureWorld : DemoWorld where
  requiredPrior := fun p b =>
    (p = .middle ∧ b = .later) ∨
    (p = .prior ∧ b = .later)
  resolved := fun b => b = .middle
  live := fun b => b = .later
  warrantBearing := fun b => b = .later
  exploratory := fun _ => False

  inherited := demoInherited
  accountedNow := demoAccountedNow
  yieldIfSuccess := demoYield
  accountedConditionalYield := demoConditionalYield
  yieldExercised := fun _ => False
  passageSucceeds := True

  operativeBoundary := demoOperativeBoundary
  boundaryPreserved := demoBoundaryPreserved
  requiredBehavior := demoRequiredBehavior
  behaviorPreserved := demoBehaviorPreserved

theorem carry_regime_without_frontier :
    CarryFidelity frontierFailureWorld ∧
    RegimeFidelity frontierFailureWorld ∧
    ¬ FrontierFidelity frontierFailureWorld := by
  constructor
  · simp [CarryFidelity, ReapFidelity, SowFidelity,
      frontierFailureWorld, demoInherited, demoAccountedNow,
      demoYield, demoConditionalYield]
  constructor
  · constructor
    · constructor
      · exact ⟨DemoBoundary.main, by
          simp [frontierFailureWorld, demoOperativeBoundary]⟩
      · simp [frontierFailureWorld, demoOperativeBoundary,
          demoBoundaryPreserved]
    · intro b s hBoundary hRequired
      cases b
      cases s <;>
        simp [frontierFailureWorld, demoOperativeBoundary,
          demoRequiredBehavior, demoBehaviorPreserved] at hBoundary hRequired ⊢
  · intro hFrontier
    have hLater : FrontierCandidate frontierFailureWorld DemoBurden.later :=
      hFrontier DemoBurden.later (by simp [frontierFailureWorld])
    have hPriorResolved : frontierFailureWorld.resolved DemoBurden.prior :=
      hLater.2.2 DemoBurden.prior (by simp [frontierFailureWorld])
    simp [frontierFailureWorld] at hPriorResolved

/-- Frontier + Regime hold while Carry fails. -/
def carryFailureWorld : DemoWorld where
  requiredPrior := fun _ _ => False
  resolved := fun _ => False
  live := fun b => b = .left
  warrantBearing := fun b => b = .left
  exploratory := fun _ => False

  inherited := demoInherited
  accountedNow := fun _ => False
  yieldIfSuccess := demoYield
  accountedConditionalYield := demoConditionalYield
  yieldExercised := fun _ => False
  passageSucceeds := True

  operativeBoundary := demoOperativeBoundary
  boundaryPreserved := demoBoundaryPreserved
  requiredBehavior := demoRequiredBehavior
  behaviorPreserved := demoBehaviorPreserved

theorem frontier_regime_without_carry :
    FrontierFidelity carryFailureWorld ∧
    RegimeFidelity carryFailureWorld ∧
    ¬ CarryFidelity carryFailureWorld := by
  constructor
  · simp [FrontierFidelity, FrontierCandidate, carryFailureWorld]
  constructor
  · constructor
    · constructor
      · exact ⟨DemoBoundary.main, by
          simp [carryFailureWorld, demoOperativeBoundary]⟩
      · simp [carryFailureWorld, demoOperativeBoundary,
          demoBoundaryPreserved]
    · intro b s hBoundary hRequired
      cases b
      cases s <;>
        simp [carryFailureWorld, demoOperativeBoundary,
          demoRequiredBehavior, demoBehaviorPreserved] at hBoundary hRequired ⊢
  · intro hCarry
    have hReap : ReapFidelity carryFailureWorld := hCarry.1
    have hAccounted :
        carryFailureWorld.accountedNow DemoCarry.inheritedItem :=
      hReap DemoCarry.inheritedItem
        (by simp [carryFailureWorld, demoInherited])
    simp [carryFailureWorld] at hAccounted

/-- Frontier + Carry hold while Regime fails because no boundary is preserved. -/
def regimeFailureWorld : DemoWorld where
  requiredPrior := fun _ _ => False
  resolved := fun _ => False
  live := fun b => b = .left
  warrantBearing := fun b => b = .left
  exploratory := fun _ => False

  inherited := demoInherited
  accountedNow := demoAccountedNow
  yieldIfSuccess := demoYield
  accountedConditionalYield := demoConditionalYield
  yieldExercised := fun _ => False
  passageSucceeds := True

  operativeBoundary := demoOperativeBoundary
  boundaryPreserved := fun _ => False
  requiredBehavior := demoRequiredBehavior
  behaviorPreserved := demoBehaviorPreserved

theorem frontier_carry_without_regime :
    FrontierFidelity regimeFailureWorld ∧
    CarryFidelity regimeFailureWorld ∧
    ¬ RegimeFidelity regimeFailureWorld := by
  constructor
  · simp [FrontierFidelity, FrontierCandidate, regimeFailureWorld]
  constructor
  · simp [CarryFidelity, ReapFidelity, SowFidelity,
      regimeFailureWorld, demoInherited, demoAccountedNow,
      demoYield, demoConditionalYield]
  · intro hRegime
    have hBoundary : BoundaryFidelity regimeFailureWorld := hRegime.1
    have hPreserved :
        regimeFailureWorld.boundaryPreserved DemoBoundary.main :=
      hBoundary.2 DemoBoundary.main
        (by simp [regimeFailureWorld, demoOperativeBoundary])
    simp [regimeFailureWorld] at hPreserved

theorem canon_three_are_nonabsorptive :
    (∃ w : DemoWorld,
      CarryFidelity w ∧ RegimeFidelity w ∧ ¬ FrontierFidelity w)
    ∧
    (∃ w : DemoWorld,
      FrontierFidelity w ∧ RegimeFidelity w ∧ ¬ CarryFidelity w)
    ∧
    (∃ w : DemoWorld,
      FrontierFidelity w ∧ CarryFidelity w ∧ ¬ RegimeFidelity w) := by
  exact ⟨
    ⟨frontierFailureWorld, carry_regime_without_frontier⟩,
    ⟨carryFailureWorld, frontier_regime_without_carry⟩,
    ⟨regimeFailureWorld, frontier_carry_without_regime⟩
  ⟩

/-! --------------------------------------------------------------------------
Internal-face pressure
---------------------------------------------------------------------------- -/

/-- Reap can hold while Sow fails. -/
def reapWithoutSowWorld : DemoWorld where
  requiredPrior := fun _ _ => False
  resolved := fun _ => False
  live := fun _ => False
  warrantBearing := fun _ => False
  exploratory := fun _ => False

  inherited := demoInherited
  accountedNow := demoAccountedNow
  yieldIfSuccess := demoYield
  accountedConditionalYield := fun _ => False
  yieldExercised := fun _ => False
  passageSucceeds := True

  operativeBoundary := demoOperativeBoundary
  boundaryPreserved := demoBoundaryPreserved
  requiredBehavior := demoRequiredBehavior
  behaviorPreserved := demoBehaviorPreserved

theorem reap_does_not_absorb_sow :
    ReapFidelity reapWithoutSowWorld ∧
    ¬ SowFidelity reapWithoutSowWorld := by
  constructor
  · simp [ReapFidelity, reapWithoutSowWorld,
      demoInherited, demoAccountedNow]
  · intro hSow
    have hAccounted :
        reapWithoutSowWorld.accountedConditionalYield DemoCarry.yieldItem :=
      hSow DemoCarry.yieldItem
        (by simp [reapWithoutSowWorld, demoYield])
    simp [reapWithoutSowWorld] at hAccounted

/-- Sow can hold while Reap fails. -/
def sowWithoutReapWorld : DemoWorld where
  requiredPrior := fun _ _ => False
  resolved := fun _ => False
  live := fun _ => False
  warrantBearing := fun _ => False
  exploratory := fun _ => False

  inherited := demoInherited
  accountedNow := fun _ => False
  yieldIfSuccess := demoYield
  accountedConditionalYield := demoConditionalYield
  yieldExercised := fun _ => False
  passageSucceeds := True

  operativeBoundary := demoOperativeBoundary
  boundaryPreserved := demoBoundaryPreserved
  requiredBehavior := demoRequiredBehavior
  behaviorPreserved := demoBehaviorPreserved

theorem sow_does_not_absorb_reap :
    SowFidelity sowWithoutReapWorld ∧
    ¬ ReapFidelity sowWithoutReapWorld := by
  constructor
  · simp [SowFidelity, sowWithoutReapWorld,
      demoYield, demoConditionalYield]
  · intro hReap
    have hAccounted :
        sowWithoutReapWorld.accountedNow DemoCarry.inheritedItem :=
      hReap DemoCarry.inheritedItem
        (by simp [sowWithoutReapWorld, demoInherited])
    simp [sowWithoutReapWorld] at hAccounted

/-- Boundary location/preservation can hold while required behavior fails. -/
def boundaryWithoutBehaviorWorld : DemoWorld where
  requiredPrior := fun _ _ => False
  resolved := fun _ => False
  live := fun _ => False
  warrantBearing := fun _ => False
  exploratory := fun _ => False

  inherited := demoInherited
  accountedNow := demoAccountedNow
  yieldIfSuccess := demoYield
  accountedConditionalYield := demoConditionalYield
  yieldExercised := fun _ => False
  passageSucceeds := True

  operativeBoundary := demoOperativeBoundary
  boundaryPreserved := demoBoundaryPreserved
  requiredBehavior := demoRequiredBehavior
  behaviorPreserved := fun _ _ => False

theorem boundary_face_does_not_absorb_behavior_face :
    BoundaryFidelity boundaryWithoutBehaviorWorld ∧
    ¬ RequiredBehaviorFidelity boundaryWithoutBehaviorWorld := by
  constructor
  · constructor
    · exact ⟨DemoBoundary.main, by
        simp [boundaryWithoutBehaviorWorld, demoOperativeBoundary]⟩
    · simp [boundaryWithoutBehaviorWorld, demoOperativeBoundary,
        demoBoundaryPreserved]
  · intro hBehavior
    have hPreserved :
        boundaryWithoutBehaviorWorld.behaviorPreserved
          DemoBoundary.main DemoSide.sideA :=
      hBehavior DemoBoundary.main DemoSide.sideA
        (by simp [boundaryWithoutBehaviorWorld, demoOperativeBoundary])
        (by simp [boundaryWithoutBehaviorWorld, demoRequiredBehavior])
    simp [boundaryWithoutBehaviorWorld] at hPreserved

/-- Required behavior can be preserved while the boundary itself is not. -/
def behaviorWithoutBoundaryWorld : DemoWorld where
  requiredPrior := fun _ _ => False
  resolved := fun _ => False
  live := fun _ => False
  warrantBearing := fun _ => False
  exploratory := fun _ => False

  inherited := demoInherited
  accountedNow := demoAccountedNow
  yieldIfSuccess := demoYield
  accountedConditionalYield := demoConditionalYield
  yieldExercised := fun _ => False
  passageSucceeds := True

  operativeBoundary := demoOperativeBoundary
  boundaryPreserved := fun _ => False
  requiredBehavior := demoRequiredBehavior
  behaviorPreserved := demoBehaviorPreserved

theorem behavior_face_does_not_absorb_boundary_face :
    RequiredBehaviorFidelity behaviorWithoutBoundaryWorld ∧
    ¬ BoundaryFidelity behaviorWithoutBoundaryWorld := by
  constructor
  · simp [RequiredBehaviorFidelity, behaviorWithoutBoundaryWorld,
      demoOperativeBoundary, demoRequiredBehavior, demoBehaviorPreserved]
  · intro hBoundary
    have hPreserved :
        behaviorWithoutBoundaryWorld.boundaryPreserved DemoBoundary.main :=
      hBoundary.2 DemoBoundary.main
        (by simp [behaviorWithoutBoundaryWorld, demoOperativeBoundary])
    simp [behaviorWithoutBoundaryWorld] at hPreserved

theorem carry_internal_faces_are_nonabsorbed :
    (∃ w : DemoWorld, ReapFidelity w ∧ ¬ SowFidelity w)
    ∧
    (∃ w : DemoWorld, SowFidelity w ∧ ¬ ReapFidelity w) := by
  exact ⟨
    ⟨reapWithoutSowWorld, reap_does_not_absorb_sow⟩,
    ⟨sowWithoutReapWorld, sow_does_not_absorb_reap⟩
  ⟩

theorem regime_internal_faces_are_nonabsorbed :
    (∃ w : DemoWorld,
      BoundaryFidelity w ∧ ¬ RequiredBehaviorFidelity w)
    ∧
    (∃ w : DemoWorld,
      RequiredBehaviorFidelity w ∧ ¬ BoundaryFidelity w) := by
  exact ⟨
    ⟨boundaryWithoutBehaviorWorld,
      boundary_face_does_not_absorb_behavior_face⟩,
    ⟨behaviorWithoutBoundaryWorld,
      behavior_face_does_not_absorb_boundary_face⟩
  ⟩

/-! --------------------------------------------------------------------------
Frozen safeguards and non-guarantee pressure
---------------------------------------------------------------------------- -/

def UniqueNextMove
    {Burden CarryItem Boundary Side : Type u}
    (w : World Burden CarryItem Boundary Side) : Prop :=
  ∃ b,
    (w.warrantBearing b ∧ FrontierCandidate w b) ∧
    ∀ b',
      (w.warrantBearing b' ∧ FrontierCandidate w b') →
      b' = b

def multipleFrontierWorld : DemoWorld where
  requiredPrior := fun _ _ => False
  resolved := fun _ => False
  live := fun b => b = .left ∨ b = .right
  warrantBearing := fun b => b = .left ∨ b = .right
  exploratory := fun _ => False

  inherited := demoInherited
  accountedNow := demoAccountedNow
  yieldIfSuccess := demoYield
  accountedConditionalYield := demoConditionalYield
  yieldExercised := fun _ => False
  passageSucceeds := True

  operativeBoundary := demoOperativeBoundary
  boundaryPreserved := demoBoundaryPreserved
  requiredBehavior := demoRequiredBehavior
  behaviorPreserved := demoBehaviorPreserved

theorem multipleFrontier_has_frontier_fidelity :
    FrontierFidelity multipleFrontierWorld := by
  simp [FrontierFidelity, FrontierCandidate, multipleFrontierWorld]

theorem multipleFrontier_not_unique :
    ¬ UniqueNextMove multipleFrontierWorld := by
  intro hUnique
  rcases hUnique with ⟨b, _hb, hOnly⟩
  have hLeft :
      multipleFrontierWorld.warrantBearing DemoBurden.left ∧
      FrontierCandidate multipleFrontierWorld DemoBurden.left := by
    constructor
    · simp [multipleFrontierWorld]
    · simp [FrontierCandidate, multipleFrontierWorld]
  have hRight :
      multipleFrontierWorld.warrantBearing DemoBurden.right ∧
      FrontierCandidate multipleFrontierWorld DemoBurden.right := by
    constructor
    · simp [multipleFrontierWorld]
    · simp [FrontierCandidate, multipleFrontierWorld]
  have hLeftEq : DemoBurden.left = b :=
    hOnly DemoBurden.left hLeft
  have hRightEq : DemoBurden.right = b :=
    hOnly DemoBurden.right hRight
  have hImpossible : DemoBurden.left = DemoBurden.right :=
    hLeftEq.trans hRightEq.symm
  cases hImpossible

theorem frontier_fidelity_does_not_entail_unique_next_move :
    ∃ w : DemoWorld,
      FrontierFidelity w ∧ ¬ UniqueNextMove w := by
  exact ⟨multipleFrontierWorld,
    multipleFrontier_has_frontier_fidelity,
    multipleFrontier_not_unique⟩

/-- No action need be selected. -/
def noSelectedMoveWorld : DemoWorld where
  requiredPrior := fun _ _ => False
  resolved := fun _ => False
  live := fun _ => False
  warrantBearing := fun _ => False
  exploratory := fun _ => False

  inherited := demoInherited
  accountedNow := demoAccountedNow
  yieldIfSuccess := demoYield
  accountedConditionalYield := demoConditionalYield
  yieldExercised := fun _ => False
  passageSucceeds := True

  operativeBoundary := demoOperativeBoundary
  boundaryPreserved := demoBoundaryPreserved
  requiredBehavior := demoRequiredBehavior
  behaviorPreserved := demoBehaviorPreserved

theorem frontier_fidelity_allows_no_selected_move :
    FrontierFidelity noSelectedMoveWorld ∧
    ¬ ∃ b, noSelectedMoveWorld.warrantBearing b := by
  constructor
  · simp [FrontierFidelity, noSelectedMoveWorld]
  · simp [noSelectedMoveWorld]

/--
Exploration beyond the warranted frontier is permitted.

`later` is explored but not a FrontierCandidate because it is not live.
-/
def downstreamExplorationWorld : DemoWorld where
  requiredPrior := fun p b =>
    p = .prior ∧ b = .left
  resolved := fun b => b = .prior
  live := fun b => b = .left
  warrantBearing := fun b => b = .left
  exploratory := fun b => b = .later

  inherited := demoInherited
  accountedNow := demoAccountedNow
  yieldIfSuccess := demoYield
  accountedConditionalYield := demoConditionalYield
  yieldExercised := fun _ => False
  passageSucceeds := True

  operativeBoundary := demoOperativeBoundary
  boundaryPreserved := demoBoundaryPreserved
  requiredBehavior := demoRequiredBehavior
  behaviorPreserved := demoBehaviorPreserved

theorem frontier_fidelity_allows_downstream_exploration :
    FrontierFidelity downstreamExplorationWorld ∧
    downstreamExplorationWorld.exploratory DemoBurden.later ∧
    ¬ FrontierCandidate downstreamExplorationWorld DemoBurden.later := by
  constructor
  · simp [FrontierFidelity, FrontierCandidate,
      downstreamExplorationWorld]
  constructor
  · simp [downstreamExplorationWorld]
  · intro hFrontier
    have hLive : downstreamExplorationWorld.live DemoBurden.later :=
      hFrontier.1
    simp [downstreamExplorationWorld] at hLive

/-- Carry Fidelity does not entail successful passage. -/
def carryWithoutSuccessWorld : DemoWorld where
  requiredPrior := fun _ _ => False
  resolved := fun _ => False
  live := fun _ => False
  warrantBearing := fun _ => False
  exploratory := fun _ => False

  inherited := demoInherited
  accountedNow := demoAccountedNow
  yieldIfSuccess := demoYield
  accountedConditionalYield := demoConditionalYield
  yieldExercised := fun _ => False
  passageSucceeds := False

  operativeBoundary := demoOperativeBoundary
  boundaryPreserved := demoBoundaryPreserved
  requiredBehavior := demoRequiredBehavior
  behaviorPreserved := demoBehaviorPreserved

theorem carry_fidelity_does_not_entail_success :
    ∃ w : DemoWorld,
      CarryFidelity w ∧ ¬ w.passageSucceeds := by
  exact ⟨carryWithoutSuccessWorld, by
    constructor
    · simp [CarryFidelity, ReapFidelity, SowFidelity,
        carryWithoutSuccessWorld, demoInherited, demoAccountedNow,
        demoYield, demoConditionalYield]
    · simp [carryWithoutSuccessWorld]⟩

/-- Nor does the full Canon Three entail passage success. -/
theorem canon_three_do_not_entail_success :
    ∃ w : DemoWorld,
      FrontierFidelity w ∧
      CarryFidelity w ∧
      RegimeFidelity w ∧
      ¬ w.passageSucceeds := by
  refine ⟨carryWithoutSuccessWorld, ?_, ?_, ?_, ?_⟩
  · simp [FrontierFidelity, carryWithoutSuccessWorld]
  · simp [CarryFidelity, ReapFidelity, SowFidelity,
      carryWithoutSuccessWorld, demoInherited, demoAccountedNow,
      demoYield, demoConditionalYield]
  · constructor
    · constructor
      · exact ⟨DemoBoundary.main, by
          simp [carryWithoutSuccessWorld, demoOperativeBoundary]⟩
      · simp [carryWithoutSuccessWorld, demoOperativeBoundary,
          demoBoundaryPreserved]
    · intro b s hBoundary hRequired
      cases b
      cases s <;>
        simp [carryWithoutSuccessWorld, demoOperativeBoundary,
          demoRequiredBehavior, demoBehaviorPreserved] at hBoundary hRequired ⊢
  · simp [carryWithoutSuccessWorld]

/--
Accounting the conditional yield does not entail exercising it.
-/
def ConditionalYieldExercised
    {Burden CarryItem Boundary Side : Type u}
    (w : World Burden CarryItem Boundary Side) : Prop :=
  ∀ c, w.yieldIfSuccess c → w.yieldExercised c

theorem carry_fidelity_does_not_entail_yield_exercise :
    ∃ w : DemoWorld,
      CarryFidelity w ∧ ¬ ConditionalYieldExercised w := by
  refine ⟨navigationSuccess, ?_, ?_⟩
  · simp [CarryFidelity, ReapFidelity, SowFidelity,
      navigationSuccess, demoInherited, demoAccountedNow,
      demoYield, demoConditionalYield]
  · intro hExercise
    have hUsed : navigationSuccess.yieldExercised DemoCarry.yieldItem :=
      hExercise DemoCarry.yieldItem
        (by simp [navigationSuccess, demoYield])
    simp [navigationSuccess] at hUsed

def NonemptyRequiredDuality
    {Burden CarryItem Boundary Side : Type u}
    (w : World Burden CarryItem Boundary Side) : Prop :=
  ∃ b s₁ s₂,
    w.operativeBoundary b ∧
    w.requiredBehavior b s₁ ∧
    w.requiredBehavior b s₂ ∧
    s₁ ≠ s₂

/--
A real located and preserved boundary may require no nonempty dual pair.
-/
def regimeWithoutDualityWorld : DemoWorld where
  requiredPrior := fun _ _ => False
  resolved := fun _ => False
  live := fun _ => False
  warrantBearing := fun _ => False
  exploratory := fun _ => False

  inherited := demoInherited
  accountedNow := demoAccountedNow
  yieldIfSuccess := demoYield
  accountedConditionalYield := demoConditionalYield
  yieldExercised := fun _ => False
  passageSucceeds := True

  operativeBoundary := demoOperativeBoundary
  boundaryPreserved := demoBoundaryPreserved
  requiredBehavior := fun _ _ => False
  behaviorPreserved := fun _ _ => False

theorem regime_fidelity_does_not_entail_nonempty_duality :
    ∃ w : DemoWorld,
      RegimeFidelity w ∧ ¬ NonemptyRequiredDuality w := by
  exact ⟨regimeWithoutDualityWorld, by
    constructor
    · constructor
      · constructor
        · exact ⟨DemoBoundary.main, by
            simp [regimeWithoutDualityWorld, demoOperativeBoundary]⟩
        · simp [regimeWithoutDualityWorld, demoOperativeBoundary,
            demoBoundaryPreserved]
      · intro b s _hBoundary hRequired
        cases b
        cases s <;> simp [regimeWithoutDualityWorld] at hRequired
    · simp [NonemptyRequiredDuality, regimeWithoutDualityWorld]⟩

/-! --------------------------------------------------------------------------
Declared-scope no-fourth closure
---------------------------------------------------------------------------- -/

def UniversalNavigationRequirement
    {Burden CarryItem Boundary Side : Type u}
    (Q : World Burden CarryItem Boundary Side → Prop) : Prop :=
  ∀ w, LawfulSituatedNavigation w → Q w

def IndependentOfCanonThree
    {Burden CarryItem Boundary Side : Type u}
    (Q : World Burden CarryItem Boundary Side → Prop) : Prop :=
  ∃ w,
    FrontierFidelity w ∧
    CarryFidelity w ∧
    RegimeFidelity w ∧
    ¬ Q w

/--
Arbitrary-Q closure at the declared lower-semantic navigation scope.

This theorem does NOT certify that the lower-semantic vocabulary is
metaphysically exhaustive. It proves that once `LawfulSituatedNavigation` is
accepted as the independently earned universal navigation endpoint, no further
predicate can be both necessary for that endpoint and independent of all three
fidelities.
-/
theorem no_fourth_universal_requirement_independent_of_canon_three
    {Burden CarryItem Boundary Side : Type u}
    (Q : World Burden CarryItem Boundary Side → Prop)
    (hUniversal : UniversalNavigationRequirement Q) :
    ¬ IndependentOfCanonThree Q := by
  intro hIndependent
  rcases hIndependent with
    ⟨w, hFrontier, hCarry, hRegime, hNotQ⟩
  have hNavigation : LawfulSituatedNavigation w :=
    (lawful_navigation_iff_canon_three w).mpr
      ⟨hFrontier, hCarry, hRegime⟩
  exact hNotQ (hUniversal w hNavigation)

theorem no_fourth_independent_universal_navigation_obligation
    {Burden CarryItem Boundary Side : Type u} :
    ¬ ∃ Q : World Burden CarryItem Boundary Side → Prop,
      UniversalNavigationRequirement Q ∧
      IndependentOfCanonThree Q := by
  intro h
  rcases h with ⟨Q, hUniversal, hIndependent⟩
  exact
    (no_fourth_universal_requirement_independent_of_canon_three
      Q hUniversal) hIndependent

/--
Consolidated semantic-repair checkpoint.
-/
theorem canon_three_machine_checkpoint :
    LawfulSituatedNavigation navigationSuccess
    ∧
    (∃ w : DemoWorld,
      CarryFidelity w ∧ RegimeFidelity w ∧ ¬ FrontierFidelity w)
    ∧
    (∃ w : DemoWorld,
      FrontierFidelity w ∧ RegimeFidelity w ∧ ¬ CarryFidelity w)
    ∧
    (∃ w : DemoWorld,
      FrontierFidelity w ∧ CarryFidelity w ∧ ¬ RegimeFidelity w)
    ∧
    (∃ w : DemoWorld,
      FrontierFidelity w ∧ ¬ UniqueNextMove w)
    ∧
    (∃ w : DemoWorld,
      CarryFidelity w ∧ ¬ w.passageSucceeds)
    ∧
    (∃ w : DemoWorld,
      RegimeFidelity w ∧ ¬ NonemptyRequiredDuality w) := by
  constructor
  · exact navigationSuccess_is_lawful
  constructor
  · exact ⟨frontierFailureWorld, carry_regime_without_frontier⟩
  constructor
  · exact ⟨carryFailureWorld, frontier_regime_without_carry⟩
  constructor
  · exact ⟨regimeFailureWorld, frontier_carry_without_regime⟩
  constructor
  · exact frontier_fidelity_does_not_entail_unique_next_move
  constructor
  · exact carry_fidelity_does_not_entail_success
  · exact regime_fidelity_does_not_entail_nonempty_duality

end CanonThree
end StructuralFlow


/-!
===============================================================================
+3 SIEVE — PUBLIC THEOREM MODULE
===============================================================================

Historical derivation line: machine-closure kernel attempt v0.1.
Historical derivation authority:
  Structural Flow T.O.E. — +3 Sieve:
  Intentional Object Derivation and Discrimination

Historical machine antecedent:
  Structural Flow Universal Machine Kernel v0.7 — clean Lean pass twice.

Human questions
---------------
1. What is this object's structural job?
2. What is its weakest honest shape?
3. What capacity disappears if it fails?

Operating rule
--------------
All three answers concern:
* the same candidate;
* at the same structural level;
* within the same declared scope.

The proposed weakest shape must perform the stated job.
Failure of that shape must remove the stated capacity at the declared
candidate/level/scope.

After the three answers are coherent, the method separately adjudicates:
* adjacent-object absorption;
* false substitutes;
* level shift;
* scope shift;
* internal inflation;
* whether the candidate is needed at all.

Passing/completing the +3 Sieve does NOT establish object closure.

Machine strategy
----------------
Do not encode the +3 by a three-constructor datatype.

Instead:
* fix one selected candidate / level / scope anchor;
* represent the selected job, selected shape, and selected capacity separately;
* state the lower-semantic object-answer endpoint independently;
* recover that endpoint from three machine-facing fidelities;
* build all three separating states;
* test minimal-shape non-uniqueness;
* test job and lost-capacity non-uniqueness;
* keep the six post-answer pressure tests distinct from the three questions;
* prove Sieve completion does not imply survival or object closure;
* quantify over arbitrary Q for a scope-bound no-fourth-answer-job result.

Closure remains conditional on the declared lower-semantic object-answer
language. A genuinely missing universal object-derivation job reopens the
endpoint rather than being excluded by constructor count.
-/

namespace StructuralFlow
namespace PlusThree

universe u

/--
One +3 object-derivation task.

The selected candidate / level / scope are single anchors.
The selected Job / Shape / Capacity are the proposed answers under test.

`Case` is open-ended: it may carry configuration, passage, history,
provenance, comparison, or domain evidence needed to pressure the proposed
capacity-loss relation.
-/
structure World
    (Candidate Level Scope Job Shape Capacity Case : Type u) where
  selectedCandidate : Candidate
  selectedLevel : Level
  selectedScope : Scope

  selectedJob : Job
  selectedShape : Shape
  selectedCapacity : Capacity

  /- Q1 lower semantics. -/
  structuralJob : Candidate → Level → Scope → Job → Prop

  /- Q2 lower semantics. -/
  honestShape : Candidate → Level → Scope → Shape → Prop
  performs : Shape → Job → Prop
  strictlyThinner : Shape → Shape → Prop

  /- Q3 lower semantics. -/
  caseInScope : Candidate → Level → Scope → Case → Prop
  shapeHolds : Shape → Case → Prop
  failurePassage : Case → Case → Prop
  shapeFails : Shape → Case → Prop
  capacityAvailable : Capacity → Case → Prop

  /- Post-answer discrimination pressure. -/
  adjacentAbsorptionTested : Prop
  falseSubstituteTested : Prop
  levelShiftTested : Prop
  scopeShiftTested : Prop
  internalInflationTested : Prop
  neededAtAllTested : Prop

  /- Outcome probes. The sieve does not determine these by fiat. -/
  candidateSurvives : Prop
  objectClosed : Prop

/-- Q1: the proposed job is genuinely a structural job of the anchored candidate. -/
def JobFidelity
    {Candidate Level Scope Job Shape Capacity Case : Type u}
    (w : World Candidate Level Scope Job Shape Capacity Case) : Prop :=
  w.structuralJob
    w.selectedCandidate w.selectedLevel w.selectedScope w.selectedJob

/--
Minimality of a proposed shape for the selected job.

"Weakest" means minimal, not globally least and not unique:
there is no strictly thinner honest shape for the same anchored candidate that
can still perform the selected job.
-/
def MinimalHonestShapeAt
    {Candidate Level Scope Job Shape Capacity Case : Type u}
    (w : World Candidate Level Scope Job Shape Capacity Case)
    (s : Shape) : Prop :=
  w.honestShape
      w.selectedCandidate w.selectedLevel w.selectedScope s
  ∧ w.performs s w.selectedJob
  ∧ ∀ thinner,
      w.strictlyThinner thinner s →
      ¬ (
        w.honestShape
          w.selectedCandidate w.selectedLevel w.selectedScope thinner
        ∧ w.performs thinner w.selectedJob
      )

/-- Q2: the selected shape is a weakest honest shape for the selected job. -/
def ShapeFidelity
    {Candidate Level Scope Job Shape Capacity Case : Type u}
    (w : World Candidate Level Scope Job Shape Capacity Case) : Prop :=
  MinimalHonestShapeAt w w.selectedShape

/--
Q3: the selected capacity has an admitted same-scope loss passage tied to
failure of the selected shape.

The witness requires:
* a before-case and after-case at the same anchored candidate / level / scope;
* the selected shape holds before;
* the selected capacity is available before;
* an admitted failure passage connects before to after;
* the selected shape fails after;
* the selected capacity is absent after.

This earns a plausible candidate loss-link without claiming:
* every possible failure of the shape loses this capacity;
* the shape will fail in the realized future;
* the selected capacity is the only capacity that may be lost;
* Failure-Theorem exhaustion or object closure.
-/
def CapacityLossFidelity
    {Candidate Level Scope Job Shape Capacity Case : Type u}
    (w : World Candidate Level Scope Job Shape Capacity Case) : Prop :=
  ∃ before after,
    w.caseInScope
      w.selectedCandidate w.selectedLevel w.selectedScope before
    ∧
    w.caseInScope
      w.selectedCandidate w.selectedLevel w.selectedScope after
    ∧
    w.shapeHolds w.selectedShape before
    ∧
    w.capacityAvailable w.selectedCapacity before
    ∧
    w.failurePassage before after
    ∧
    w.shapeFails w.selectedShape after
    ∧
    ¬ w.capacityAvailable w.selectedCapacity after

/--
Independent lower-semantic endpoint for the three +3 answers.

This endpoint is not defined by naming JobFidelity / ShapeFidelity /
CapacityLossFidelity.
-/
def ObjectAnswerEndpoint
    {Candidate Level Scope Job Shape Capacity Case : Type u}
    (w : World Candidate Level Scope Job Shape Capacity Case) : Prop :=
  w.structuralJob
      w.selectedCandidate w.selectedLevel w.selectedScope w.selectedJob
  ∧
  w.honestShape
      w.selectedCandidate w.selectedLevel w.selectedScope w.selectedShape
  ∧
  w.performs w.selectedShape w.selectedJob
  ∧
  (∀ thinner,
      w.strictlyThinner thinner w.selectedShape →
      ¬ (
        w.honestShape
          w.selectedCandidate w.selectedLevel w.selectedScope thinner
        ∧ w.performs thinner w.selectedJob
      ))
  ∧
  (∃ before after,
      w.caseInScope
        w.selectedCandidate w.selectedLevel w.selectedScope before
      ∧
      w.caseInScope
        w.selectedCandidate w.selectedLevel w.selectedScope after
      ∧
      w.shapeHolds w.selectedShape before
      ∧
      w.capacityAvailable w.selectedCapacity before
      ∧
      w.failurePassage before after
      ∧
      w.shapeFails w.selectedShape after
      ∧
      ¬ w.capacityAvailable w.selectedCapacity after)

/--
The three proposed answers exactly recover the independently stated
lower-semantic object-answer endpoint.
-/
theorem object_answer_endpoint_iff_plus_three
    {Candidate Level Scope Job Shape Capacity Case : Type u}
    (w : World Candidate Level Scope Job Shape Capacity Case) :
    ObjectAnswerEndpoint w ↔
      JobFidelity w ∧ ShapeFidelity w ∧ CapacityLossFidelity w := by
  constructor
  · intro h
    rcases h with
      ⟨hJob, hHonest, hPerforms, hMinimal, hLoss⟩
    exact
      ⟨hJob,
       ⟨hHonest, hPerforms, hMinimal⟩,
       hLoss⟩
  · intro h
    rcases h with
      ⟨hJob,
       ⟨hHonest, hPerforms, hMinimal⟩,
       hLoss⟩
    exact
      ⟨hJob, hHonest, hPerforms, hMinimal, hLoss⟩

/--
All six source-card discrimination pressures have been adjudicated.

No truth value about the candidate is inferred merely from completing them.
-/
def PressureAdjudicated
    {Candidate Level Scope Job Shape Capacity Case : Type u}
    (w : World Candidate Level Scope Job Shape Capacity Case) : Prop :=
  w.adjacentAbsorptionTested
  ∧ w.falseSubstituteTested
  ∧ w.levelShiftTested
  ∧ w.scopeShiftTested
  ∧ w.internalInflationTested
  ∧ w.neededAtAllTested

/-- Full +3 method completion. This is not object closure. -/
def SieveComplete
    {Candidate Level Scope Job Shape Capacity Case : Type u}
    (w : World Candidate Level Scope Job Shape Capacity Case) : Prop :=
  ObjectAnswerEndpoint w ∧ PressureAdjudicated w

/-! --------------------------------------------------------------------------
Finite witness vocabulary
---------------------------------------------------------------------------- -/

inductive DemoCandidate
  | candidate
  deriving DecidableEq

inductive DemoLevel
  | level
  deriving DecidableEq

inductive DemoScope
  | scope
  deriving DecidableEq

inductive DemoJob
  | jobA
  | jobB
  deriving DecidableEq

inductive DemoShape
  | weak
  | thin
  | alternate
  deriving DecidableEq

inductive DemoCapacity
  | capA
  | capB
  deriving DecidableEq

inductive DemoCase
  | baseline
  | failure
  deriving DecidableEq

abbrev DemoWorld :=
  World DemoCandidate DemoLevel DemoScope
    DemoJob DemoShape DemoCapacity DemoCase

def demoJob : DemoCandidate → DemoLevel → DemoScope → DemoJob → Prop
  | .candidate, .level, .scope, .jobA => True
  | _, _, _, _ => False

def demoHonestShape :
    DemoCandidate → DemoLevel → DemoScope → DemoShape → Prop
  | .candidate, .level, .scope, .weak => True
  | _, _, _, _ => False

def demoPerforms : DemoShape → DemoJob → Prop
  | .weak, .jobA => True
  | _, _ => False

def demoThinner : DemoShape → DemoShape → Prop
  | .thin, .weak => True
  | _, _ => False

def demoCaseInScope :
    DemoCandidate → DemoLevel → DemoScope → DemoCase → Prop
  | .candidate, .level, .scope, _ => True

def demoShapeHolds : DemoShape → DemoCase → Prop
  | .weak, .baseline => True
  | _, _ => False

def demoFailurePassage : DemoCase → DemoCase → Prop
  | .baseline, .failure => True
  | _, _ => False

def demoShapeFails : DemoShape → DemoCase → Prop
  | .weak, .failure => True
  | _, _ => False

def demoCapacityAvailable : DemoCapacity → DemoCase → Prop
  | .capA, .baseline => True
  | _, _ => False

/-- Full coherent +3 answer witness with all pressure tests adjudicated. -/
def sieveSuccess : DemoWorld where
  selectedCandidate := .candidate
  selectedLevel := .level
  selectedScope := .scope
  selectedJob := .jobA
  selectedShape := .weak
  selectedCapacity := .capA

  structuralJob := demoJob
  honestShape := demoHonestShape
  performs := demoPerforms
  strictlyThinner := demoThinner

  caseInScope := demoCaseInScope
  shapeHolds := demoShapeHolds
  failurePassage := demoFailurePassage
  shapeFails := demoShapeFails
  capacityAvailable := demoCapacityAvailable

  adjacentAbsorptionTested := True
  falseSubstituteTested := True
  levelShiftTested := True
  scopeShiftTested := True
  internalInflationTested := True
  neededAtAllTested := True

  candidateSurvives := True
  objectClosed := False

theorem sieveSuccess_job :
    JobFidelity sieveSuccess := by
  simp [JobFidelity, sieveSuccess, demoJob]

theorem sieveSuccess_shape :
    ShapeFidelity sieveSuccess := by
  constructor
  · simp [sieveSuccess, demoHonestShape]
  constructor
  · simp [sieveSuccess, demoPerforms]
  · intro s hThin hBad
    cases s <;>
      simp [sieveSuccess, demoThinner, demoHonestShape, demoPerforms]
        at hThin hBad

theorem sieveSuccess_capacity :
    CapacityLossFidelity sieveSuccess := by
  exact ⟨
    DemoCase.baseline,
    DemoCase.failure,
    by simp [sieveSuccess, demoCaseInScope],
    by simp [sieveSuccess, demoCaseInScope],
    by simp [sieveSuccess, demoShapeHolds],
    by simp [sieveSuccess, demoCapacityAvailable],
    by simp [sieveSuccess, demoFailurePassage],
    by simp [sieveSuccess, demoShapeFails],
    by simp [sieveSuccess, demoCapacityAvailable]
  ⟩

theorem sieveSuccess_answers :
    ObjectAnswerEndpoint sieveSuccess := by
  exact
    (object_answer_endpoint_iff_plus_three sieveSuccess).mpr
      ⟨sieveSuccess_job, sieveSuccess_shape, sieveSuccess_capacity⟩

theorem sieveSuccess_pressures :
    PressureAdjudicated sieveSuccess := by
  simp [PressureAdjudicated, sieveSuccess]

theorem sieveSuccess_complete :
    SieveComplete sieveSuccess := by
  exact ⟨sieveSuccess_answers, sieveSuccess_pressures⟩

/-! --------------------------------------------------------------------------
Three-way non-absorption
---------------------------------------------------------------------------- -/

/-- Shape + Capacity can remain coherent while the selected structural job fails. -/
def jobFailureWorld : DemoWorld where
  selectedCandidate := .candidate
  selectedLevel := .level
  selectedScope := .scope
  selectedJob := .jobA
  selectedShape := .weak
  selectedCapacity := .capA

  structuralJob := fun _ _ _ _ => False
  honestShape := demoHonestShape
  performs := demoPerforms
  strictlyThinner := demoThinner

  caseInScope := demoCaseInScope
  shapeHolds := demoShapeHolds
  failurePassage := demoFailurePassage
  shapeFails := demoShapeFails
  capacityAvailable := demoCapacityAvailable

  adjacentAbsorptionTested := True
  falseSubstituteTested := True
  levelShiftTested := True
  scopeShiftTested := True
  internalInflationTested := True
  neededAtAllTested := True

  candidateSurvives := False
  objectClosed := False

theorem shape_capacity_without_job :
    ShapeFidelity jobFailureWorld ∧
    CapacityLossFidelity jobFailureWorld ∧
    ¬ JobFidelity jobFailureWorld := by
  constructor
  · constructor
    · simp [jobFailureWorld, demoHonestShape]
    constructor
    · simp [jobFailureWorld, demoPerforms]
    · intro s hThin hBad
      cases s <;>
        simp [jobFailureWorld, demoThinner, demoHonestShape, demoPerforms]
          at hThin hBad
  constructor
  · exact ⟨
      DemoCase.baseline,
      DemoCase.failure,
      by simp [jobFailureWorld, demoCaseInScope],
      by simp [jobFailureWorld, demoCaseInScope],
      by simp [jobFailureWorld, demoShapeHolds],
      by simp [jobFailureWorld, demoCapacityAvailable],
      by simp [jobFailureWorld, demoFailurePassage],
      by simp [jobFailureWorld, demoShapeFails],
      by simp [jobFailureWorld, demoCapacityAvailable]
    ⟩
  · simp [JobFidelity, jobFailureWorld]

/--
Job + Capacity can hold while Shape Fidelity fails because a strictly thinner
honest shape performs the selected job.
-/
def shapeFailureWorld : DemoWorld where
  selectedCandidate := .candidate
  selectedLevel := .level
  selectedScope := .scope
  selectedJob := .jobA
  selectedShape := .weak
  selectedCapacity := .capA

  structuralJob := demoJob
  honestShape := fun c l sc s =>
    (c = .candidate ∧ l = .level ∧ sc = .scope)
    ∧ (s = .weak ∨ s = .thin)
  performs := fun s j =>
    (s = .weak ∨ s = .thin) ∧ j = .jobA
  strictlyThinner := demoThinner

  caseInScope := demoCaseInScope
  shapeHolds := demoShapeHolds
  failurePassage := demoFailurePassage
  shapeFails := demoShapeFails
  capacityAvailable := demoCapacityAvailable

  adjacentAbsorptionTested := True
  falseSubstituteTested := True
  levelShiftTested := True
  scopeShiftTested := True
  internalInflationTested := True
  neededAtAllTested := True

  candidateSurvives := False
  objectClosed := False

theorem job_capacity_without_shape :
    JobFidelity shapeFailureWorld ∧
    CapacityLossFidelity shapeFailureWorld ∧
    ¬ ShapeFidelity shapeFailureWorld := by
  constructor
  · simp [JobFidelity, shapeFailureWorld, demoJob]
  constructor
  · exact ⟨
      DemoCase.baseline,
      DemoCase.failure,
      by simp [shapeFailureWorld, demoCaseInScope],
      by simp [shapeFailureWorld, demoCaseInScope],
      by simp [shapeFailureWorld, demoShapeHolds],
      by simp [shapeFailureWorld, demoCapacityAvailable],
      by simp [shapeFailureWorld, demoFailurePassage],
      by simp [shapeFailureWorld, demoShapeFails],
      by simp [shapeFailureWorld, demoCapacityAvailable]
    ⟩
  · intro hShape
    have hMinimal := hShape.2.2
    have hNoThin :=
      hMinimal DemoShape.thin
        (by simp [shapeFailureWorld, demoThinner])
    apply hNoThin
    constructor
    · simp [shapeFailureWorld]
    · simp [shapeFailureWorld]

/--
Job + Shape can remain coherent while the selected capacity fails the loss-link:
the capacity remains available in the admitted selected-shape failure case.
-/
def capacityFailureWorld : DemoWorld where
  selectedCandidate := .candidate
  selectedLevel := .level
  selectedScope := .scope
  selectedJob := .jobA
  selectedShape := .weak
  selectedCapacity := .capA

  structuralJob := demoJob
  honestShape := demoHonestShape
  performs := demoPerforms
  strictlyThinner := demoThinner

  caseInScope := demoCaseInScope
  shapeHolds := demoShapeHolds
  failurePassage := demoFailurePassage
  shapeFails := demoShapeFails
  capacityAvailable := fun cap _ => cap = .capA

  adjacentAbsorptionTested := True
  falseSubstituteTested := True
  levelShiftTested := True
  scopeShiftTested := True
  internalInflationTested := True
  neededAtAllTested := True

  candidateSurvives := False
  objectClosed := False

theorem job_shape_without_capacity :
    JobFidelity capacityFailureWorld ∧
    ShapeFidelity capacityFailureWorld ∧
    ¬ CapacityLossFidelity capacityFailureWorld := by
  constructor
  · simp [JobFidelity, capacityFailureWorld, demoJob]
  constructor
  · constructor
    · simp [capacityFailureWorld, demoHonestShape]
    constructor
    · simp [capacityFailureWorld, demoPerforms]
    · intro s hThin hBad
      cases s <;>
        simp [capacityFailureWorld, demoThinner,
          demoHonestShape, demoPerforms] at hThin hBad
  · intro hLoss
    rcases hLoss with
      ⟨before, after, _hBeforeScope, _hAfterScope,
       _hShapeBefore, _hAvailableBefore, _hPassage,
       _hFailsAfter, hNotAvailableAfter⟩
    have hAvailableAfter :
        capacityFailureWorld.capacityAvailable DemoCapacity.capA after := by
      simp [capacityFailureWorld]
    exact hNotAvailableAfter hAvailableAfter

theorem plus_three_are_nonabsorptive :
    (∃ w : DemoWorld,
      ShapeFidelity w ∧ CapacityLossFidelity w ∧ ¬ JobFidelity w)
    ∧
    (∃ w : DemoWorld,
      JobFidelity w ∧ CapacityLossFidelity w ∧ ¬ ShapeFidelity w)
    ∧
    (∃ w : DemoWorld,
      JobFidelity w ∧ ShapeFidelity w ∧ ¬ CapacityLossFidelity w) := by
  exact ⟨
    ⟨jobFailureWorld, shape_capacity_without_job⟩,
    ⟨shapeFailureWorld, job_capacity_without_shape⟩,
    ⟨capacityFailureWorld, job_shape_without_capacity⟩
  ⟩

/-! --------------------------------------------------------------------------
Anti-overclaim safeguards
---------------------------------------------------------------------------- -/

/-- Job Fidelity does not claim the candidate has exactly one structural job. -/
def UniqueStructuralJob
    {Candidate Level Scope Job Shape Capacity Case : Type u}
    (w : World Candidate Level Scope Job Shape Capacity Case) : Prop :=
  ∃ j,
    w.structuralJob
      w.selectedCandidate w.selectedLevel w.selectedScope j
    ∧
    ∀ j',
      w.structuralJob
        w.selectedCandidate w.selectedLevel w.selectedScope j' →
      j' = j

def multipleJobWorld : DemoWorld where
  selectedCandidate := .candidate
  selectedLevel := .level
  selectedScope := .scope
  selectedJob := .jobA
  selectedShape := .weak
  selectedCapacity := .capA

  structuralJob := fun c l sc _ =>
    c = .candidate ∧ l = .level ∧ sc = .scope
  honestShape := demoHonestShape
  performs := demoPerforms
  strictlyThinner := demoThinner

  caseInScope := demoCaseInScope
  shapeHolds := demoShapeHolds
  failurePassage := demoFailurePassage
  shapeFails := demoShapeFails
  capacityAvailable := demoCapacityAvailable

  adjacentAbsorptionTested := True
  falseSubstituteTested := True
  levelShiftTested := True
  scopeShiftTested := True
  internalInflationTested := True
  neededAtAllTested := True

  candidateSurvives := True
  objectClosed := False

theorem job_fidelity_does_not_entail_unique_job :
    JobFidelity multipleJobWorld ∧
    ¬ UniqueStructuralJob multipleJobWorld := by
  constructor
  · simp [JobFidelity, multipleJobWorld]
  · intro hUnique
    rcases hUnique with ⟨j, _hj, hOnly⟩
    have hA :
        multipleJobWorld.structuralJob
          DemoCandidate.candidate DemoLevel.level DemoScope.scope
          DemoJob.jobA := by
      simp [multipleJobWorld]
    have hB :
        multipleJobWorld.structuralJob
          DemoCandidate.candidate DemoLevel.level DemoScope.scope
          DemoJob.jobB := by
      simp [multipleJobWorld]
    have hAEq := hOnly DemoJob.jobA hA
    have hBEq := hOnly DemoJob.jobB hB
    have hImpossible : DemoJob.jobA = DemoJob.jobB :=
      hAEq.trans hBEq.symm
    cases hImpossible

/--
Shape Fidelity establishes a minimal honest shape, not a uniquely minimal one.
-/
def UniqueMinimalHonestShape
    {Candidate Level Scope Job Shape Capacity Case : Type u}
    (w : World Candidate Level Scope Job Shape Capacity Case) : Prop :=
  ∃ s,
    MinimalHonestShapeAt w s
    ∧ ∀ s', MinimalHonestShapeAt w s' → s' = s

def multipleMinimalShapeWorld : DemoWorld where
  selectedCandidate := .candidate
  selectedLevel := .level
  selectedScope := .scope
  selectedJob := .jobA
  selectedShape := .weak
  selectedCapacity := .capA

  structuralJob := demoJob
  honestShape := fun c l sc s =>
    c = .candidate ∧ l = .level ∧ sc = .scope
    ∧ (s = .weak ∨ s = .alternate)
  performs := fun s j =>
    (s = .weak ∨ s = .alternate) ∧ j = .jobA
  strictlyThinner := fun _ _ => False

  caseInScope := demoCaseInScope
  shapeHolds := demoShapeHolds
  failurePassage := demoFailurePassage
  shapeFails := demoShapeFails
  capacityAvailable := demoCapacityAvailable

  adjacentAbsorptionTested := True
  falseSubstituteTested := True
  levelShiftTested := True
  scopeShiftTested := True
  internalInflationTested := True
  neededAtAllTested := True

  candidateSurvives := True
  objectClosed := False

theorem multipleMinimalShape_has_shape_fidelity :
    ShapeFidelity multipleMinimalShapeWorld := by
  constructor
  · simp [multipleMinimalShapeWorld]
  constructor
  · simp [multipleMinimalShapeWorld]
  · intro thinner hThin
    simp [multipleMinimalShapeWorld] at hThin

theorem shape_fidelity_does_not_entail_unique_minimum :
    ShapeFidelity multipleMinimalShapeWorld ∧
    ¬ UniqueMinimalHonestShape multipleMinimalShapeWorld := by
  constructor
  · exact multipleMinimalShape_has_shape_fidelity
  · intro hUnique
    rcases hUnique with ⟨s, _hs, hOnly⟩
    have hWeak : MinimalHonestShapeAt multipleMinimalShapeWorld DemoShape.weak := by
      constructor
      · simp [multipleMinimalShapeWorld]
      constructor
      · simp [multipleMinimalShapeWorld]
      · intro thinner hThin
        simp [multipleMinimalShapeWorld] at hThin
    have hAlt :
        MinimalHonestShapeAt multipleMinimalShapeWorld DemoShape.alternate := by
      constructor
      · simp [multipleMinimalShapeWorld]
      constructor
      · simp [multipleMinimalShapeWorld]
      · intro thinner hThin
        simp [multipleMinimalShapeWorld] at hThin
    have hWeakEq := hOnly DemoShape.weak hWeak
    have hAltEq := hOnly DemoShape.alternate hAlt
    have hImpossible : DemoShape.weak = DemoShape.alternate :=
      hWeakEq.trans hAltEq.symm
    cases hImpossible

/--
A capacity is loss-linked to the selected shape when there is an admitted
same-scope passage in which the shape holds and the capacity is available
before, then the shape fails and the capacity is absent after.

This predicate permits more than one capacity to be loss-linked to the same
selected shape.
-/
def LossLinkedCapacity
    {Candidate Level Scope Job Shape Capacity Case : Type u}
    (w : World Candidate Level Scope Job Shape Capacity Case)
    (cap : Capacity) : Prop :=
  ∃ before after,
    w.caseInScope
      w.selectedCandidate w.selectedLevel w.selectedScope before
    ∧
    w.caseInScope
      w.selectedCandidate w.selectedLevel w.selectedScope after
    ∧
    w.shapeHolds w.selectedShape before
    ∧
    w.capacityAvailable cap before
    ∧
    w.failurePassage before after
    ∧
    w.shapeFails w.selectedShape after
    ∧
    ¬ w.capacityAvailable cap after

def UniqueLossLinkedCapacity
    {Candidate Level Scope Job Shape Capacity Case : Type u}
    (w : World Candidate Level Scope Job Shape Capacity Case) : Prop :=
  ∃ cap,
    LossLinkedCapacity w cap
    ∧ ∀ cap', LossLinkedCapacity w cap' → cap' = cap

def multipleCapacityWorld : DemoWorld where
  selectedCandidate := .candidate
  selectedLevel := .level
  selectedScope := .scope
  selectedJob := .jobA
  selectedShape := .weak
  selectedCapacity := .capA

  structuralJob := demoJob
  honestShape := demoHonestShape
  performs := demoPerforms
  strictlyThinner := demoThinner

  caseInScope := demoCaseInScope
  shapeHolds := demoShapeHolds
  failurePassage := demoFailurePassage
  shapeFails := demoShapeFails
  capacityAvailable := fun cap x =>
    x = .baseline ∧ (cap = .capA ∨ cap = .capB)

  adjacentAbsorptionTested := True
  falseSubstituteTested := True
  levelShiftTested := True
  scopeShiftTested := True
  internalInflationTested := True
  neededAtAllTested := True

  candidateSurvives := True
  objectClosed := False

theorem multipleCapacity_has_selected_capacity_loss :
    CapacityLossFidelity multipleCapacityWorld := by
  exact ⟨
    DemoCase.baseline,
    DemoCase.failure,
    by simp [multipleCapacityWorld, demoCaseInScope],
    by simp [multipleCapacityWorld, demoCaseInScope],
    by simp [multipleCapacityWorld, demoShapeHolds],
    by simp [multipleCapacityWorld],
    by simp [multipleCapacityWorld, demoFailurePassage],
    by simp [multipleCapacityWorld, demoShapeFails],
    by simp [multipleCapacityWorld]
  ⟩

theorem capA_loss_linked :
    LossLinkedCapacity multipleCapacityWorld DemoCapacity.capA := by
  exact ⟨
    DemoCase.baseline,
    DemoCase.failure,
    by simp [multipleCapacityWorld, demoCaseInScope],
    by simp [multipleCapacityWorld, demoCaseInScope],
    by simp [multipleCapacityWorld, demoShapeHolds],
    by simp [multipleCapacityWorld],
    by simp [multipleCapacityWorld, demoFailurePassage],
    by simp [multipleCapacityWorld, demoShapeFails],
    by simp [multipleCapacityWorld]
  ⟩

theorem capB_loss_linked :
    LossLinkedCapacity multipleCapacityWorld DemoCapacity.capB := by
  exact ⟨
    DemoCase.baseline,
    DemoCase.failure,
    by simp [multipleCapacityWorld, demoCaseInScope],
    by simp [multipleCapacityWorld, demoCaseInScope],
    by simp [multipleCapacityWorld, demoShapeHolds],
    by simp [multipleCapacityWorld],
    by simp [multipleCapacityWorld, demoFailurePassage],
    by simp [multipleCapacityWorld, demoShapeFails],
    by simp [multipleCapacityWorld]
  ⟩

theorem capacity_loss_fidelity_does_not_entail_unique_lost_capacity :
    CapacityLossFidelity multipleCapacityWorld
    ∧ ¬ UniqueLossLinkedCapacity multipleCapacityWorld := by
  constructor
  · exact multipleCapacity_has_selected_capacity_loss
  · intro hUnique
    rcases hUnique with ⟨cap, _hCap, hOnly⟩
    have hAeq : DemoCapacity.capA = cap :=
      hOnly DemoCapacity.capA capA_loss_linked
    have hBeq : DemoCapacity.capB = cap :=
      hOnly DemoCapacity.capB capB_loss_linked
    have hImpossible : DemoCapacity.capA = DemoCapacity.capB :=
      hAeq.trans hBeq.symm
    cases hImpossible

/--
Capacity-loss fidelity does not imply that the selected shape will actually
fail in the realized future.
-/
def WillFail
    {Candidate Level Scope Job Shape Capacity Case : Type u}
    (_w : World Candidate Level Scope Job Shape Capacity Case) : Prop :=
  False

theorem capacity_loss_fidelity_does_not_entail_future_failure :
    CapacityLossFidelity sieveSuccess ∧ ¬ WillFail sieveSuccess := by
  exact ⟨sieveSuccess_capacity, by simp [WillFail]⟩

/-! --------------------------------------------------------------------------
Pressure layer and closure boundary
---------------------------------------------------------------------------- -/

/--
A fully coherent +3 answer package plus all six adjudicated pressure tests may
still yield non-survival and non-closure.
-/
def rejectedButCompleteWorld : DemoWorld where
  selectedCandidate := .candidate
  selectedLevel := .level
  selectedScope := .scope
  selectedJob := .jobA
  selectedShape := .weak
  selectedCapacity := .capA

  structuralJob := demoJob
  honestShape := demoHonestShape
  performs := demoPerforms
  strictlyThinner := demoThinner

  caseInScope := demoCaseInScope
  shapeHolds := demoShapeHolds
  failurePassage := demoFailurePassage
  shapeFails := demoShapeFails
  capacityAvailable := demoCapacityAvailable

  adjacentAbsorptionTested := True
  falseSubstituteTested := True
  levelShiftTested := True
  scopeShiftTested := True
  internalInflationTested := True
  neededAtAllTested := True

  candidateSurvives := False
  objectClosed := False

theorem rejectedButComplete_answers :
    ObjectAnswerEndpoint rejectedButCompleteWorld := by
  apply (object_answer_endpoint_iff_plus_three rejectedButCompleteWorld).mpr
  constructor
  · simp [JobFidelity, rejectedButCompleteWorld, demoJob]
  constructor
  · constructor
    · simp [rejectedButCompleteWorld, demoHonestShape]
    constructor
    · simp [rejectedButCompleteWorld, demoPerforms]
    · intro s hThin hBad
      cases s <;>
        simp [rejectedButCompleteWorld, demoThinner,
          demoHonestShape, demoPerforms] at hThin hBad
  · exact ⟨
      DemoCase.baseline,
      DemoCase.failure,
      by simp [rejectedButCompleteWorld, demoCaseInScope],
      by simp [rejectedButCompleteWorld, demoCaseInScope],
      by simp [rejectedButCompleteWorld, demoShapeHolds],
      by simp [rejectedButCompleteWorld, demoCapacityAvailable],
      by simp [rejectedButCompleteWorld, demoFailurePassage],
      by simp [rejectedButCompleteWorld, demoShapeFails],
      by simp [rejectedButCompleteWorld, demoCapacityAvailable]
    ⟩

theorem rejectedButComplete_pressures :
    PressureAdjudicated rejectedButCompleteWorld := by
  simp [PressureAdjudicated, rejectedButCompleteWorld]

theorem sieve_completion_does_not_entail_survival_or_closure :
    ∃ w : DemoWorld,
      SieveComplete w ∧ ¬ w.candidateSurvives ∧ ¬ w.objectClosed := by
  exact ⟨rejectedButCompleteWorld,
    ⟨rejectedButComplete_answers, rejectedButComplete_pressures⟩,
    by simp [rejectedButCompleteWorld],
    by simp [rejectedButCompleteWorld]⟩

/-! --------------------------------------------------------------------------
Declared-scope no-fourth answer-job closure
---------------------------------------------------------------------------- -/

/--
An arbitrary Q is universal for the three-answer derivation endpoint when every
world satisfying the independently stated endpoint also satisfies Q.
-/
def UniversalObjectAnswerRequirement
    {Candidate Level Scope Job Shape Capacity Case : Type u}
    (Q : World Candidate Level Scope Job Shape Capacity Case → Prop) : Prop :=
  ∀ w, ObjectAnswerEndpoint w → Q w

/--
Q is independent of the +3 answer core if all three answer fidelities can hold
while Q fails.
-/
def IndependentOfPlusThreeAnswers
    {Candidate Level Scope Job Shape Capacity Case : Type u}
    (Q : World Candidate Level Scope Job Shape Capacity Case → Prop) : Prop :=
  ∃ w,
    JobFidelity w ∧
    ShapeFidelity w ∧
    CapacityLossFidelity w ∧
    ¬ Q w

/--
No arbitrary requirement can be both:
* universally necessary for the independently stated three-answer endpoint;
  and
* independent of Job / Shape / Capacity-Loss Fidelity.

This is arbitrary-Q closure, not constructor counting.
-/
theorem no_fourth_universal_answer_requirement_independent_of_plus_three
    {Candidate Level Scope Job Shape Capacity Case : Type u}
    (Q : World Candidate Level Scope Job Shape Capacity Case → Prop)
    (hUniversal : UniversalObjectAnswerRequirement Q) :
    ¬ IndependentOfPlusThreeAnswers Q := by
  intro hIndependent
  rcases hIndependent with
    ⟨w, hJob, hShape, hCapacity, hNotQ⟩
  have hEndpoint : ObjectAnswerEndpoint w :=
    (object_answer_endpoint_iff_plus_three w).mpr
      ⟨hJob, hShape, hCapacity⟩
  exact hNotQ (hUniversal w hEndpoint)

theorem no_fourth_independent_universal_object_answer_job
    {Candidate Level Scope Job Shape Capacity Case : Type u} :
    ¬ ∃ Q : World Candidate Level Scope Job Shape Capacity Case → Prop,
      UniversalObjectAnswerRequirement Q
      ∧ IndependentOfPlusThreeAnswers Q := by
  intro h
  rcases h with ⟨Q, hUniversal, hIndependent⟩
  exact
    (no_fourth_universal_answer_requirement_independent_of_plus_three
      Q hUniversal) hIndependent

/--
Consolidated first +3 machine checkpoint.
-/
theorem plus_three_machine_checkpoint :
    SieveComplete sieveSuccess
    ∧
    (∃ w : DemoWorld,
      ShapeFidelity w ∧ CapacityLossFidelity w ∧ ¬ JobFidelity w)
    ∧
    (∃ w : DemoWorld,
      JobFidelity w ∧ CapacityLossFidelity w ∧ ¬ ShapeFidelity w)
    ∧
    (∃ w : DemoWorld,
      JobFidelity w ∧ ShapeFidelity w ∧ ¬ CapacityLossFidelity w)
    ∧
    (∃ w : DemoWorld,
      CapacityLossFidelity w ∧ ¬ UniqueLossLinkedCapacity w)
    ∧
    (∃ w : DemoWorld,
      SieveComplete w ∧ ¬ w.candidateSurvives ∧ ¬ w.objectClosed) := by
  constructor
  · exact sieveSuccess_complete
  constructor
  · exact ⟨jobFailureWorld, shape_capacity_without_job⟩
  constructor
  · exact ⟨shapeFailureWorld, job_capacity_without_shape⟩
  constructor
  · exact ⟨capacityFailureWorld, job_shape_without_capacity⟩
  constructor
  · exact ⟨multipleCapacityWorld,
      capacity_loss_fidelity_does_not_entail_unique_lost_capacity⟩
  · exact sieve_completion_does_not_entail_survival_or_closure

end PlusThree
end StructuralFlow


/-!
===============================================================================
UNIVERSAL DENSITY — PUBLIC THEOREM MODULE
Historical machine provenance: promoted from clean Universal Density Kernel Attempt v0.5
===============================================================================

Purpose
-------
Public machine formalization of universal Density at the declared encoded scope.

This module formalizes only the universal object and its failure-side
discrimination package.

It intentionally parks:
* cross-domain translation;
* Coherence;
* equationhood;
* domain-specific Density mechanisms.

Governing semantic statement for this module
--------------------------------------------
Universal Density is non-empty QUALIFYING common standing interaction support
among plural incorporated interaction-conditioned distinctions.

A qualifying common witness is:
* in the declared interaction surface;
* standing-supported by every relevant member;
* joint-distinction preserving;
* differentially conditionable by at least two distinct relevant members.

Density failure is independently stated as:
* the same member base survives;
* every relevant member retains individual standing support;
* no qualifying common witness remains.

The failure predicate is NOT defined as `not DensityHeld`.

Failure-shape articulation
--------------------------
Each failure case yields a canonical JOINT SUPPORT ROUTE projected from the
lower member-support semantics.

The projected route stops at Boundary because Density is standing support,
not an executed downstream traversal.

Every Density shape witness is therefore:
  Dissolution OR Shear OR Drift

and never:
  Echo OR Lock.

Echo / Lock remain valid downstream passage controls and may coexist with
prior standing Density.

No closure claim is made merely because this file exists.
-/

namespace StructuralFlow
namespace UniversalDensity

universe u

/--
Lower semantic world for universal Density.

`Established`, `Carries`, and `Discriminates` are inherited support-route
coordinates.  The two implication fields preserve the already-closed
Persistence / Boundary prerequisite order.

Nothing here says a candidate interaction actually occurs.
-/
structure World (Case Member Interaction : Type u) where
  relevant :
    Case → Member → Prop

  incorporated :
    Case → Member → Prop

  memberDistinguished :
    Case → Member → Prop

  interactionInScope :
    Case → Interaction → Prop

  established :
    Case → Member → Interaction → Prop

  carries :
    Case → Member → Interaction → Prop

  discriminates :
    Case → Member → Interaction → Prop

  carry_requires_establishment :
    ∀ x m i,
      carries x m i →
      established x m i

  discrimination_requires_carry :
    ∀ x m i,
      discriminates x m i →
      carries x m i

  /--
  Joint distinction at one proposed common interaction surface.

  This is stronger than saying the members remain distinguishable somewhere
  in the case.
  -/
  jointDistinction :
    Case → Interaction → Prop

  /--
  Domain-neutral relational witness:
  the distinct conditions carried by members `a` and `b` can differentially
  bear on / condition interaction `i`.

  This is intentionally relational.  Two members merely satisfying separate
  unary "can condition" predicates is not enough to earn differential
  conditioning.
  -/
  differentiallyConditions :
    Case → Member → Member → Interaction → Prop

/-- At least two distinct relevant members are present. -/
def Plural
    {Case Member Interaction : Type u}
    (w : World Case Member Interaction)
    (x : Case) : Prop :=
  ∃ a b,
    w.relevant x a ∧
    w.relevant x b ∧
    a ≠ b

/--
The retained same-level member base inherited by Density.
-/
def MemberBase
    {Case Member Interaction : Type u}
    (w : World Case Member Interaction)
    (x : Case) : Prop :=
  Plural w x ∧
  ∀ m,
    w.relevant x m →
    w.incorporated x m ∧
    w.memberDistinguished x m

/--
Standing support of one member toward one candidate interaction.

This is standing availability + discrimination in inherited support-route
coordinates.  It does not assert occurrence of the interaction.
-/
def MemberSupport
    {Case Member Interaction : Type u}
    (w : World Case Member Interaction)
    (x : Case)
    (m : Member)
    (i : Interaction) : Prop :=
  w.interactionInScope x i ∧
  w.carries x m i ∧
  w.discriminates x m i

/-- One relevant member retains at least one standing support relation. -/
def IndividualSupport
    {Case Member Interaction : Type u}
    (w : World Case Member Interaction)
    (x : Case)
    (m : Member) : Prop :=
  ∃ i, MemberSupport w x m i

/--
Raw common overlap.

Raw common overlap is intentionally weaker than Density.
-/
def CommonSupport
    {Case Member Interaction : Type u}
    (w : World Case Member Interaction)
    (x : Case)
    (i : Interaction) : Prop :=
  w.interactionInScope x i ∧
  ∀ m,
    w.relevant x m →
    MemberSupport w x m i

/--
At least two distinct relevant members can differentially bear on the proposed
common interaction.
-/
def DifferentialPair
    {Case Member Interaction : Type u}
    (w : World Case Member Interaction)
    (x : Case)
    (i : Interaction) : Prop :=
  ∃ a b,
    w.relevant x a ∧
    w.relevant x b ∧
    a ≠ b ∧
    w.differentiallyConditions x a b i

/--
Exact machine form of a qualifying common Density witness.
-/
def Qualifying
    {Case Member Interaction : Type u}
    (w : World Case Member Interaction)
    (x : Case)
    (i : Interaction) : Prop :=
  CommonSupport w x i ∧
  w.jointDistinction x i ∧
  DifferentialPair w x i

/--
Fixed same-level survivor surface for Density discrimination.

The member base survives and every relevant member retains individual standing
support.  Qualifying common support is deliberately NOT part of eligibility.
-/
def DensityEligible
    {Case Member Interaction : Type u}
    (w : World Case Member Interaction)
    (x : Case) : Prop :=
  MemberBase w x ∧
  ∀ m,
    w.relevant x m →
    IndividualSupport w x m

/--
Universal Density held condition.

The member base is present and at least one qualifying common witness exists.
-/
def DensityHeld
    {Case Member Interaction : Type u}
    (w : World Case Member Interaction)
    (x : Case) : Prop :=
  MemberBase w x ∧
  ∃ i, Qualifying w x i

/--
Universal Density failure predicate.

This is intentionally independent syntax.
It is NOT defined as `not DensityHeld`.
-/
def DensityFails
    {Case Member Interaction : Type u}
    (w : World Case Member Interaction)
    (x : Case) : Prop :=
  DensityEligible w x ∧
  ∀ i, ¬ Qualifying w x i

/--
A qualifying common witness gives individual standing support to every relevant
member.
-/
theorem qualifying_implies_individual_support
    {Case Member Interaction : Type u}
    (w : World Case Member Interaction)
    (x : Case)
    (i : Interaction)
    (hQ : Qualifying w x i) :
    ∀ m,
      w.relevant x m →
      IndividualSupport w x m := by
  intro m hRelevant
  exact
    ⟨i,
      hQ.1.2 m hRelevant⟩

/--
Density holding automatically lies on the fixed same-level Density
discrimination surface.
-/
theorem density_held_in_scope
    {Case Member Interaction : Type u}
    (w : World Case Member Interaction)
    (x : Case)
    (hHeld : DensityHeld w x) :
    DensityEligible w x := by
  rcases hHeld with ⟨hBase, i, hQ⟩
  refine ⟨hBase, ?_⟩
  exact qualifying_implies_individual_support w x i hQ

/--
Held Density and Density failure are disjoint.
-/
theorem density_held_and_failure_disjoint
    {Case Member Interaction : Type u}
    (w : World Case Member Interaction)
    (x : Case)
    (hHeld : DensityHeld w x) :
    ¬ DensityFails w x := by
  intro hFail
  rcases hHeld with ⟨_hBase, i, hQ⟩
  exact hFail.2 i hQ

/--
No remainder on the fixed survivor surface.

Because the failure predicate is independently stated as absence of qualifying
common support while the survivor surface remains, every eligible non-holding
case is a Density failure.
-/
theorem density_failure_exhaustive_on_surface
    {Case Member Interaction : Type u}
    (w : World Case Member Interaction)
    (x : Case)
    (hEligible : DensityEligible w x)
    (hNotHeld : ¬ DensityHeld w x) :
    DensityFails w x := by
  refine ⟨hEligible, ?_⟩
  intro i hQ
  apply hNotHeld
  exact ⟨hEligible.1, ⟨i, hQ⟩⟩

/--
Exact complement relation, but only AFTER fixing the Density survivor surface.
-/
theorem density_failure_iff_not_held_on_surface
    {Case Member Interaction : Type u}
    (w : World Case Member Interaction)
    (x : Case)
    (hEligible : DensityEligible w x) :
    DensityFails w x ↔ ¬ DensityHeld w x := by
  constructor
  · intro hFail hHeld
    exact density_held_and_failure_disjoint w x hHeld hFail
  · intro hNotHeld
    exact
      density_failure_exhaustive_on_surface
        w x hEligible hNotHeld

/--
Non-vacuity is an explicit earning burden for a universal Density theory.

The generic kernel does not invent held or failure cases.
-/
structure NonVacuous
    {Case Member Interaction : Type u}
    (w : World Case Member Interaction) : Prop where
  heldWitness :
    ∃ x,
      DensityEligible w x ∧
      DensityHeld w x

  failureWitness :
    ∃ x,
      DensityEligible w x ∧
      DensityFails w x

/-! --------------------------------------------------------------------------
Density +3 answer-core instantiation
---------------------------------------------------------------------------- -/

/--
Tags used only to place the universal Density object into the already-closed
generic +3 interface.

They are parameterized by `Case` only to live at the same universe as the
open-ended Density case language.
-/
inductive DensityCandidateTag (Case : Type u) : Type u where
  | universalDensity

inductive DensityLevelTag (Case : Type u) : Type u where
  | declaredLevel

inductive DensityScopeTag (Case : Type u) : Type u where
  | declaredScope

inductive DensityJobTag (Case : Type u) : Type u where
  | qualifyingCommonSupportJob

inductive DensityCapacityTag (Case : Type u) : Type u where
  | qualifyingCommonSupportCapacity

/--
Same relevant member identities across the before/after sides of an admitted
Density loss passage.

This is stronger than merely requiring each side to contain some plurality.
-/
def SameRelevantMembers
    {Case Member Interaction : Type u}
    (w : World Case Member Interaction)
    (before after : Case) : Prop :=
  ∀ m,
    w.relevant before m ↔
    w.relevant after m

/--
Upstream evidence for the +3 Q3 passage.

The passage is structural comparison evidence, not a prediction that such a
failure will occur in the realized future.
-/
structure DensityLossPassageEvidence
    {Case Member Interaction : Type u}
    (w : World Case Member Interaction) : Type u where
  before :
    Case

  after :
    Case

  sameRelevantMembers :
    SameRelevantMembers w before after

  beforeHeld :
    DensityHeld w before

  afterFails :
    DensityFails w after

/--
Semantic weakening order on candidate Density shapes.

`s` is strictly thinner than `t` when:
* every `t`-case is admitted by `s`; and
* at least one additional case is admitted by `s`.

Thus a thinner shape has fewer requirements and is extensionally broader.
-/
def DensityStrictlyThinner
    {Case : Type u}
    (s t : Case → Prop) : Prop :=
  (∀ x, t x → s x) ∧
  ∃ x, s x ∧ ¬ t x

/--
Density's +3 job is independently earned when the individual-support survivor
surface can exist without Density.

That separating state establishes a real structural contrast between:
* surviving individual support; and
* qualifying common support.
-/
def DensityStructuralJobEarned
    {Case Member Interaction : Type u}
    (w : World Case Member Interaction) : Prop :=
  ∃ x,
    DensityEligible w x ∧
    DensityFails w x

/--
An honest candidate Density shape must at least guarantee the inherited
same-object member base.

This prevents a purported "shape" from performing the Density job by changing
the object under discussion.
-/
def DensityHonestShape
    {Case Member Interaction : Type u}
    (w : World Case Member Interaction)
    (s : Case → Prop) : Prop :=
  ∀ x,
    s x →
    MemberBase w x

/--
A candidate shape performs Density's selected job when every case admitted by
that shape actually makes qualifying common support available.

Combined with `DensityHonestShape`, this reconstructs the exact held condition
without defining minimality by fiat.
-/
def DensityShapePerformsJob
    {Case Member Interaction : Type u}
    (w : World Case Member Interaction)
    (s : Case → Prop) : Prop :=
  ∀ x,
    s x →
    ∃ i, Qualifying w x i

/--
Generic +3 world for the universal Density answer core.

Important:
the six post-answer pressure fields are deliberately `False`.

This world is used only to machine-test:
* Job Fidelity;
* Shape Fidelity;
* Capacity-Loss Fidelity.

It does NOT smuggle human/domain pressure adjudication into Lean, and it does
not claim `SieveComplete`.
-/
def densityPlusThreeAnswerWorld
    {Case Member Interaction : Type u}
    (w : World Case Member Interaction) :
    PlusThree.World
      (DensityCandidateTag Case)
      (DensityLevelTag Case)
      (DensityScopeTag Case)
      (DensityJobTag Case)
      (Case → Prop)
      (DensityCapacityTag Case)
      Case where
  selectedCandidate :=
    .universalDensity

  selectedLevel :=
    .declaredLevel

  selectedScope :=
    .declaredScope

  selectedJob :=
    .qualifyingCommonSupportJob

  selectedShape :=
    DensityHeld w

  selectedCapacity :=
    .qualifyingCommonSupportCapacity

  structuralJob :=
    fun _candidate _level _scope _job =>
      DensityStructuralJobEarned w

  honestShape :=
    fun _candidate _level _scope s =>
      DensityHonestShape w s

  performs :=
    fun s _job =>
      DensityShapePerformsJob w s

  strictlyThinner :=
    DensityStrictlyThinner

  caseInScope :=
    fun _candidate _level _scope x =>
      MemberBase w x

  shapeHolds :=
    fun s x =>
      s x

  failurePassage :=
    fun before after =>
      SameRelevantMembers w before after
      ∧ DensityHeld w before
      ∧ DensityFails w after

  shapeFails :=
    fun s x =>
      ¬ s x

  capacityAvailable :=
    fun _capacity x =>
      ∃ i, Qualifying w x i

  adjacentAbsorptionTested :=
    False

  falseSubstituteTested :=
    False

  levelShiftTested :=
    False

  scopeShiftTested :=
    False

  internalInflationTested :=
    False

  neededAtAllTested :=
    False

  candidateSurvives :=
    False

  objectClosed :=
    False

/--
Q1 for universal Density.

A non-vacuous earned Density failure witness establishes the structural job:
individual support can survive while qualifying common support does not.
-/
theorem density_plus_three_job_fidelity
    {Case Member Interaction : Type u}
    (w : World Case Member Interaction)
    (nv : NonVacuous w) :
    PlusThree.JobFidelity
      (densityPlusThreeAnswerWorld w) := by
  exact nv.failureWitness

/--
Q2 for universal Density.

The selected shape is the exact Density held condition.

It is honest because it preserves the member base.
It performs the selected job because it guarantees a qualifying common witness.

No strictly thinner honest shape can still perform the same job:
a strict weakening supplies an admitted case outside DensityHeld, while honesty
plus performance would reconstruct DensityHeld for that same case.
-/
theorem density_plus_three_shape_fidelity
    {Case Member Interaction : Type u}
    (w : World Case Member Interaction) :
    PlusThree.ShapeFidelity
      (densityPlusThreeAnswerWorld w) := by
  constructor
  · intro x hHeld
    exact hHeld.1
  constructor
  · intro x hHeld
    exact hHeld.2
  · intro thinner hThinner hBad
    rcases hThinner.2 with
      ⟨x, hThinX, hNotHeldX⟩
    have hBase :
        MemberBase w x :=
      hBad.1 x hThinX
    have hQualifying :
        ∃ i, Qualifying w x i :=
      hBad.2 x hThinX
    exact
      hNotHeldX
        ⟨hBase, hQualifying⟩

/--
Q3 for universal Density.

An independently admitted same-member loss passage connects:
* a before-case where the selected Density shape holds and qualifying common
  support is available;
* an after-case where Density fails and qualifying common support is absent.
-/
theorem density_plus_three_capacity_loss_fidelity
    {Case Member Interaction : Type u}
    (w : World Case Member Interaction)
    (loss : DensityLossPassageEvidence w) :
    PlusThree.CapacityLossFidelity
      (densityPlusThreeAnswerWorld w) := by
  refine
    ⟨loss.before,
      loss.after,
      ?_,
      ?_,
      ?_,
      ?_,
      ?_,
      ?_,
      ?_⟩
  · exact loss.beforeHeld.1
  · exact loss.afterFails.1.1
  · exact loss.beforeHeld
  · exact loss.beforeHeld.2
  · exact
      ⟨loss.sameRelevantMembers,
        loss.beforeHeld,
        loss.afterFails⟩
  · intro hAfterHeld
    exact
      density_held_and_failure_disjoint
        w
        loss.after
        hAfterHeld
        loss.afterFails
  · intro hAfterCapacity
    rcases hAfterCapacity with ⟨i, hQ⟩
    exact loss.afterFails.2 i hQ

/--
Universal Density therefore satisfies the complete three-answer +3 endpoint
whenever:
* non-vacuity is earned; and
* one same-member Density loss passage is independently admitted.

This theorem closes the machine-facing +3 ANSWER CORE only.
The six source-card pressure adjudications remain deliberately outside this
world and are not machine-claimed here.
-/
theorem density_plus_three_answer_core
    {Case Member Interaction : Type u}
    (w : World Case Member Interaction)
    (nv : NonVacuous w)
    (loss : DensityLossPassageEvidence w) :
    PlusThree.JobFidelity (densityPlusThreeAnswerWorld w)
    ∧ PlusThree.ShapeFidelity (densityPlusThreeAnswerWorld w)
    ∧ PlusThree.CapacityLossFidelity (densityPlusThreeAnswerWorld w) := by
  exact
    ⟨density_plus_three_job_fidelity w nv,
      density_plus_three_shape_fidelity w,
      density_plus_three_capacity_loss_fidelity w loss⟩

/--
Independent endpoint form inherited from the generic +3 theorem.
-/
theorem density_object_answer_endpoint
    {Case Member Interaction : Type u}
    (w : World Case Member Interaction)
    (nv : NonVacuous w)
    (loss : DensityLossPassageEvidence w) :
    PlusThree.ObjectAnswerEndpoint
      (densityPlusThreeAnswerWorld w) := by
  apply
    (PlusThree.object_answer_endpoint_iff_plus_three
      (densityPlusThreeAnswerWorld w)).mpr
  exact density_plus_three_answer_core w nv loss

/--
Firewall:
the answer-core world does not claim that the six downstream +3 pressure
burdens have already been machine adjudicated.
-/
theorem density_answer_core_does_not_smuggle_pressure_completion
    {Case Member Interaction : Type u}
    (w : World Case Member Interaction) :
    ¬ PlusThree.PressureAdjudicated
        (densityPlusThreeAnswerWorld w) := by
  intro hPressure
  exact hPressure.1

/-! --------------------------------------------------------------------------
Canonical joint support route
---------------------------------------------------------------------------- -/

/--
All relevant members establish retained support toward one candidate
interaction.
-/
def JointEstablished
    {Case Member Interaction : Type u}
    (w : World Case Member Interaction)
    (x : Case)
    (i : Interaction) : Prop :=
  ∀ m,
    w.relevant x m →
    w.established x m i

/--
All relevant members carry retained support under the relevant load toward one
candidate interaction.
-/
def JointCarries
    {Case Member Interaction : Type u}
    (w : World Case Member Interaction)
    (x : Case)
    (i : Interaction) : Prop :=
  ∀ m,
    w.relevant x m →
    w.carries x m i

/--
Canonical foundational-shape projection for the standing common-support
burden.

The route intentionally stops at Boundary:
`cascadeInherits` and `authorizationIncorporates` are false.

This is an articulation witness, not literal realized history.
-/
def jointRoute
    {Case Member Interaction : Type u}
    (w : World Case Member Interaction)
    (x : Case)
    (i : Interaction) :
    FailureClosure.RouteSnapshot where
  produced :=
    w.interactionInScope x i

  persistenceEstablished :=
    JointEstablished w x i

  persistenceCarriesUnderLoad :=
    JointCarries w x i

  boundaryDiscriminates :=
    Qualifying w x i

  cascadeInherits :=
    False

  authorizationIncorporates :=
    False

/--
The projected joint support route is well-formed from inherited support-route
prerequisite order.
-/
theorem joint_route_wellFormed
    {Case Member Interaction : Type u}
    (w : World Case Member Interaction)
    (x : Case)
    (i : Interaction) :
    FailureClosure.WellFormedRoute (jointRoute w x i) := by
  refine
    { loadCarry_requires_establishment := ?_
      boundary_requires_loadCarry := ?_
      cascade_requires_boundary := ?_
      authorization_requires_cascade := ?_ }
  · intro hCarries m hRelevant
    exact
      w.carry_requires_establishment
        x m i
        (hCarries m hRelevant)
  · intro hQualifying m hRelevant
    exact
      (hQualifying.1.2 m hRelevant).2.1
  · intro hCascade
    simp [jointRoute] at hCascade
  · intro hAuthorization
    simp [jointRoute] at hAuthorization

/--
A non-decorative articulation witness.

The witness interaction:
* is already standing-supported by at least one surviving relevant member;
* is not qualifying for the plurality;
* is projected by the canonical joint support route.
-/
def DensityShapeWitness
    {Case Member Interaction : Type u}
    (w : World Case Member Interaction)
    (x : Case)
    (s : FailureClosure.RouteSnapshot) : Prop :=
  ∃ m i,
    DensityEligible w x ∧
    w.relevant x m ∧
    MemberSupport w x m i ∧
    ¬ Qualifying w x i ∧
    s = jointRoute w x i

theorem density_shape_witness_in_scope
    {Case Member Interaction : Type u}
    (w : World Case Member Interaction)
    (x : Case)
    (s : FailureClosure.RouteSnapshot)
    (hWitness : DensityShapeWitness w x s) :
    DensityEligible w x := by
  rcases hWitness with
    ⟨_m, _i, hEligible, _hRelevant, _hSupport, _hNotQ, _hs⟩
  exact hEligible

theorem density_shape_witness_wellFormed
    {Case Member Interaction : Type u}
    (w : World Case Member Interaction)
    (x : Case)
    (s : FailureClosure.RouteSnapshot)
    (hWitness : DensityShapeWitness w x s) :
    FailureClosure.WellFormedRoute s := by
  rcases hWitness with
    ⟨_m, i, _hEligible, _hRelevant, _hSupport, _hNotQ, rfl⟩
  exact joint_route_wellFormed w x i

theorem density_shape_witness_is_foundational_failure
    {Case Member Interaction : Type u}
    (w : World Case Member Interaction)
    (x : Case)
    (s : FailureClosure.RouteSnapshot)
    (hWitness : DensityShapeWitness w x s) :
    FailureClosure.FoundationalFailure s := by
  rcases hWitness with
    ⟨_m, i, _hEligible, _hRelevant, hSupport, _hNotQ, rfl⟩
  change
    w.interactionInScope x i ∧
    ¬ False
  exact ⟨hSupport.1, by simp⟩

/--
Every Density failure earns at least one canonical joint support route witness.

No arbitrary regime tag is supplied.
-/
theorem density_failure_has_shape_witness
    {Case Member Interaction : Type u}
    (w : World Case Member Interaction)
    (x : Case)
    (hFail : DensityFails w x) :
    ∃ s,
      DensityShapeWitness w x s := by
  rcases hFail.1.1.1 with
    ⟨a, b, hRelevantA, _hRelevantB, _hDistinct⟩
  rcases hFail.1.2 a hRelevantA with
    ⟨i, hSupport⟩
  have hNotQ : ¬ Qualifying w x i :=
    hFail.2 i
  exact
    ⟨jointRoute w x i,
      ⟨a, i,
        hFail.1,
        hRelevantA,
        hSupport,
        hNotQ,
        rfl⟩⟩

/--
Every Density articulation witness lies strictly in the standing-support
pre-Cascade part of the foundational failure space.

Exact result:
  Dissolution OR Shear OR Drift.
-/
theorem density_shape_witness_is_dissolution_shear_or_drift
    {Case Member Interaction : Type u}
    (w : World Case Member Interaction)
    (x : Case)
    (s : FailureClosure.RouteSnapshot)
    (hWitness : DensityShapeWitness w x s) :
    FailureClosure.Dissolution s ∨
    FailureClosure.Shear s ∨
    FailureClosure.Drift s := by
  rcases hWitness with
    ⟨_m, i, _hEligible, _hRelevant, hSupport, hNotQ, rfl⟩

  by_cases hEstablished : JointEstablished w x i
  · by_cases hCarries : JointCarries w x i
    · right
      right
      change
        w.interactionInScope x i ∧
        JointCarries w x i ∧
        ¬ Qualifying w x i
      exact ⟨hSupport.1, hCarries, hNotQ⟩
    · right
      left
      change
        w.interactionInScope x i ∧
        JointEstablished w x i ∧
        ¬ JointCarries w x i
      exact ⟨hSupport.1, hEstablished, hCarries⟩
  · left
    change
      w.interactionInScope x i ∧
      ¬ JointEstablished w x i
    exact ⟨hSupport.1, hEstablished⟩

/--
Density's own standing-support articulation witnesses are never Echo or Lock.
-/
theorem density_shape_witness_is_not_echo_or_lock
    {Case Member Interaction : Type u}
    (w : World Case Member Interaction)
    (x : Case)
    (s : FailureClosure.RouteSnapshot)
    (hWitness : DensityShapeWitness w x s) :
    ¬ FailureClosure.Echo s ∧
    ¬ FailureClosure.Lock s := by
  rcases hWitness with
    ⟨_m, i, _hEligible, _hRelevant, _hSupport, hNotQ, rfl⟩
  constructor
  · intro hEcho
    have hBoundary :
        Qualifying w x i := by
      exact hEcho.2.1
    exact hNotQ hBoundary
  · intro hLock
    have hCascade : False := by
      simpa [jointRoute] using hLock.2.1
    exact hCascade.elim

/--
The machine-visible third state from the prose audit:

raw common overlap survives,
but the interaction is not qualifying.

Its exact projected foundational shape is Boundary-side Drift.
-/
theorem raw_common_nonqualifying_is_drift
    {Case Member Interaction : Type u}
    (w : World Case Member Interaction)
    (x : Case)
    (i : Interaction)
    (hCommon : CommonSupport w x i)
    (hNotQ : ¬ Qualifying w x i) :
    FailureClosure.Drift (jointRoute w x i) := by
  change
    w.interactionInScope x i ∧
    JointCarries w x i ∧
    ¬ Qualifying w x i
  refine ⟨hCommon.1, ?_, hNotQ⟩
  intro m hRelevant
  exact
    (hCommon.2 m hRelevant).2.1

/-! --------------------------------------------------------------------------
Failure-Side Discrimination instantiation
---------------------------------------------------------------------------- -/

/--
Exact non-decorative regime articulation for universal Density.
-/
def densityRegimeArticulation
    {Case Member Interaction : Type u}
    (w : World Case Member Interaction) :
    FailureDiscrimination.RegimeArticulation
      (DensityEligible w)
      (DensityFails w) where
  shapeWitness :=
    DensityShapeWitness w

  witnessCaseInScope := by
    intro x s hWitness
    exact
      density_shape_witness_in_scope
        w x s hWitness

  witnessWellFormed := by
    intro x s hWitness
    exact
      density_shape_witness_wellFormed
        w x s hWitness

  witnessIsFoundationalFailureShape := by
    intro x s hWitness
    exact
      density_shape_witness_is_foundational_failure
        w x s hWitness

  matchedCaseHasShapeWitness := by
    intro x hFail
    exact
      density_failure_has_shape_witness
        w x hFail

/--
Once non-vacuity is independently earned, universal Density satisfies the
generic Failure-Side Discrimination `EarnedSignature` interface.
-/
def densityEarnedSignature
    {Case Member Interaction : Type u}
    (w : World Case Member Interaction)
    (nv : NonVacuous w) :
    FailureDiscrimination.EarnedSignature
      (DensityEligible w)
      (DensityHeld w)
      (DensityFails w) where
  heldInScope := by
    intro x hHeld
    exact density_held_in_scope w x hHeld

  matchInScope := by
    intro x hFail
    exact hFail.1

  disjoint := by
    intro x hHeld
    exact density_held_and_failure_disjoint w x hHeld

  exhaustive := by
    intro x hEligible hNotHeld
    exact
      density_failure_exhaustive_on_surface
        w x hEligible hNotHeld

  heldWitness :=
    nv.heldWitness

  failureWitness :=
    nv.failureWitness

  articulation :=
    densityRegimeArticulation w

/--
Generic Failure-Side complement theorem, now inherited by universal Density.
-/
theorem density_failure_class_iff_not_held_in_scope
    {Case Member Interaction : Type u}
    (w : World Case Member Interaction)
    (nv : NonVacuous w)
    (x : Case)
    (hEligible : DensityEligible w x) :
    DensityFails w x ↔
    ¬ DensityHeld w x := by
  exact
    FailureDiscrimination.failure_class_iff_not_held_in_scope
      (densityEarnedSignature w nv)
      x
      hEligible

/-! --------------------------------------------------------------------------
Same-level survivor surface
---------------------------------------------------------------------------- -/

inductive DensityNeighbor (Case : Type u) : Type u where
  | plurality
  | incorporation
  | memberDistinction
  | individualSupport

/--
Declared same-level neighbor survival conditions for universal Density.
-/
def densityNeighborHolds
    {Case Member Interaction : Type u}
    (w : World Case Member Interaction) :
    DensityNeighbor Case → Case → Prop
  | .plurality, x =>
      Plural w x

  | .incorporation, x =>
      ∀ m,
        w.relevant x m →
        w.incorporated x m

  | .memberDistinction, x =>
      ∀ m,
        w.relevant x m →
        w.memberDistinguished x m

  | .individualSupport, x =>
      ∀ m,
        w.relevant x m →
        IndividualSupport w x m

/--
Fixed Density object-discrimination surface.

All four declared same-level neighbors are relevant and stable in every
eligible case.
-/
def densityDiscriminationSurface
    {Case Member Interaction : Type u}
    (w : World Case Member Interaction) :
    FailureDiscrimination.DiscriminationSurface
      Case
      (DensityNeighbor Case) where
  eligible :=
    DensityEligible w

  relevant :=
    fun _ => True

  neighborHolds :=
    densityNeighborHolds w

  relevantNeighborsStable := by
    intro x hEligible n _hRelevant
    cases n with
    | plurality =>
        exact hEligible.1.1
    | incorporation =>
        intro m hMember
        exact
          (hEligible.1.2 m hMember).1
    | memberDistinction =>
        intro m hMember
        exact
          (hEligible.1.2 m hMember).2
    | individualSupport =>
        exact hEligible.2

/--
Every earned Density failure preserves the declared same-level neighboring
structures.
-/
theorem density_failure_preserves_declared_neighbors
    {Case Member Interaction : Type u}
    (w : World Case Member Interaction)
    (nv : NonVacuous w)
    (x : Case)
    (hFail : DensityFails w x) :
    ∀ n,
      (densityDiscriminationSurface w).relevant n →
      (densityDiscriminationSurface w).neighborHolds n x := by
  exact
    FailureDiscrimination.failure_preserves_declared_relevant_neighbors
      (densityDiscriminationSurface w)
      (densityEarnedSignature w nv)
      x
      hFail

/--
Universal Density therefore inherits the generic same-level survivor witness.
-/
theorem density_has_same_level_survivor_witness
    {Case Member Interaction : Type u}
    (w : World Case Member Interaction)
    (nv : NonVacuous w) :
    ∃ x,
      DensityFails w x ∧
      ∀ n,
        (densityDiscriminationSurface w).relevant n →
        (densityDiscriminationSurface w).neighborHolds n x := by
  exact
    FailureDiscrimination.earned_signature_has_same_level_survivor_witness
      (densityDiscriminationSurface w)
      (densityEarnedSignature w nv)

/-! --------------------------------------------------------------------------
Generic Universal Density closure checkpoint
---------------------------------------------------------------------------- -/

/--
Direct instantiation of the already-machine-closed Failure-Side semantic
closure theorem for universal Density.

This theorem is generic over the Density world.
The concrete demo world below is not needed for the inference.
-/
theorem density_failure_side_semantic_closure
    {Case Member Interaction : Type u}
    (w : World Case Member Interaction)
    (nv : NonVacuous w) :
    (∀ x,
      DensityEligible w x →
      (DensityFails w x ↔ ¬ DensityHeld w x))
    ∧
    (∀ x,
      DensityFails w x →
      ∀ n,
        (densityDiscriminationSurface w).relevant n →
        (densityDiscriminationSurface w).neighborHolds n x)
    ∧
    (∀ x,
      DensityFails w x →
      ∃ s,
        (densityEarnedSignature w nv).articulation.shapeWitness x s ∧
        (
          FailureClosure.Dissolution s ∨
          FailureClosure.Shear s ∨
          FailureClosure.Drift s ∨
          FailureClosure.Echo s ∨
          FailureClosure.Lock s
        ))
    ∧
    (∃ x,
      DensityEligible w x ∧ DensityHeld w x)
    ∧
    (∃ y,
      DensityEligible w y ∧ DensityFails w y) := by
  exact
    FailureDiscrimination.failure_side_discrimination_semantic_closure
      (densityDiscriminationSurface w)
      (densityEarnedSignature w nv)

/--
Stronger Density-specific articulation than the generic five-regime firewall.

Every Density-owned standing-support witness is pre-Cascade:
Dissolution, Shear, or Drift only.
-/
theorem density_failure_owned_witness_is_preCascade
    {Case Member Interaction : Type u}
    (w : World Case Member Interaction)
    (x : Case)
    (hFail : DensityFails w x) :
    ∃ s,
      DensityShapeWitness w x s
      ∧
      (
        FailureClosure.Dissolution s ∨
        FailureClosure.Shear s ∨
        FailureClosure.Drift s
      )
      ∧
      ¬ FailureClosure.Echo s
      ∧
      ¬ FailureClosure.Lock s := by
  rcases density_failure_has_shape_witness w x hFail with ⟨s, hWitness⟩
  have hPre :=
    density_shape_witness_is_dissolution_shear_or_drift
      w x s hWitness
  have hNot :=
    density_shape_witness_is_not_echo_or_lock
      w x s hWitness
  exact
    ⟨s, hWitness, hPre, hNot.1, hNot.2⟩

/--
Generic combined closure checkpoint for the Universal Density object.

Premises:
* `nv` independently establishes that both the held and failure sides are
  non-vacuous;
* `loss` independently admits one same-member before/after Density loss
  passage for the +3 capacity-loss burden.

Conclusions:
A. Density satisfies the complete generic +3 ANSWER CORE;
B. the answer-core encoding does not smuggle the six downstream +3 pressure
   adjudications;
C. Density satisfies the generic Failure-Side semantic closure;
D. every Density-owned articulation witness is restricted further to
   Dissolution / Shear / Drift and excludes Echo / Lock.

This is machine closure of the universal structural object conditional on the
declared upstream/domain premises.  It is not translation, Coherence, or
equationhood.
-/
theorem universal_density_semantic_closure
    {Case Member Interaction : Type u}
    (w : World Case Member Interaction)
    (nv : NonVacuous w)
    (loss : DensityLossPassageEvidence w) :
    PlusThree.ObjectAnswerEndpoint
      (densityPlusThreeAnswerWorld w)
    ∧
    ¬ PlusThree.PressureAdjudicated
      (densityPlusThreeAnswerWorld w)
    ∧
    (
      (∀ x,
        DensityEligible w x →
        (DensityFails w x ↔ ¬ DensityHeld w x))
      ∧
      (∀ x,
        DensityFails w x →
        ∀ n,
          (densityDiscriminationSurface w).relevant n →
          (densityDiscriminationSurface w).neighborHolds n x)
      ∧
      (∀ x,
        DensityFails w x →
        ∃ s,
          (densityEarnedSignature w nv).articulation.shapeWitness x s ∧
          (
            FailureClosure.Dissolution s ∨
            FailureClosure.Shear s ∨
            FailureClosure.Drift s ∨
            FailureClosure.Echo s ∨
            FailureClosure.Lock s
          ))
      ∧
      (∃ x,
        DensityEligible w x ∧ DensityHeld w x)
      ∧
      (∃ y,
        DensityEligible w y ∧ DensityFails w y)
    )
    ∧
    (∀ x,
      DensityFails w x →
      ∃ s,
        DensityShapeWitness w x s
        ∧
        (
          FailureClosure.Dissolution s ∨
          FailureClosure.Shear s ∨
          FailureClosure.Drift s
        )
        ∧
        ¬ FailureClosure.Echo s
        ∧
        ¬ FailureClosure.Lock s) := by
  constructor
  · exact density_object_answer_endpoint w nv loss
  constructor
  · exact density_answer_core_does_not_smuggle_pressure_completion w
  constructor
  · exact density_failure_side_semantic_closure w nv
  · intro x hFail
    exact density_failure_owned_witness_is_preCascade w x hFail


/-! --------------------------------------------------------------------------
Echo / Lock downstream controls
---------------------------------------------------------------------------- -/

/--
A canonical actual-traversal Echo control.

This route is deliberately independent of the standing Density support route.
-/
def echoControlRoute :
    FailureClosure.RouteSnapshot where
  produced := True
  persistenceEstablished := True
  persistenceCarriesUnderLoad := True
  boundaryDiscriminates := True
  cascadeInherits := False
  authorizationIncorporates := False

theorem echoControlRoute_wellFormed :
    FailureClosure.WellFormedRoute echoControlRoute := by
  constructor <;> simp [echoControlRoute]

theorem echoControlRoute_is_echo :
    FailureClosure.Echo echoControlRoute := by
  simp [FailureClosure.Echo, echoControlRoute]

/--
A canonical actual-traversal Lock control.
-/
def lockControlRoute :
    FailureClosure.RouteSnapshot where
  produced := True
  persistenceEstablished := True
  persistenceCarriesUnderLoad := True
  boundaryDiscriminates := True
  cascadeInherits := True
  authorizationIncorporates := False

theorem lockControlRoute_wellFormed :
    FailureClosure.WellFormedRoute lockControlRoute := by
  constructor <;> simp [lockControlRoute]

theorem lockControlRoute_is_lock :
    FailureClosure.Lock lockControlRoute := by
  simp [FailureClosure.Lock, lockControlRoute]

/--
Standing Density is logically compatible with a separate downstream Echo
route.
-/
theorem density_held_compatible_with_echo
    {Case Member Interaction : Type u}
    (w : World Case Member Interaction)
    (x : Case)
    (hHeld : DensityHeld w x) :
    DensityHeld w x ∧
    FailureClosure.Echo echoControlRoute := by
  exact ⟨hHeld, echoControlRoute_is_echo⟩

/--
Standing Density is logically compatible with a separate downstream Lock
route.
-/
theorem density_held_compatible_with_lock
    {Case Member Interaction : Type u}
    (w : World Case Member Interaction)
    (x : Case)
    (hHeld : DensityHeld w x) :
    DensityHeld w x ∧
    FailureClosure.Lock lockControlRoute := by
  exact ⟨hHeld, lockControlRoute_is_lock⟩

/-! --------------------------------------------------------------------------
Concrete non-vacuity / third-state witness world
---------------------------------------------------------------------------- -/

inductive DemoCase
  | held
  | split
  | rawOverlap
  deriving DecidableEq

inductive DemoMember
  | left
  | right
  deriving DecidableEq

inductive DemoInteraction
  | common
  | leftOnly
  | rightOnly
  deriving DecidableEq

def demoRelevant :
    DemoCase → DemoMember → Prop :=
  fun _ _ => True

def demoIncorporated :
    DemoCase → DemoMember → Prop :=
  fun _ _ => True

def demoMemberDistinguished :
    DemoCase → DemoMember → Prop :=
  fun _ _ => True

def demoInteractionInScope :
    DemoCase → DemoInteraction → Prop
  | .held, .common => True
  | .split, .leftOnly => True
  | .split, .rightOnly => True
  | .rawOverlap, .common => True
  | _, _ => False

def demoEstablished :
    DemoCase → DemoMember → DemoInteraction → Prop
  | .held, _, .common => True
  | .split, _, .leftOnly => True
  | .split, _, .rightOnly => True
  | .rawOverlap, _, .common => True
  | _, _, _ => False

def demoCarries :
    DemoCase → DemoMember → DemoInteraction → Prop
  | .held, _, .common => True
  | .split, .left, .leftOnly => True
  | .split, .right, .rightOnly => True
  | .rawOverlap, _, .common => True
  | _, _, _ => False

def demoDiscriminates :
    DemoCase → DemoMember → DemoInteraction → Prop :=
  demoCarries

def demoJointDistinction :
    DemoCase → DemoInteraction → Prop
  | .held, .common => True
  | .rawOverlap, .common => False
  | _, _ => False

def demoDifferentiallyConditions :
    DemoCase → DemoMember → DemoMember → DemoInteraction → Prop
  | .held, .left, .right, .common => True
  | .held, .right, .left, .common => True
  | .rawOverlap, .left, .right, .common => True
  | .rawOverlap, .right, .left, .common => True
  | _, _, _, _ => False

def demoWorld :
    World DemoCase DemoMember DemoInteraction where
  relevant :=
    demoRelevant

  incorporated :=
    demoIncorporated

  memberDistinguished :=
    demoMemberDistinguished

  interactionInScope :=
    demoInteractionInScope

  established :=
    demoEstablished

  carries :=
    demoCarries

  discriminates :=
    demoDiscriminates

  carry_requires_establishment := by
    intro x m i hCarry
    cases x <;> cases m <;> cases i <;>
      simp [demoCarries, demoEstablished] at hCarry ⊢

  discrimination_requires_carry := by
    intro x m i hDiscriminates
    exact hDiscriminates

  jointDistinction :=
    demoJointDistinction

  differentiallyConditions :=
    demoDifferentiallyConditions

theorem demo_member_base
    (x : DemoCase) :
    MemberBase demoWorld x := by
  constructor
  · exact
      ⟨DemoMember.left,
       DemoMember.right,
       by simp [demoWorld, demoRelevant],
       by simp [demoWorld, demoRelevant],
       by simp⟩
  · intro m _hRelevant
    exact
      ⟨by simp [demoWorld, demoIncorporated],
       by simp [demoWorld, demoMemberDistinguished]⟩

theorem demo_held_qualifying :
    Qualifying demoWorld DemoCase.held DemoInteraction.common := by
  constructor
  · constructor
    · simp [demoWorld, demoInteractionInScope]
    · intro m _hRelevant
      cases m <;>
        simp [MemberSupport, demoWorld, demoInteractionInScope,
          demoCarries, demoDiscriminates]
  constructor
  · simp [demoWorld, demoJointDistinction]
  · exact
      ⟨DemoMember.left,
       DemoMember.right,
       by simp [demoWorld, demoRelevant],
       by simp [demoWorld, demoRelevant],
       by simp,
       by simp [demoWorld, demoDifferentiallyConditions]⟩

theorem demo_held_density :
    DensityHeld demoWorld DemoCase.held := by
  exact
    ⟨demo_member_base DemoCase.held,
     ⟨DemoInteraction.common, demo_held_qualifying⟩⟩

theorem demo_split_eligible :
    DensityEligible demoWorld DemoCase.split := by
  constructor
  · exact demo_member_base DemoCase.split
  · intro m _hRelevant
    cases m with
    | left =>
        exact
          ⟨DemoInteraction.leftOnly,
           by
             simp [MemberSupport, demoWorld, demoInteractionInScope,
               demoCarries, demoDiscriminates]⟩
    | right =>
        exact
          ⟨DemoInteraction.rightOnly,
           by
             simp [MemberSupport, demoWorld, demoInteractionInScope,
               demoCarries, demoDiscriminates]⟩

theorem demo_split_no_qualifying
    (i : DemoInteraction) :
    ¬ Qualifying demoWorld DemoCase.split i := by
  cases i <;>
    simp [Qualifying, CommonSupport, MemberSupport, DifferentialPair,
      demoWorld, demoInteractionInScope, demoCarries, demoDiscriminates,
      demoJointDistinction, demoDifferentiallyConditions, demoRelevant]

theorem demo_split_failure :
    DensityFails demoWorld DemoCase.split := by
  exact
    ⟨demo_split_eligible,
     demo_split_no_qualifying⟩

theorem demo_raw_overlap_eligible :
    DensityEligible demoWorld DemoCase.rawOverlap := by
  constructor
  · exact demo_member_base DemoCase.rawOverlap
  · intro m _hRelevant
    exact
      ⟨DemoInteraction.common,
       by
         cases m <;>
           simp [MemberSupport, demoWorld, demoInteractionInScope,
             demoCarries, demoDiscriminates]⟩

theorem demo_raw_overlap_common :
    CommonSupport
      demoWorld
      DemoCase.rawOverlap
      DemoInteraction.common := by
  constructor
  · simp [demoWorld, demoInteractionInScope]
  · intro m _hRelevant
    cases m <;>
      simp [MemberSupport, demoWorld, demoInteractionInScope,
        demoCarries, demoDiscriminates]

theorem demo_raw_overlap_not_qualifying :
    ¬ Qualifying
      demoWorld
      DemoCase.rawOverlap
      DemoInteraction.common := by
  intro hQ
  exact
    (by
      simpa [demoWorld, demoJointDistinction]
        using hQ.2.1)

theorem demo_raw_overlap_no_qualifying
    (i : DemoInteraction) :
    ¬ Qualifying demoWorld DemoCase.rawOverlap i := by
  cases i with
  | common =>
      exact demo_raw_overlap_not_qualifying
  | leftOnly =>
      simp [Qualifying, CommonSupport, MemberSupport,
        demoWorld, demoInteractionInScope]
  | rightOnly =>
      simp [Qualifying, CommonSupport, MemberSupport,
        demoWorld, demoInteractionInScope]

theorem demo_raw_overlap_failure :
    DensityFails demoWorld DemoCase.rawOverlap := by
  exact
    ⟨demo_raw_overlap_eligible,
     demo_raw_overlap_no_qualifying⟩

/--
The former prose third state is an actual admitted Density failure:
raw overlap exists, but qualifying common support does not.
-/
theorem raw_overlap_without_qualification_is_density_failure :
    CommonSupport
      demoWorld
      DemoCase.rawOverlap
      DemoInteraction.common
    ∧
    DensityFails demoWorld DemoCase.rawOverlap := by
  exact
    ⟨demo_raw_overlap_common,
     demo_raw_overlap_failure⟩

/--
And that exact third-state witness projects to Drift.
-/
theorem demo_raw_overlap_projects_to_drift :
    FailureClosure.Drift
      (jointRoute
        demoWorld
        DemoCase.rawOverlap
        DemoInteraction.common) := by
  exact
    raw_common_nonqualifying_is_drift
      demoWorld
      DemoCase.rawOverlap
      DemoInteraction.common
      demo_raw_overlap_common
      demo_raw_overlap_not_qualifying

theorem demoNonVacuous :
    NonVacuous demoWorld := by
  constructor
  · exact
      ⟨DemoCase.held,
        density_held_in_scope
          demoWorld
          DemoCase.held
          demo_held_density,
        demo_held_density⟩
  · exact
      ⟨DemoCase.split,
        demo_split_eligible,
        demo_split_failure⟩

def demoDensityLossPassage :
    DensityLossPassageEvidence demoWorld := by
  refine
    { before := DemoCase.held
      after := DemoCase.split
      sameRelevantMembers := ?_
      beforeHeld := demo_held_density
      afterFails := demo_split_failure }
  intro m
  constructor <;> intro _h <;>
    simp [demoWorld, demoRelevant]

theorem demo_density_plus_three_answer_core :
    PlusThree.JobFidelity (densityPlusThreeAnswerWorld demoWorld)
    ∧ PlusThree.ShapeFidelity (densityPlusThreeAnswerWorld demoWorld)
    ∧ PlusThree.CapacityLossFidelity
        (densityPlusThreeAnswerWorld demoWorld) := by
  exact
    density_plus_three_answer_core
      demoWorld
      demoNonVacuous
      demoDensityLossPassage

theorem demo_density_object_answer_endpoint :
    PlusThree.ObjectAnswerEndpoint
      (densityPlusThreeAnswerWorld demoWorld) := by
  exact
    density_object_answer_endpoint
      demoWorld
      demoNonVacuous
      demoDensityLossPassage

def demoEarnedSignature :
    FailureDiscrimination.EarnedSignature
      (DensityEligible demoWorld)
      (DensityHeld demoWorld)
      (DensityFails demoWorld) :=
  densityEarnedSignature demoWorld demoNonVacuous

/--
The generic Failure-Side theorem is now genuinely live for universal Density.
-/
theorem demo_density_failure_class_iff_not_held
    (x : DemoCase)
    (hEligible : DensityEligible demoWorld x) :
    DensityFails demoWorld x ↔
    ¬ DensityHeld demoWorld x := by
  exact
    FailureDiscrimination.failure_class_iff_not_held_in_scope
      demoEarnedSignature
      x
      hEligible

/--
Consolidated first Universal Density machine checkpoint.

This packages:
* held/failure complement on the fixed survivor surface;
* a nonempty earned signature;
* non-decorative regime articulation;
* strict Dissolution/Shear/Drift shape restriction;
* Echo/Lock exclusion for Density's own shape witnesses;
* raw-overlap/nonqualifying Drift;
* same-level survivor preservation.
-/
theorem universal_density_machine_checkpoint :
    PlusThree.ObjectAnswerEndpoint
      (densityPlusThreeAnswerWorld demoWorld)
    ∧
    ¬ PlusThree.PressureAdjudicated
        (densityPlusThreeAnswerWorld demoWorld)
    ∧
    (∀ x,
      DensityEligible demoWorld x →
      (DensityFails demoWorld x ↔ ¬ DensityHeld demoWorld x))
    ∧
    (∃ x,
      DensityEligible demoWorld x ∧ DensityHeld demoWorld x)
    ∧
    (∃ x,
      DensityEligible demoWorld x ∧ DensityFails demoWorld x)
    ∧
    (∀ x s,
      DensityShapeWitness demoWorld x s →
      (
        FailureClosure.Dissolution s ∨
        FailureClosure.Shear s ∨
        FailureClosure.Drift s
      ))
    ∧
    (∀ x s,
      DensityShapeWitness demoWorld x s →
      ¬ FailureClosure.Echo s ∧ ¬ FailureClosure.Lock s)
    ∧
    FailureClosure.Drift
      (jointRoute
        demoWorld
        DemoCase.rawOverlap
        DemoInteraction.common)
    ∧
    (∃ x,
      DensityFails demoWorld x ∧
      ∀ n,
        (densityDiscriminationSurface demoWorld).relevant n →
        (densityDiscriminationSurface demoWorld).neighborHolds n x) := by
  constructor
  · exact demo_density_object_answer_endpoint
  constructor
  · exact density_answer_core_does_not_smuggle_pressure_completion demoWorld
  constructor
  · intro x hEligible
    exact
      demo_density_failure_class_iff_not_held
        x hEligible
  constructor
  · exact demoNonVacuous.heldWitness
  constructor
  · exact demoNonVacuous.failureWitness
  constructor
  · intro x s hWitness
    exact
      density_shape_witness_is_dissolution_shear_or_drift
        demoWorld x s hWitness
  constructor
  · intro x s hWitness
    exact
      density_shape_witness_is_not_echo_or_lock
        demoWorld x s hWitness
  constructor
  · exact demo_raw_overlap_projects_to_drift
  · exact
      density_has_same_level_survivor_witness
        demoWorld
        demoNonVacuous

end UniversalDensity
end StructuralFlow


/-!
===============================================================================
DENSITY TRANSLATION — PUBLIC THEOREM MODULE
Historical machine provenance: promoted from clean Density Translation Kernel Attempt v0.4
===============================================================================

Purpose
-------
Public machine formalization of the Density translation layer.

Machine dependency:
  StructuralFlow.UniversalDensity

This module does NOT alter Universal Density.

It formalizes:

1. domain-local survivor-role profiles;
2. role-by-role realization preservation;
3. derived local eligibility;
4. local transfer of the machine-closed Density held/failure grammar;
5. heterogeneous minimum translation pairs;
6. routing of genuinely universal Density invariants;
7. negative witnesses showing that minimum Density translation does not require:
   * equal translation thickness; or
   * member-type equivalence.

Important scope
---------------
The universal machine audits STRUCTURAL realization.

It does not manufacture domain truth.

A domain-specific module remains responsible for independently warranting the
local predicates, mechanisms, observables, members, interactions, level, and
scope used to construct a realization.

Minimum Density translation is therefore:

independently earned realization A
        \
         -> machine-closed Universal Density
        /
independently earned realization B

No direct content map is constitutive.
No direct member map is constitutive.
No isomorphism is constitutive.
No Coherence is constitutive.
No equationhood is licensed here.
-/

namespace StructuralFlow
namespace DensityTranslation

universe u


/-! --------------------------------------------------------------------------
Local survivor-role profile
---------------------------------------------------------------------------- -/

/--
A domain-local Density field profile.

The four neighbor roles are independently declared by the domain using the
already-closed Universal Density role tags.

`held` and `fails` are also domain-local predicates.

Nothing in this structure defines the local predicates from Universal Density.
That preservation burden belongs to `DensityStructuralRealization`.
-/
structure LocalDensityProfile (Case : Type u) where
  neighborHolds :
    StructuralFlow.UniversalDensity.DensityNeighbor Case → Case → Prop

  held :
    Case → Prop

  fails :
    Case → Prop

/--
Local Density eligibility is reconstructed from the four independently named
survivor roles.

There is deliberately no fifth opaque `eligible` field.
-/
def LocalEligible
    {Case : Type u}
    (p : LocalDensityProfile Case)
    (x : Case) : Prop :=
  ∀ n,
    p.neighborHolds n x

/--
The Universal Density survivor surface is exactly the conjunction of its four
declared neighbor roles.

This is the first bridge required by translation.
-/
theorem density_eligible_iff_all_neighbors
    {Case Member Interaction : Type u}
    (w : StructuralFlow.UniversalDensity.World Case Member Interaction)
    (x : Case) :
    StructuralFlow.UniversalDensity.DensityEligible w x ↔
      ∀ n : StructuralFlow.UniversalDensity.DensityNeighbor Case,
        StructuralFlow.UniversalDensity.densityNeighborHolds w n x := by
  constructor
  · intro hEligible n
    cases n with
    | plurality =>
        exact hEligible.1.1
    | incorporation =>
        intro m hRelevant
        exact
          (hEligible.1.2 m hRelevant).1
    | memberDistinction =>
        intro m hRelevant
        exact
          (hEligible.1.2 m hRelevant).2
    | individualSupport =>
        exact hEligible.2
  · intro hAll
    refine ⟨?_, ?_⟩
    · constructor
      · exact hAll .plurality
      · intro m hRelevant
        exact
          ⟨hAll .incorporation m hRelevant,
           hAll .memberDistinction m hRelevant⟩
    · exact hAll .individualSupport

/-! --------------------------------------------------------------------------
Structural realization
---------------------------------------------------------------------------- -/

inductive DensityThickness where
  | minimum
  | accumulation
  | recognition
  | coherence
  | domainBearing
  deriving DecidableEq

/--
A structurally admitted domain realization of Universal Density.

The domain owns:
* its local survivor-role predicates;
* its local held/failure predicates;
* its domain / level / scope declarations.

The realization must preserve:
* each survivor role;
* the held condition;
* the failure condition.

Non-vacuity and the +3 loss passage are carried because they are already
explicit premises of machine-closed Universal Density.

No opaque domain-truth flag is included.
-/
structure DensityStructuralRealization
    (Domain Case Member Interaction Level Scope : Type u) where
  domain :
    Domain

  level :
    Level

  scope :
    Scope

  thickness :
    DensityThickness

  profile :
    LocalDensityProfile Case

  projectedWorld :
    StructuralFlow.UniversalDensity.World Case Member Interaction

  nonVacuous :
    StructuralFlow.UniversalDensity.NonVacuous projectedWorld

  lossPassage :
    StructuralFlow.UniversalDensity.DensityLossPassageEvidence projectedWorld

  neighborPreservation :
    ∀ x n,
      profile.neighborHolds n x ↔
      StructuralFlow.UniversalDensity.densityNeighborHolds projectedWorld n x

  heldPreservation :
    ∀ x,
      profile.held x ↔
      StructuralFlow.UniversalDensity.DensityHeld projectedWorld x

  failurePreservation :
    ∀ x,
      profile.fails x ↔
      StructuralFlow.UniversalDensity.DensityFails projectedWorld x

/--
Eligibility preservation is derived from role preservation.

It is not an axiom of the realization.
-/
theorem local_eligible_iff_density_eligible
    {Domain Case Member Interaction Level Scope : Type u}
    (R :
      DensityStructuralRealization
        Domain Case Member Interaction Level Scope)
    (x : Case) :
    LocalEligible R.profile x ↔
      StructuralFlow.UniversalDensity.DensityEligible R.projectedWorld x := by
  constructor
  · intro hLocal
    apply
      (density_eligible_iff_all_neighbors
        R.projectedWorld x).2
    intro n
    exact
      (R.neighborPreservation x n).1
        (hLocal n)
  · intro hDensity
    have hAll :
        ∀ n : StructuralFlow.UniversalDensity.DensityNeighbor Case,
          StructuralFlow.UniversalDensity.densityNeighborHolds R.projectedWorld n x :=
      (density_eligible_iff_all_neighbors
        R.projectedWorld x).1
        hDensity
    intro n
    exact
      (R.neighborPreservation x n).2
        (hAll n)

/--
Local failure becomes the exact complement of local held Density on the local
survivor surface.

This result is inherited from machine-closed Universal Density rather than
asserted independently.
-/
theorem local_failure_iff_not_local_held_on_surface
    {Domain Case Member Interaction Level Scope : Type u}
    (R :
      DensityStructuralRealization
        Domain Case Member Interaction Level Scope)
    (x : Case)
    (hLocalEligible : LocalEligible R.profile x) :
    R.profile.fails x ↔
      ¬ R.profile.held x := by
  have hDensityEligible :
      StructuralFlow.UniversalDensity.DensityEligible R.projectedWorld x :=
    (local_eligible_iff_density_eligible R x).1
      hLocalEligible
  constructor
  · intro hLocalFail hLocalHeld
    have hDensityFail :
        StructuralFlow.UniversalDensity.DensityFails R.projectedWorld x :=
      (R.failurePreservation x).1
        hLocalFail
    have hDensityHeld :
        StructuralFlow.UniversalDensity.DensityHeld R.projectedWorld x :=
      (R.heldPreservation x).1
        hLocalHeld
    exact
      (StructuralFlow.UniversalDensity.density_held_and_failure_disjoint
        R.projectedWorld x hDensityHeld)
        hDensityFail
  · intro hNotLocalHeld
    have hNotDensityHeld :
        ¬ StructuralFlow.UniversalDensity.DensityHeld R.projectedWorld x := by
      intro hDensityHeld
      exact
        hNotLocalHeld
          ((R.heldPreservation x).2 hDensityHeld)
    have hDensityFail :
        StructuralFlow.UniversalDensity.DensityFails R.projectedWorld x :=
      (StructuralFlow.UniversalDensity.density_failure_iff_not_held_on_surface
        R.projectedWorld
        x
        hDensityEligible).2
        hNotDensityHeld
    exact
      (R.failurePreservation x).2
        hDensityFail

/--
A local Density failure preserves all four locally declared Density survivor
roles.

This is the Failure-Theorem survivor signature transported through the
realization map.
-/
theorem local_failure_preserves_local_neighbors
    {Domain Case Member Interaction Level Scope : Type u}
    (R :
      DensityStructuralRealization
        Domain Case Member Interaction Level Scope)
    (x : Case)
    (hLocalFail : R.profile.fails x) :
    ∀ n,
      R.profile.neighborHolds n x := by
  intro n
  have hDensityFail :
      StructuralFlow.UniversalDensity.DensityFails R.projectedWorld x :=
    (R.failurePreservation x).1
      hLocalFail
  have hUniversalNeighbor :
      StructuralFlow.UniversalDensity.densityNeighborHolds R.projectedWorld n x := by
    have hStable :=
      StructuralFlow.UniversalDensity.density_failure_preserves_declared_neighbors
        R.projectedWorld
        R.nonVacuous
        x
        hDensityFail
        n
        (by trivial)
    exact hStable
  exact
    (R.neighborPreservation x n).2
      hUniversalNeighbor

/--
A local Density failure inherits the exact Universal Density standing-support
failure grammar:

Dissolution OR Shear OR Drift,

and not Echo / not Lock for the Density-owned witness.
-/
theorem local_failure_has_preCascade_density_witness
    {Domain Case Member Interaction Level Scope : Type u}
    (R :
      DensityStructuralRealization
        Domain Case Member Interaction Level Scope)
    (x : Case)
    (hLocalFail : R.profile.fails x) :
    ∃ s,
      StructuralFlow.UniversalDensity.DensityShapeWitness R.projectedWorld x s
      ∧
      (
        FailureClosure.Dissolution s ∨
        FailureClosure.Shear s ∨
        FailureClosure.Drift s
      )
      ∧
      ¬ FailureClosure.Echo s
      ∧
      ¬ FailureClosure.Lock s := by
  have hDensityFail :
      StructuralFlow.UniversalDensity.DensityFails R.projectedWorld x :=
    (R.failurePreservation x).1
      hLocalFail
  exact
    StructuralFlow.UniversalDensity.density_failure_owned_witness_is_preCascade
      R.projectedWorld
      x
      hDensityFail

/--
Local held and failure sides are both non-vacuous whenever the admitted
Universal Density realization is non-vacuous.
-/
theorem local_realization_nonvacuous
    {Domain Case Member Interaction Level Scope : Type u}
    (R :
      DensityStructuralRealization
        Domain Case Member Interaction Level Scope) :
    (∃ x,
      LocalEligible R.profile x ∧
      R.profile.held x)
    ∧
    (∃ y,
      LocalEligible R.profile y ∧
      R.profile.fails y) := by
  constructor
  · rcases R.nonVacuous.heldWitness with
      ⟨x, hEligible, hHeld⟩
    exact
      ⟨x,
        (local_eligible_iff_density_eligible R x).2
          hEligible,
        (R.heldPreservation x).2
          hHeld⟩
  · rcases R.nonVacuous.failureWitness with
      ⟨y, hEligible, hFail⟩
    exact
      ⟨y,
        (local_eligible_iff_density_eligible R y).2
          hEligible,
        (R.failurePreservation y).2
          hFail⟩

/--
Complete local failure grammar inherited by any admitted structural
realization.
-/
def LocalFailureGrammar
    {Domain Case Member Interaction Level Scope : Type u}
    (R :
      DensityStructuralRealization
        Domain Case Member Interaction Level Scope) : Prop :=
  (
    ∀ x,
      LocalEligible R.profile x →
      (R.profile.fails x ↔ ¬ R.profile.held x)
  )
  ∧
  (
    ∀ x,
      R.profile.fails x →
      ∀ n,
        R.profile.neighborHolds n x
  )
  ∧
  (
    ∀ x,
      R.profile.fails x →
      ∃ s,
        StructuralFlow.UniversalDensity.DensityShapeWitness R.projectedWorld x s
        ∧
        (
          FailureClosure.Dissolution s ∨
          FailureClosure.Shear s ∨
          FailureClosure.Drift s
        )
        ∧
        ¬ FailureClosure.Echo s
        ∧
        ¬ FailureClosure.Lock s
  )

theorem domain_density_realization_checkpoint
    {Domain Case Member Interaction Level Scope : Type u}
    (R :
      DensityStructuralRealization
        Domain Case Member Interaction Level Scope) :
    LocalFailureGrammar R
    ∧
    (∃ x,
      LocalEligible R.profile x ∧
      R.profile.held x)
    ∧
    (∃ y,
      LocalEligible R.profile y ∧
      R.profile.fails y) := by
  constructor
  · constructor
    · intro x hEligible
      exact
        local_failure_iff_not_local_held_on_surface
          R x hEligible
    constructor
    · intro x hFail n
      exact
        local_failure_preserves_local_neighbors
          R x hFail n
    · intro x hFail
      exact
        local_failure_has_preCascade_density_witness
          R x hFail
  · exact local_realization_nonvacuous R

/-! --------------------------------------------------------------------------
Minimum heterogeneous translation
---------------------------------------------------------------------------- -/

/--
Minimum Density translation is a data package containing two independently
earned structural realizations.

No direct cross-domain map is constitutive.
-/
structure DensityTranslationPair
    (DomainA CaseA MemberA InteractionA LevelA ScopeA : Type u)
    (DomainB CaseB MemberB InteractionB LevelB ScopeB : Type u) where
  left :
    DensityStructuralRealization
      DomainA CaseA MemberA InteractionA LevelA ScopeA

  right :
    DensityStructuralRealization
      DomainB CaseB MemberB InteractionB LevelB ScopeB

/--
Each side of a minimum translation pair independently carries the exact local
Density failure grammar.
-/
theorem translation_pair_shares_density_failure_grammar
    {DomainA CaseA MemberA InteractionA LevelA ScopeA : Type u}
    {DomainB CaseB MemberB InteractionB LevelB ScopeB : Type u}
    (T :
      DensityTranslationPair
        DomainA CaseA MemberA InteractionA LevelA ScopeA
        DomainB CaseB MemberB InteractionB LevelB ScopeB) :
    LocalFailureGrammar T.left
    ∧
    LocalFailureGrammar T.right := by
  constructor
  · exact
      (domain_density_realization_checkpoint
        T.left).1
  · exact
      (domain_density_realization_checkpoint
        T.right).1

/-! --------------------------------------------------------------------------
Universal-invariant routing
---------------------------------------------------------------------------- -/

/--
A universal Density invariant is a property of an arbitrary Universal Density
world that follows from only the universal machine premises required by the
closed object.

This definition is intentionally polymorphic over domain-local Case / Member /
Interaction types at one universe level.
-/
def UniversalDensityInvariant
    (P :
      ∀ {Case Member Interaction : Type u},
        StructuralFlow.UniversalDensity.World Case Member Interaction → Prop) : Prop :=
  ∀ {Case Member Interaction : Type u}
    (w : StructuralFlow.UniversalDensity.World Case Member Interaction),
    StructuralFlow.UniversalDensity.NonVacuous w →
    StructuralFlow.UniversalDensity.DensityLossPassageEvidence w →
    P w

/--
A minimum translation pair routes any genuinely universal Density invariant
onto both realization surfaces.

This is structural routing.

It is not arbitrary local-content transport from A into B.
-/
theorem translation_routes_universal_density_invariant
    {DomainA CaseA MemberA InteractionA LevelA ScopeA : Type u}
    {DomainB CaseB MemberB InteractionB LevelB ScopeB : Type u}
    (T :
      DensityTranslationPair
        DomainA CaseA MemberA InteractionA LevelA ScopeA
        DomainB CaseB MemberB InteractionB LevelB ScopeB)
    (P :
      ∀ {Case Member Interaction : Type u},
        StructuralFlow.UniversalDensity.World Case Member Interaction → Prop)
    (hInvariant : UniversalDensityInvariant P) :
    P T.left.projectedWorld
    ∧
    P T.right.projectedWorld := by
  constructor
  · exact
      hInvariant
        T.left.projectedWorld
        T.left.nonVacuous
        T.left.lossPassage
  · exact
      hInvariant
        T.right.projectedWorld
        T.right.nonVacuous
        T.right.lossPassage

/--
One concrete universal invariant:
on the fixed Universal Density survivor surface, failure is exactly
non-held Density.
-/
def DensityComplementInvariant :
    ∀ {Case Member Interaction : Type u},
      StructuralFlow.UniversalDensity.World Case Member Interaction → Prop :=
  fun {_Case} {_Member} {_Interaction} w =>
    ∀ x,
      StructuralFlow.UniversalDensity.DensityEligible w x →
      (StructuralFlow.UniversalDensity.DensityFails w x ↔ ¬ StructuralFlow.UniversalDensity.DensityHeld w x)

theorem density_complement_is_universal_invariant :
    UniversalDensityInvariant
      DensityComplementInvariant := by
  intro _Case _Member _Interaction w _nv _loss x hEligible
  exact
    StructuralFlow.UniversalDensity.density_failure_iff_not_held_on_surface
      w x hEligible

/-! --------------------------------------------------------------------------
Canonical realization helper for consistency / negative witnesses
---------------------------------------------------------------------------- -/

/--
Canonical local profile induced by an already-built Universal Density world.

This helper is used only for machine consistency / negative witnesses.

It is NOT a substitute for independent domain warrant in a real domain module.
-/
def canonicalLocalProfile
    {Case Member Interaction : Type u}
    (w : StructuralFlow.UniversalDensity.World Case Member Interaction) :
    LocalDensityProfile Case where
  neighborHolds :=
    StructuralFlow.UniversalDensity.densityNeighborHolds w

  held :=
    StructuralFlow.UniversalDensity.DensityHeld w

  fails :=
    StructuralFlow.UniversalDensity.DensityFails w

/-! --------------------------------------------------------------------------
Generic simple Density worlds for heterogeneous translation witnesses
---------------------------------------------------------------------------- -/

/--
Two-state consistency world.

Case `false`:
one qualifying common interaction.

Case `true`:
every member retains one individual interaction keyed by that member,
but no qualifying common interaction exists.

This construction works for any member type with two distinct witnesses.
-/
def simpleInteractionInScope
    {Member : Type} :
    Bool → Sum Unit Member → Prop
  | false, .inl _ => True
  | true, .inr _ => True
  | _, _ => False

def simpleCarries
    {Member : Type}
    [DecidableEq Member] :
    Bool → Member → Sum Unit Member → Prop
  | false, _, .inl _ => True
  | true, m, .inr n => m = n
  | _, _, _ => False

def simpleJointDistinction
    {Member : Type} :
    Bool → Sum Unit Member → Prop
  | false, .inl _ => True
  | _, _ => False

def simpleDifferentiallyConditions
    {Member : Type} :
    Bool → Member → Member → Sum Unit Member → Prop
  | false, a, b, .inl _ => a ≠ b
  | _, _, _, _ => False

def simpleWorld
    (Member : Type)
    [DecidableEq Member] :
    StructuralFlow.UniversalDensity.World Bool Member (Sum Unit Member) where
  relevant :=
    fun _ _ => True

  incorporated :=
    fun _ _ => True

  memberDistinguished :=
    fun _ _ => True

  interactionInScope :=
    simpleInteractionInScope

  established :=
    simpleCarries

  carries :=
    simpleCarries

  discriminates :=
    simpleCarries

  carry_requires_establishment := by
    intro x m i hCarry
    exact hCarry

  discrimination_requires_carry := by
    intro x m i hDisc
    exact hDisc

  jointDistinction :=
    simpleJointDistinction

  differentiallyConditions :=
    simpleDifferentiallyConditions

theorem simple_member_base
    {Member : Type}
    [DecidableEq Member]
    (a b : Member)
    (hab : a ≠ b)
    (x : Bool) :
    StructuralFlow.UniversalDensity.MemberBase (simpleWorld Member) x := by
  constructor
  · exact
      ⟨a, b, by simp [simpleWorld], by simp [simpleWorld], hab⟩
  · intro m _hRelevant
    exact
      ⟨by simp [simpleWorld],
       by simp [simpleWorld]⟩

theorem simple_held_qualifying
    {Member : Type}
    [DecidableEq Member]
    (a b : Member)
    (hab : a ≠ b) :
    StructuralFlow.UniversalDensity.Qualifying
      (simpleWorld Member)
      false
      (Sum.inl ()) := by
  constructor
  · constructor
    · simp [simpleWorld, simpleInteractionInScope]
    · intro m _hRelevant
      simp [StructuralFlow.UniversalDensity.MemberSupport, simpleWorld,
        simpleInteractionInScope, simpleCarries]
  constructor
  · simp [simpleWorld, simpleJointDistinction]
  · exact
      ⟨a, b,
        by simp [simpleWorld],
        by simp [simpleWorld],
        hab,
        by
          simpa [simpleWorld, simpleDifferentiallyConditions]
            using hab⟩

theorem simple_held_density
    {Member : Type}
    [DecidableEq Member]
    (a b : Member)
    (hab : a ≠ b) :
    StructuralFlow.UniversalDensity.DensityHeld
      (simpleWorld Member)
      false := by
  exact
    ⟨simple_member_base a b hab false,
     ⟨Sum.inl (), simple_held_qualifying a b hab⟩⟩

theorem simple_failure_eligible
    {Member : Type}
    [DecidableEq Member]
    (a b : Member)
    (hab : a ≠ b) :
    StructuralFlow.UniversalDensity.DensityEligible
      (simpleWorld Member)
      true := by
  constructor
  · exact
      simple_member_base a b hab true
  · intro m _hRelevant
    exact
      ⟨Sum.inr m,
       by
         simp [StructuralFlow.UniversalDensity.MemberSupport, simpleWorld,
           simpleInteractionInScope, simpleCarries]⟩

theorem simple_failure_no_qualifying
    {Member : Type}
    [DecidableEq Member]
    (i : Sum Unit Member) :
    ¬ StructuralFlow.UniversalDensity.Qualifying
      (simpleWorld Member)
      true
      i := by
  intro hQ
  exact
    (by
      simpa [simpleWorld, simpleJointDistinction]
        using hQ.2.1)

theorem simple_density_failure
    {Member : Type}
    [DecidableEq Member]
    (a b : Member)
    (hab : a ≠ b) :
    StructuralFlow.UniversalDensity.DensityFails
      (simpleWorld Member)
      true := by
  exact
    ⟨simple_failure_eligible a b hab,
     simple_failure_no_qualifying⟩

theorem simple_nonvacuous
    {Member : Type}
    [DecidableEq Member]
    (a b : Member)
    (hab : a ≠ b) :
    StructuralFlow.UniversalDensity.NonVacuous (simpleWorld Member) := by
  constructor
  · exact
      ⟨false,
        StructuralFlow.UniversalDensity.density_held_in_scope
          (simpleWorld Member)
          false
          (simple_held_density a b hab),
        simple_held_density a b hab⟩
  · exact
      ⟨true,
        simple_failure_eligible a b hab,
        simple_density_failure a b hab⟩

def simple_loss_passage
    {Member : Type}
    [DecidableEq Member]
    (a b : Member)
    (hab : a ≠ b) :
    StructuralFlow.UniversalDensity.DensityLossPassageEvidence
      (simpleWorld Member) := by
  refine
    { before := false
      after := true
      sameRelevantMembers := ?_
      beforeHeld := simple_held_density a b hab
      afterFails := simple_density_failure a b hab }
  intro m
  constructor <;> intro _h <;>
    simp [simpleWorld]

/--
Canonical structural realization used only for consistency / negative witness
construction.
-/
def simpleRealization
    {Domain Level Scope Member : Type}
    [DecidableEq Member]
    (domain : Domain)
    (level : Level)
    (scope : Scope)
    (thickness : DensityThickness)
    (a b : Member)
    (hab : a ≠ b) :
    DensityStructuralRealization
      Domain
      Bool
      Member
      (Sum Unit Member)
      Level
      Scope where
  domain :=
    domain

  level :=
    level

  scope :=
    scope

  thickness :=
    thickness

  profile :=
    canonicalLocalProfile
      (simpleWorld Member)

  projectedWorld :=
    simpleWorld Member

  nonVacuous :=
    simple_nonvacuous a b hab

  lossPassage :=
    simple_loss_passage a b hab

  neighborPreservation := by
    intro x n
    rfl

  heldPreservation := by
    intro x
    rfl

  failurePreservation := by
    intro x
    rfl

/-! --------------------------------------------------------------------------
Negative witnesses
---------------------------------------------------------------------------- -/

def demoLeftRealization :
    DensityStructuralRealization
      Unit
      Bool
      Bool
      (Sum Unit Bool)
      Unit
      Unit :=
  simpleRealization
    ()
    ()
    ()
    .minimum
    false
    true
    (by decide)

def demoRightRealization :
    DensityStructuralRealization
      Unit
      Bool
      (Fin 3)
      (Sum Unit (Fin 3))
      Unit
      Unit :=
  simpleRealization
    ()
    ()
    ()
    .coherence
    0
    1
    (by decide)

def demoTranslationPair :
    DensityTranslationPair
      Unit Bool Bool (Sum Unit Bool) Unit Unit
      Unit Bool (Fin 3) (Sum Unit (Fin 3)) Unit Unit where
  left :=
    demoLeftRealization

  right :=
    demoRightRealization

/--
Minimum Density translation does not require equal translation thickness.
-/
theorem translation_does_not_require_same_thickness :
    demoTranslationPair.left.thickness ≠
      demoTranslationPair.right.thickness := by
  simp [demoTranslationPair, demoLeftRealization, demoRightRealization,
    simpleRealization]

/--
Small dependency-free equivalence package used only by the finite negative
witness below.

It is intentionally local to this countermodel so the translation kernel does
not depend on a larger equivalence / finite-cardinality library surface.
-/
structure MemberEquivalence (A B : Type) where
  toFun :
    A → B

  invFun :
    B → A

  left_inv :
    ∀ a,
      invFun (toFun a) = a

  right_inv :
    ∀ b,
      toFun (invFun b) = b

/--
Among three Bool values, at least two coincide.
-/
theorem bool_three_pair_collision
    (a b c : Bool) :
    a = b ∨ a = c ∨ b = c := by
  cases a <;> cases b <;> cases c <;> simp

/--
There is no member-type equivalence between the two admitted demo realization
surfaces.

Thus minimum Density translation does not entail member/content isomorphism.
-/
theorem no_bool_fin3_member_equivalence :
    ¬ Nonempty (MemberEquivalence Bool (Fin 3)) := by
  intro hEquiv
  rcases hEquiv with ⟨e⟩

  have hInject :
      ∀ a b : Fin 3,
        e.invFun a = e.invFun b →
        a = b := by
    intro a b hab
    calc
      a = e.toFun (e.invFun a) :=
        (e.right_inv a).symm
      _ = e.toFun (e.invFun b) :=
        congrArg e.toFun hab
      _ = b :=
        e.right_inv b

  rcases
      bool_three_pair_collision
        (e.invFun 0)
        (e.invFun 1)
        (e.invFun 2) with
    h01 | h02 | h12
  · have hEq : (0 : Fin 3) = 1 :=
      hInject 0 1 h01
    exact
      (by decide : (0 : Fin 3) ≠ 1) hEq
  · have hEq : (0 : Fin 3) = 2 :=
      hInject 0 2 h02
    exact
      (by decide : (0 : Fin 3) ≠ 2) hEq
  · have hEq : (1 : Fin 3) = 2 :=
      hInject 1 2 h12
    exact
      (by decide : (1 : Fin 3) ≠ 2) hEq

/--
Concrete negative checkpoint:

a minimum translation pair exists even though:
* the two realizations have different thickness;
* their member types are not equivalent.
-/
theorem heterogeneous_translation_without_member_equivalence :
    (
      demoTranslationPair.left.thickness ≠
        demoTranslationPair.right.thickness
    )
    ∧
    ¬ Nonempty (MemberEquivalence Bool (Fin 3)) := by
  exact
    ⟨translation_does_not_require_same_thickness,
     no_bool_fin3_member_equivalence⟩

/-! --------------------------------------------------------------------------
First translation machine checkpoint
---------------------------------------------------------------------------- -/

theorem density_translation_machine_checkpoint :
    LocalFailureGrammar demoTranslationPair.left
    ∧
    LocalFailureGrammar demoTranslationPair.right
    ∧
    (
      DensityComplementInvariant
        demoTranslationPair.left.projectedWorld
    )
    ∧
    (
      DensityComplementInvariant
        demoTranslationPair.right.projectedWorld
    )
    ∧
    (
      demoTranslationPair.left.thickness ≠
        demoTranslationPair.right.thickness
    )
    ∧
    ¬ Nonempty (MemberEquivalence Bool (Fin 3)) := by
  have hGrammar :=
    translation_pair_shares_density_failure_grammar
      demoTranslationPair
  have hInvariant :
      UniversalDensityInvariant
        DensityComplementInvariant :=
    density_complement_is_universal_invariant
  have hRouted :=
    translation_routes_universal_density_invariant
      demoTranslationPair
      DensityComplementInvariant
      hInvariant
  exact
    ⟨hGrammar.1,
     hGrammar.2,
     hRouted.1,
     hRouted.2,
     translation_does_not_require_same_thickness,
     no_bool_fin3_member_equivalence⟩

end DensityTranslation
end StructuralFlow


/-!
===============================================================================
STRONG EQUATIONHOOD — PUBLIC THEOREM MODULE
Historical machine provenance: kernel attempt v0.2; full consolidated run on SF Universal Machine Kernel v1.0
===============================================================================

Purpose
-------
First semantic machine candidate for Coherence-licensed Strong Equationhood.

This module does NOT modify StructuralFlow.Coherence.

Architecture
------------
Strong Equationhood is a specialized realization of the already machine-closed
Coherence object.

Independent side earning is structural input.

Equation-specific qualification earns:
* two-sided relation co-dependency through admitted demand-change passages;
* distinct side-failure states;
* an irreducible relation-failure state while both side burdens remain;
* explicit level admission / bridge;
* a strong relation-owned shared invariant that neither side alone nor mere
  aggregation can carry as sufficient.

Successful relation whole-hold remains OUTSIDE qualification.

For a qualified relation, the central theorem target is:

  Coherence.Coheres (coherenceProjection w)
  iff
  SuccessfulRelationHold w

Thus the equation-specific criteria reach Coherence's threshold; Coherence
contributes the remaining whole-hold burden.

No +3 instance is encoded yet.
No relation-object Failure-Side closure is encoded yet.
-/

namespace StructuralFlow
namespace StrongEquationhood

universe u

/-! --------------------------------------------------------------------------
Independent side earning
---------------------------------------------------------------------------- -/

/--
A side enters relation testing only after its object-level held/failure
signature has already been earned.

The candidate relation is not an argument to this certificate.
-/
structure SideEarningCertificate (Case : Type u) where
  eligible :
    Case → Prop

  held :
    Case → Prop

  fails :
    Case → Prop

  earned :
    FailureDiscrimination.EarnedSignature
      eligible
      held
      fails

/-! --------------------------------------------------------------------------
Equation relation world
---------------------------------------------------------------------------- -/

structure World
    (LeftCase RightCase RelationCase Relation Invariant Demand
      LeftLevel RightLevel RelationLevel Bridge : Type u) where
  leftEarning :
    SideEarningCertificate LeftCase

  rightEarning :
    SideEarningCertificate RightCase

  candidateRelation :
    Relation

  leftLocallyIntelligible :
    RelationCase → Prop

  rightLocallyIntelligible :
    RelationCase → Prop

  leftBurdenHolds :
    RelationCase → Prop

  rightBurdenHolds :
    RelationCase → Prop

  relationHolds :
    RelationCase → Prop

  demandOnLeft :
    RelationCase → Demand → Prop

  demandOnRight :
    RelationCase → Demand → Prop

  leftFailurePassage :
    RelationCase → RelationCase → Prop

  rightFailurePassage :
    RelationCase → RelationCase → Prop

  leftParticipatesInvariant :
    Invariant → Prop

  rightParticipatesInvariant :
    Invariant → Prop

  relationOwnsInvariant :
    Invariant → Prop

  leftAloneSufficient :
    Invariant → Prop

  rightAloneSufficient :
    Invariant → Prop

  mereAggregationSufficient :
    Invariant → Prop

  leftLevel :
    LeftLevel

  rightLevel :
    RightLevel

  relationLevel :
    RelationLevel

  levelCompatible :
    LeftLevel → RightLevel → RelationLevel → Prop

  bridge :
    Bridge → LeftLevel → RightLevel → RelationLevel → Prop

/-! --------------------------------------------------------------------------
Side / relation states
---------------------------------------------------------------------------- -/

def FacingReference
    {LeftCase RightCase RelationCase Relation Invariant Demand
      LeftLevel RightLevel RelationLevel Bridge : Type u}
    (w :
      World LeftCase RightCase RelationCase Relation Invariant Demand
        LeftLevel RightLevel RelationLevel Bridge)
    (x : RelationCase) : Prop :=
  w.leftLocallyIntelligible x
  ∧ w.rightLocallyIntelligible x
  ∧ w.leftBurdenHolds x
  ∧ w.rightBurdenHolds x

def LeftSideFailure
    {LeftCase RightCase RelationCase Relation Invariant Demand
      LeftLevel RightLevel RelationLevel Bridge : Type u}
    (w :
      World LeftCase RightCase RelationCase Relation Invariant Demand
        LeftLevel RightLevel RelationLevel Bridge)
    (x : RelationCase) : Prop :=
  w.rightLocallyIntelligible x
  ∧ ¬ w.leftBurdenHolds x
  ∧ w.rightBurdenHolds x

def RightSideFailure
    {LeftCase RightCase RelationCase Relation Invariant Demand
      LeftLevel RightLevel RelationLevel Bridge : Type u}
    (w :
      World LeftCase RightCase RelationCase Relation Invariant Demand
        LeftLevel RightLevel RelationLevel Bridge)
    (x : RelationCase) : Prop :=
  w.leftLocallyIntelligible x
  ∧ w.leftBurdenHolds x
  ∧ ¬ w.rightBurdenHolds x

def IndependentSideFailures
    {LeftCase RightCase RelationCase Relation Invariant Demand
      LeftLevel RightLevel RelationLevel Bridge : Type u}
    (w :
      World LeftCase RightCase RelationCase Relation Invariant Demand
        LeftLevel RightLevel RelationLevel Bridge) : Prop :=
  (∃ x, LeftSideFailure w x)
  ∧
  (∃ y, RightSideFailure w y)

/--
Admitted left-side failure passage changes the structural demand the right side
is being asked to answer.

This is an answerability / demand-change relation, not a causal law.
-/
def LeftFailureCoDependency
    {LeftCase RightCase RelationCase Relation Invariant Demand
      LeftLevel RightLevel RelationLevel Bridge : Type u}
    (w :
      World LeftCase RightCase RelationCase Relation Invariant Demand
        LeftLevel RightLevel RelationLevel Bridge) : Prop :=
  ∃ before after dBefore dAfter,
    FacingReference w before
    ∧ w.leftFailurePassage before after
    ∧ LeftSideFailure w after
    ∧ w.demandOnRight before dBefore
    ∧ w.demandOnRight after dAfter
    ∧ dBefore ≠ dAfter

/--
Admitted right-side failure passage changes the structural demand the left side
is being asked to answer.
-/
def RightFailureCoDependency
    {LeftCase RightCase RelationCase Relation Invariant Demand
      LeftLevel RightLevel RelationLevel Bridge : Type u}
    (w :
      World LeftCase RightCase RelationCase Relation Invariant Demand
        LeftLevel RightLevel RelationLevel Bridge) : Prop :=
  ∃ before after dBefore dAfter,
    FacingReference w before
    ∧ w.rightFailurePassage before after
    ∧ RightSideFailure w after
    ∧ w.demandOnLeft before dBefore
    ∧ w.demandOnLeft after dAfter
    ∧ dBefore ≠ dAfter

def RelationCoDependent
    {LeftCase RightCase RelationCase Relation Invariant Demand
      LeftLevel RightLevel RelationLevel Bridge : Type u}
    (w :
      World LeftCase RightCase RelationCase Relation Invariant Demand
        LeftLevel RightLevel RelationLevel Bridge) : Prop :=
  LeftFailureCoDependency w
  ∧
  RightFailureCoDependency w

theorem relation_co_dependency_implies_independent_side_failures
    {LeftCase RightCase RelationCase Relation Invariant Demand
      LeftLevel RightLevel RelationLevel Bridge : Type u}
    (w :
      World LeftCase RightCase RelationCase Relation Invariant Demand
        LeftLevel RightLevel RelationLevel Bridge)
    (hCoDep : RelationCoDependent w) :
    IndependentSideFailures w := by
  constructor
  · rcases hCoDep.1 with
      ⟨_before, after, _dBefore, _dAfter,
        _hReference, _hPassage, hFailure,
        _hDemandBefore, _hDemandAfter, _hDistinct⟩
    exact ⟨after, hFailure⟩
  · rcases hCoDep.2 with
      ⟨_before, after, _dBefore, _dAfter,
        _hReference, _hPassage, hFailure,
        _hDemandBefore, _hDemandAfter, _hDistinct⟩
    exact ⟨after, hFailure⟩

/--
Relation failure is stronger than mere side intelligibility:
both side burdens still hold while the relation itself does not.
-/
def RelationFailureCase
    {LeftCase RightCase RelationCase Relation Invariant Demand
      LeftLevel RightLevel RelationLevel Bridge : Type u}
    (w :
      World LeftCase RightCase RelationCase Relation Invariant Demand
        LeftLevel RightLevel RelationLevel Bridge)
    (x : RelationCase) : Prop :=
  w.leftLocallyIntelligible x
  ∧ w.rightLocallyIntelligible x
  ∧ w.leftBurdenHolds x
  ∧ w.rightBurdenHolds x
  ∧ ¬ w.relationHolds x

def RelationFailureExists
    {LeftCase RightCase RelationCase Relation Invariant Demand
      LeftLevel RightLevel RelationLevel Bridge : Type u}
    (w :
      World LeftCase RightCase RelationCase Relation Invariant Demand
        LeftLevel RightLevel RelationLevel Bridge) : Prop :=
  ∃ x, RelationFailureCase w x

theorem relation_failure_not_left_side_failure
    {LeftCase RightCase RelationCase Relation Invariant Demand
      LeftLevel RightLevel RelationLevel Bridge : Type u}
    (w :
      World LeftCase RightCase RelationCase Relation Invariant Demand
        LeftLevel RightLevel RelationLevel Bridge)
    (x : RelationCase)
    (hRelationFail : RelationFailureCase w x) :
    ¬ LeftSideFailure w x := by
  intro hLeft
  exact hLeft.2.1 hRelationFail.2.2.1

theorem relation_failure_not_right_side_failure
    {LeftCase RightCase RelationCase Relation Invariant Demand
      LeftLevel RightLevel RelationLevel Bridge : Type u}
    (w :
      World LeftCase RightCase RelationCase Relation Invariant Demand
        LeftLevel RightLevel RelationLevel Bridge)
    (x : RelationCase)
    (hRelationFail : RelationFailureCase w x) :
    ¬ RightSideFailure w x := by
  intro hRight
  exact hRight.2.2 hRelationFail.2.2.2.1

/--
Positive whole-hold remains independently visible and is not folded into
`EquationQualified`.
-/
def SuccessfulRelationCase
    {LeftCase RightCase RelationCase Relation Invariant Demand
      LeftLevel RightLevel RelationLevel Bridge : Type u}
    (w :
      World LeftCase RightCase RelationCase Relation Invariant Demand
        LeftLevel RightLevel RelationLevel Bridge)
    (x : RelationCase) : Prop :=
  w.leftLocallyIntelligible x
  ∧ w.rightLocallyIntelligible x
  ∧ w.leftBurdenHolds x
  ∧ w.rightBurdenHolds x
  ∧ w.relationHolds x

def SuccessfulRelationHold
    {LeftCase RightCase RelationCase Relation Invariant Demand
      LeftLevel RightLevel RelationLevel Bridge : Type u}
    (w :
      World LeftCase RightCase RelationCase Relation Invariant Demand
        LeftLevel RightLevel RelationLevel Bridge) : Prop :=
  ∃ x, SuccessfulRelationCase w x

/-! --------------------------------------------------------------------------
Fit, invariant, and level burdens
---------------------------------------------------------------------------- -/

def LeftFitsRelation
    {LeftCase RightCase RelationCase Relation Invariant Demand
      LeftLevel RightLevel RelationLevel Bridge : Type u}
    (w :
      World LeftCase RightCase RelationCase Relation Invariant Demand
        LeftLevel RightLevel RelationLevel Bridge) : Prop :=
  ∃ x,
    w.leftLocallyIntelligible x
    ∧ w.leftBurdenHolds x

def RightFitsRelation
    {LeftCase RightCase RelationCase Relation Invariant Demand
      LeftLevel RightLevel RelationLevel Bridge : Type u}
    (w :
      World LeftCase RightCase RelationCase Relation Invariant Demand
        LeftLevel RightLevel RelationLevel Bridge) : Prop :=
  ∃ x,
    w.rightLocallyIntelligible x
    ∧ w.rightBurdenHolds x

theorem relation_failure_implies_both_fit
    {LeftCase RightCase RelationCase Relation Invariant Demand
      LeftLevel RightLevel RelationLevel Bridge : Type u}
    (w :
      World LeftCase RightCase RelationCase Relation Invariant Demand
        LeftLevel RightLevel RelationLevel Bridge)
    (hFailure : RelationFailureExists w) :
    LeftFitsRelation w ∧ RightFitsRelation w := by
  rcases hFailure with ⟨x, h⟩
  constructor
  · exact ⟨x, h.1, h.2.2.1⟩
  · exact ⟨x, h.2.1, h.2.2.2.1⟩

/--
Strong relation-owned invariant.

Both sides participate.
The relation owns the invariant.
Neither side alone nor mere aggregation is sufficient for the relation-owned
invariant burden.
-/
def StrongSharedInvariant
    {LeftCase RightCase RelationCase Relation Invariant Demand
      LeftLevel RightLevel RelationLevel Bridge : Type u}
    (w :
      World LeftCase RightCase RelationCase Relation Invariant Demand
        LeftLevel RightLevel RelationLevel Bridge) : Prop :=
  ∃ i,
    w.leftParticipatesInvariant i
    ∧ w.rightParticipatesInvariant i
    ∧ w.relationOwnsInvariant i
    ∧ ¬ w.leftAloneSufficient i
    ∧ ¬ w.rightAloneSufficient i
    ∧ ¬ w.mereAggregationSufficient i

def LevelAdmitted
    {LeftCase RightCase RelationCase Relation Invariant Demand
      LeftLevel RightLevel RelationLevel Bridge : Type u}
    (w :
      World LeftCase RightCase RelationCase Relation Invariant Demand
        LeftLevel RightLevel RelationLevel Bridge) : Prop :=
  w.levelCompatible
      w.leftLevel
      w.rightLevel
      w.relationLevel
  ∨
  ∃ b,
    w.bridge
      b
      w.leftLevel
      w.rightLevel
      w.relationLevel

/--
Machine-compressed equation qualification.

Independent side earning is carried structurally by the world itself.

Co-dependency contains the two distinct side-failure witnesses.
Relation failure contains local intelligibility under relation failure and
irreducibility from side failure.
-/
def EquationQualified
    {LeftCase RightCase RelationCase Relation Invariant Demand
      LeftLevel RightLevel RelationLevel Bridge : Type u}
    (w :
      World LeftCase RightCase RelationCase Relation Invariant Demand
        LeftLevel RightLevel RelationLevel Bridge) : Prop :=
  RelationCoDependent w
  ∧ RelationFailureExists w
  ∧ LevelAdmitted w
  ∧ StrongSharedInvariant w

/-! --------------------------------------------------------------------------
Projection into machine-closed Coherence
---------------------------------------------------------------------------- -/

inductive EquationPiece (Marker : Type u) : Type u
  | left
  | right

def LeftRecognized
    {LeftCase : Type u}
    (cert : SideEarningCertificate LeftCase) : Prop :=
  ∃ x,
    cert.eligible x
    ∧ cert.held x

def RightRecognized
    {RightCase : Type u}
    (cert : SideEarningCertificate RightCase) : Prop :=
  ∃ x,
    cert.eligible x
    ∧ cert.held x

def coherenceProjection
    {LeftCase RightCase RelationCase Relation Invariant Demand
      LeftLevel RightLevel RelationLevel Bridge : Type u}
    (w :
      World LeftCase RightCase RelationCase Relation Invariant Demand
        LeftLevel RightLevel RelationLevel Bridge) :
    Coherence.World (EquationPiece Relation) Relation Invariant where
  local₁ :=
    .left

  local₂ :=
    .right

  recognized :=
    fun p =>
      match p with
      | .left =>
          LeftRecognized w.leftEarning
      | .right =>
          RightRecognized w.rightEarning

  compatible :=
    fun a b =>
      match a, b with
      | .left, .right =>
          RelationCoDependent w
      | .right, .left =>
          RelationCoDependent w
      | _, _ =>
          False

  candidateWhole :=
    w.candidateRelation

  fits :=
    fun r p =>
      r = w.candidateRelation
      ∧
      match p with
      | .left =>
          LeftFitsRelation w
      | .right =>
          RightFitsRelation w

  heldAsOne :=
    fun r =>
      r = w.candidateRelation
      ∧ SuccessfulRelationHold w

  carriesInvariant :=
    fun p i =>
      match p with
      | .left =>
          w.leftParticipatesInvariant i
      | .right =>
          w.rightParticipatesInvariant i

  wholeOwnsInvariant :=
    fun r i =>
      r = w.candidateRelation
      ∧ w.relationOwnsInvariant i

theorem left_earning_implies_recognized
    {LeftCase : Type u}
    (cert : SideEarningCertificate LeftCase) :
    LeftRecognized cert := by
  exact cert.earned.heldWitness

theorem right_earning_implies_recognized
    {RightCase : Type u}
    (cert : SideEarningCertificate RightCase) :
    RightRecognized cert := by
  exact cert.earned.heldWitness

theorem qualified_implies_recognized_compatible
    {LeftCase RightCase RelationCase Relation Invariant Demand
      LeftLevel RightLevel RelationLevel Bridge : Type u}
    (w :
      World LeftCase RightCase RelationCase Relation Invariant Demand
        LeftLevel RightLevel RelationLevel Bridge)
    (hQualified : EquationQualified w) :
    Coherence.RecognizedCompatible (coherenceProjection w) := by
  refine ⟨?_, ?_, ?_, ?_, ?_⟩
  · simp [coherenceProjection]
  · exact left_earning_implies_recognized w.leftEarning
  · exact right_earning_implies_recognized w.rightEarning
  · simpa [coherenceProjection] using hQualified.1
  · simpa [coherenceProjection] using hQualified.1

theorem qualified_implies_global_fit
    {LeftCase RightCase RelationCase Relation Invariant Demand
      LeftLevel RightLevel RelationLevel Bridge : Type u}
    (w :
      World LeftCase RightCase RelationCase Relation Invariant Demand
        LeftLevel RightLevel RelationLevel Bridge)
    (hQualified : EquationQualified w) :
    Coherence.GlobalFit (coherenceProjection w) := by
  have hFit :
      LeftFitsRelation w ∧ RightFitsRelation w :=
    relation_failure_implies_both_fit
      w
      hQualified.2.1
  constructor
  · exact ⟨rfl, hFit.1⟩
  · exact ⟨rfl, hFit.2⟩

theorem strong_invariant_implies_coherence_shared_invariant
    {LeftCase RightCase RelationCase Relation Invariant Demand
      LeftLevel RightLevel RelationLevel Bridge : Type u}
    (w :
      World LeftCase RightCase RelationCase Relation Invariant Demand
        LeftLevel RightLevel RelationLevel Bridge)
    (hStrong : StrongSharedInvariant w) :
    Coherence.SharedInvariant (coherenceProjection w) := by
  rcases hStrong with
    ⟨i, hLeft, hRight, hOwns,
      _hLeftAlone, _hRightAlone, _hAggregate⟩
  exact
    ⟨i,
      hLeft,
      hRight,
      ⟨rfl, hOwns⟩⟩

theorem qualified_implies_shared_invariant
    {LeftCase RightCase RelationCase Relation Invariant Demand
      LeftLevel RightLevel RelationLevel Bridge : Type u}
    (w :
      World LeftCase RightCase RelationCase Relation Invariant Demand
        LeftLevel RightLevel RelationLevel Bridge)
    (hQualified : EquationQualified w) :
    Coherence.SharedInvariant (coherenceProjection w) := by
  exact
    strong_invariant_implies_coherence_shared_invariant
      w
      hQualified.2.2.2

/--
For an already-qualified candidate relation, generic Coherence contributes
exactly the remaining whole-hold burden.
-/
theorem qualified_coherence_iff_successful_relation_hold
    {LeftCase RightCase RelationCase Relation Invariant Demand
      LeftLevel RightLevel RelationLevel Bridge : Type u}
    (w :
      World LeftCase RightCase RelationCase Relation Invariant Demand
        LeftLevel RightLevel RelationLevel Bridge)
    (hQualified : EquationQualified w) :
    Coherence.Coheres (coherenceProjection w)
    ↔
    SuccessfulRelationHold w := by
  constructor
  · intro hCoheres
    exact hCoheres.1.2
  · intro hSuccess
    refine
      ⟨⟨rfl, hSuccess⟩,
       qualified_implies_global_fit w hQualified,
       qualified_implies_shared_invariant w hQualified⟩

def StrongEquationhood
    {LeftCase RightCase RelationCase Relation Invariant Demand
      LeftLevel RightLevel RelationLevel Bridge : Type u}
    (w :
      World LeftCase RightCase RelationCase Relation Invariant Demand
        LeftLevel RightLevel RelationLevel Bridge) : Prop :=
  EquationQualified w
  ∧
  Coherence.Coheres (coherenceProjection w)

theorem strong_equationhood_iff_qualified_success
    {LeftCase RightCase RelationCase Relation Invariant Demand
      LeftLevel RightLevel RelationLevel Bridge : Type u}
    (w :
      World LeftCase RightCase RelationCase Relation Invariant Demand
        LeftLevel RightLevel RelationLevel Bridge) :
    StrongEquationhood w
    ↔
    EquationQualified w
      ∧ SuccessfulRelationHold w := by
  constructor
  · intro hStrong
    exact
      ⟨hStrong.1,
       (qualified_coherence_iff_successful_relation_hold
          w hStrong.1).1 hStrong.2⟩
  · intro h
    exact
      ⟨h.1,
       (qualified_coherence_iff_successful_relation_hold
          w h.1).2 h.2⟩

theorem strong_equationhood_preserves_piece_nonidentity
    {LeftCase RightCase RelationCase Relation Invariant Demand
      LeftLevel RightLevel RelationLevel Bridge : Type u}
    (w :
      World LeftCase RightCase RelationCase Relation Invariant Demand
        LeftLevel RightLevel RelationLevel Bridge)
    (_hStrong : StrongEquationhood w) :
    (EquationPiece.left : EquationPiece Relation) ≠
      EquationPiece.right := by
  simp

/-! --------------------------------------------------------------------------
Generic relation-failure separator
---------------------------------------------------------------------------- -/

theorem relation_failure_is_irreducible_from_side_failures
    {LeftCase RightCase RelationCase Relation Invariant Demand
      LeftLevel RightLevel RelationLevel Bridge : Type u}
    (w :
      World LeftCase RightCase RelationCase Relation Invariant Demand
        LeftLevel RightLevel RelationLevel Bridge)
    (x : RelationCase)
    (hFailure : RelationFailureCase w x) :
    ¬ LeftSideFailure w x
    ∧
    ¬ RightSideFailure w x := by
  exact
    ⟨relation_failure_not_left_side_failure w x hFailure,
     relation_failure_not_right_side_failure w x hFailure⟩

/-! --------------------------------------------------------------------------
Finite side earning witness
---------------------------------------------------------------------------- -/

def demoSideRoute :
    FailureClosure.RouteSnapshot where
  produced := True
  persistenceEstablished := False
  persistenceCarriesUnderLoad := False
  boundaryDiscriminates := False
  cascadeInherits := False
  authorizationIncorporates := False

theorem demoSideRoute_wellFormed :
    FailureClosure.WellFormedRoute demoSideRoute := by
  constructor <;> simp [demoSideRoute]

theorem demoSideRoute_failure :
    FailureClosure.FoundationalFailure demoSideRoute := by
  simp [FailureClosure.FoundationalFailure, demoSideRoute]

def demoSideEligible (_ : Bool) : Prop :=
  True

def demoSideHeld (x : Bool) : Prop :=
  x = false

def demoSideFails (x : Bool) : Prop :=
  x = true

def demoSideShapeWitness
    (x : Bool)
    (s : FailureClosure.RouteSnapshot) : Prop :=
  x = true
  ∧ s = demoSideRoute

def demoSideArticulation :
    FailureDiscrimination.RegimeArticulation
      demoSideEligible
      demoSideFails where
  shapeWitness :=
    demoSideShapeWitness

  witnessCaseInScope := by
    intro x s _h
    trivial

  witnessWellFormed := by
    intro x s h
    rcases h with ⟨_hx, rfl⟩
    exact demoSideRoute_wellFormed

  witnessIsFoundationalFailureShape := by
    intro x s h
    rcases h with ⟨_hx, rfl⟩
    exact demoSideRoute_failure

  matchedCaseHasShapeWitness := by
    intro x hFail
    exact
      ⟨demoSideRoute,
       ⟨hFail, rfl⟩⟩

def demoSideEarned :
    FailureDiscrimination.EarnedSignature
      demoSideEligible
      demoSideHeld
      demoSideFails where
  heldInScope := by
    intro x _h
    trivial

  matchInScope := by
    intro x _h
    trivial

  disjoint := by
    intro x hHeld hFail
    cases x <;>
      simp [demoSideHeld, demoSideFails] at hHeld hFail

  exhaustive := by
    intro x _hEligible hNotHeld
    cases x <;>
      simp [demoSideHeld, demoSideFails] at hNotHeld ⊢

  heldWitness :=
    ⟨false, by trivial, rfl⟩

  failureWitness :=
    ⟨true, by trivial, rfl⟩

  articulation :=
    demoSideArticulation

def demoSideCertificate :
    SideEarningCertificate Bool where
  eligible :=
    demoSideEligible

  held :=
    demoSideHeld

  fails :=
    demoSideFails

  earned :=
    demoSideEarned

/-! --------------------------------------------------------------------------
Finite equation worlds
---------------------------------------------------------------------------- -/

inductive DemoRelationCase
  | success
  | relationFail
  | leftBefore
  | leftAfter
  | rightBefore
  | rightAfter
  deriving DecidableEq

inductive DemoRelation
  | omega

inductive DemoInvariant
  | shared

def demoLeftIntelligible
    (x : DemoRelationCase) : Prop :=
  match x with
  | .leftAfter => False
  | _ => True

def demoRightIntelligible
    (x : DemoRelationCase) : Prop :=
  match x with
  | .rightAfter => False
  | _ => True

def demoLeftBurden
    (x : DemoRelationCase) : Prop :=
  match x with
  | .leftAfter => False
  | _ => True

def demoRightBurden
    (x : DemoRelationCase) : Prop :=
  match x with
  | .rightAfter => False
  | _ => True

def demoRelationHolds
    (successEnabled : Bool)
    (x : DemoRelationCase) : Prop :=
  successEnabled = true
  ∧ x = .success

def demoDemandOnRight
    (x : DemoRelationCase)
    (d : Bool) : Prop :=
  match x with
  | .leftBefore =>
      d = false
  | .leftAfter =>
      d = true
  | _ =>
      False

def demoDemandOnLeft
    (x : DemoRelationCase)
    (d : Bool) : Prop :=
  match x with
  | .rightBefore =>
      d = false
  | .rightAfter =>
      d = true
  | _ =>
      False

def demoEquationWorld
    (successEnabled : Bool)
    (strongInvariantEnabled : Bool) :
    World
      Bool
      Bool
      DemoRelationCase
      DemoRelation
      DemoInvariant
      Bool
      Unit
      Unit
      Unit
      Unit where
  leftEarning :=
    demoSideCertificate

  rightEarning :=
    demoSideCertificate

  candidateRelation :=
    .omega

  leftLocallyIntelligible :=
    demoLeftIntelligible

  rightLocallyIntelligible :=
    demoRightIntelligible

  leftBurdenHolds :=
    demoLeftBurden

  rightBurdenHolds :=
    demoRightBurden

  relationHolds :=
    demoRelationHolds successEnabled

  demandOnLeft :=
    demoDemandOnLeft

  demandOnRight :=
    demoDemandOnRight

  leftFailurePassage :=
    fun before after =>
      before = .leftBefore
      ∧ after = .leftAfter

  rightFailurePassage :=
    fun before after =>
      before = .rightBefore
      ∧ after = .rightAfter

  leftParticipatesInvariant :=
    fun _ => True

  rightParticipatesInvariant :=
    fun _ => True

  relationOwnsInvariant :=
    fun _ => True

  leftAloneSufficient :=
    fun _ => strongInvariantEnabled = false

  rightAloneSufficient :=
    fun _ => False

  mereAggregationSufficient :=
    fun _ => False

  leftLevel :=
    ()

  rightLevel :=
    ()

  relationLevel :=
    ()

  levelCompatible :=
    fun _ _ _ => True

  bridge :=
    fun _ _ _ _ => False

theorem demo_relation_co_dependent
    (successEnabled strongInvariantEnabled : Bool) :
    RelationCoDependent
      (demoEquationWorld
        successEnabled
        strongInvariantEnabled) := by
  constructor
  · exact
      ⟨.leftBefore,
       .leftAfter,
       false,
       true,
       by
         simp [FacingReference, demoEquationWorld,
           demoLeftIntelligible, demoRightIntelligible,
           demoLeftBurden, demoRightBurden],
       by simp [demoEquationWorld],
       by
         simp [LeftSideFailure, demoEquationWorld,
           demoRightIntelligible, demoLeftBurden, demoRightBurden],
       by simp [demoEquationWorld, demoDemandOnRight],
       by simp [demoEquationWorld, demoDemandOnRight],
       by decide⟩
  · exact
      ⟨.rightBefore,
       .rightAfter,
       false,
       true,
       by
         simp [FacingReference, demoEquationWorld,
           demoLeftIntelligible, demoRightIntelligible,
           demoLeftBurden, demoRightBurden],
       by simp [demoEquationWorld],
       by
         simp [RightSideFailure, demoEquationWorld,
           demoLeftIntelligible, demoLeftBurden, demoRightBurden],
       by simp [demoEquationWorld, demoDemandOnLeft],
       by simp [demoEquationWorld, demoDemandOnLeft],
       by decide⟩

theorem demo_relation_failure
    (successEnabled strongInvariantEnabled : Bool) :
    RelationFailureExists
      (demoEquationWorld
        successEnabled
        strongInvariantEnabled) := by
  exact
    ⟨.relationFail,
     by
       simp [RelationFailureCase, demoEquationWorld,
         demoLeftIntelligible, demoRightIntelligible,
         demoLeftBurden, demoRightBurden, demoRelationHolds]⟩

theorem demo_level_admitted
    (successEnabled strongInvariantEnabled : Bool) :
    LevelAdmitted
      (demoEquationWorld
        successEnabled
        strongInvariantEnabled) := by
  left
  trivial

theorem demo_strong_invariant :
    StrongSharedInvariant
      (demoEquationWorld true true) := by
  exact
    ⟨.shared,
     by trivial,
     by trivial,
     by trivial,
     by simp [demoEquationWorld],
     by simp [demoEquationWorld],
     by simp [demoEquationWorld]⟩

theorem demo_qualified_success_world :
    EquationQualified
      (demoEquationWorld true true) := by
  exact
    ⟨demo_relation_co_dependent true true,
     demo_relation_failure true true,
     demo_level_admitted true true,
     demo_strong_invariant⟩

theorem demo_successful_relation_hold :
    SuccessfulRelationHold
      (demoEquationWorld true true) := by
  exact
    ⟨.success,
     by
       simp [SuccessfulRelationCase, demoEquationWorld,
         demoLeftIntelligible, demoRightIntelligible,
         demoLeftBurden, demoRightBurden, demoRelationHolds]⟩

theorem demo_strong_equationhood :
    StrongEquationhood
      (demoEquationWorld true true) := by
  exact
    (strong_equationhood_iff_qualified_success
      (demoEquationWorld true true)).2
      ⟨demo_qualified_success_world,
       demo_successful_relation_hold⟩

/--
Qualification can hold while successful whole-hold does not.
-/
theorem qualified_without_coherence_whole_hold :
    EquationQualified
      (demoEquationWorld false true)
    ∧
    ¬ SuccessfulRelationHold
      (demoEquationWorld false true)
    ∧
    ¬ StrongEquationhood
      (demoEquationWorld false true) := by
  have hQualified :
      EquationQualified
        (demoEquationWorld false true) := by
    exact
      ⟨demo_relation_co_dependent false true,
       demo_relation_failure false true,
       demo_level_admitted false true,
       by
         exact
           ⟨.shared,
            by trivial,
            by trivial,
            by trivial,
            by simp [demoEquationWorld],
            by simp [demoEquationWorld],
            by simp [demoEquationWorld]⟩⟩
  have hNoSuccess :
      ¬ SuccessfulRelationHold
        (demoEquationWorld false true) := by
    intro hSuccess
    rcases hSuccess with ⟨x, hCase⟩
    exact
      (by
        simpa [SuccessfulRelationCase, demoEquationWorld,
          demoRelationHolds] using hCase.2.2.2.2)
  have hNoStrong :
      ¬ StrongEquationhood
        (demoEquationWorld false true) := by
    intro hStrong
    have hSuccess :
        SuccessfulRelationHold
          (demoEquationWorld false true) :=
      (strong_equationhood_iff_qualified_success
        (demoEquationWorld false true)).1
        hStrong
      |>.2
    exact hNoSuccess hSuccess
  exact ⟨hQualified, hNoSuccess, hNoStrong⟩

/--
Generic Coherence can hold while the strong relation-owned invariant
anti-collapse condition fails.
-/
theorem coherence_without_strong_equationhood :
    Coherence.Coheres
      (coherenceProjection
        (demoEquationWorld true false))
    ∧
    ¬ StrongSharedInvariant
      (demoEquationWorld true false)
    ∧
    ¬ StrongEquationhood
      (demoEquationWorld true false) := by
  have hFailure :=
    demo_relation_failure true false
  have hBothFit :
      LeftFitsRelation (demoEquationWorld true false)
      ∧ RightFitsRelation (demoEquationWorld true false) :=
    relation_failure_implies_both_fit
      (demoEquationWorld true false)
      hFailure
  have hFit :
      Coherence.GlobalFit
        (coherenceProjection
          (demoEquationWorld true false)) := by
    constructor
    · exact ⟨rfl, hBothFit.1⟩
    · exact ⟨rfl, hBothFit.2⟩
  have hShared :
      Coherence.SharedInvariant
        (coherenceProjection
          (demoEquationWorld true false)) := by
    exact
      ⟨.shared,
       by trivial,
       by trivial,
       ⟨rfl, by trivial⟩⟩
  have hSuccess :
      SuccessfulRelationHold
        (demoEquationWorld true false) := by
    exact
      ⟨.success,
       by
         simp [SuccessfulRelationCase, demoEquationWorld,
           demoLeftIntelligible, demoRightIntelligible,
           demoLeftBurden, demoRightBurden, demoRelationHolds]⟩
  have hCoheres :
      Coherence.Coheres
        (coherenceProjection
          (demoEquationWorld true false)) := by
    exact
      ⟨⟨rfl, hSuccess⟩,
       hFit,
       hShared⟩
  have hNotStrongInvariant :
      ¬ StrongSharedInvariant
        (demoEquationWorld true false) := by
    intro hStrong
    rcases hStrong with
      ⟨i, _hLeft, _hRight, _hOwns,
        hNotLeftAlone, _hNotRightAlone, _hNotAggregate⟩
    exact
      hNotLeftAlone
        (by
          cases i
          simp [demoEquationWorld])
  have hNotStrongEquationhood :
      ¬ StrongEquationhood
        (demoEquationWorld true false) := by
    intro hStrong
    exact hNotStrongInvariant hStrong.1.2.2.2
  exact
    ⟨hCoheres,
     hNotStrongInvariant,
     hNotStrongEquationhood⟩

/-! --------------------------------------------------------------------------
First semantic machine checkpoint
---------------------------------------------------------------------------- -/

theorem strong_equationhood_machine_checkpoint :
    StrongEquationhood
      (demoEquationWorld true true)
    ∧
    (
      EquationQualified
        (demoEquationWorld false true)
      ∧
      ¬ StrongEquationhood
        (demoEquationWorld false true)
    )
    ∧
    (
      Coherence.Coheres
        (coherenceProjection
          (demoEquationWorld true false))
      ∧
      ¬ StrongEquationhood
        (demoEquationWorld true false)
    )
    ∧
    (EquationPiece.left : EquationPiece DemoRelation) ≠
      EquationPiece.right := by
  constructor
  · exact demo_strong_equationhood
  constructor
  · exact
      ⟨qualified_without_coherence_whole_hold.1,
       qualified_without_coherence_whole_hold.2.2⟩
  constructor
  · exact
      ⟨coherence_without_strong_equationhood.1,
       coherence_without_strong_equationhood.2.2⟩
  · simp

end StrongEquationhood
end StructuralFlow


/-!
===============================================================================
STRONG EQUATIONHOOD +3 / FAILURE-SIDE — PUBLIC CLOSURE MODULE
Historical derivation line: closure attempt v0.3
===============================================================================

Antecedent
----------
Strong Equationhood Kernel Attempt v0.2 — clean Lean pass.

Purpose
-------
Pressure the already-passing semantic Strong Equationhood object through:

1. the machine-closed +3 answer core; and
2. the machine-closed Failure-Side Discrimination theorem.

No semantic change is made to the v0.2 equationhood definitions.

Important interpretation
------------------------
The canonical foundational articulation used below is Lock-shaped.

This does NOT identify:
  failed strong equationhood = foundational Lock.

It says only:
  the relation-level failure signature may be articulated through an already
  closed Lock-shaped route when both side burdens survive but whole relation
  incorporation / whole-hold is absent.

This is a shape projection, not a literal historical claim.
-/

namespace StructuralFlow
namespace StrongEquationhood

/-! --------------------------------------------------------------------------
Exact relation-object case predicates
---------------------------------------------------------------------------- -/

/--
The same-level survivor surface for the relation object:
both sides remain locally intelligible and both side burdens remain live.
-/
def EquationSurfaceEligible
    {LeftCase RightCase RelationCase Relation Invariant Demand
      LeftLevel RightLevel RelationLevel Bridge : Type u}
    (w :
      World LeftCase RightCase RelationCase Relation Invariant Demand
        LeftLevel RightLevel RelationLevel Bridge)
    (x : RelationCase) : Prop :=
  FacingReference w x

/--
Case-level held condition for Strong Equationhood.

The relation is already qualified and the relation actually holds while both
side burdens remain live.
-/
def StrongEquationCase
    {LeftCase RightCase RelationCase Relation Invariant Demand
      LeftLevel RightLevel RelationLevel Bridge : Type u}
    (w :
      World LeftCase RightCase RelationCase Relation Invariant Demand
        LeftLevel RightLevel RelationLevel Bridge)
    (x : RelationCase) : Prop :=
  EquationQualified w
  ∧ SuccessfulRelationCase w x

/--
Case-level relation failure for an already-qualified candidate.

Both side burdens survive; the relation itself does not hold.
-/
def QualifiedRelationFailureCase
    {LeftCase RightCase RelationCase Relation Invariant Demand
      LeftLevel RightLevel RelationLevel Bridge : Type u}
    (w :
      World LeftCase RightCase RelationCase Relation Invariant Demand
        LeftLevel RightLevel RelationLevel Bridge)
    (x : RelationCase) : Prop :=
  EquationQualified w
  ∧ RelationFailureCase w x

/--
Fixed object-discrimination surface for a qualified relation.
-/
def EquationObjectEligible
    {LeftCase RightCase RelationCase Relation Invariant Demand
      LeftLevel RightLevel RelationLevel Bridge : Type u}
    (w :
      World LeftCase RightCase RelationCase Relation Invariant Demand
        LeftLevel RightLevel RelationLevel Bridge)
    (x : RelationCase) : Prop :=
  EquationQualified w
  ∧ EquationSurfaceEligible w x

theorem strong_equation_case_in_scope
    {LeftCase RightCase RelationCase Relation Invariant Demand
      LeftLevel RightLevel RelationLevel Bridge : Type u}
    (w :
      World LeftCase RightCase RelationCase Relation Invariant Demand
        LeftLevel RightLevel RelationLevel Bridge)
    (x : RelationCase)
    (h : StrongEquationCase w x) :
    EquationObjectEligible w x := by
  exact
    ⟨h.1,
     h.2.1,
     h.2.2.1,
     h.2.2.2.1,
     h.2.2.2.2.1⟩

theorem qualified_relation_failure_in_scope
    {LeftCase RightCase RelationCase Relation Invariant Demand
      LeftLevel RightLevel RelationLevel Bridge : Type u}
    (w :
      World LeftCase RightCase RelationCase Relation Invariant Demand
        LeftLevel RightLevel RelationLevel Bridge)
    (x : RelationCase)
    (h : QualifiedRelationFailureCase w x) :
    EquationObjectEligible w x := by
  exact
    ⟨h.1,
     h.2.1,
     h.2.2.1,
     h.2.2.2.1,
     h.2.2.2.2.1⟩

theorem strong_equationhood_iff_exists_strong_equation_case
    {LeftCase RightCase RelationCase Relation Invariant Demand
      LeftLevel RightLevel RelationLevel Bridge : Type u}
    (w :
      World LeftCase RightCase RelationCase Relation Invariant Demand
        LeftLevel RightLevel RelationLevel Bridge) :
    StrongEquationhood w
    ↔
    ∃ x, StrongEquationCase w x := by
  constructor
  · intro hStrong
    have hQS :
        EquationQualified w
        ∧ SuccessfulRelationHold w :=
      (strong_equationhood_iff_qualified_success w).1 hStrong
    rcases hQS.2 with ⟨x, hSuccess⟩
    exact ⟨x, hQS.1, hSuccess⟩
  · intro h
    rcases h with ⟨x, hQualified, hSuccess⟩
    exact
      (strong_equationhood_iff_qualified_success w).2
        ⟨hQualified, ⟨x, hSuccess⟩⟩

/-! --------------------------------------------------------------------------
Explicit +3 loss-passage evidence
---------------------------------------------------------------------------- -/

/--
Independent structural-comparison evidence for the +3 capacity-loss burden.

`passage` is supplied rather than predicted by the machine.

The fixed world already carries:
* the same candidate relation;
* the same side earning certificates;
* the same relation-specific qualification package.

The passage therefore compares two states of one declared relation object.
-/
structure EquationLossPassageEvidence
    {LeftCase RightCase RelationCase Relation Invariant Demand
      LeftLevel RightLevel RelationLevel Bridge : Type u}
    (w :
      World LeftCase RightCase RelationCase Relation Invariant Demand
        LeftLevel RightLevel RelationLevel Bridge) : Type u where
  passage :
    RelationCase → RelationCase → Prop

  before :
    RelationCase

  after :
    RelationCase

  beforeStrong :
    StrongEquationCase w before

  afterFailure :
    QualifiedRelationFailureCase w after

  admittedPassage :
    passage before after

/-! --------------------------------------------------------------------------
Strong Equationhood +3 answer core
---------------------------------------------------------------------------- -/

inductive EquationCandidateTag (Marker : Type u) : Type u
  | strongEquationhood

inductive EquationLevelTag (Marker : Type u) : Type u
  | declaredLevel

inductive EquationScopeTag (Marker : Type u) : Type u
  | declaredScope

inductive EquationJobTag (Marker : Type u) : Type u
  | jointRelationHoldJob

inductive EquationCapacityTag (Marker : Type u) : Type u
  | coherenceLicensedJointHold

/--
Semantic weakening order.

`s` is strictly thinner than `t` when every t-case is admitted by s and s
admits at least one additional case.
-/
def EquationStrictlyThinner
    {Case : Type u}
    (s t : Case → Prop) : Prop :=
  (∀ x, t x → s x)
  ∧
  ∃ x, s x ∧ ¬ t x

/--
The relation-object job is independently visible when the same fixed candidate
admits:
* a qualified successful whole-hold case; and
* a qualified relation-failure case with the side burdens still live.
-/
def EquationStructuralJobEarned
    {LeftCase RightCase RelationCase Relation Invariant Demand
      LeftLevel RightLevel RelationLevel Bridge : Type u}
    (w :
      World LeftCase RightCase RelationCase Relation Invariant Demand
        LeftLevel RightLevel RelationLevel Bridge) : Prop :=
  ∃ before after,
    StrongEquationCase w before
    ∧ QualifiedRelationFailureCase w after

/--
An honest Strong Equationhood shape must preserve:
* equation qualification; and
* the same side-survivor surface.

This prevents a purported weaker shape from performing the equationhood job by
dropping one of the side burdens or changing the candidate object.
-/
def EquationHonestShape
    {LeftCase RightCase RelationCase Relation Invariant Demand
      LeftLevel RightLevel RelationLevel Bridge : Type u}
    (w :
      World LeftCase RightCase RelationCase Relation Invariant Demand
        LeftLevel RightLevel RelationLevel Bridge)
    (s : RelationCase → Prop) : Prop :=
  ∀ x,
    s x →
    EquationObjectEligible w x

/--
A candidate shape performs the selected equationhood job when every admitted
case actually carries the relation whole-hold predicate.

Combined with `EquationHonestShape`, this reconstructs `StrongEquationCase`.
-/
def EquationShapePerformsJob
    {LeftCase RightCase RelationCase Relation Invariant Demand
      LeftLevel RightLevel RelationLevel Bridge : Type u}
    (w :
      World LeftCase RightCase RelationCase Relation Invariant Demand
        LeftLevel RightLevel RelationLevel Bridge)
    (s : RelationCase → Prop) : Prop :=
  ∀ x,
    s x →
    w.relationHolds x

def equationPlusThreeAnswerWorld
    {LeftCase RightCase RelationCase Relation Invariant Demand
      LeftLevel RightLevel RelationLevel Bridge : Type u}
    (w :
      World LeftCase RightCase RelationCase Relation Invariant Demand
        LeftLevel RightLevel RelationLevel Bridge)
    (loss : EquationLossPassageEvidence w) :
    PlusThree.World
      (EquationCandidateTag RelationCase)
      (EquationLevelTag RelationCase)
      (EquationScopeTag RelationCase)
      (EquationJobTag RelationCase)
      (RelationCase → Prop)
      (EquationCapacityTag RelationCase)
      RelationCase where
  selectedCandidate :=
    .strongEquationhood

  selectedLevel :=
    .declaredLevel

  selectedScope :=
    .declaredScope

  selectedJob :=
    .jointRelationHoldJob

  selectedShape :=
    StrongEquationCase w

  selectedCapacity :=
    .coherenceLicensedJointHold

  structuralJob :=
    fun _candidate _level _scope _job =>
      EquationStructuralJobEarned w

  honestShape :=
    fun _candidate _level _scope s =>
      EquationHonestShape w s

  performs :=
    fun s _job =>
      EquationShapePerformsJob w s

  strictlyThinner :=
    EquationStrictlyThinner

  caseInScope :=
    fun _candidate _level _scope x =>
      EquationObjectEligible w x

  shapeHolds :=
    fun s x =>
      s x

  failurePassage :=
    loss.passage

  shapeFails :=
    fun s x =>
      ¬ s x

  capacityAvailable :=
    fun _capacity x =>
      w.relationHolds x

  adjacentAbsorptionTested :=
    False

  falseSubstituteTested :=
    False

  levelShiftTested :=
    False

  scopeShiftTested :=
    False

  internalInflationTested :=
    False

  neededAtAllTested :=
    False

  candidateSurvives :=
    False

  objectClosed :=
    False

theorem equation_plus_three_job_fidelity
    {LeftCase RightCase RelationCase Relation Invariant Demand
      LeftLevel RightLevel RelationLevel Bridge : Type u}
    (w :
      World LeftCase RightCase RelationCase Relation Invariant Demand
        LeftLevel RightLevel RelationLevel Bridge)
    (loss : EquationLossPassageEvidence w) :
    PlusThree.JobFidelity
      (equationPlusThreeAnswerWorld w loss) := by
  exact
    ⟨loss.before,
     loss.after,
     loss.beforeStrong,
     loss.afterFailure⟩

theorem equation_plus_three_shape_fidelity
    {LeftCase RightCase RelationCase Relation Invariant Demand
      LeftLevel RightLevel RelationLevel Bridge : Type u}
    (w :
      World LeftCase RightCase RelationCase Relation Invariant Demand
        LeftLevel RightLevel RelationLevel Bridge)
    (loss : EquationLossPassageEvidence w) :
    PlusThree.ShapeFidelity
      (equationPlusThreeAnswerWorld w loss) := by
  constructor
  · intro x hStrong
    exact strong_equation_case_in_scope w x hStrong
  constructor
  · intro x hStrong
    exact hStrong.2.2.2.2.2
  · intro thinner hThinner hBad
    rcases hThinner.2 with
      ⟨x, hThinX, hNotStrongX⟩
    have hEligible :
        EquationObjectEligible w x :=
      hBad.1 x hThinX
    have hRelation :
        w.relationHolds x :=
      hBad.2 x hThinX
    have hSuccess :
        SuccessfulRelationCase w x :=
      ⟨hEligible.2.1,
       hEligible.2.2.1,
       hEligible.2.2.2.1,
       hEligible.2.2.2.2,
       hRelation⟩
    exact
      hNotStrongX
        ⟨hEligible.1, hSuccess⟩

theorem equation_plus_three_capacity_loss_fidelity
    {LeftCase RightCase RelationCase Relation Invariant Demand
      LeftLevel RightLevel RelationLevel Bridge : Type u}
    (w :
      World LeftCase RightCase RelationCase Relation Invariant Demand
        LeftLevel RightLevel RelationLevel Bridge)
    (loss : EquationLossPassageEvidence w) :
    PlusThree.CapacityLossFidelity
      (equationPlusThreeAnswerWorld w loss) := by
  refine
    ⟨loss.before,
     loss.after,
     ?_,
     ?_,
     ?_,
     ?_,
     ?_,
     ?_,
     ?_⟩
  · exact
      strong_equation_case_in_scope
        w loss.before loss.beforeStrong
  · exact
      qualified_relation_failure_in_scope
        w loss.after loss.afterFailure
  · exact loss.beforeStrong
  · exact loss.beforeStrong.2.2.2.2.2
  · exact loss.admittedPassage
  · intro hAfterStrong
    exact
      loss.afterFailure.2.2.2.2.2
        hAfterStrong.2.2.2.2.2
  · exact loss.afterFailure.2.2.2.2.2

theorem strong_equationhood_plus_three_answer_core
    {LeftCase RightCase RelationCase Relation Invariant Demand
      LeftLevel RightLevel RelationLevel Bridge : Type u}
    (w :
      World LeftCase RightCase RelationCase Relation Invariant Demand
        LeftLevel RightLevel RelationLevel Bridge)
    (loss : EquationLossPassageEvidence w) :
    PlusThree.JobFidelity
        (equationPlusThreeAnswerWorld w loss)
    ∧
    PlusThree.ShapeFidelity
        (equationPlusThreeAnswerWorld w loss)
    ∧
    PlusThree.CapacityLossFidelity
        (equationPlusThreeAnswerWorld w loss) := by
  exact
    ⟨equation_plus_three_job_fidelity w loss,
     equation_plus_three_shape_fidelity w loss,
     equation_plus_three_capacity_loss_fidelity w loss⟩

theorem strong_equationhood_object_answer_endpoint
    {LeftCase RightCase RelationCase Relation Invariant Demand
      LeftLevel RightLevel RelationLevel Bridge : Type u}
    (w :
      World LeftCase RightCase RelationCase Relation Invariant Demand
        LeftLevel RightLevel RelationLevel Bridge)
    (loss : EquationLossPassageEvidence w) :
    PlusThree.ObjectAnswerEndpoint
      (equationPlusThreeAnswerWorld w loss) := by
  apply
    (PlusThree.object_answer_endpoint_iff_plus_three
      (equationPlusThreeAnswerWorld w loss)).mpr
  exact
    strong_equationhood_plus_three_answer_core
      w loss

/--
Firewall:
the +3 answer-core instance does not claim that the six downstream pressure
adjudications have been machine-completed.
-/
theorem strong_equationhood_answer_core_does_not_smuggle_pressure_completion
    {LeftCase RightCase RelationCase Relation Invariant Demand
      LeftLevel RightLevel RelationLevel Bridge : Type u}
    (w :
      World LeftCase RightCase RelationCase Relation Invariant Demand
        LeftLevel RightLevel RelationLevel Bridge)
    (loss : EquationLossPassageEvidence w) :
    ¬ PlusThree.PressureAdjudicated
        (equationPlusThreeAnswerWorld w loss) := by
  intro h
  exact h.1

/-! --------------------------------------------------------------------------
Canonical Lock-shaped articulation of relation whole-hold failure
---------------------------------------------------------------------------- -/

def relationLockRoute :
    FailureClosure.RouteSnapshot where
  produced :=
    True

  persistenceEstablished :=
    True

  persistenceCarriesUnderLoad :=
    True

  boundaryDiscriminates :=
    True

  cascadeInherits :=
    True

  authorizationIncorporates :=
    False

theorem relationLockRoute_wellFormed :
    FailureClosure.WellFormedRoute
      relationLockRoute := by
  constructor <;> simp [relationLockRoute]

theorem relationLockRoute_foundational_failure :
    FailureClosure.FoundationalFailure
      relationLockRoute := by
  simp [FailureClosure.FoundationalFailure, relationLockRoute]

theorem relationLockRoute_is_lock :
    FailureClosure.Lock
      relationLockRoute := by
  simp [FailureClosure.Lock, relationLockRoute]

def relationRegimeArticulation
    {LeftCase RightCase RelationCase Relation Invariant Demand
      LeftLevel RightLevel RelationLevel Bridge : Type u}
    (w :
      World LeftCase RightCase RelationCase Relation Invariant Demand
        LeftLevel RightLevel RelationLevel Bridge) :
    FailureDiscrimination.RegimeArticulation
      (EquationObjectEligible w)
      (QualifiedRelationFailureCase w) where
  shapeWitness :=
    fun x s =>
      QualifiedRelationFailureCase w x
      ∧ s = relationLockRoute

  witnessCaseInScope := by
    intro x s h
    exact
      qualified_relation_failure_in_scope
        w x h.1

  witnessWellFormed := by
    intro x s h
    rcases h with ⟨_hFail, rfl⟩
    exact relationLockRoute_wellFormed

  witnessIsFoundationalFailureShape := by
    intro x s h
    rcases h with ⟨_hFail, rfl⟩
    exact relationLockRoute_foundational_failure

  matchedCaseHasShapeWitness := by
    intro x hFail
    exact
      ⟨relationLockRoute,
       hFail,
       rfl⟩

/-! --------------------------------------------------------------------------
Earned relation-object failure signature
---------------------------------------------------------------------------- -/

def relationEarnedSignature
    {LeftCase RightCase RelationCase Relation Invariant Demand
      LeftLevel RightLevel RelationLevel Bridge : Type u}
    (w :
      World LeftCase RightCase RelationCase Relation Invariant Demand
        LeftLevel RightLevel RelationLevel Bridge)
    (loss : EquationLossPassageEvidence w) :
    FailureDiscrimination.EarnedSignature
      (EquationObjectEligible w)
      (StrongEquationCase w)
      (QualifiedRelationFailureCase w) where
  heldInScope := by
    intro x hHeld
    exact
      strong_equation_case_in_scope
        w x hHeld

  matchInScope := by
    intro x hFail
    exact
      qualified_relation_failure_in_scope
        w x hFail

  disjoint := by
    intro x hHeld hFail
    exact
      hFail.2.2.2.2.2
        hHeld.2.2.2.2.2

  exhaustive := by
    intro x hEligible hNotHeld
    have hNotRelation :
        ¬ w.relationHolds x := by
      intro hRelation
      apply hNotHeld
      exact
        ⟨hEligible.1,
         hEligible.2.1,
         hEligible.2.2.1,
         hEligible.2.2.2.1,
         hEligible.2.2.2.2,
         hRelation⟩
    exact
      ⟨hEligible.1,
       hEligible.2.1,
       hEligible.2.2.1,
       hEligible.2.2.2.1,
       hEligible.2.2.2.2,
       hNotRelation⟩

  heldWitness :=
    ⟨loss.before,
     strong_equation_case_in_scope
       w loss.before loss.beforeStrong,
     loss.beforeStrong⟩

  failureWitness :=
    ⟨loss.after,
     qualified_relation_failure_in_scope
       w loss.after loss.afterFailure,
     loss.afterFailure⟩

  articulation :=
    relationRegimeArticulation w

/-! --------------------------------------------------------------------------
Same-level survivor surface
---------------------------------------------------------------------------- -/

inductive RelationNeighbor (Marker : Type u) : Type u
  | leftBurden
  | rightBurden

def relationDiscriminationSurface
    {LeftCase RightCase RelationCase Relation Invariant Demand
      LeftLevel RightLevel RelationLevel Bridge : Type u}
    (w :
      World LeftCase RightCase RelationCase Relation Invariant Demand
        LeftLevel RightLevel RelationLevel Bridge) :
    FailureDiscrimination.DiscriminationSurface
      RelationCase
      (RelationNeighbor RelationCase) where
  eligible :=
    EquationObjectEligible w

  relevant :=
    fun _ => True

  neighborHolds :=
    fun n x =>
      match n with
      | .leftBurden =>
          w.leftBurdenHolds x
      | .rightBurden =>
          w.rightBurdenHolds x

  relevantNeighborsStable := by
    intro x hEligible n _hRelevant
    cases n with
    | leftBurden =>
        exact hEligible.2.2.2.1
    | rightBurden =>
        exact hEligible.2.2.2.2

theorem qualified_relation_failure_preserves_side_burdens
    {LeftCase RightCase RelationCase Relation Invariant Demand
      LeftLevel RightLevel RelationLevel Bridge : Type u}
    (w :
      World LeftCase RightCase RelationCase Relation Invariant Demand
        LeftLevel RightLevel RelationLevel Bridge)
    (loss : EquationLossPassageEvidence w)
    (x : RelationCase)
    (hFail : QualifiedRelationFailureCase w x) :
    ∀ n,
      (relationDiscriminationSurface w).relevant n →
      (relationDiscriminationSurface w).neighborHolds n x := by
  exact
    FailureDiscrimination.failure_preserves_declared_relevant_neighbors
      (relationDiscriminationSurface w)
      (relationEarnedSignature w loss)
      x
      hFail

/--
Every qualified relation-failure case has the canonical Lock-shaped
articulation witness.

Again:
this is articulation THROUGH Lock, not object/regime identity.
-/
theorem qualified_relation_failure_has_lock_articulation
    {LeftCase RightCase RelationCase Relation Invariant Demand
      LeftLevel RightLevel RelationLevel Bridge : Type u}
    (w :
      World LeftCase RightCase RelationCase Relation Invariant Demand
        LeftLevel RightLevel RelationLevel Bridge)
    (x : RelationCase)
    (hFail : QualifiedRelationFailureCase w x) :
    ∃ s,
      (relationRegimeArticulation w).shapeWitness x s
      ∧ FailureClosure.Lock s := by
  exact
    ⟨relationLockRoute,
     ⟨hFail, rfl⟩,
     relationLockRoute_is_lock⟩

theorem strong_equationhood_failure_side_semantic_closure
    {LeftCase RightCase RelationCase Relation Invariant Demand
      LeftLevel RightLevel RelationLevel Bridge : Type u}
    (w :
      World LeftCase RightCase RelationCase Relation Invariant Demand
        LeftLevel RightLevel RelationLevel Bridge)
    (loss : EquationLossPassageEvidence w) :
    (∀ x,
      EquationObjectEligible w x →
      (
        QualifiedRelationFailureCase w x
        ↔
        ¬ StrongEquationCase w x
      ))
    ∧
    (∀ x,
      QualifiedRelationFailureCase w x →
      ∀ n,
        (relationDiscriminationSurface w).relevant n →
        (relationDiscriminationSurface w).neighborHolds n x)
    ∧
    (∀ x,
      QualifiedRelationFailureCase w x →
      ∃ s,
        (relationEarnedSignature w loss).articulation.shapeWitness x s
        ∧
        (
          FailureClosure.Dissolution s
          ∨ FailureClosure.Shear s
          ∨ FailureClosure.Drift s
          ∨ FailureClosure.Echo s
          ∨ FailureClosure.Lock s
        ))
    ∧
    (∃ x,
      EquationObjectEligible w x
      ∧ StrongEquationCase w x)
    ∧
    (∃ y,
      EquationObjectEligible w y
      ∧ QualifiedRelationFailureCase w y) := by
  exact
    FailureDiscrimination.failure_side_discrimination_semantic_closure
      (relationDiscriminationSurface w)
      (relationEarnedSignature w loss)

/-! --------------------------------------------------------------------------
Demo loss passage
---------------------------------------------------------------------------- -/

def demoRelationFailurePassage
    (before after : DemoRelationCase) : Prop :=
  before = .success
  ∧ after = .relationFail

def demoEquationLossEvidence :
    EquationLossPassageEvidence
      (demoEquationWorld true true) where
  passage :=
    demoRelationFailurePassage

  before :=
    .success

  after :=
    .relationFail

  beforeStrong := by
    exact
      ⟨demo_qualified_success_world,
       by
         simp [SuccessfulRelationCase,
           demoEquationWorld,
           demoLeftIntelligible,
           demoRightIntelligible,
           demoLeftBurden,
           demoRightBurden,
           demoRelationHolds]⟩

  afterFailure := by
    exact
      ⟨demo_qualified_success_world,
       by
         simp [RelationFailureCase,
           demoEquationWorld,
           demoLeftIntelligible,
           demoRightIntelligible,
           demoLeftBurden,
           demoRightBurden,
           demoRelationHolds]⟩

  admittedPassage := by
    simp [demoRelationFailurePassage]

/-! --------------------------------------------------------------------------
Consolidated object checkpoint
---------------------------------------------------------------------------- -/

theorem strong_equationhood_object_machine_checkpoint :
    PlusThree.JobFidelity
      (equationPlusThreeAnswerWorld
        (demoEquationWorld true true)
        demoEquationLossEvidence)
    ∧
    PlusThree.ShapeFidelity
      (equationPlusThreeAnswerWorld
        (demoEquationWorld true true)
        demoEquationLossEvidence)
    ∧
    PlusThree.CapacityLossFidelity
      (equationPlusThreeAnswerWorld
        (demoEquationWorld true true)
        demoEquationLossEvidence)
    ∧
    (∀ x,
      QualifiedRelationFailureCase
        (demoEquationWorld true true) x →
      ∃ s,
        (relationRegimeArticulation
          (demoEquationWorld true true)).shapeWitness x s
        ∧ FailureClosure.Lock s)
    ∧
    (
      ∃ x,
        EquationObjectEligible
          (demoEquationWorld true true) x
        ∧ StrongEquationCase
          (demoEquationWorld true true) x
    )
    ∧
    (
      ∃ y,
        EquationObjectEligible
          (demoEquationWorld true true) y
        ∧ QualifiedRelationFailureCase
          (demoEquationWorld true true) y
    ) := by
  have hPlus :=
    strong_equationhood_plus_three_answer_core
      (demoEquationWorld true true)
      demoEquationLossEvidence
  have hFailure :=
    strong_equationhood_failure_side_semantic_closure
      (demoEquationWorld true true)
      demoEquationLossEvidence
  exact
    ⟨hPlus.1,
     hPlus.2.1,
     hPlus.2.2,
     by
       intro x hFail
       exact
         qualified_relation_failure_has_lock_articulation
           (demoEquationWorld true true)
           x
           hFail,
     hFailure.2.2.2.1,
     hFailure.2.2.2.2⟩

end StrongEquationhood
end StructuralFlow


/-!
===============================================================================
DUALITY DISCRIMINATION — PUBLIC THEOREM MODULE
Historical machine provenance: kernel attempt v0.5; full consolidated run on SF Universal Machine Kernel v1.1
===============================================================================

Purpose
-------
Machine candidate for the TOE Duality Discrimination Corollary.

A lawful duality is not established by saying "both".

At the declared universal scope, the candidate must show:

1. one operative interface generates both claimed faces;
2. both faces stay on one declared object / level / scope / comparison frame /
   interpretation frame;
3. each face performs at least one structural job the other does not absorb;
4. there exists one admissible case in which both faces hold together.

Important boundaries
--------------------
* This module does NOT thicken foundational Boundary.
* This module does NOT require every boundary to have a dual pair.
* This module does NOT import Coherence as a prerequisite for joint hold.
* This module does NOT create a new primitive, hinge, Chance-face, or
  foundational failure regime.
* "Meaning lock" is represented as one shared interpretation frame, not
  identical face jobs or identical face descriptions.
* ComparisonFrame is deliberately non-metric. Domain physical time may be
  included only through domain-owned frame semantics.
-/

namespace StructuralFlow
namespace DualityDiscrimination

universe u

/-! --------------------------------------------------------------------------
Duality world
---------------------------------------------------------------------------- -/

structure World
    (Object Level Scope ComparisonFrame InterpretationFrame
      Boundary Face Job Case : Type u) where
  declaredObject :
    Object

  declaredLevel :
    Level

  declaredScope :
    Scope

  declaredFrame :
    ComparisonFrame

  declaredInterpretation :
    InterpretationFrame

  objectOf :
    Face → Object

  levelOf :
    Face → Level

  scopeOf :
    Face → Scope

  frameOf :
    Face → ComparisonFrame

  interpretationOf :
    Face → InterpretationFrame

  left :
    Face

  right :
    Face

  candidateBoundary :
    Boundary

  operativeBoundary :
    Boundary → Prop

  generatedBy :
    Boundary → Face → Prop

  performsJob :
    Face → Job → Prop

  admissibleCase :
    Case → Prop

  faceHolds :
    Case → Face → Prop

/--
One supplied operative boundary / interface generates both claimed faces.
-/
def InterfaceGrounded
    {Object Level Scope ComparisonFrame InterpretationFrame
      Boundary Face Job Case : Type u}
    (w :
      World Object Level Scope ComparisonFrame InterpretationFrame
        Boundary Face Job Case) : Prop :=
  w.operativeBoundary w.candidateBoundary
  ∧ w.generatedBy w.candidateBoundary w.left
  ∧ w.generatedBy w.candidateBoundary w.right

/--
Both faces remain on one declared comparison surface.

The final coordinate is one shared interpretation / referential frame.
It is NOT an assertion that the two faces perform the same job or have the same
face-description.
-/
def SurfaceLocked
    {Object Level Scope ComparisonFrame InterpretationFrame
      Boundary Face Job Case : Type u}
    (w :
      World Object Level Scope ComparisonFrame InterpretationFrame
        Boundary Face Job Case) : Prop :=
  w.objectOf w.left = w.declaredObject
  ∧ w.objectOf w.right = w.declaredObject
  ∧ w.levelOf w.left = w.declaredLevel
  ∧ w.levelOf w.right = w.declaredLevel
  ∧ w.scopeOf w.left = w.declaredScope
  ∧ w.scopeOf w.right = w.declaredScope
  ∧ w.frameOf w.left = w.declaredFrame
  ∧ w.frameOf w.right = w.declaredFrame
  ∧ w.interpretationOf w.left = w.declaredInterpretation
  ∧ w.interpretationOf w.right = w.declaredInterpretation

/--
Each face performs at least one structural job not absorbed by the other.

No uniqueness of job and no complete disjointness of job sets is required.
-/
def FunctionallySeparated
    {Object Level Scope ComparisonFrame InterpretationFrame
      Boundary Face Job Case : Type u}
    (w :
      World Object Level Scope ComparisonFrame InterpretationFrame
        Boundary Face Job Case) : Prop :=
  (
    ∃ jLeft,
      w.performsJob w.left jLeft
      ∧ ¬ w.performsJob w.right jLeft
  )
  ∧
  (
    ∃ jRight,
      w.performsJob w.right jRight
      ∧ ¬ w.performsJob w.left jRight
  )

/--
Joint hold is lower-semantic and case-based.

It requires one admissible case in which both faces hold.
No candidate whole or Coherence invariant is imported.
-/
def JointlyHoldable
    {Object Level Scope ComparisonFrame InterpretationFrame
      Boundary Face Job Case : Type u}
    (w :
      World Object Level Scope ComparisonFrame InterpretationFrame
        Boundary Face Job Case) : Prop :=
  ∃ x,
    w.admissibleCase x
    ∧ w.faceHolds x w.left
    ∧ w.faceHolds x w.right

/--
Universal minimum for a lawful duality claim.
-/
def LawfulDuality
    {Object Level Scope ComparisonFrame InterpretationFrame
      Boundary Face Job Case : Type u}
    (w :
      World Object Level Scope ComparisonFrame InterpretationFrame
        Boundary Face Job Case) : Prop :=
  InterfaceGrounded w
  ∧ SurfaceLocked w
  ∧ FunctionallySeparated w
  ∧ JointlyHoldable w

theorem functionally_separated_implies_face_nonidentity
    {Object Level Scope ComparisonFrame InterpretationFrame
      Boundary Face Job Case : Type u}
    (w :
      World Object Level Scope ComparisonFrame InterpretationFrame
        Boundary Face Job Case)
    (hSeparated : FunctionallySeparated w) :
    w.left ≠ w.right := by
  intro hSame
  rcases hSeparated.1 with ⟨j, hLeft, hNotRight⟩
  apply hNotRight
  simpa [hSame] using hLeft

theorem lawful_duality_implies_interface_grounded
    {Object Level Scope ComparisonFrame InterpretationFrame
      Boundary Face Job Case : Type u}
    (w :
      World Object Level Scope ComparisonFrame InterpretationFrame
        Boundary Face Job Case)
    (h : LawfulDuality w) :
    InterfaceGrounded w :=
  h.1

theorem lawful_duality_implies_surface_locked
    {Object Level Scope ComparisonFrame InterpretationFrame
      Boundary Face Job Case : Type u}
    (w :
      World Object Level Scope ComparisonFrame InterpretationFrame
        Boundary Face Job Case)
    (h : LawfulDuality w) :
    SurfaceLocked w :=
  h.2.1

theorem lawful_duality_implies_functional_separation
    {Object Level Scope ComparisonFrame InterpretationFrame
      Boundary Face Job Case : Type u}
    (w :
      World Object Level Scope ComparisonFrame InterpretationFrame
        Boundary Face Job Case)
    (h : LawfulDuality w) :
    FunctionallySeparated w :=
  h.2.2.1

theorem lawful_duality_implies_joint_hold
    {Object Level Scope ComparisonFrame InterpretationFrame
      Boundary Face Job Case : Type u}
    (w :
      World Object Level Scope ComparisonFrame InterpretationFrame
        Boundary Face Job Case)
    (h : LawfulDuality w) :
    JointlyHoldable w :=
  h.2.2.2

theorem lawful_duality_implies_face_nonidentity
    {Object Level Scope ComparisonFrame InterpretationFrame
      Boundary Face Job Case : Type u}
    (w :
      World Object Level Scope ComparisonFrame InterpretationFrame
        Boundary Face Job Case)
    (h : LawfulDuality w) :
    w.left ≠ w.right :=
  functionally_separated_implies_face_nonidentity
    w
    h.2.2.1

/-! --------------------------------------------------------------------------
Finite semantic witnesses
---------------------------------------------------------------------------- -/

inductive DemoObject
  | alpha
  | beta
  deriving DecidableEq

inductive DemoLevel
  | levelA
  | levelB
  deriving DecidableEq

inductive DemoScope
  | local
  deriving DecidableEq

inductive DemoFrame
  | frame
  deriving DecidableEq

inductive DemoInterpretation
  | stable
  deriving DecidableEq

inductive DemoBoundary
  | main
  deriving DecidableEq

inductive DemoFace
  | left
  | right
  deriving DecidableEq

inductive DemoJob
  | leftJob
  | rightJob
  | commonJob
  deriving DecidableEq

inductive DemoCase
  | both
  | leftOnly
  | rightOnly
  deriving DecidableEq

abbrev DemoWorld :=
  World
    DemoObject
    DemoLevel
    DemoScope
    DemoFrame
    DemoInterpretation
    DemoBoundary
    DemoFace
    DemoJob
    DemoCase

def demoObjectOf (_ : DemoFace) : DemoObject :=
  .alpha

def demoLevelOf (_ : DemoFace) : DemoLevel :=
  .levelA

def demoScopeOf (_ : DemoFace) : DemoScope :=
  .local

def demoFrameOf (_ : DemoFace) : DemoFrame :=
  .frame

def demoInterpretationOf (_ : DemoFace) : DemoInterpretation :=
  .stable

def demoOperativeBoundary : DemoBoundary → Prop
  | .main => True

def demoGeneratedBy : DemoBoundary → DemoFace → Prop
  | .main, .left => True
  | .main, .right => True

def demoSeparatedJobs : DemoFace → DemoJob → Prop
  | .left, .leftJob => True
  | .right, .rightJob => True
  | _, _ => False

def demoCollapsedJobs : DemoFace → DemoJob → Prop
  | .left, .commonJob => True
  | .right, .commonJob => True
  | _, _ => False

def demoBothAdmissible : DemoCase → Prop
  | .both => True
  | _ => False

def demoBothHold : DemoCase → DemoFace → Prop
  | .both, .left => True
  | .both, .right => True
  | _, _ => False

def demoSplitAdmissible : DemoCase → Prop
  | .leftOnly => True
  | .rightOnly => True
  | .both => False

def demoSplitHold : DemoCase → DemoFace → Prop
  | .leftOnly, .left => True
  | .rightOnly, .right => True
  | _, _ => False

def dualitySuccess : DemoWorld where
  declaredObject :=
    .alpha

  declaredLevel :=
    .levelA

  declaredScope :=
    .local

  declaredFrame :=
    .frame

  declaredInterpretation :=
    .stable

  objectOf :=
    demoObjectOf

  levelOf :=
    demoLevelOf

  scopeOf :=
    demoScopeOf

  frameOf :=
    demoFrameOf

  interpretationOf :=
    demoInterpretationOf

  left :=
    .left

  right :=
    .right

  candidateBoundary :=
    .main

  operativeBoundary :=
    demoOperativeBoundary

  generatedBy :=
    demoGeneratedBy

  performsJob :=
    demoSeparatedJobs

  admissibleCase :=
    demoBothAdmissible

  faceHolds :=
    demoBothHold

theorem dualitySuccess_interface :
    InterfaceGrounded dualitySuccess := by
  simp [InterfaceGrounded, dualitySuccess,
    demoOperativeBoundary, demoGeneratedBy]

theorem dualitySuccess_surface :
    SurfaceLocked dualitySuccess := by
  simp [SurfaceLocked, dualitySuccess,
    demoObjectOf, demoLevelOf, demoScopeOf,
    demoFrameOf, demoInterpretationOf]

theorem dualitySuccess_separated :
    FunctionallySeparated dualitySuccess := by
  constructor
  · exact
      ⟨.leftJob,
       by simp [dualitySuccess, demoSeparatedJobs],
       by simp [dualitySuccess, demoSeparatedJobs]⟩
  · exact
      ⟨.rightJob,
       by simp [dualitySuccess, demoSeparatedJobs],
       by simp [dualitySuccess, demoSeparatedJobs]⟩

theorem dualitySuccess_joint :
    JointlyHoldable dualitySuccess := by
  exact
    ⟨.both,
     by simp [dualitySuccess, demoBothAdmissible],
     by simp [dualitySuccess, demoBothHold],
     by simp [dualitySuccess, demoBothHold]⟩

theorem dualitySuccess_lawful :
    LawfulDuality dualitySuccess := by
  exact
    ⟨dualitySuccess_interface,
     dualitySuccess_surface,
     dualitySuccess_separated,
     dualitySuccess_joint⟩

/--
One real interface + one surface + one admissible "both" case is insufficient
when the two faces do not perform non-absorbed structural work.
-/
def interfaceWithoutSeparation : DemoWorld where
  declaredObject :=
    .alpha

  declaredLevel :=
    .levelA

  declaredScope :=
    .local

  declaredFrame :=
    .frame

  declaredInterpretation :=
    .stable

  objectOf :=
    demoObjectOf

  levelOf :=
    demoLevelOf

  scopeOf :=
    demoScopeOf

  frameOf :=
    demoFrameOf

  interpretationOf :=
    demoInterpretationOf

  left :=
    .left

  right :=
    .right

  candidateBoundary :=
    .main

  operativeBoundary :=
    demoOperativeBoundary

  generatedBy :=
    demoGeneratedBy

  performsJob :=
    demoCollapsedJobs

  admissibleCase :=
    demoBothAdmissible

  faceHolds :=
    demoBothHold

theorem interfaceWithoutSeparation_not_separated :
    ¬ FunctionallySeparated interfaceWithoutSeparation := by
  intro h
  rcases h.1 with ⟨j, hLeft, hNotRight⟩
  cases j <;>
    simp [interfaceWithoutSeparation, demoCollapsedJobs] at hLeft hNotRight

theorem interface_and_both_do_not_establish_duality :
    InterfaceGrounded interfaceWithoutSeparation
    ∧ SurfaceLocked interfaceWithoutSeparation
    ∧ JointlyHoldable interfaceWithoutSeparation
    ∧ ¬ LawfulDuality interfaceWithoutSeparation := by
  constructor
  · simp [InterfaceGrounded, interfaceWithoutSeparation,
      demoOperativeBoundary, demoGeneratedBy]
  constructor
  · simp [SurfaceLocked, interfaceWithoutSeparation,
      demoObjectOf, demoLevelOf, demoScopeOf,
      demoFrameOf, demoInterpretationOf]
  constructor
  · exact
      ⟨.both,
       by simp [interfaceWithoutSeparation, demoBothAdmissible],
       by simp [interfaceWithoutSeparation, demoBothHold],
       by simp [interfaceWithoutSeparation, demoBothHold]⟩
  · intro hDual
    exact
      interfaceWithoutSeparation_not_separated
        hDual.2.2.1

/--
Both faces can hold together on one declared surface while no real shared
interface is supplied.
-/
def bothWithoutInterface : DemoWorld where
  declaredObject :=
    .alpha

  declaredLevel :=
    .levelA

  declaredScope :=
    .local

  declaredFrame :=
    .frame

  declaredInterpretation :=
    .stable

  objectOf :=
    demoObjectOf

  levelOf :=
    demoLevelOf

  scopeOf :=
    demoScopeOf

  frameOf :=
    demoFrameOf

  interpretationOf :=
    demoInterpretationOf

  left :=
    .left

  right :=
    .right

  candidateBoundary :=
    .main

  operativeBoundary :=
    fun _ => False

  generatedBy :=
    demoGeneratedBy

  performsJob :=
    demoSeparatedJobs

  admissibleCase :=
    demoBothAdmissible

  faceHolds :=
    demoBothHold

theorem bothWithoutInterface_not_grounded :
    ¬ InterfaceGrounded bothWithoutInterface := by
  simp [InterfaceGrounded, bothWithoutInterface]

theorem both_does_not_establish_duality :
    SurfaceLocked bothWithoutInterface
    ∧ FunctionallySeparated bothWithoutInterface
    ∧ JointlyHoldable bothWithoutInterface
    ∧ ¬ LawfulDuality bothWithoutInterface := by
  constructor
  · simp [SurfaceLocked, bothWithoutInterface,
      demoObjectOf, demoLevelOf, demoScopeOf,
      demoFrameOf, demoInterpretationOf]
  constructor
  · constructor
    · exact
        ⟨.leftJob,
         by simp [bothWithoutInterface, demoSeparatedJobs],
         by simp [bothWithoutInterface, demoSeparatedJobs]⟩
    · exact
        ⟨.rightJob,
         by simp [bothWithoutInterface, demoSeparatedJobs],
         by simp [bothWithoutInterface, demoSeparatedJobs]⟩
  constructor
  · exact
      ⟨.both,
       by simp [bothWithoutInterface, demoBothAdmissible],
       by simp [bothWithoutInterface, demoBothHold],
       by simp [bothWithoutInterface, demoBothHold]⟩
  · intro hDual
    exact bothWithoutInterface_not_grounded hDual.1

/--
One interface + one surface + two non-absorbed jobs is insufficient if no
admissible case carries both faces together.
-/
def separatedWithoutJointHold : DemoWorld where
  declaredObject :=
    .alpha

  declaredLevel :=
    .levelA

  declaredScope :=
    .local

  declaredFrame :=
    .frame

  declaredInterpretation :=
    .stable

  objectOf :=
    demoObjectOf

  levelOf :=
    demoLevelOf

  scopeOf :=
    demoScopeOf

  frameOf :=
    demoFrameOf

  interpretationOf :=
    demoInterpretationOf

  left :=
    .left

  right :=
    .right

  candidateBoundary :=
    .main

  operativeBoundary :=
    demoOperativeBoundary

  generatedBy :=
    demoGeneratedBy

  performsJob :=
    demoSeparatedJobs

  admissibleCase :=
    demoSplitAdmissible

  faceHolds :=
    demoSplitHold

theorem separatedWithoutJointHold_not_joint :
    ¬ JointlyHoldable separatedWithoutJointHold := by
  intro h
  rcases h with ⟨x, hAdmissible, hLeft, hRight⟩
  cases x <;>
    simp [separatedWithoutJointHold, demoSplitAdmissible,
      demoSplitHold] at hAdmissible hLeft hRight

theorem distinct_jobs_do_not_establish_joint_duality :
    InterfaceGrounded separatedWithoutJointHold
    ∧ SurfaceLocked separatedWithoutJointHold
    ∧ FunctionallySeparated separatedWithoutJointHold
    ∧ ¬ LawfulDuality separatedWithoutJointHold := by
  constructor
  · simp [InterfaceGrounded, separatedWithoutJointHold,
      demoOperativeBoundary, demoGeneratedBy]
  constructor
  · simp [SurfaceLocked, separatedWithoutJointHold,
      demoObjectOf, demoLevelOf, demoScopeOf,
      demoFrameOf, demoInterpretationOf]
  constructor
  · constructor
    · exact
        ⟨.leftJob,
         by simp [separatedWithoutJointHold, demoSeparatedJobs],
         by simp [separatedWithoutJointHold, demoSeparatedJobs]⟩
    · exact
        ⟨.rightJob,
         by simp [separatedWithoutJointHold, demoSeparatedJobs],
         by simp [separatedWithoutJointHold, demoSeparatedJobs]⟩
  · intro hDual
    exact
      separatedWithoutJointHold_not_joint
        hDual.2.2.2

/--
Joint hold does not excuse a silent level shift.
-/
def demoShiftedLevelOf : DemoFace → DemoLevel
  | .left => .levelA
  | .right => .levelB

def jointHoldWithSurfaceShift : DemoWorld where
  declaredObject :=
    .alpha

  declaredLevel :=
    .levelA

  declaredScope :=
    .local

  declaredFrame :=
    .frame

  declaredInterpretation :=
    .stable

  objectOf :=
    demoObjectOf

  levelOf :=
    demoShiftedLevelOf

  scopeOf :=
    demoScopeOf

  frameOf :=
    demoFrameOf

  interpretationOf :=
    demoInterpretationOf

  left :=
    .left

  right :=
    .right

  candidateBoundary :=
    .main

  operativeBoundary :=
    demoOperativeBoundary

  generatedBy :=
    demoGeneratedBy

  performsJob :=
    demoSeparatedJobs

  admissibleCase :=
    demoBothAdmissible

  faceHolds :=
    demoBothHold

theorem jointHoldWithSurfaceShift_not_locked :
    ¬ SurfaceLocked jointHoldWithSurfaceShift := by
  simp [SurfaceLocked, jointHoldWithSurfaceShift,
    demoObjectOf, demoShiftedLevelOf, demoScopeOf,
    demoFrameOf, demoInterpretationOf]

theorem joint_hold_does_not_excuse_surface_shift :
    InterfaceGrounded jointHoldWithSurfaceShift
    ∧ FunctionallySeparated jointHoldWithSurfaceShift
    ∧ JointlyHoldable jointHoldWithSurfaceShift
    ∧ ¬ LawfulDuality jointHoldWithSurfaceShift := by
  constructor
  · simp [InterfaceGrounded, jointHoldWithSurfaceShift,
      demoOperativeBoundary, demoGeneratedBy]
  constructor
  · constructor
    · exact
        ⟨.leftJob,
         by simp [jointHoldWithSurfaceShift, demoSeparatedJobs],
         by simp [jointHoldWithSurfaceShift, demoSeparatedJobs]⟩
    · exact
        ⟨.rightJob,
         by simp [jointHoldWithSurfaceShift, demoSeparatedJobs],
         by simp [jointHoldWithSurfaceShift, demoSeparatedJobs]⟩
  constructor
  · exact
      ⟨.both,
       by simp [jointHoldWithSurfaceShift, demoBothAdmissible],
       by simp [jointHoldWithSurfaceShift, demoBothHold],
       by simp [jointHoldWithSurfaceShift, demoBothHold]⟩
  · intro hDual
    exact
      jointHoldWithSurfaceShift_not_locked
        hDual.2.1

/-! --------------------------------------------------------------------------
Generic hinge adapter intentionally omitted
---------------------------------------------------------------------------- -/

/-
The earlier generic hinge adapter was intentionally removed before closure.

Reason:
it could manufacture functional separation from synthetic job labels even when
the underlying constraint/capacity predicates were semantically duplicated.

Recognition and Coherence are instead audited through direct projections from
their already-closed machine semantics.

Any future generic hinge adapter must receive independently warranted
non-absorption evidence rather than create it by construction.
-/

/-! --------------------------------------------------------------------------
Canon Three composition: validation + preservation, not entailment
---------------------------------------------------------------------------- -/

structure NavigationDualityBridge
    {Burden CarryItem Boundary Face : Type u}
    (cw : CanonThree.World Burden CarryItem Boundary Face)
    {Object Level Scope ComparisonFrame InterpretationFrame Job Case : Type u}
    (dw :
      World Object Level Scope ComparisonFrame InterpretationFrame
        Boundary Face Job Case) where
  boundaryIsOperative :
    cw.operativeBoundary dw.candidateBoundary

  leftIsRequiredBehavior :
    cw.requiredBehavior dw.candidateBoundary dw.left

  rightIsRequiredBehavior :
    cw.requiredBehavior dw.candidateBoundary dw.right

def LawfulDualStatePreserved
    {Burden CarryItem Boundary Face : Type u}
    (cw : CanonThree.World Burden CarryItem Boundary Face)
    {Object Level Scope ComparisonFrame InterpretationFrame Job Case : Type u}
    (dw :
      World Object Level Scope ComparisonFrame InterpretationFrame
        Boundary Face Job Case) : Prop :=
  LawfulDuality dw
  ∧ cw.behaviorPreserved dw.candidateBoundary dw.left
  ∧ cw.behaviorPreserved dw.candidateBoundary dw.right

/--
Duality validates the pair.
Canon Three preserves required behavior.
The explicit bridge says this navigation task actually treats the two dual
faces as required behavior of the corresponding operative boundary.
-/
theorem lawful_duality_plus_regime_fidelity_preserves_required_pair
    {Burden CarryItem Boundary Face : Type u}
    (cw : CanonThree.World Burden CarryItem Boundary Face)
    {Object Level Scope ComparisonFrame InterpretationFrame Job Case : Type u}
    (dw :
      World Object Level Scope ComparisonFrame InterpretationFrame
        Boundary Face Job Case)
    (hDual : LawfulDuality dw)
    (hRegime : CanonThree.RegimeFidelity cw)
    (bridge : NavigationDualityBridge cw dw) :
    LawfulDualStatePreserved cw dw := by
  refine
    ⟨hDual, ?_, ?_⟩
  · exact
      hRegime.2
        dw.candidateBoundary
        dw.left
        bridge.boundaryIsOperative
        bridge.leftIsRequiredBehavior
  · exact
      hRegime.2
        dw.candidateBoundary
        dw.right
        bridge.boundaryIsOperative
        bridge.rightIsRequiredBehavior

/-! --------------------------------------------------------------------------
First semantic machine checkpoint
---------------------------------------------------------------------------- -/

theorem duality_discrimination_machine_checkpoint :
    LawfulDuality dualitySuccess
    ∧
    (
      InterfaceGrounded interfaceWithoutSeparation
      ∧ JointlyHoldable interfaceWithoutSeparation
      ∧ ¬ LawfulDuality interfaceWithoutSeparation
    )
    ∧
    (
      JointlyHoldable bothWithoutInterface
      ∧ ¬ LawfulDuality bothWithoutInterface
    )
    ∧
    (
      FunctionallySeparated separatedWithoutJointHold
      ∧ ¬ LawfulDuality separatedWithoutJointHold
    )
    ∧
    (
      JointlyHoldable jointHoldWithSurfaceShift
      ∧ ¬ LawfulDuality jointHoldWithSurfaceShift
    )
    ∧
    dualitySuccess.left ≠ dualitySuccess.right := by
  constructor
  · exact dualitySuccess_lawful
  constructor
  · exact
      ⟨interface_and_both_do_not_establish_duality.1,
       interface_and_both_do_not_establish_duality.2.2.1,
       interface_and_both_do_not_establish_duality.2.2.2⟩
  constructor
  · exact
      ⟨both_does_not_establish_duality.2.2.1,
       both_does_not_establish_duality.2.2.2⟩
  constructor
  · exact
      ⟨distinct_jobs_do_not_establish_joint_duality.2.2.1,
       distinct_jobs_do_not_establish_joint_duality.2.2.2⟩
  constructor
  · exact
      ⟨joint_hold_does_not_excuse_surface_shift.2.2.1,
       joint_hold_does_not_excuse_surface_shift.2.2.2⟩
  · exact
      lawful_duality_implies_face_nonidentity
        dualitySuccess
        dualitySuccess_lawful


/-! --------------------------------------------------------------------------
Stronger state-separation audit
---------------------------------------------------------------------------- -/

/--
Optional stronger audit for hinge-face predicates.

This is NOT part of the universal minimum `LawfulDuality`.
It asks whether each face can hold in an admissible case while the other fails.
-/
def FaceStateSeparated
    {Object Level Scope ComparisonFrame InterpretationFrame
      Boundary Face Job Case : Type u}
    (w :
      World Object Level Scope ComparisonFrame InterpretationFrame
        Boundary Face Job Case) : Prop :=
  (
    ∃ x,
      w.admissibleCase x
      ∧ w.faceHolds x w.left
      ∧ ¬ w.faceHolds x w.right
  )
  ∧
  (
    ∃ y,
      w.admissibleCase y
      ∧ w.faceHolds y w.right
      ∧ ¬ w.faceHolds y w.left
  )

/-! --------------------------------------------------------------------------
Recognition hinge duality audit
---------------------------------------------------------------------------- -/

inductive RecognitionDualFace
  | constraint
  | capacity
  deriving DecidableEq

inductive RecognitionDualJob
  | lawfulComparison
  | sameBindingBeyondOrigin
  deriving DecidableEq

inductive RecognitionDualBoundary
  | recognition
  deriving DecidableEq

/--
Machine-facing Recognition constraint face:

the admitted local variation supports lawful cross-surface
comparison / transport.
-/
def RecognitionConstraintFace
    (w : Recognition.TestWorld) : Prop :=
  w.origin ≠ w.target
  ∧ w.lawfulVariation w.origin w.target
  ∧ w.transport
      w.origin
      w.target
      w.sourcePresentation
      w.targetPresentation

/--
Machine-facing Recognition capacity face:

the target presentation carries the same binding content.
-/
def RecognitionCapacityFace
    (w : Recognition.TestWorld) : Prop :=
  w.located w.target w.targetPresentation
  ∧ w.binds w.targetPresentation w.content

def recognitionDualityWorld :
    World
      Unit
      Unit
      Unit
      Unit
      Unit
      RecognitionDualBoundary
      RecognitionDualFace
      RecognitionDualJob
      Recognition.TestWorld where
  declaredObject := ()
  declaredLevel := ()
  declaredScope := ()
  declaredFrame := ()
  declaredInterpretation := ()

  objectOf := fun _ => ()
  levelOf := fun _ => ()
  scopeOf := fun _ => ()
  frameOf := fun _ => ()
  interpretationOf := fun _ => ()

  left := .constraint
  right := .capacity

  candidateBoundary := .recognition

  operativeBoundary := fun _ => True

  generatedBy := fun _ _ => True

  performsJob := fun face job =>
    match face, job with
    | .constraint, .lawfulComparison => True
    | .capacity, .sameBindingBeyondOrigin => True
    | _, _ => False

  admissibleCase := Recognition.UpstreamReady

  faceHolds := fun w face =>
    match face with
    | .constraint => RecognitionConstraintFace w
    | .capacity => RecognitionCapacityFace w

theorem recognition_constraint_success :
    RecognitionConstraintFace
      Recognition.recognitionSuccess := by
  simp [RecognitionConstraintFace,
    Recognition.recognitionSuccess,
    Recognition.lawfulLocalVariation,
    Recognition.transportSourceToTarget]

theorem recognition_capacity_success :
    RecognitionCapacityFace
      Recognition.recognitionSuccess := by
  simp [RecognitionCapacityFace,
    Recognition.recognitionSuccess,
    Recognition.locatedBoth,
    Recognition.sameBinding]

theorem recognition_transportFailure_capacity :
    RecognitionCapacityFace
      Recognition.transportFailure := by
  simp [RecognitionCapacityFace,
    Recognition.transportFailure,
    Recognition.locatedBoth,
    Recognition.sameBinding]

theorem recognition_transportFailure_not_constraint :
    ¬ RecognitionConstraintFace
      Recognition.transportFailure := by
  simp [RecognitionConstraintFace,
    Recognition.transportFailure,
    Recognition.lawfulLocalVariation,
    Recognition.noTransport]

theorem recognition_identityDrift_constraint :
    RecognitionConstraintFace
      Recognition.identityDrift := by
  simp [RecognitionConstraintFace,
    Recognition.identityDrift,
    Recognition.lawfulLocalVariation,
    Recognition.transportSourceToTarget]

theorem recognition_identityDrift_not_capacity :
    ¬ RecognitionCapacityFace
      Recognition.identityDrift := by
  simp [RecognitionCapacityFace,
    Recognition.identityDrift,
    Recognition.locatedBoth,
    Recognition.driftBinding]

theorem recognition_duality_lawful :
    LawfulDuality recognitionDualityWorld := by
  constructor
  · simp [InterfaceGrounded, recognitionDualityWorld]
  constructor
  · simp [SurfaceLocked, recognitionDualityWorld]
  constructor
  · constructor
    · exact
        ⟨RecognitionDualJob.lawfulComparison,
         by simp [recognitionDualityWorld],
         by simp [recognitionDualityWorld]⟩
    · exact
        ⟨RecognitionDualJob.sameBindingBeyondOrigin,
         by simp [recognitionDualityWorld],
         by simp [recognitionDualityWorld]⟩
  · exact
      ⟨Recognition.recognitionSuccess,
       Recognition.success_upstream_ready,
       recognition_constraint_success,
       recognition_capacity_success⟩

theorem recognition_duality_state_separated :
    FaceStateSeparated recognitionDualityWorld := by
  constructor
  · exact
      ⟨Recognition.identityDrift,
       Recognition.identityDrift_upstream_ready,
       recognition_identityDrift_constraint,
       recognition_identityDrift_not_capacity⟩
  · exact
      ⟨Recognition.transportFailure,
       Recognition.transportFailure_upstream_ready,
       recognition_transportFailure_capacity,
       recognition_transportFailure_not_constraint⟩

/-! --------------------------------------------------------------------------
Coherence hinge duality audit
---------------------------------------------------------------------------- -/

inductive CoherenceDualFace
  | constraint
  | capacity
  deriving DecidableEq

inductive CoherenceDualJob
  | fitOneGlobalHold
  | holdWholeAsOne
  deriving DecidableEq

inductive CoherenceDualBoundary
  | coherence
  deriving DecidableEq

def CoherenceConstraintFace
    (w : Coherence.TestWorld) : Prop :=
  Coherence.GlobalFit w

def CoherenceCapacityFace
    (w : Coherence.TestWorld) : Prop :=
  w.heldAsOne w.candidateWhole

def coherenceDualityWorld :
    World
      Unit
      Unit
      Unit
      Unit
      Unit
      CoherenceDualBoundary
      CoherenceDualFace
      CoherenceDualJob
      Coherence.TestWorld where
  declaredObject := ()
  declaredLevel := ()
  declaredScope := ()
  declaredFrame := ()
  declaredInterpretation := ()

  objectOf := fun _ => ()
  levelOf := fun _ => ()
  scopeOf := fun _ => ()
  frameOf := fun _ => ()
  interpretationOf := fun _ => ()

  left := .constraint
  right := .capacity

  candidateBoundary := .coherence

  operativeBoundary := fun _ => True

  generatedBy := fun _ _ => True

  performsJob := fun face job =>
    match face, job with
    | .constraint, .fitOneGlobalHold => True
    | .capacity, .holdWholeAsOne => True
    | _, _ => False

  admissibleCase := Coherence.RecognizedCompatible

  faceHolds := fun w face =>
    match face with
    | .constraint => CoherenceConstraintFace w
    | .capacity => CoherenceCapacityFace w

theorem coherence_constraint_success :
    CoherenceConstraintFace
      Coherence.coherenceSuccess := by
  exact Coherence.success_global_fit

theorem coherence_capacity_success :
    CoherenceCapacityFace
      Coherence.coherenceSuccess := by
  simp [CoherenceCapacityFace,
    Coherence.coherenceSuccess,
    Coherence.wholeHeld]

theorem coherence_fragmented_constraint :
    CoherenceConstraintFace
      Coherence.fragmented := by
  simp [CoherenceConstraintFace,
    Coherence.GlobalFit,
    Coherence.fragmented,
    Coherence.fitsBoth]

theorem coherence_fragmented_not_capacity :
    ¬ CoherenceCapacityFace
      Coherence.fragmented := by
  simp [CoherenceCapacityFace,
    Coherence.fragmented,
    Coherence.wholeNotHeld]

theorem coherence_fitFailure_capacity :
    CoherenceCapacityFace
      Coherence.fitFailure := by
  simp [CoherenceCapacityFace,
    Coherence.fitFailure,
    Coherence.wholeHeld]

theorem coherence_fitFailure_not_constraint :
    ¬ CoherenceConstraintFace
      Coherence.fitFailure := by
  exact Coherence.fitFailure_not_global_fit

theorem coherence_duality_lawful :
    LawfulDuality coherenceDualityWorld := by
  constructor
  · simp [InterfaceGrounded, coherenceDualityWorld]
  constructor
  · simp [SurfaceLocked, coherenceDualityWorld]
  constructor
  · constructor
    · exact
        ⟨CoherenceDualJob.fitOneGlobalHold,
         by simp [coherenceDualityWorld],
         by simp [coherenceDualityWorld]⟩
    · exact
        ⟨CoherenceDualJob.holdWholeAsOne,
         by simp [coherenceDualityWorld],
         by simp [coherenceDualityWorld]⟩
  · exact
      ⟨Coherence.coherenceSuccess,
       Coherence.success_recognized_compatible,
       coherence_constraint_success,
       coherence_capacity_success⟩

theorem coherence_duality_state_separated :
    FaceStateSeparated coherenceDualityWorld := by
  constructor
  · exact
      ⟨Coherence.fragmented,
       Coherence.fragmented_recognized_compatible,
       coherence_fragmented_constraint,
       coherence_fragmented_not_capacity⟩
  · exact
      ⟨Coherence.fitFailure,
       Coherence.fitFailure_recognized_compatible,
       coherence_fitFailure_capacity,
       coherence_fitFailure_not_constraint⟩

/--
Lawful Duality does not universally require two-way state separation.

`dualitySuccess` is lawful because one admissible case carries both distinct,
non-absorbed faces on one locked interface. It does not provide admissible
left-only or right-only states.

Therefore `FaceStateSeparated` remains a stronger optional hinge audit rather
than a constitutive Duality burden.
-/
theorem lawful_duality_does_not_require_face_state_separation :
    LawfulDuality dualitySuccess
    ∧ ¬ FaceStateSeparated dualitySuccess := by
  constructor
  · exact dualitySuccess_lawful
  · intro hSeparated
    rcases hSeparated.1 with
      ⟨x, hAdmissible, hLeft, hNotRight⟩
    cases x <;>
      simp [dualitySuccess, demoBothAdmissible, demoBothHold]
        at hAdmissible hLeft hNotRight

/-! --------------------------------------------------------------------------
Hinge self-audit checkpoint
---------------------------------------------------------------------------- -/

theorem hinge_duality_self_audit_checkpoint :
    LawfulDuality recognitionDualityWorld
    ∧ FaceStateSeparated recognitionDualityWorld
    ∧ LawfulDuality coherenceDualityWorld
    ∧ FaceStateSeparated coherenceDualityWorld := by
  exact
    ⟨recognition_duality_lawful,
     recognition_duality_state_separated,
     coherence_duality_lawful,
     coherence_duality_state_separated⟩

end DualityDiscrimination
end StructuralFlow

/-!
===============================================================================
LADDER — PUBLIC THEOREM MODULE
Historical machine provenance: kernel attempt v0.3; full consolidated run on SF Universal Machine Kernel v1.2
===============================================================================

Purpose
-------
First semantic machine candidate for the Structural Flow Ladder rule.

A Ladder is not "Coherence followed by more Coherence".

The candidate architecture separates:

1. earned parent Coherence endpoint;
2. declared parent coherent ground actually attached to that whole;
3. live descendant answers to all declared inherited ground;
4. actual inherited ground that supports descendant entry;
5. the first relevant descendant burden not already supplied by inheritance;
6. independently earned descendant Coherence endpoint.

Important scope
---------------
* Parent Coherence licenses descendant entry; it does not guarantee descendant
  Coherence.
* Inheritance is answerability-preserving, not literal identity-preserving.
* No unique child answer is required.
* The child begins where inherited supply stops being sufficient.
* This module does NOT yet encode F / H / L, +3, Failure-Side closure, or a
  full within-ladder hinge-state vector.
-/

namespace StructuralFlow
namespace Ladder

universe u

structure World
    (ParentPiece ParentWhole ParentInvariant
      ChildPiece ChildWhole ChildInvariant
      ParentGround ChildGround Burden : Type u) where
  parentWorld :
    Coherence.World ParentPiece ParentWhole ParentInvariant

  childWorld :
    Coherence.World ChildPiece ChildWhole ChildInvariant

  parentWholeOwnsGround :
    ParentWhole → ParentGround → Prop

  inheritedGround :
    ParentGround → Prop

  childEntryGround :
    ChildGround → Prop

  answersInherited :
    ParentGround → ChildGround → Prop

  supportsEntry :
    ChildGround → Burden → Prop

  childWholeBelongsToEntryLineage :
    Burden → ChildWhole → Prop

  groundSupplies :
    ChildGround → Burden → Prop

  relevantBurden :
    Burden → Prop

  precedes :
    Burden → Burden → Prop

  entryBurden :
    Burden

def ParentEndpoint
    {ParentPiece ParentWhole ParentInvariant
      ChildPiece ChildWhole ChildInvariant
      ParentGround ChildGround Burden : Type u}
    (w :
      World
        ParentPiece ParentWhole ParentInvariant
        ChildPiece ChildWhole ChildInvariant
        ParentGround ChildGround Burden) : Prop :=
  Coherence.JointWholeHoldEndpoint w.parentWorld

def ChildEndpoint
    {ParentPiece ParentWhole ParentInvariant
      ChildPiece ChildWhole ChildInvariant
      ParentGround ChildGround Burden : Type u}
    (w :
      World
        ParentPiece ParentWhole ParentInvariant
        ChildPiece ChildWhole ChildInvariant
        ParentGround ChildGround Burden) : Prop :=
  Coherence.JointWholeHoldEndpoint w.childWorld

/--
Every ground item claimed as inherited from the parent is actually attached to
the parent candidate whole.
-/
def GroundAttached
    {ParentPiece ParentWhole ParentInvariant
      ChildPiece ChildWhole ChildInvariant
      ParentGround ChildGround Burden : Type u}
    (w :
      World
        ParentPiece ParentWhole ParentInvariant
        ChildPiece ChildWhole ChildInvariant
        ParentGround ChildGround Burden) : Prop :=
  ∀ gParent,
    w.inheritedGround gParent →
    w.parentWholeOwnsGround
      w.parentWorld.candidateWhole
      gParent

/--
Every declared inherited parent-ground item has at least one child-side answer.

This is a coverage / no-free-reset burden.
It does not select a unique answer and does not require literal identity.
-/
def LiveInheritance
    {ParentPiece ParentWhole ParentInvariant
      ChildPiece ChildWhole ChildInvariant
      ParentGround ChildGround Burden : Type u}
    (w :
      World
        ParentPiece ParentWhole ParentInvariant
        ChildPiece ChildWhole ChildInvariant
        ParentGround ChildGround Burden) : Prop :=
  ∀ gParent,
    w.inheritedGround gParent →
    ∃ gChild,
      w.childEntryGround gChild
      ∧ w.answersInherited gParent gChild

/--
A child-ground item counts as inherited only when it is present at child entry
and answers actual parent-owned inherited ground.
-/
def InheritedChildGround
    {ParentPiece ParentWhole ParentInvariant
      ChildPiece ChildWhole ChildInvariant
      ParentGround ChildGround Burden : Type u}
    (w :
      World
        ParentPiece ParentWhole ParentInvariant
        ChildPiece ChildWhole ChildInvariant
        ParentGround ChildGround Burden)
    (gChild : ChildGround) : Prop :=
  w.childEntryGround gChild
  ∧
  ∃ gParent,
    w.inheritedGround gParent
    ∧ w.parentWholeOwnsGround
        w.parentWorld.candidateWhole
        gParent
    ∧ w.answersInherited gParent gChild

/--
At least one genuinely inherited child-ground item actually supports descendant
entry.

This blocks decorative lineage: inherited material may be present without
being the ground that licenses the new ladder.
-/
def EntryGrounded
    {ParentPiece ParentWhole ParentInvariant
      ChildPiece ChildWhole ChildInvariant
      ParentGround ChildGround Burden : Type u}
    (w :
      World
        ParentPiece ParentWhole ParentInvariant
        ChildPiece ChildWhole ChildInvariant
        ParentGround ChildGround Burden) : Prop :=
  ∃ gChild,
    InheritedChildGround w gChild
    ∧ w.supportsEntry gChild w.entryBurden

def InheritedSupplies
    {ParentPiece ParentWhole ParentInvariant
      ChildPiece ChildWhole ChildInvariant
      ParentGround ChildGround Burden : Type u}
    (w :
      World
        ParentPiece ParentWhole ParentInvariant
        ChildPiece ChildWhole ChildInvariant
        ParentGround ChildGround Burden)
    (b : Burden) : Prop :=
  ∃ gChild,
    InheritedChildGround w gChild
    ∧ w.groundSupplies gChild b

/--
The entry burden is the first declared relevant burden not already supplied by
inherited coherent ground.
-/
def FirstNewBurden
    {ParentPiece ParentWhole ParentInvariant
      ChildPiece ChildWhole ChildInvariant
      ParentGround ChildGround Burden : Type u}
    (w :
      World
        ParentPiece ParentWhole ParentInvariant
        ChildPiece ChildWhole ChildInvariant
        ParentGround ChildGround Burden) : Prop :=
  w.relevantBurden w.entryBurden
  ∧ ¬ InheritedSupplies w w.entryBurden
  ∧
  ∀ b,
    w.relevantBurden b →
    w.precedes b w.entryBurden →
    InheritedSupplies w b

/--
License to begin descendant hinge work.

This is deliberately weaker than a completed lawful ladder.
-/
def LadderEntry
    {ParentPiece ParentWhole ParentInvariant
      ChildPiece ChildWhole ChildInvariant
      ParentGround ChildGround Burden : Type u}
    (w :
      World
        ParentPiece ParentWhole ParentInvariant
        ChildPiece ChildWhole ChildInvariant
        ParentGround ChildGround Burden) : Prop :=
  ParentEndpoint w
  ∧ GroundAttached w
  ∧ LiveInheritance w
  ∧ EntryGrounded w
  ∧ FirstNewBurden w

/--
The coherent child used to complete the Ladder must belong to the descendant
lineage opened at the admitted entry burden.

This is a provenance / ancestry bridge, not a deterministic production claim.
-/
def DescendantLineageBound
    {ParentPiece ParentWhole ParentInvariant
      ChildPiece ChildWhole ChildInvariant
      ParentGround ChildGround Burden : Type u}
    (w :
      World
        ParentPiece ParentWhole ParentInvariant
        ChildPiece ChildWhole ChildInvariant
        ParentGround ChildGround Burden) : Prop :=
  w.childWholeBelongsToEntryLineage
    w.entryBurden
    w.childWorld.candidateWhole

/--
A completed lawful ladder additionally earns its own descendant Coherence
endpoint AND binds that coherent whole to the lineage opened at the entry
burden.
-/
def LawfulLadder
    {ParentPiece ParentWhole ParentInvariant
      ChildPiece ChildWhole ChildInvariant
      ParentGround ChildGround Burden : Type u}
    (w :
      World
        ParentPiece ParentWhole ParentInvariant
        ChildPiece ChildWhole ChildInvariant
        ParentGround ChildGround Burden) : Prop :=
  LadderEntry w
  ∧ ChildEndpoint w
  ∧ DescendantLineageBound w

theorem entry_grounded_implies_identified_parent_ground
    {ParentPiece ParentWhole ParentInvariant
      ChildPiece ChildWhole ChildInvariant
      ParentGround ChildGround Burden : Type u}
    (w :
      World
        ParentPiece ParentWhole ParentInvariant
        ChildPiece ChildWhole ChildInvariant
        ParentGround ChildGround Burden)
    (hEntry : EntryGrounded w) :
    ∃ gParent, w.inheritedGround gParent := by
  rcases hEntry with
    ⟨gChild, ⟨_hChild, gParent, hInherited, _hOwned, _hAnswers⟩, _hSupports⟩
  exact ⟨gParent, hInherited⟩

theorem live_inheritance_excludes_declared_ground_erasure
    {ParentPiece ParentWhole ParentInvariant
      ChildPiece ChildWhole ChildInvariant
      ParentGround ChildGround Burden : Type u}
    (w :
      World
        ParentPiece ParentWhole ParentInvariant
        ChildPiece ChildWhole ChildInvariant
        ParentGround ChildGround Burden)
    (hLive : LiveInheritance w)
    (gParent : ParentGround)
    (hInherited : w.inheritedGround gParent) :
    ¬ (∀ gChild,
        w.childEntryGround gChild →
        ¬ w.answersInherited gParent gChild) := by
  intro hErased
  rcases hLive gParent hInherited with
    ⟨gChild, hChild, hAnswers⟩
  exact (hErased gChild hChild) hAnswers

theorem lawful_ladder_implies_entry
    {ParentPiece ParentWhole ParentInvariant
      ChildPiece ChildWhole ChildInvariant
      ParentGround ChildGround Burden : Type u}
    (w :
      World
        ParentPiece ParentWhole ParentInvariant
        ChildPiece ChildWhole ChildInvariant
        ParentGround ChildGround Burden)
    (h : LawfulLadder w) :
    LadderEntry w :=
  h.1

theorem lawful_ladder_implies_child_endpoint
    {ParentPiece ParentWhole ParentInvariant
      ChildPiece ChildWhole ChildInvariant
      ParentGround ChildGround Burden : Type u}
    (w :
      World
        ParentPiece ParentWhole ParentInvariant
        ChildPiece ChildWhole ChildInvariant
        ParentGround ChildGround Burden)
    (h : LawfulLadder w) :
    ChildEndpoint w :=
  h.2.1

theorem lawful_ladder_implies_lineage_bound
    {ParentPiece ParentWhole ParentInvariant
      ChildPiece ChildWhole ChildInvariant
      ParentGround ChildGround Burden : Type u}
    (w :
      World
        ParentPiece ParentWhole ParentInvariant
        ChildPiece ChildWhole ChildInvariant
        ParentGround ChildGround Burden)
    (h : LawfulLadder w) :
    DescendantLineageBound w :=
  h.2.2

/-! --------------------------------------------------------------------------
Finite witness vocabulary
---------------------------------------------------------------------------- -/

inductive DemoParentGround
  | legacy
  deriving DecidableEq

inductive DemoChildGround
  | reworked
  | alternative
  deriving DecidableEq

inductive DemoBurden
  | inherited
  | novel
  deriving DecidableEq

abbrev DemoWorld :=
  World
    Coherence.TestPiece
    Coherence.TestWhole
    Coherence.TestInvariant
    Coherence.TestPiece
    Coherence.TestWhole
    Coherence.TestInvariant
    DemoParentGround
    DemoChildGround
    DemoBurden

def demoParentWholeOwnsGround :
    Coherence.TestWhole → DemoParentGround → Prop
  | .omega, .legacy => True

def demoInheritedGround : DemoParentGround → Prop
  | .legacy => True

def noInheritedGround : DemoParentGround → Prop
  | .legacy => False

def demoChildEntryGround : DemoChildGround → Prop
  | .reworked => True
  | .alternative => True

def demoAnswersInherited :
    DemoParentGround → DemoChildGround → Prop
  | .legacy, .reworked => True
  | .legacy, .alternative => True

def demoSupportsEntry : DemoChildGround → DemoBurden → Prop
  | .reworked, .novel => True
  | _, _ => False

def noGroundSupportsEntry (_ : DemoChildGround) (_ : DemoBurden) : Prop :=
  False

def demoChildWholeBelongsToEntryLineage :
    DemoBurden → Coherence.TestWhole → Prop
  | .novel, .omega => True
  | _, _ => False

def noChildWholeBelongsToEntryLineage
    (_ : DemoBurden) (_ : Coherence.TestWhole) : Prop :=
  False

def demoGroundSupplies :
    DemoChildGround → DemoBurden → Prop
  | .reworked, .inherited => True
  | .alternative, .inherited => True
  | _, .novel => False

def demoRelevantBurden (_ : DemoBurden) : Prop :=
  True

def demoPrecedes :
    DemoBurden → DemoBurden → Prop
  | .inherited, .novel => True
  | _, _ => False

def ladderSuccess : DemoWorld where
  parentWorld :=
    Coherence.coherenceSuccess

  childWorld :=
    Coherence.coherenceSuccess

  parentWholeOwnsGround :=
    demoParentWholeOwnsGround

  inheritedGround :=
    demoInheritedGround

  childEntryGround :=
    demoChildEntryGround

  answersInherited :=
    demoAnswersInherited

  supportsEntry :=
    demoSupportsEntry

  childWholeBelongsToEntryLineage :=
    demoChildWholeBelongsToEntryLineage

  groundSupplies :=
    demoGroundSupplies

  relevantBurden :=
    demoRelevantBurden

  precedes :=
    demoPrecedes

  entryBurden :=
    .novel

theorem ladderSuccess_parent_endpoint :
    ParentEndpoint ladderSuccess := by
  exact Coherence.coherenceSuccess_reaches_endpoint

theorem ladderSuccess_child_endpoint :
    ChildEndpoint ladderSuccess := by
  exact Coherence.coherenceSuccess_reaches_endpoint

theorem ladderSuccess_ground_attached :
    GroundAttached ladderSuccess := by
  intro g h
  cases g
  simp [ladderSuccess, demoInheritedGround,
    demoParentWholeOwnsGround] at h ⊢

theorem ladderSuccess_live_inheritance :
    LiveInheritance ladderSuccess := by
  intro g h
  cases g
  exact
    ⟨DemoChildGround.reworked,
     by simp [ladderSuccess, demoChildEntryGround],
     by simp [ladderSuccess, demoAnswersInherited]⟩

theorem ladderSuccess_entry_grounded :
    EntryGrounded ladderSuccess := by
  exact
    ⟨DemoChildGround.reworked,
     ⟨by
        refine
          ⟨by simp [ladderSuccess, demoChildEntryGround], ?_⟩
        exact
          ⟨DemoParentGround.legacy,
           by simp [ladderSuccess, demoInheritedGround],
           by simp [ladderSuccess, demoParentWholeOwnsGround],
           by simp [ladderSuccess, demoAnswersInherited]⟩,
      by simp [ladderSuccess, demoSupportsEntry]⟩⟩

theorem ladderSuccess_inherited_supplies_old :
    InheritedSupplies ladderSuccess DemoBurden.inherited := by
  exact
    ⟨DemoChildGround.reworked,
     ⟨by
        refine
          ⟨by simp [ladderSuccess, demoChildEntryGround], ?_⟩
        exact
          ⟨DemoParentGround.legacy,
           by simp [ladderSuccess, demoInheritedGround],
           by simp [ladderSuccess, demoParentWholeOwnsGround],
           by simp [ladderSuccess, demoAnswersInherited]⟩,
      by simp [ladderSuccess, demoGroundSupplies]⟩⟩

theorem ladderSuccess_novel_not_inherited :
    ¬ InheritedSupplies ladderSuccess DemoBurden.novel := by
  intro h
  rcases h with ⟨gChild, _hInheritedChild, hSupplies⟩
  cases gChild <;>
    simp [ladderSuccess, demoGroundSupplies] at hSupplies

theorem ladderSuccess_first_new_burden :
    FirstNewBurden ladderSuccess := by
  constructor
  · trivial
  constructor
  · exact ladderSuccess_novel_not_inherited
  · intro b _hRelevant hPrecedes
    cases b with
    | inherited =>
        exact ladderSuccess_inherited_supplies_old
    | novel =>
        simp [ladderSuccess, demoPrecedes] at hPrecedes

theorem ladderSuccess_entry :
    LadderEntry ladderSuccess := by
  exact
    ⟨ladderSuccess_parent_endpoint,
     ladderSuccess_ground_attached,
     ladderSuccess_live_inheritance,
     ladderSuccess_entry_grounded,
     ladderSuccess_first_new_burden⟩

theorem ladderSuccess_lineage_bound :
    DescendantLineageBound ladderSuccess := by
  simp [DescendantLineageBound, ladderSuccess,
    demoChildWholeBelongsToEntryLineage]

theorem ladderSuccess_lawful :
    LawfulLadder ladderSuccess := by
  exact
    ⟨ladderSuccess_entry,
     ladderSuccess_child_endpoint,
     ladderSuccess_lineage_bound⟩

/-! --------------------------------------------------------------------------
Countermodel: two Coherent systems without ancestry
---------------------------------------------------------------------------- -/

def coherentButDisconnected : DemoWorld where
  parentWorld :=
    Coherence.coherenceSuccess

  childWorld :=
    Coherence.coherenceSuccess

  parentWholeOwnsGround :=
    demoParentWholeOwnsGround

  inheritedGround :=
    noInheritedGround

  childEntryGround :=
    demoChildEntryGround

  answersInherited :=
    demoAnswersInherited

  supportsEntry :=
    demoSupportsEntry

  childWholeBelongsToEntryLineage :=
    demoChildWholeBelongsToEntryLineage

  groundSupplies :=
    demoGroundSupplies

  relevantBurden :=
    demoRelevantBurden

  precedes :=
    demoPrecedes

  entryBurden :=
    .novel

theorem coherentButDisconnected_parent_endpoint :
    ParentEndpoint coherentButDisconnected := by
  exact Coherence.coherenceSuccess_reaches_endpoint

theorem coherentButDisconnected_child_endpoint :
    ChildEndpoint coherentButDisconnected := by
  exact Coherence.coherenceSuccess_reaches_endpoint

theorem coherentButDisconnected_not_entry_grounded :
    ¬ EntryGrounded coherentButDisconnected := by
  intro h
  rcases h with
    ⟨gChild,
      ⟨_hChild, gParent, hInherited, _hOwned, _hAnswers⟩,
      _hSupports⟩
  cases gParent
  simp [coherentButDisconnected, noInheritedGround] at hInherited

theorem coherent_endpoints_do_not_entail_ladder_entry :
    ParentEndpoint coherentButDisconnected
    ∧ ChildEndpoint coherentButDisconnected
    ∧ ¬ LadderEntry coherentButDisconnected := by
  constructor
  · exact coherentButDisconnected_parent_endpoint
  constructor
  · exact coherentButDisconnected_child_endpoint
  · intro hEntry
    exact
      coherentButDisconnected_not_entry_grounded
        hEntry.2.2.2.1

/-! --------------------------------------------------------------------------
Countermodel: live inheritance that does not actually ground entry
---------------------------------------------------------------------------- -/

def decorativeInheritance : DemoWorld where
  parentWorld :=
    Coherence.coherenceSuccess

  childWorld :=
    Coherence.coherenceSuccess

  parentWholeOwnsGround :=
    demoParentWholeOwnsGround

  inheritedGround :=
    demoInheritedGround

  childEntryGround :=
    demoChildEntryGround

  answersInherited :=
    demoAnswersInherited

  supportsEntry :=
    noGroundSupportsEntry

  childWholeBelongsToEntryLineage :=
    demoChildWholeBelongsToEntryLineage

  groundSupplies :=
    demoGroundSupplies

  relevantBurden :=
    demoRelevantBurden

  precedes :=
    demoPrecedes

  entryBurden :=
    .novel

theorem decorativeInheritance_live :
    LiveInheritance decorativeInheritance := by
  intro g h
  cases g
  exact
    ⟨DemoChildGround.reworked,
     by simp [decorativeInheritance, demoChildEntryGround],
     by simp [decorativeInheritance, demoAnswersInherited]⟩

theorem decorativeInheritance_not_entry_grounded :
    ¬ EntryGrounded decorativeInheritance := by
  intro h
  rcases h with ⟨gChild, _hInherited, hSupports⟩
  exact
    (by
      cases gChild <;>
        simp [decorativeInheritance, noGroundSupportsEntry] at hSupports)

theorem live_inheritance_does_not_entail_ladder_entry :
    LiveInheritance decorativeInheritance
    ∧ ¬ LadderEntry decorativeInheritance := by
  constructor
  · exact decorativeInheritance_live
  · intro hEntry
    exact
      decorativeInheritance_not_entry_grounded
        hEntry.2.2.2.1

/-! --------------------------------------------------------------------------
Countermodel: inherited entry burden is not a new ladder burden
---------------------------------------------------------------------------- -/

def inheritedEntryBurden : DemoWorld where
  parentWorld :=
    Coherence.coherenceSuccess

  childWorld :=
    Coherence.coherenceSuccess

  parentWholeOwnsGround :=
    demoParentWholeOwnsGround

  inheritedGround :=
    demoInheritedGround

  childEntryGround :=
    demoChildEntryGround

  answersInherited :=
    demoAnswersInherited

  supportsEntry :=
    demoSupportsEntry

  childWholeBelongsToEntryLineage :=
    demoChildWholeBelongsToEntryLineage

  groundSupplies :=
    demoGroundSupplies

  relevantBurden :=
    demoRelevantBurden

  precedes :=
    demoPrecedes

  entryBurden :=
    .inherited

theorem inheritedEntryBurden_supplied :
    InheritedSupplies inheritedEntryBurden DemoBurden.inherited := by
  exact
    ⟨DemoChildGround.reworked,
     ⟨by
        refine
          ⟨by simp [inheritedEntryBurden, demoChildEntryGround], ?_⟩
        exact
          ⟨DemoParentGround.legacy,
           by simp [inheritedEntryBurden, demoInheritedGround],
           by simp [inheritedEntryBurden, demoParentWholeOwnsGround],
           by simp [inheritedEntryBurden, demoAnswersInherited]⟩,
      by simp [inheritedEntryBurden, demoGroundSupplies]⟩⟩

theorem inherited_entry_burden_is_not_first_new :
    ¬ FirstNewBurden inheritedEntryBurden := by
  intro h
  exact h.2.1 inheritedEntryBurden_supplied

theorem inherited_entry_burden_does_not_make_new_ladder_entry :
    ¬ LadderEntry inheritedEntryBurden := by
  intro h
  exact
    inherited_entry_burden_is_not_first_new
      h.2.2.2.2

/-! --------------------------------------------------------------------------
Countermodel: entry is licensed but descendant Coherence is not guaranteed
---------------------------------------------------------------------------- -/

def entryWithoutChildCoherence : DemoWorld where
  parentWorld :=
    Coherence.coherenceSuccess

  childWorld :=
    Coherence.fragmented

  parentWholeOwnsGround :=
    demoParentWholeOwnsGround

  inheritedGround :=
    demoInheritedGround

  childEntryGround :=
    demoChildEntryGround

  answersInherited :=
    demoAnswersInherited

  supportsEntry :=
    demoSupportsEntry

  childWholeBelongsToEntryLineage :=
    demoChildWholeBelongsToEntryLineage

  groundSupplies :=
    demoGroundSupplies

  relevantBurden :=
    demoRelevantBurden

  precedes :=
    demoPrecedes

  entryBurden :=
    .novel

theorem entryWithoutChildCoherence_entry :
    LadderEntry entryWithoutChildCoherence := by
  constructor
  · exact Coherence.coherenceSuccess_reaches_endpoint
  constructor
  · intro g h
    cases g
    simp [entryWithoutChildCoherence, demoInheritedGround,
      demoParentWholeOwnsGround] at h ⊢
  constructor
  · intro g h
    cases g
    exact
      ⟨DemoChildGround.reworked,
       by simp [entryWithoutChildCoherence, demoChildEntryGround],
       by simp [entryWithoutChildCoherence, demoAnswersInherited]⟩
  constructor
  · exact
      ⟨DemoChildGround.reworked,
       ⟨by
          refine
            ⟨by simp [entryWithoutChildCoherence, demoChildEntryGround], ?_⟩
          exact
            ⟨DemoParentGround.legacy,
             by simp [entryWithoutChildCoherence, demoInheritedGround],
             by simp [entryWithoutChildCoherence,
               demoParentWholeOwnsGround],
             by simp [entryWithoutChildCoherence,
               demoAnswersInherited]⟩,
        by simp [entryWithoutChildCoherence, demoSupportsEntry]⟩⟩
  · constructor
    · trivial
    constructor
    · intro hInherited
      rcases hInherited with ⟨gChild, _hIG, hSupplies⟩
      cases gChild <;>
        simp [entryWithoutChildCoherence, demoGroundSupplies] at hSupplies
    · intro b _hRelevant hPrecedes
      cases b with
      | inherited =>
          exact
            ⟨DemoChildGround.reworked,
             ⟨by
                refine
                  ⟨by simp [entryWithoutChildCoherence,
                    demoChildEntryGround], ?_⟩
                exact
                  ⟨DemoParentGround.legacy,
                   by simp [entryWithoutChildCoherence,
                     demoInheritedGround],
                   by simp [entryWithoutChildCoherence,
                     demoParentWholeOwnsGround],
                   by simp [entryWithoutChildCoherence,
                     demoAnswersInherited]⟩,
              by simp [entryWithoutChildCoherence,
                demoGroundSupplies]⟩⟩
      | novel =>
          simp [entryWithoutChildCoherence, demoPrecedes] at hPrecedes

theorem entryWithoutChildCoherence_not_child_endpoint :
    ¬ ChildEndpoint entryWithoutChildCoherence := by
  intro hEndpoint
  have hCoheres :
      Coherence.Coheres Coherence.fragmented :=
    Coherence.endpoint_requires_coherence hEndpoint
  exact Coherence.fragmented_not_coherent hCoheres

theorem ladder_entry_does_not_entail_descendant_coherence :
    LadderEntry entryWithoutChildCoherence
    ∧ ¬ LawfulLadder entryWithoutChildCoherence := by
  constructor
  · exact entryWithoutChildCoherence_entry
  · intro hLawful
    exact
      entryWithoutChildCoherence_not_child_endpoint
        hLawful.2.1

/-! --------------------------------------------------------------------------
Countermodel: valid entry + coherent child, but child is not lineage-bound
---------------------------------------------------------------------------- -/

def splicedCoherentChild : DemoWorld where
  parentWorld :=
    Coherence.coherenceSuccess

  childWorld :=
    Coherence.coherenceSuccess

  parentWholeOwnsGround :=
    demoParentWholeOwnsGround

  inheritedGround :=
    demoInheritedGround

  childEntryGround :=
    demoChildEntryGround

  answersInherited :=
    demoAnswersInherited

  supportsEntry :=
    demoSupportsEntry

  childWholeBelongsToEntryLineage :=
    noChildWholeBelongsToEntryLineage

  groundSupplies :=
    demoGroundSupplies

  relevantBurden :=
    demoRelevantBurden

  precedes :=
    demoPrecedes

  entryBurden :=
    .novel

theorem splicedCoherentChild_entry :
    LadderEntry splicedCoherentChild := by
  constructor
  · exact Coherence.coherenceSuccess_reaches_endpoint
  constructor
  · intro g h
    cases g
    simp [splicedCoherentChild, demoInheritedGround,
      demoParentWholeOwnsGround] at h ⊢
  constructor
  · intro g h
    cases g
    exact
      ⟨DemoChildGround.reworked,
       by simp [splicedCoherentChild, demoChildEntryGround],
       by simp [splicedCoherentChild, demoAnswersInherited]⟩
  constructor
  · exact
      ⟨DemoChildGround.reworked,
       ⟨by
          refine
            ⟨by simp [splicedCoherentChild, demoChildEntryGround], ?_⟩
          exact
            ⟨DemoParentGround.legacy,
             by simp [splicedCoherentChild, demoInheritedGround],
             by simp [splicedCoherentChild, demoParentWholeOwnsGround],
             by simp [splicedCoherentChild, demoAnswersInherited]⟩,
        by simp [splicedCoherentChild, demoSupportsEntry]⟩⟩
  · constructor
    · trivial
    constructor
    · intro hInherited
      rcases hInherited with ⟨gChild, _hIG, hSupplies⟩
      cases gChild <;>
        simp [splicedCoherentChild, demoGroundSupplies] at hSupplies
    · intro b _hRelevant hPrecedes
      cases b with
      | inherited =>
          exact
            ⟨DemoChildGround.reworked,
             ⟨by
                refine
                  ⟨by simp [splicedCoherentChild, demoChildEntryGround], ?_⟩
                exact
                  ⟨DemoParentGround.legacy,
                   by simp [splicedCoherentChild, demoInheritedGround],
                   by simp [splicedCoherentChild, demoParentWholeOwnsGround],
                   by simp [splicedCoherentChild, demoAnswersInherited]⟩,
              by simp [splicedCoherentChild, demoGroundSupplies]⟩⟩
      | novel =>
          simp [splicedCoherentChild, demoPrecedes] at hPrecedes

theorem splicedCoherentChild_child_endpoint :
    ChildEndpoint splicedCoherentChild := by
  exact Coherence.coherenceSuccess_reaches_endpoint

theorem splicedCoherentChild_not_lineage_bound :
    ¬ DescendantLineageBound splicedCoherentChild := by
  simp [DescendantLineageBound, splicedCoherentChild,
    noChildWholeBelongsToEntryLineage]

theorem coherent_child_does_not_complete_unbound_entry :
    LadderEntry splicedCoherentChild
    ∧ ChildEndpoint splicedCoherentChild
    ∧ ¬ LawfulLadder splicedCoherentChild := by
  constructor
  · exact splicedCoherentChild_entry
  constructor
  · exact splicedCoherentChild_child_endpoint
  · intro hLawful
    exact
      splicedCoherentChild_not_lineage_bound
        hLawful.2.2

/-! --------------------------------------------------------------------------
Non-unique inheritance answer witness
---------------------------------------------------------------------------- -/

theorem ladder_inheritance_does_not_select_unique_child_answer :
    LiveInheritance ladderSuccess
    ∧
    ∃ gParent gChild₁ gChild₂,
      ladderSuccess.inheritedGround gParent
      ∧ ladderSuccess.childEntryGround gChild₁
      ∧ ladderSuccess.childEntryGround gChild₂
      ∧ ladderSuccess.answersInherited gParent gChild₁
      ∧ ladderSuccess.answersInherited gParent gChild₂
      ∧ gChild₁ ≠ gChild₂ := by
  constructor
  · exact ladderSuccess_live_inheritance
  · exact
      ⟨DemoParentGround.legacy,
       DemoChildGround.reworked,
       DemoChildGround.alternative,
       by simp [ladderSuccess, demoInheritedGround],
       by simp [ladderSuccess, demoChildEntryGround],
       by simp [ladderSuccess, demoChildEntryGround],
       by simp [ladderSuccess, demoAnswersInherited],
       by simp [ladderSuccess, demoAnswersInherited],
       by decide⟩

/-! --------------------------------------------------------------------------
First Ladder semantic checkpoint
---------------------------------------------------------------------------- -/

theorem ladder_machine_checkpoint :
    LawfulLadder ladderSuccess
    ∧
    (
      ParentEndpoint coherentButDisconnected
      ∧ ChildEndpoint coherentButDisconnected
      ∧ ¬ LadderEntry coherentButDisconnected
    )
    ∧
    (
      LiveInheritance decorativeInheritance
      ∧ ¬ LadderEntry decorativeInheritance
    )
    ∧
    ¬ LadderEntry inheritedEntryBurden
    ∧
    (
      LadderEntry entryWithoutChildCoherence
      ∧ ¬ LawfulLadder entryWithoutChildCoherence
    )
    ∧
    (
      LadderEntry splicedCoherentChild
      ∧ ChildEndpoint splicedCoherentChild
      ∧ ¬ LawfulLadder splicedCoherentChild
    )
    ∧
    (
      LiveInheritance ladderSuccess
      ∧
      ∃ gParent gChild₁ gChild₂,
        ladderSuccess.inheritedGround gParent
        ∧ ladderSuccess.childEntryGround gChild₁
        ∧ ladderSuccess.childEntryGround gChild₂
        ∧ ladderSuccess.answersInherited gParent gChild₁
        ∧ ladderSuccess.answersInherited gParent gChild₂
        ∧ gChild₁ ≠ gChild₂
    ) := by
  exact
    ⟨ladderSuccess_lawful,
     coherent_endpoints_do_not_entail_ladder_entry,
     live_inheritance_does_not_entail_ladder_entry,
     inherited_entry_burden_does_not_make_new_ladder_entry,
     ladder_entry_does_not_entail_descendant_coherence,
     coherent_child_does_not_complete_unbound_entry,
     ladder_inheritance_does_not_select_unique_child_answer⟩


/-! --------------------------------------------------------------------------
Ladder +3 answer core and same-level ancestry-failure discrimination
---------------------------------------------------------------------------- -/

/--
Same-level Ladder object surface.

Both coherent endpoints remain available.  This deliberately excludes a child
that simply failed to reach Coherence.
-/
def LadderObjectEligible
    {ParentPiece ParentWhole ParentInvariant
      ChildPiece ChildWhole ChildInvariant
      ParentGround ChildGround Burden : Type u}
    (w :
      World
        ParentPiece ParentWhole ParentInvariant
        ChildPiece ChildWhole ChildInvariant
        ParentGround ChildGround Burden) : Prop :=
  ParentEndpoint w
  ∧ ChildEndpoint w

/--
Lower-semantic ancestry capacity on the fixed coherent-endpoint surface.

The descendant entry is genuinely parent-grounded and the coherent child whole
is bound to that lineage.
-/
def AncestryCapacity
    {ParentPiece ParentWhole ParentInvariant
      ChildPiece ChildWhole ChildInvariant
      ParentGround ChildGround Burden : Type u}
    (w :
      World
        ParentPiece ParentWhole ParentInvariant
        ChildPiece ChildWhole ChildInvariant
        ParentGround ChildGround Burden) : Prop :=
  LadderEntry w
  ∧ DescendantLineageBound w

/--
Independent syntax for the strong Ladder ancestry-edge failure.

Both coherent endpoints survive while the ancestry capacity does not.
-/
def LadderAncestryFailure
    {ParentPiece ParentWhole ParentInvariant
      ChildPiece ChildWhole ChildInvariant
      ParentGround ChildGround Burden : Type u}
    (w :
      World
        ParentPiece ParentWhole ParentInvariant
        ChildPiece ChildWhole ChildInvariant
        ParentGround ChildGround Burden) : Prop :=
  LadderObjectEligible w
  ∧ ¬ AncestryCapacity w

theorem lawful_ladder_on_eligible_surface_iff_ancestry_capacity
    {ParentPiece ParentWhole ParentInvariant
      ChildPiece ChildWhole ChildInvariant
      ParentGround ChildGround Burden : Type u}
    (w :
      World
        ParentPiece ParentWhole ParentInvariant
        ChildPiece ChildWhole ChildInvariant
        ParentGround ChildGround Burden)
    (hEligible : LadderObjectEligible w) :
    LawfulLadder w ↔ AncestryCapacity w := by
  constructor
  · intro hLawful
    exact
      ⟨hLawful.1,
       hLawful.2.2⟩
  · intro hCapacity
    exact
      ⟨hCapacity.1,
       hEligible.2,
       hCapacity.2⟩

theorem ladder_ancestry_failure_iff_not_lawful_on_surface
    {ParentPiece ParentWhole ParentInvariant
      ChildPiece ChildWhole ChildInvariant
      ParentGround ChildGround Burden : Type u}
    (w :
      World
        ParentPiece ParentWhole ParentInvariant
        ChildPiece ChildWhole ChildInvariant
        ParentGround ChildGround Burden)
    (hEligible : LadderObjectEligible w) :
    LadderAncestryFailure w ↔ ¬ LawfulLadder w := by
  constructor
  · intro hFail hLawful
    exact
      hFail.2
        ((lawful_ladder_on_eligible_surface_iff_ancestry_capacity
          w hEligible).mp hLawful)
  · intro hNotLawful
    refine
      ⟨hEligible, ?_⟩
    intro hCapacity
    exact
      hNotLawful
        ((lawful_ladder_on_eligible_surface_iff_ancestry_capacity
          w hEligible).mpr hCapacity)

/-! --------------------------------------------------------------------------
+3 answer core
---------------------------------------------------------------------------- -/

inductive LadderCandidateTag (Marker : Type u) : Type u
  | ladder

inductive LadderLevelTag (Marker : Type u) : Type u
  | declaredLevel

inductive LadderScopeTag (Marker : Type u) : Type u
  | declaredScope

inductive LadderJobTag (Marker : Type u) : Type u
  | coherentAncestryJob

inductive LadderCapacityTag (Marker : Type u) : Type u
  | coherenceGroundedAncestry

def LadderStrictlyThinner
    {Case : Type u}
    (s t : Case → Prop) : Prop :=
  (∀ x, t x → s x)
  ∧ ∃ x, s x ∧ ¬ t x

def LadderStructuralJobEarned
    {ParentPiece ParentWhole ParentInvariant
      ChildPiece ChildWhole ChildInvariant
      ParentGround ChildGround Burden : Type u} : Prop :=
  ∃ x :
      World
        ParentPiece ParentWhole ParentInvariant
        ChildPiece ChildWhole ChildInvariant
        ParentGround ChildGround Burden,
    LadderObjectEligible x
    ∧ LadderAncestryFailure x

def LadderHonestShape
    {ParentPiece ParentWhole ParentInvariant
      ChildPiece ChildWhole ChildInvariant
      ParentGround ChildGround Burden : Type u}
    (s :
      World
        ParentPiece ParentWhole ParentInvariant
        ChildPiece ChildWhole ChildInvariant
        ParentGround ChildGround Burden → Prop) : Prop :=
  ∀ x,
    s x →
    LadderObjectEligible x

def LadderShapePerformsJob
    {ParentPiece ParentWhole ParentInvariant
      ChildPiece ChildWhole ChildInvariant
      ParentGround ChildGround Burden : Type u}
    (s :
      World
        ParentPiece ParentWhole ParentInvariant
        ChildPiece ChildWhole ChildInvariant
        ParentGround ChildGround Burden → Prop) : Prop :=
  ∀ x,
    s x →
    AncestryCapacity x

structure LadderLossPassageEvidence
    (ParentPiece ParentWhole ParentInvariant
      ChildPiece ChildWhole ChildInvariant
      ParentGround ChildGround Burden : Type u) where
  passage :
    World
      ParentPiece ParentWhole ParentInvariant
      ChildPiece ChildWhole ChildInvariant
      ParentGround ChildGround Burden →
    World
      ParentPiece ParentWhole ParentInvariant
      ChildPiece ChildWhole ChildInvariant
      ParentGround ChildGround Burden →
    Prop

  before :
    World
      ParentPiece ParentWhole ParentInvariant
      ChildPiece ChildWhole ChildInvariant
      ParentGround ChildGround Burden

  after :
    World
      ParentPiece ParentWhole ParentInvariant
      ChildPiece ChildWhole ChildInvariant
      ParentGround ChildGround Burden

  beforeLawful :
    LawfulLadder before

  afterFailure :
    LadderAncestryFailure after

  admittedPassage :
    passage before after

def ladderPlusThreeAnswerWorld
    {ParentPiece ParentWhole ParentInvariant
      ChildPiece ChildWhole ChildInvariant
      ParentGround ChildGround Burden : Type u}
    (loss :
      LadderLossPassageEvidence
        ParentPiece ParentWhole ParentInvariant
        ChildPiece ChildWhole ChildInvariant
        ParentGround ChildGround Burden) :
    PlusThree.World
      (LadderCandidateTag
        (World
          ParentPiece ParentWhole ParentInvariant
          ChildPiece ChildWhole ChildInvariant
          ParentGround ChildGround Burden))
      (LadderLevelTag
        (World
          ParentPiece ParentWhole ParentInvariant
          ChildPiece ChildWhole ChildInvariant
          ParentGround ChildGround Burden))
      (LadderScopeTag
        (World
          ParentPiece ParentWhole ParentInvariant
          ChildPiece ChildWhole ChildInvariant
          ParentGround ChildGround Burden))
      (LadderJobTag
        (World
          ParentPiece ParentWhole ParentInvariant
          ChildPiece ChildWhole ChildInvariant
          ParentGround ChildGround Burden))
      ((World
          ParentPiece ParentWhole ParentInvariant
          ChildPiece ChildWhole ChildInvariant
          ParentGround ChildGround Burden) → Prop)
      (LadderCapacityTag
        (World
          ParentPiece ParentWhole ParentInvariant
          ChildPiece ChildWhole ChildInvariant
          ParentGround ChildGround Burden))
      (World
        ParentPiece ParentWhole ParentInvariant
        ChildPiece ChildWhole ChildInvariant
        ParentGround ChildGround Burden) where
  selectedCandidate :=
    .ladder

  selectedLevel :=
    .declaredLevel

  selectedScope :=
    .declaredScope

  selectedJob :=
    .coherentAncestryJob

  selectedShape :=
    LawfulLadder

  selectedCapacity :=
    .coherenceGroundedAncestry

  structuralJob :=
    fun _candidate _level _scope _job =>
      @LadderStructuralJobEarned
        ParentPiece ParentWhole ParentInvariant
        ChildPiece ChildWhole ChildInvariant
        ParentGround ChildGround Burden

  honestShape :=
    fun _candidate _level _scope s =>
      @LadderHonestShape
        ParentPiece ParentWhole ParentInvariant
        ChildPiece ChildWhole ChildInvariant
        ParentGround ChildGround Burden
        s

  performs :=
    fun s _job =>
      @LadderShapePerformsJob
        ParentPiece ParentWhole ParentInvariant
        ChildPiece ChildWhole ChildInvariant
        ParentGround ChildGround Burden
        s

  strictlyThinner :=
    @LadderStrictlyThinner
      (World
        ParentPiece ParentWhole ParentInvariant
        ChildPiece ChildWhole ChildInvariant
        ParentGround ChildGround Burden)

  caseInScope :=
    fun _candidate _level _scope x =>
      LadderObjectEligible x

  shapeHolds :=
    fun s x =>
      s x

  failurePassage :=
    loss.passage

  shapeFails :=
    fun s x =>
      ¬ s x

  capacityAvailable :=
    fun _capacity x =>
      AncestryCapacity x

  adjacentAbsorptionTested :=
    False

  falseSubstituteTested :=
    False

  levelShiftTested :=
    False

  scopeShiftTested :=
    False

  internalInflationTested :=
    False

  neededAtAllTested :=
    False

  candidateSurvives :=
    False

  objectClosed :=
    False

theorem ladder_plus_three_job_fidelity
    {ParentPiece ParentWhole ParentInvariant
      ChildPiece ChildWhole ChildInvariant
      ParentGround ChildGround Burden : Type u}
    (loss :
      LadderLossPassageEvidence
        ParentPiece ParentWhole ParentInvariant
        ChildPiece ChildWhole ChildInvariant
        ParentGround ChildGround Burden) :
    PlusThree.JobFidelity
      (ladderPlusThreeAnswerWorld loss) := by
  exact
    ⟨loss.after,
     loss.afterFailure.1,
     loss.afterFailure⟩

theorem ladder_plus_three_shape_fidelity
    {ParentPiece ParentWhole ParentInvariant
      ChildPiece ChildWhole ChildInvariant
      ParentGround ChildGround Burden : Type u}
    (loss :
      LadderLossPassageEvidence
        ParentPiece ParentWhole ParentInvariant
        ChildPiece ChildWhole ChildInvariant
        ParentGround ChildGround Burden) :
    PlusThree.ShapeFidelity
      (ladderPlusThreeAnswerWorld loss) := by
  constructor
  · intro x hLawful
    exact
      ⟨hLawful.1.1,
       hLawful.2.1⟩
  constructor
  · intro x hLawful
    exact
      ⟨hLawful.1,
       hLawful.2.2⟩
  · intro thinner hThinner hCandidate
    rcases hThinner.2 with
      ⟨x, hThin, hNotLawful⟩
    have hEligible :
        LadderObjectEligible x :=
      hCandidate.1 x hThin
    have hCapacity :
        AncestryCapacity x :=
      hCandidate.2 x hThin
    exact
      hNotLawful
        ((lawful_ladder_on_eligible_surface_iff_ancestry_capacity
          x hEligible).mpr hCapacity)

theorem ladder_plus_three_capacity_loss_fidelity
    {ParentPiece ParentWhole ParentInvariant
      ChildPiece ChildWhole ChildInvariant
      ParentGround ChildGround Burden : Type u}
    (loss :
      LadderLossPassageEvidence
        ParentPiece ParentWhole ParentInvariant
        ChildPiece ChildWhole ChildInvariant
        ParentGround ChildGround Burden) :
    PlusThree.CapacityLossFidelity
      (ladderPlusThreeAnswerWorld loss) := by
  refine
    ⟨loss.before,
     loss.after,
     ?_, ?_, ?_, ?_, ?_, ?_, ?_⟩
  · exact
      ⟨loss.beforeLawful.1.1,
       loss.beforeLawful.2.1⟩
  · exact
      loss.afterFailure.1
  · exact
      loss.beforeLawful
  · exact
      ⟨loss.beforeLawful.1,
       loss.beforeLawful.2.2⟩
  · exact
      loss.admittedPassage
  · exact
      fun hLawful =>
        loss.afterFailure.2
          ⟨hLawful.1, hLawful.2.2⟩
  · exact
      loss.afterFailure.2

theorem ladder_plus_three_answer_core
    {ParentPiece ParentWhole ParentInvariant
      ChildPiece ChildWhole ChildInvariant
      ParentGround ChildGround Burden : Type u}
    (loss :
      LadderLossPassageEvidence
        ParentPiece ParentWhole ParentInvariant
        ChildPiece ChildWhole ChildInvariant
        ParentGround ChildGround Burden) :
    PlusThree.ObjectAnswerEndpoint
      (ladderPlusThreeAnswerWorld loss) := by
  exact
    (PlusThree.object_answer_endpoint_iff_plus_three
      (ladderPlusThreeAnswerWorld loss)).mpr
      ⟨ladder_plus_three_job_fidelity loss,
       ladder_plus_three_shape_fidelity loss,
       ladder_plus_three_capacity_loss_fidelity loss⟩

theorem ladder_plus_three_does_not_smuggle_pressure_adjudication
    {ParentPiece ParentWhole ParentInvariant
      ChildPiece ChildWhole ChildInvariant
      ParentGround ChildGround Burden : Type u}
    (loss :
      LadderLossPassageEvidence
        ParentPiece ParentWhole ParentInvariant
        ChildPiece ChildWhole ChildInvariant
        ParentGround ChildGround Burden) :
    ¬ PlusThree.PressureAdjudicated
        (ladderPlusThreeAnswerWorld loss) := by
  intro h
  exact h.1

/-! --------------------------------------------------------------------------
Strong same-level Ladder ancestry signature
---------------------------------------------------------------------------- -/

/-
Important closure boundary:

The strong object-specific signature IS machine-closed:

* parent Coherence endpoint survives;
* child Coherence endpoint survives;
* ancestry capacity is absent.

But foundational first-break articulation is intentionally NOT closed here.

Why:
endpoint survival does not establish that the ancestry relation itself had
already passed Persistence.  A lineage relation may in principle first-break
through Dissolution, Shear, Drift, Echo, or Lock depending on independently
warranted route / history structure.

Therefore this kernel does not manufacture a Drift/Echo/Lock-only projection.
A later route-aware Ladder articulation may close that burden without changing
the already-closed ancestry signature.
-/

theorem ladder_ancestry_failure_preserves_both_coherent_endpoints
    {ParentPiece ParentWhole ParentInvariant
      ChildPiece ChildWhole ChildInvariant
      ParentGround ChildGround Burden : Type u}
    (x :
      World
        ParentPiece ParentWhole ParentInvariant
        ChildPiece ChildWhole ChildInvariant
        ParentGround ChildGround Burden)
    (hFail : LadderAncestryFailure x) :
    ParentEndpoint x
    ∧ ChildEndpoint x := by
  exact hFail.1

theorem ladder_strong_ancestry_signature
    {ParentPiece ParentWhole ParentInvariant
      ChildPiece ChildWhole ChildInvariant
      ParentGround ChildGround Burden : Type u}
    (x :
      World
        ParentPiece ParentWhole ParentInvariant
        ChildPiece ChildWhole ChildInvariant
        ParentGround ChildGround Burden)
    (hFail : LadderAncestryFailure x) :
    ParentEndpoint x
    ∧ ChildEndpoint x
    ∧ ¬ AncestryCapacity x := by
  exact
    ⟨hFail.1.1,
     hFail.1.2,
     hFail.2⟩

theorem ladder_same_level_failure_semantic_closure
    {ParentPiece ParentWhole ParentInvariant
      ChildPiece ChildWhole ChildInvariant
      ParentGround ChildGround Burden : Type u} :
    (
      ∀ x :
        World
          ParentPiece ParentWhole ParentInvariant
          ChildPiece ChildWhole ChildInvariant
          ParentGround ChildGround Burden,
        LadderObjectEligible x →
        (LadderAncestryFailure x ↔ ¬ LawfulLadder x)
    )
    ∧
    (
      ∀ x :
        World
          ParentPiece ParentWhole ParentInvariant
          ChildPiece ChildWhole ChildInvariant
          ParentGround ChildGround Burden,
        LadderAncestryFailure x →
        ParentEndpoint x
        ∧ ChildEndpoint x
        ∧ ¬ AncestryCapacity x
    ) := by
  constructor
  · intro x hEligible
    exact
      ladder_ancestry_failure_iff_not_lawful_on_surface
        x hEligible
  · intro x hFail
    exact ladder_strong_ancestry_signature x hFail

theorem entry_without_child_coherence_is_outside_ladder_failure_surface :
    ¬ LadderObjectEligible entryWithoutChildCoherence := by
  intro hEligible
  exact
    entryWithoutChildCoherence_not_child_endpoint
      hEligible.2

theorem ladder_entry_support_does_not_mean_burden_is_inherited :
    ladderSuccess.supportsEntry
        DemoChildGround.reworked
        DemoBurden.novel
    ∧
    ¬ ladderSuccess.groundSupplies
        DemoChildGround.reworked
        DemoBurden.novel := by
  constructor
  · simp [ladderSuccess, demoSupportsEntry]
  · simp [ladderSuccess, demoGroundSupplies]

/-! --------------------------------------------------------------------------
Demo ancestry-loss passage
---------------------------------------------------------------------------- -/

def demoLadderLossPassage
    (before after : DemoWorld) : Prop :=
  before = ladderSuccess
  ∧ after = splicedCoherentChild

theorem splicedCoherentChild_ancestry_failure :
    LadderAncestryFailure splicedCoherentChild := by
  constructor
  · exact
      ⟨splicedCoherentChild_entry.1,
       splicedCoherentChild_child_endpoint⟩
  · intro hCapacity
    exact
      splicedCoherentChild_not_lineage_bound
        hCapacity.2

def demoLadderLossEvidence :
    LadderLossPassageEvidence
      Coherence.TestPiece
      Coherence.TestWhole
      Coherence.TestInvariant
      Coherence.TestPiece
      Coherence.TestWhole
      Coherence.TestInvariant
      DemoParentGround
      DemoChildGround
      DemoBurden where
  passage :=
    demoLadderLossPassage

  before :=
    ladderSuccess

  after :=
    splicedCoherentChild

  beforeLawful :=
    ladderSuccess_lawful

  afterFailure :=
    splicedCoherentChild_ancestry_failure

  admittedPassage := by
    simp [demoLadderLossPassage]

/-! --------------------------------------------------------------------------
Combined semantic closure checkpoint
---------------------------------------------------------------------------- -/

theorem ladder_plus_three_and_signature_checkpoint :
    PlusThree.ObjectAnswerEndpoint
      (ladderPlusThreeAnswerWorld demoLadderLossEvidence)
    ∧
    ¬ PlusThree.PressureAdjudicated
      (ladderPlusThreeAnswerWorld demoLadderLossEvidence)
    ∧
    (
      ∀ x : DemoWorld,
        LadderObjectEligible x →
        (LadderAncestryFailure x ↔ ¬ LawfulLadder x)
    )
    ∧
    (
      ∀ x : DemoWorld,
        LadderAncestryFailure x →
        ParentEndpoint x
        ∧ ChildEndpoint x
        ∧ ¬ AncestryCapacity x
    )
    ∧
    ¬ LadderObjectEligible entryWithoutChildCoherence
    ∧
    (
      ladderSuccess.supportsEntry
          DemoChildGround.reworked
          DemoBurden.novel
      ∧
      ¬ ladderSuccess.groundSupplies
          DemoChildGround.reworked
          DemoBurden.novel
    ) := by
  constructor
  · exact
      ladder_plus_three_answer_core
        demoLadderLossEvidence
  constructor
  · exact
      ladder_plus_three_does_not_smuggle_pressure_adjudication
        demoLadderLossEvidence
  constructor
  · intro x hEligible
    exact
      ladder_ancestry_failure_iff_not_lawful_on_surface
        x hEligible
  constructor
  · intro x hFail
    exact ladder_strong_ancestry_signature x hFail
  constructor
  · exact
      entry_without_child_coherence_is_outside_ladder_failure_surface
  · exact
      ladder_entry_support_does_not_mean_burden_is_inherited

end Ladder
end StructuralFlow


/-!
===============================================================================
H READOUT — PUBLIC THEOREM MODULE
Historical machine provenance: kernel attempt v0.1; full consolidated run on SF Universal Machine Kernel v1.3
===============================================================================

Purpose
-------
Machine-test H as a derived current prerequisite-complete hinge-depth readout.

H is not a new capacity or object.  It is a bounded ordinal readout of one
current six-hinge status vector:

Persistence -> Boundary -> Cascade -> Authorization -> Recognition -> Coherence.

The foundational FailureClosure kernel splits Persistence into establishment
and carry-under-load.  H counts Persistence as currently satisfied only when
the relevant retained availability carries under load.
-/

namespace StructuralFlow
namespace HReadout

structure CurrentState where
  persistence : Prop
  boundary : Prop
  cascade : Prop
  authorization : Prop
  recognition : Prop
  coherence : Prop

structure CurrentWellFormed (s : CurrentState) : Prop where
  boundary_requires_persistence :
    s.boundary -> s.persistence

  cascade_requires_boundary :
    s.cascade -> s.boundary

  authorization_requires_cascade :
    s.authorization -> s.cascade

  recognition_requires_authorization :
    s.recognition -> s.authorization

  coherence_requires_recognition :
    s.coherence -> s.recognition

/--
Current prerequisite-complete hinge depth.

The nested tests make H a prefix readout.  Downstream residue or a downstream
flag cannot raise H after an earlier current prerequisite fails.
-/
noncomputable def depth (s : CurrentState) : Nat := by
  classical
  exact
    if s.persistence then
      if s.boundary then
        if s.cascade then
          if s.authorization then
            if s.recognition then
              if s.coherence then 6 else 5
            else 4
          else 3
        else 2
      else 1
    else 0

theorem depth_le_six (s : CurrentState) :
    depth s <= 6 := by
  classical
  by_cases hp : s.persistence
  · by_cases hb : s.boundary
    · by_cases hc : s.cascade
      · by_cases ha : s.authorization
        · by_cases hr : s.recognition
          · by_cases hco : s.coherence
            · simp [depth, hp, hb, hc, ha, hr, hco]
            · simp [depth, hp, hb, hc, ha, hr, hco]
          · simp [depth, hp, hb, hc, ha, hr]
        · simp [depth, hp, hb, hc, ha]
      · simp [depth, hp, hb, hc]
    · simp [depth, hp, hb]
  · simp [depth, hp]

/-!
Exact threshold semantics.

These theorems characterize H directly as the current prerequisite-complete
prefix length.  They do not require CurrentWellFormed: `depth` is a total
readout over raw status vectors.  CurrentWellFormed remains the separate
admissibility predicate for interpreting a raw vector as a lawful current
hinge-state claim.
-/

theorem depth_ge_one_iff (s : CurrentState) :
    1 <= depth s ↔ s.persistence := by
  classical
  by_cases hp : s.persistence
  · by_cases hb : s.boundary
    · by_cases hc : s.cascade
      · by_cases ha : s.authorization
        · by_cases hr : s.recognition
          · by_cases hco : s.coherence
            · simp [depth, hp, hb, hc, ha, hr, hco]
            · simp [depth, hp, hb, hc, ha, hr, hco]
          · simp [depth, hp, hb, hc, ha, hr]
        · simp [depth, hp, hb, hc, ha]
      · simp [depth, hp, hb, hc]
    · simp [depth, hp, hb]
  · simp [depth, hp]

theorem depth_ge_two_iff (s : CurrentState) :
    2 <= depth s ↔ s.persistence ∧ s.boundary := by
  classical
  by_cases hp : s.persistence
  · by_cases hb : s.boundary
    · by_cases hc : s.cascade
      · by_cases ha : s.authorization
        · by_cases hr : s.recognition
          · by_cases hco : s.coherence
            · simp [depth, hp, hb, hc, ha, hr, hco]
            · simp [depth, hp, hb, hc, ha, hr, hco]
          · simp [depth, hp, hb, hc, ha, hr]
        · simp [depth, hp, hb, hc, ha]
      · simp [depth, hp, hb, hc]
    · simp [depth, hp, hb]
  · simp [depth, hp]

theorem depth_ge_three_iff (s : CurrentState) :
    3 <= depth s ↔
      s.persistence ∧ s.boundary ∧ s.cascade := by
  classical
  by_cases hp : s.persistence
  · by_cases hb : s.boundary
    · by_cases hc : s.cascade
      · by_cases ha : s.authorization
        · by_cases hr : s.recognition
          · by_cases hco : s.coherence
            · simp [depth, hp, hb, hc, ha, hr, hco]
            · simp [depth, hp, hb, hc, ha, hr, hco]
          · simp [depth, hp, hb, hc, ha, hr]
        · simp [depth, hp, hb, hc, ha]
      · simp [depth, hp, hb, hc]
    · simp [depth, hp, hb]
  · simp [depth, hp]

theorem depth_ge_four_iff (s : CurrentState) :
    4 <= depth s ↔
      s.persistence ∧ s.boundary ∧ s.cascade ∧ s.authorization := by
  classical
  by_cases hp : s.persistence
  · by_cases hb : s.boundary
    · by_cases hc : s.cascade
      · by_cases ha : s.authorization
        · by_cases hr : s.recognition
          · by_cases hco : s.coherence
            · simp [depth, hp, hb, hc, ha, hr, hco]
            · simp [depth, hp, hb, hc, ha, hr, hco]
          · simp [depth, hp, hb, hc, ha, hr]
        · simp [depth, hp, hb, hc, ha]
      · simp [depth, hp, hb, hc]
    · simp [depth, hp, hb]
  · simp [depth, hp]

theorem depth_ge_five_iff (s : CurrentState) :
    5 <= depth s ↔
      s.persistence ∧ s.boundary ∧ s.cascade
      ∧ s.authorization ∧ s.recognition := by
  classical
  by_cases hp : s.persistence
  · by_cases hb : s.boundary
    · by_cases hc : s.cascade
      · by_cases ha : s.authorization
        · by_cases hr : s.recognition
          · by_cases hco : s.coherence
            · simp [depth, hp, hb, hc, ha, hr, hco]
            · simp [depth, hp, hb, hc, ha, hr, hco]
          · simp [depth, hp, hb, hc, ha, hr]
        · simp [depth, hp, hb, hc, ha]
      · simp [depth, hp, hb, hc]
    · simp [depth, hp, hb]
  · simp [depth, hp]

theorem depth_ge_six_iff (s : CurrentState) :
    6 <= depth s ↔
      s.persistence ∧ s.boundary ∧ s.cascade
      ∧ s.authorization ∧ s.recognition ∧ s.coherence := by
  classical
  by_cases hp : s.persistence
  · by_cases hb : s.boundary
    · by_cases hc : s.cascade
      · by_cases ha : s.authorization
        · by_cases hr : s.recognition
          · by_cases hco : s.coherence
            · simp [depth, hp, hb, hc, ha, hr, hco]
            · simp [depth, hp, hb, hc, ha, hr, hco]
          · simp [depth, hp, hb, hc, ha, hr]
        · simp [depth, hp, hb, hc, ha]
      · simp [depth, hp, hb, hc]
    · simp [depth, hp, hb]
  · simp [depth, hp]

/-! Canonical current-prefix states. -/

def h0 : CurrentState where
  persistence := False
  boundary := False
  cascade := False
  authorization := False
  recognition := False
  coherence := False

def h1 : CurrentState where
  persistence := True
  boundary := False
  cascade := False
  authorization := False
  recognition := False
  coherence := False

def h2 : CurrentState where
  persistence := True
  boundary := True
  cascade := False
  authorization := False
  recognition := False
  coherence := False

def h3 : CurrentState where
  persistence := True
  boundary := True
  cascade := True
  authorization := False
  recognition := False
  coherence := False

def h4 : CurrentState where
  persistence := True
  boundary := True
  cascade := True
  authorization := True
  recognition := False
  coherence := False

def h5 : CurrentState where
  persistence := True
  boundary := True
  cascade := True
  authorization := True
  recognition := True
  coherence := False

def h6 : CurrentState where
  persistence := True
  boundary := True
  cascade := True
  authorization := True
  recognition := True
  coherence := True

theorem h0_depth : depth h0 = 0 := by
  simp [depth, h0]

theorem h1_depth : depth h1 = 1 := by
  simp [depth, h1]

theorem h2_depth : depth h2 = 2 := by
  simp [depth, h2]

theorem h3_depth : depth h3 = 3 := by
  simp [depth, h3]

theorem h4_depth : depth h4 = 4 := by
  simp [depth, h4]

theorem h5_depth : depth h5 = 5 := by
  simp [depth, h5]

theorem h6_depth : depth h6 = 6 := by
  simp [depth, h6]

/-!
Raw syntax may be malformed while the readout remains total.

This witness has downstream flags true despite missing Persistence.
The readout stops immediately at the first missing prerequisite, while
CurrentWellFormed correctly rejects the vector as a lawful current hinge state.
-/

def malformedRawState : CurrentState where
  persistence := False
  boundary := True
  cascade := True
  authorization := True
  recognition := True
  coherence := True

theorem malformed_raw_state_reads_zero :
    depth malformedRawState = 0 := by
  simp [depth, malformedRawState]

theorem malformed_raw_state_not_admissible :
    ¬ CurrentWellFormed malformedRawState := by
  intro h
  exact
    (by
      have hp : malformedRawState.persistence :=
        h.boundary_requires_persistence (by
          simp [malformedRawState])
      simp [malformedRawState] at hp)

/-! Bridge from the closed foundational route snapshot. -/

def fromFoundational
    (s : FailureClosure.RouteSnapshot)
    (recognition coherence : Prop) : CurrentState where
  persistence := s.persistenceCarriesUnderLoad
  boundary := s.boundaryDiscriminates
  cascade := s.cascadeInherits
  authorization := s.authorizationIncorporates
  recognition := recognition
  coherence := coherence

theorem fromFoundational_wellFormed
    (s : FailureClosure.RouteSnapshot)
    (wf : FailureClosure.WellFormedRoute s)
    (recognition coherence : Prop)
    (hR : recognition -> s.authorizationIncorporates)
    (hCo : coherence -> recognition) :
    CurrentWellFormed
      (fromFoundational s recognition coherence) := by
  constructor
  · exact wf.boundary_requires_loadCarry
  · exact wf.cascade_requires_boundary
  · exact wf.authorization_requires_cascade
  · exact hR
  · exact hCo

/-!
Foundational regime -> H bridge.

Recognition and Coherence are set false in these first-break comparisons because
the foundational route has already failed before those downstream hinges.
-/

theorem dissolution_gives_h0
    (s : FailureClosure.RouteSnapshot)
    (wf : FailureClosure.WellFormedRoute s)
    (h : FailureClosure.Dissolution s) :
    depth (fromFoundational s False False) = 0 := by
  rcases h with ⟨_hProduced, hNotEstablished⟩
  have hNotLoad :
      ¬ s.persistenceCarriesUnderLoad := by
    intro hLoad
    exact
      hNotEstablished
        (wf.loadCarry_requires_establishment hLoad)
  simp [depth, fromFoundational, hNotLoad]

theorem shear_gives_h0
    (s : FailureClosure.RouteSnapshot)
    (h : FailureClosure.Shear s) :
    depth (fromFoundational s False False) = 0 := by
  rcases h with ⟨_hProduced, _hEstablished, hNotLoad⟩
  simp [depth, fromFoundational, hNotLoad]

theorem drift_gives_h1
    (s : FailureClosure.RouteSnapshot)
    (h : FailureClosure.Drift s) :
    depth (fromFoundational s False False) = 1 := by
  rcases h with ⟨_hProduced, hLoad, hNotBoundary⟩
  simp [depth, fromFoundational, hLoad, hNotBoundary]

theorem echo_gives_h2
    (s : FailureClosure.RouteSnapshot)
    (wf : FailureClosure.WellFormedRoute s)
    (h : FailureClosure.Echo s) :
    depth (fromFoundational s False False) = 2 := by
  rcases h with ⟨_hProduced, hBoundary, hNotCascade⟩
  have hLoad :
      s.persistenceCarriesUnderLoad :=
    wf.boundary_requires_loadCarry hBoundary
  simp [depth, fromFoundational, hLoad, hBoundary, hNotCascade]

theorem lock_gives_h3
    (s : FailureClosure.RouteSnapshot)
    (wf : FailureClosure.WellFormedRoute s)
    (h : FailureClosure.Lock s) :
    depth (fromFoundational s False False) = 3 := by
  rcases h with ⟨_hProduced, hCascade, hNotAuthorization⟩
  have hBoundary :
      s.boundaryDiscriminates :=
    wf.cascade_requires_boundary hCascade
  have hLoad :
      s.persistenceCarriesUnderLoad :=
    wf.boundary_requires_loadCarry hBoundary
  simp [depth, fromFoundational, hLoad, hBoundary, hCascade,
    hNotAuthorization]

theorem authorization_without_recognition_gives_h4
    (s : FailureClosure.RouteSnapshot)
    (wf : FailureClosure.WellFormedRoute s)
    (hAuthorization : s.authorizationIncorporates) :
    depth (fromFoundational s False False) = 4 := by
  have hCascade :
      s.cascadeInherits :=
    wf.authorization_requires_cascade hAuthorization
  have hBoundary :
      s.boundaryDiscriminates :=
    wf.cascade_requires_boundary hCascade
  have hLoad :
      s.persistenceCarriesUnderLoad :=
    wf.boundary_requires_loadCarry hBoundary
  simp [depth, fromFoundational, hLoad, hBoundary, hCascade,
    hAuthorization]

theorem recognition_without_coherence_gives_h5
    (s : FailureClosure.RouteSnapshot)
    (wf : FailureClosure.WellFormedRoute s)
    (hAuthorization : s.authorizationIncorporates) :
    depth (fromFoundational s True False) = 5 := by
  have hCascade :
      s.cascadeInherits :=
    wf.authorization_requires_cascade hAuthorization
  have hBoundary :
      s.boundaryDiscriminates :=
    wf.cascade_requires_boundary hCascade
  have hLoad :
      s.persistenceCarriesUnderLoad :=
    wf.boundary_requires_loadCarry hBoundary
  simp [depth, fromFoundational, hLoad, hBoundary, hCascade,
    hAuthorization]

theorem coherence_gives_h6
    (s : FailureClosure.RouteSnapshot)
    (wf : FailureClosure.WellFormedRoute s)
    (hAuthorization : s.authorizationIncorporates) :
    depth (fromFoundational s True True) = 6 := by
  have hCascade :
      s.cascadeInherits :=
    wf.authorization_requires_cascade hAuthorization
  have hBoundary :
      s.boundaryDiscriminates :=
    wf.cascade_requires_boundary hCascade
  have hLoad :
      s.persistenceCarriesUnderLoad :=
    wf.boundary_requires_loadCarry hBoundary
  simp [depth, fromFoundational, hLoad, hBoundary, hCascade,
    hAuthorization]

/-! Residue is not current hinge depth. -/

structure Residue where
  cascadeConsequence : Prop
  authorizationConsequence : Prop
  recognitionConsequence : Prop
  coherenceConsequence : Prop

structure RouteView where
  current : CurrentState
  residue : Residue

noncomputable def depthOfView (v : RouteView) : Nat :=
  depth v.current

def allResidue : Residue where
  cascadeConsequence := True
  authorizationConsequence := True
  recognitionConsequence := True
  coherenceConsequence := True

def residueAfterBoundaryLoss : RouteView where
  current := h1
  residue := allResidue

theorem downstream_residue_does_not_raise_h :
    depthOfView residueAfterBoundaryLoss = 1
    ∧ residueAfterBoundaryLoss.residue.cascadeConsequence
    ∧ residueAfterBoundaryLoss.residue.authorizationConsequence
    ∧ residueAfterBoundaryLoss.residue.recognitionConsequence
    ∧ residueAfterBoundaryLoss.residue.coherenceConsequence := by
  simp [depthOfView, residueAfterBoundaryLoss, h1_depth, allResidue]

/-! H is current, not historical maximum. -/

def earlierAuthorizationState : RouteView where
  current := h4
  residue := allResidue

def laterBoundaryLossState : RouteView where
  current := h1
  residue := allResidue

theorem h_can_decrease_without_erasing_residue :
    depthOfView earlierAuthorizationState = 4
    ∧ depthOfView laterBoundaryLossState = 1
    ∧ laterBoundaryLossState.residue.authorizationConsequence := by
  simp [depthOfView, earlierAuthorizationState, laterBoundaryLossState,
    h4_depth, h1_depth, allResidue]

/-! Explicit non-identity with foundational first-break depth. -/

def shearDemo : FailureClosure.RouteSnapshot where
  produced := True
  persistenceEstablished := True
  persistenceCarriesUnderLoad := False
  boundaryDiscriminates := False
  cascadeInherits := False
  authorizationIncorporates := False

theorem shearDemo_is_shear :
    FailureClosure.Shear shearDemo := by
  simp [FailureClosure.Shear, shearDemo]

theorem shearDemo_first_break_depth_is_one :
    FailureClosure.firstBreakDepth shearDemo = 1 := by
  exact FailureClosure.shear_depth shearDemo shearDemo_is_shear

theorem shearDemo_h_is_zero :
    depth (fromFoundational shearDemo False False) = 0 := by
  exact shear_gives_h0 shearDemo shearDemo_is_shear

theorem foundational_failure_depth_is_not_h :
    FailureClosure.firstBreakDepth shearDemo
      ≠ depth (fromFoundational shearDemo False False) := by
  rw [shearDemo_first_break_depth_is_one, shearDemo_h_is_zero]
  decide

theorem h_machine_checkpoint :
    depth h0 = 0
    ∧ depth h1 = 1
    ∧ depth h2 = 2
    ∧ depth h3 = 3
    ∧ depth h4 = 4
    ∧ depth h5 = 5
    ∧ depth h6 = 6
    ∧
    (
      ∀ s : CurrentState,
        (1 <= depth s ↔ s.persistence)
        ∧
        (
          2 <= depth s ↔
          s.persistence ∧ s.boundary
        )
        ∧
        (
          3 <= depth s ↔
          s.persistence ∧ s.boundary ∧ s.cascade
        )
        ∧
        (
          4 <= depth s ↔
          s.persistence ∧ s.boundary ∧ s.cascade
          ∧ s.authorization
        )
        ∧
        (
          5 <= depth s ↔
          s.persistence ∧ s.boundary ∧ s.cascade
          ∧ s.authorization ∧ s.recognition
        )
        ∧
        (
          6 <= depth s ↔
          s.persistence ∧ s.boundary ∧ s.cascade
          ∧ s.authorization ∧ s.recognition ∧ s.coherence
        )
    )
    ∧
    (
      FailureClosure.firstBreakDepth shearDemo
      ≠ depth (fromFoundational shearDemo False False)
    )
    ∧ depth malformedRawState = 0
    ∧ ¬ CurrentWellFormed malformedRawState
    ∧ depthOfView residueAfterBoundaryLoss = 1
    ∧
    (
      depthOfView earlierAuthorizationState = 4
      ∧ depthOfView laterBoundaryLossState = 1
    ) := by
  refine
    ⟨h0_depth,
     h1_depth,
     h2_depth,
     h3_depth,
     h4_depth,
     h5_depth,
     h6_depth,
     ?_,
     foundational_failure_depth_is_not_h,
     malformed_raw_state_reads_zero,
     malformed_raw_state_not_admissible,
     ?_,
     ?_⟩
  · intro s
    exact
      ⟨depth_ge_one_iff s,
       depth_ge_two_iff s,
       depth_ge_three_iff s,
       depth_ge_four_iff s,
       depth_ge_five_iff s,
       depth_ge_six_iff s⟩
  · exact downstream_residue_does_not_raise_h.1
  · exact
      ⟨h_can_decrease_without_erasing_residue.1,
       h_can_decrease_without_erasing_residue.2.1⟩

end HReadout
end StructuralFlow


/-!
===============================================================================
F READOUT — PUBLIC THEOREM MODULE
Historical machine provenance: kernel attempt v0.6; full consolidated run on SF Universal Machine Kernel v1.4
===============================================================================

Purpose
-------
Machine-test F as an evidentially admitted, burden-fixed, route-conditioned
foundational-outcome profile.

This repair makes the TOE's admission surface explicit:

A. realized trial;
B. closed derivation;
C. independent domain test with six required burdens.

UNKNOWN remains outside the F codomain.
-/

namespace StructuralFlow
namespace FReadout

inductive Verdict where
  | dissolution
  | shear
  | drift
  | echo
  | lock
  | pass
deriving DecidableEq, Repr

/--
Raw helper classifier only.

This function does not establish route admission and therefore is not, by
itself, an F value.  `value` below is restricted to evidentially admitted
routes.
-/
private noncomputable def classify
    (s : FailureClosure.RouteSnapshot) : Verdict := by
  classical
  exact
    if s.persistenceEstablished then
      if s.persistenceCarriesUnderLoad then
        if s.boundaryDiscriminates then
          if s.cascadeInherits then
            if s.authorizationIncorporates then
              Verdict.pass
            else
              Verdict.lock
          else
            Verdict.echo
        else
          Verdict.drift
      else
        Verdict.shear
    else
      Verdict.dissolution

/--
Domain-owned evidentiary predicates are carried as inputs.

The machine does not decide whether these predicates are true in a substantive
domain.  It audits that an F-bearing route has a certificate of one of the
canonically admitted shapes.
-/
structure Assay
    (Structure Level Scope Burden Route : Type u) where
  declaredStructure : Structure
  declaredLevel : Level
  declaredScope : Scope
  declaredBurden : Burden

  snapshot :
    Route -> FailureClosure.RouteSnapshot

  comparable :
    Route -> Route -> Prop

  -- Channel A: realized trial.
  realizedUnderBurden :
    Route -> Prop

  inspectableOutcome :
    Route -> Prop

  -- Channel B: closed derivation.
  followsClosedCanon :
    Route -> Prop

  derivationIndependentOfF :
    Route -> Prop

  -- Channel C: independent domain test.
  burdenFixed : Prop

  routeFixed :
    Route -> Prop

  verdictRuleFixed :
    Route -> Prop

  nonCircular :
    Route -> Prop

  symmetricEvidentiaryBurden :
    Route -> Prop

  auditable :
    Route -> Prop

/--
Exactly three lawful admission channels.

Every channel additionally carries the common machine-facing route obligations:
the foundational snapshot is well-formed and the interaction was produced.

The substantive truth of the evidence predicates remains domain-owned.
-/
inductive AdmissionEvidence
    {Structure Level Scope Burden Route : Type u}
    (w : Assay Structure Level Scope Burden Route)
    (r : Route) : Prop where

  | realizedTrial
      (realized :
        w.realizedUnderBurden r)
      (inspectable :
        w.inspectableOutcome r)
      (wellFormed :
        FailureClosure.WellFormedRoute (w.snapshot r))
      (produced :
        (w.snapshot r).produced)

  | closedDerivation
      (closedCanon :
        w.followsClosedCanon r)
      (independentOfProfile :
        w.derivationIndependentOfF r)
      (wellFormed :
        FailureClosure.WellFormedRoute (w.snapshot r))
      (produced :
        (w.snapshot r).produced)

  | independentDomainTest
      (burdenFixed :
        w.burdenFixed)
      (routeFixed :
        w.routeFixed r)
      (verdictRuleFixed :
        w.verdictRuleFixed r)
      (nonCircular :
        w.nonCircular r)
      (symmetricEvidence :
        w.symmetricEvidentiaryBurden r)
      (auditable :
        w.auditable r)
      (wellFormed :
        FailureClosure.WellFormedRoute (w.snapshot r))
      (produced :
        (w.snapshot r).produced)

theorem admission_wellFormed
    {Structure Level Scope Burden Route : Type u}
    (w : Assay Structure Level Scope Burden Route)
    (r : Route)
    (h : AdmissionEvidence w r) :
    FailureClosure.WellFormedRoute (w.snapshot r) := by
  cases h with
  | realizedTrial _ _ hWF _ =>
      exact hWF
  | closedDerivation _ _ hWF _ =>
      exact hWF
  | independentDomainTest _ _ _ _ _ _ hWF _ =>
      exact hWF

theorem admission_produced
    {Structure Level Scope Burden Route : Type u}
    (w : Assay Structure Level Scope Burden Route)
    (r : Route)
    (h : AdmissionEvidence w r) :
    (w.snapshot r).produced := by
  cases h with
  | realizedTrial _ _ _ hProduced =>
      exact hProduced
  | closedDerivation _ _ _ hProduced =>
      exact hProduced
  | independentDomainTest _ _ _ _ _ _ _ hProduced =>
      exact hProduced

def AdmittedRoute
    {Structure Level Scope Burden Route : Type u}
    (w : Assay Structure Level Scope Burden Route) :=
  { r : Route // AdmissionEvidence w r }

noncomputable def value
    {Structure Level Scope Burden Route : Type u}
    (w : Assay Structure Level Scope Burden Route)
    (r : AdmittedRoute w) : Verdict :=
  classify (w.snapshot r.1)

/--
F-differentiation requires at least two evidentially admitted comparable routes
with different established F values.
-/
def Differentiated
    {Structure Level Scope Burden Route : Type u}
    (w : Assay Structure Level Scope Burden Route) : Prop :=
  ∃ r₁ r₂ : AdmittedRoute w,
    w.comparable r₁.1 r₂.1
    ∧ value w r₁ ≠ value w r₂

/-! --------------------------------------------------------------------------
UNKNOWN / non-admission stays outside the value codomain
---------------------------------------------------------------------------- -/

theorem nonadmitted_route_has_no_F_value
    {Structure Level Scope Burden Route : Type u}
    (w : Assay Structure Level Scope Burden Route)
    (r : Route)
    (hNotAdmitted : ¬ AdmissionEvidence w r) :
    ¬ ∃ ar : AdmittedRoute w, ar.1 = r := by
  intro h
  rcases h with ⟨ar, hEq⟩
  apply hNotAdmitted
  simpa [hEq] using ar.2

/-! --------------------------------------------------------------------------
Exact evidentially admitted-route semantics
---------------------------------------------------------------------------- -/

theorem value_dissolution_iff
    {Structure Level Scope Burden Route : Type u}
    (w : Assay Structure Level Scope Burden Route)
    (r : AdmittedRoute w) :
    value w r = Verdict.dissolution
    ↔ FailureClosure.Dissolution (w.snapshot r.1) := by
  have hProduced := admission_produced w r.1 r.2
  constructor
  · intro hValue
    have hNotPE :
        ¬ (w.snapshot r.1).persistenceEstablished := by
      by_cases hPE : (w.snapshot r.1).persistenceEstablished
      · by_cases hPL : (w.snapshot r.1).persistenceCarriesUnderLoad
        · by_cases hB : (w.snapshot r.1).boundaryDiscriminates
          · by_cases hC : (w.snapshot r.1).cascadeInherits
            · by_cases hA : (w.snapshot r.1).authorizationIncorporates
              · simp [value, classify, hPE, hPL, hB, hC, hA] at hValue
              · simp [value, classify, hPE, hPL, hB, hC, hA] at hValue
            · simp [value, classify, hPE, hPL, hB, hC] at hValue
          · simp [value, classify, hPE, hPL, hB] at hValue
        · simp [value, classify, hPE, hPL] at hValue
      · exact hPE
    exact ⟨hProduced, hNotPE⟩
  · intro hD
    rcases hD with ⟨_hProduced, hNotPE⟩
    simp [value, classify, hNotPE]

theorem value_shear_iff
    {Structure Level Scope Burden Route : Type u}
    (w : Assay Structure Level Scope Burden Route)
    (r : AdmittedRoute w) :
    value w r = Verdict.shear
    ↔ FailureClosure.Shear (w.snapshot r.1) := by
  have hProduced := admission_produced w r.1 r.2
  constructor
  · intro hValue
    by_cases hPE : (w.snapshot r.1).persistenceEstablished
    · have hNotPL :
          ¬ (w.snapshot r.1).persistenceCarriesUnderLoad := by
        by_cases hPL : (w.snapshot r.1).persistenceCarriesUnderLoad
        · by_cases hB : (w.snapshot r.1).boundaryDiscriminates
          · by_cases hC : (w.snapshot r.1).cascadeInherits
            · by_cases hA : (w.snapshot r.1).authorizationIncorporates
              · simp [value, classify, hPE, hPL, hB, hC, hA] at hValue
              · simp [value, classify, hPE, hPL, hB, hC, hA] at hValue
            · simp [value, classify, hPE, hPL, hB, hC] at hValue
          · simp [value, classify, hPE, hPL, hB] at hValue
        · exact hPL
      exact ⟨hProduced, hPE, hNotPL⟩
    · simp [value, classify, hPE] at hValue
  · intro hS
    rcases hS with ⟨_hProduced, hPE, hNotPL⟩
    simp [value, classify, hPE, hNotPL]

theorem value_drift_iff
    {Structure Level Scope Burden Route : Type u}
    (w : Assay Structure Level Scope Burden Route)
    (r : AdmittedRoute w) :
    value w r = Verdict.drift
    ↔ FailureClosure.Drift (w.snapshot r.1) := by
  have hProduced := admission_produced w r.1 r.2
  have hWF := admission_wellFormed w r.1 r.2
  constructor
  · intro hValue
    by_cases hPE : (w.snapshot r.1).persistenceEstablished
    · by_cases hPL : (w.snapshot r.1).persistenceCarriesUnderLoad
      · have hNotB :
          ¬ (w.snapshot r.1).boundaryDiscriminates := by
          by_cases hB : (w.snapshot r.1).boundaryDiscriminates
          · by_cases hC : (w.snapshot r.1).cascadeInherits
            · by_cases hA : (w.snapshot r.1).authorizationIncorporates
              · simp [value, classify, hPE, hPL, hB, hC, hA] at hValue
              · simp [value, classify, hPE, hPL, hB, hC, hA] at hValue
            · simp [value, classify, hPE, hPL, hB, hC] at hValue
          · exact hB
        exact ⟨hProduced, hPL, hNotB⟩
      · simp [value, classify, hPE, hPL] at hValue
    · simp [value, classify, hPE] at hValue
  · intro hD
    rcases hD with ⟨_hProduced, hPL, hNotB⟩
    have hPE :
        (w.snapshot r.1).persistenceEstablished :=
      hWF.loadCarry_requires_establishment hPL
    simp [value, classify, hPE, hPL, hNotB]

theorem value_echo_iff
    {Structure Level Scope Burden Route : Type u}
    (w : Assay Structure Level Scope Burden Route)
    (r : AdmittedRoute w) :
    value w r = Verdict.echo
    ↔ FailureClosure.Echo (w.snapshot r.1) := by
  have hProduced := admission_produced w r.1 r.2
  have hWF := admission_wellFormed w r.1 r.2
  constructor
  · intro hValue
    by_cases hPE : (w.snapshot r.1).persistenceEstablished
    · by_cases hPL : (w.snapshot r.1).persistenceCarriesUnderLoad
      · by_cases hB : (w.snapshot r.1).boundaryDiscriminates
        · have hNotC :
            ¬ (w.snapshot r.1).cascadeInherits := by
            by_cases hC : (w.snapshot r.1).cascadeInherits
            · by_cases hA : (w.snapshot r.1).authorizationIncorporates
              · simp [value, classify, hPE, hPL, hB, hC, hA] at hValue
              · simp [value, classify, hPE, hPL, hB, hC, hA] at hValue
            · exact hC
          exact ⟨hProduced, hB, hNotC⟩
        · simp [value, classify, hPE, hPL, hB] at hValue
      · simp [value, classify, hPE, hPL] at hValue
    · simp [value, classify, hPE] at hValue
  · intro hE
    rcases hE with ⟨_hProduced, hB, hNotC⟩
    have hPL :
        (w.snapshot r.1).persistenceCarriesUnderLoad :=
      hWF.boundary_requires_loadCarry hB
    have hPE :
        (w.snapshot r.1).persistenceEstablished :=
      hWF.loadCarry_requires_establishment hPL
    simp [value, classify, hPE, hPL, hB, hNotC]

theorem value_lock_iff
    {Structure Level Scope Burden Route : Type u}
    (w : Assay Structure Level Scope Burden Route)
    (r : AdmittedRoute w) :
    value w r = Verdict.lock
    ↔ FailureClosure.Lock (w.snapshot r.1) := by
  have hProduced := admission_produced w r.1 r.2
  have hWF := admission_wellFormed w r.1 r.2
  constructor
  · intro hValue
    by_cases hPE : (w.snapshot r.1).persistenceEstablished
    · by_cases hPL : (w.snapshot r.1).persistenceCarriesUnderLoad
      · by_cases hB : (w.snapshot r.1).boundaryDiscriminates
        · by_cases hC : (w.snapshot r.1).cascadeInherits
          · have hNotA :
              ¬ (w.snapshot r.1).authorizationIncorporates := by
              by_cases hA : (w.snapshot r.1).authorizationIncorporates
              · simp [value, classify, hPE, hPL, hB, hC, hA] at hValue
              · exact hA
            exact ⟨hProduced, hC, hNotA⟩
          · simp [value, classify, hPE, hPL, hB, hC] at hValue
        · simp [value, classify, hPE, hPL, hB] at hValue
      · simp [value, classify, hPE, hPL] at hValue
    · simp [value, classify, hPE] at hValue
  · intro hL
    rcases hL with ⟨_hProduced, hC, hNotA⟩
    have hB :
        (w.snapshot r.1).boundaryDiscriminates :=
      hWF.cascade_requires_boundary hC
    have hPL :
        (w.snapshot r.1).persistenceCarriesUnderLoad :=
      hWF.boundary_requires_loadCarry hB
    have hPE :
        (w.snapshot r.1).persistenceEstablished :=
      hWF.loadCarry_requires_establishment hPL
    simp [value, classify, hPE, hPL, hB, hC, hNotA]

theorem value_pass_iff_authorization
    {Structure Level Scope Burden Route : Type u}
    (w : Assay Structure Level Scope Burden Route)
    (r : AdmittedRoute w) :
    value w r = Verdict.pass
    ↔ (w.snapshot r.1).authorizationIncorporates := by
  have hWF := admission_wellFormed w r.1 r.2
  constructor
  · intro hValue
    by_cases hPE : (w.snapshot r.1).persistenceEstablished
    · by_cases hPL : (w.snapshot r.1).persistenceCarriesUnderLoad
      · by_cases hB : (w.snapshot r.1).boundaryDiscriminates
        · by_cases hC : (w.snapshot r.1).cascadeInherits
          · by_cases hA : (w.snapshot r.1).authorizationIncorporates
            · exact hA
            · simp [value, classify, hPE, hPL, hB, hC, hA] at hValue
          · simp [value, classify, hPE, hPL, hB, hC] at hValue
        · simp [value, classify, hPE, hPL, hB] at hValue
      · simp [value, classify, hPE, hPL] at hValue
    · simp [value, classify, hPE] at hValue
  · intro hA
    have hC :
        (w.snapshot r.1).cascadeInherits :=
      hWF.authorization_requires_cascade hA
    have hB :
        (w.snapshot r.1).boundaryDiscriminates :=
      hWF.cascade_requires_boundary hC
    have hPL :
        (w.snapshot r.1).persistenceCarriesUnderLoad :=
      hWF.boundary_requires_loadCarry hB
    have hPE :
        (w.snapshot r.1).persistenceEstablished :=
      hWF.loadCarry_requires_establishment hPL
    simp [value, classify, hPE, hPL, hB, hC, hA]

theorem pass_is_not_foundational_failure
    {Structure Level Scope Burden Route : Type u}
    (w : Assay Structure Level Scope Burden Route)
    (r : AdmittedRoute w)
    (hPass : value w r = Verdict.pass) :
    ¬ FailureClosure.FoundationalFailure (w.snapshot r.1) := by
  have hA :
      (w.snapshot r.1).authorizationIncorporates :=
    (value_pass_iff_authorization w r).1 hPass
  intro hFail
  exact hFail.2 hA


/-! --------------------------------------------------------------------------
Finite semantic witnesses
---------------------------------------------------------------------------- -/

inductive DemoRoute where
  | left
  | right
deriving DecidableEq

def demoDissolution : FailureClosure.RouteSnapshot where
  produced := True
  persistenceEstablished := False
  persistenceCarriesUnderLoad := False
  boundaryDiscriminates := False
  cascadeInherits := False
  authorizationIncorporates := False

def demoShear : FailureClosure.RouteSnapshot where
  produced := True
  persistenceEstablished := True
  persistenceCarriesUnderLoad := False
  boundaryDiscriminates := False
  cascadeInherits := False
  authorizationIncorporates := False

def demoPass : FailureClosure.RouteSnapshot where
  produced := True
  persistenceEstablished := True
  persistenceCarriesUnderLoad := True
  boundaryDiscriminates := True
  cascadeInherits := True
  authorizationIncorporates := True

theorem demoDissolution_wf :
    FailureClosure.WellFormedRoute demoDissolution := by
  constructor <;> simp [demoDissolution]

theorem demoShear_wf :
    FailureClosure.WellFormedRoute demoShear := by
  constructor <;> simp [demoShear]

theorem demoPass_wf :
    FailureClosure.WellFormedRoute demoPass := by
  constructor <;> simp [demoPass]

def differentiatedDemo :
    Assay Unit Unit Unit Unit DemoRoute where
  declaredStructure := ()
  declaredLevel := ()
  declaredScope := ()
  declaredBurden := ()
  snapshot
    | DemoRoute.left => demoDissolution
    | DemoRoute.right => demoShear
  comparable := fun _ _ => True
  realizedUnderBurden := fun _ => True
  inspectableOutcome := fun _ => True
  followsClosedCanon := fun _ => True
  derivationIndependentOfF := fun _ => True
  burdenFixed := True
  routeFixed := fun _ => True
  verdictRuleFixed := fun _ => True
  nonCircular := fun _ => True
  symmetricEvidentiaryBurden := fun _ => True
  auditable := fun _ => True

def uniformPassDemo :
    Assay Unit Unit Unit Unit DemoRoute where
  declaredStructure := ()
  declaredLevel := ()
  declaredScope := ()
  declaredBurden := ()
  snapshot := fun _ => demoPass
  comparable := fun _ _ => True
  realizedUnderBurden := fun _ => True
  inspectableOutcome := fun _ => True
  followsClosedCanon := fun _ => True
  derivationIndependentOfF := fun _ => True
  burdenFixed := True
  routeFixed := fun _ => True
  verdictRuleFixed := fun _ => True
  nonCircular := fun _ => True
  symmetricEvidentiaryBurden := fun _ => True
  auditable := fun _ => True

def leftAdmitted :
    AdmittedRoute differentiatedDemo :=
  ⟨DemoRoute.left,
   AdmissionEvidence.realizedTrial
     (w := differentiatedDemo)
     (r := DemoRoute.left)
     trivial
     trivial
     demoDissolution_wf
     (by simp [differentiatedDemo, demoDissolution])⟩

def rightAdmitted :
    AdmittedRoute differentiatedDemo :=
  ⟨DemoRoute.right,
   AdmissionEvidence.closedDerivation
     (w := differentiatedDemo)
     (r := DemoRoute.right)
     trivial
     trivial
     demoShear_wf
     (by simp [differentiatedDemo, demoShear])⟩

def uniformLeft :
    AdmittedRoute uniformPassDemo :=
  ⟨DemoRoute.left,
   AdmissionEvidence.independentDomainTest
     (w := uniformPassDemo)
     (r := DemoRoute.left)
     trivial
     trivial
     trivial
     trivial
     trivial
     trivial
     demoPass_wf
     (by simp [uniformPassDemo, demoPass])⟩

def uniformRight :
    AdmittedRoute uniformPassDemo :=
  ⟨DemoRoute.right,
   AdmissionEvidence.realizedTrial
     (w := uniformPassDemo)
     (r := DemoRoute.right)
     trivial
     trivial
     demoPass_wf
     (by simp [uniformPassDemo, demoPass])⟩

theorem differentiatedDemo_left_value :
    value differentiatedDemo leftAdmitted = Verdict.dissolution := by
  simp [value, classify, differentiatedDemo, leftAdmitted, demoDissolution]

theorem differentiatedDemo_right_value :
    value differentiatedDemo rightAdmitted = Verdict.shear := by
  simp [value, classify, differentiatedDemo, rightAdmitted, demoShear]

theorem differentiatedDemo_is_differentiated :
    Differentiated differentiatedDemo := by
  refine ⟨leftAdmitted, rightAdmitted, ?_, ?_⟩
  · trivial
  · rw [differentiatedDemo_left_value, differentiatedDemo_right_value]
    decide

theorem uniformPassDemo_left_value :
    value uniformPassDemo uniformLeft = Verdict.pass := by
  simp [value, classify, uniformPassDemo, uniformLeft, demoPass]

theorem uniformPassDemo_right_value :
    value uniformPassDemo uniformRight = Verdict.pass := by
  simp [value, classify, uniformPassDemo, uniformRight, demoPass]

theorem uniformPassDemo_not_differentiated :
    ¬ Differentiated uniformPassDemo := by
  intro h
  rcases h with ⟨r₁, r₂, _hComp, hNe⟩
  have h1 :
      value uniformPassDemo r₁ = Verdict.pass := by
    cases r₁ with
    | mk r hr =>
      cases r <;>
        simp [value, classify, uniformPassDemo, demoPass]
  have h2 :
      value uniformPassDemo r₂ = Verdict.pass := by
    cases r₂ with
    | mk r hr =>
      cases r <;>
        simp [value, classify, uniformPassDemo, demoPass]
  exact hNe (h1.trans h2.symm)

theorem duplicate_verdicts_preserve_route_plurality :
    uniformLeft.1 ≠ uniformRight.1
    ∧
    value uniformPassDemo uniformLeft
      = value uniformPassDemo uniformRight := by
  constructor
  · decide
  · rw [uniformPassDemo_left_value, uniformPassDemo_right_value]

theorem plurality_does_not_imply_F_differentiation :
    (∃ r₁ r₂ : AdmittedRoute uniformPassDemo, r₁.1 ≠ r₂.1)
    ∧ ¬ Differentiated uniformPassDemo := by
  constructor
  · refine ⟨uniformLeft, uniformRight, ?_⟩
    decide
  · exact uniformPassDemo_not_differentiated

/-! --------------------------------------------------------------------------
Concrete non-admission witness
---------------------------------------------------------------------------- -/

def partialDemo :
    Assay Unit Unit Unit Unit DemoRoute where
  declaredStructure := ()
  declaredLevel := ()
  declaredScope := ()
  declaredBurden := ()
  snapshot := fun _ => demoPass
  comparable := fun _ _ => True

  realizedUnderBurden :=
    fun r => r = DemoRoute.left

  inspectableOutcome :=
    fun _ => True

  followsClosedCanon :=
    fun _ => False

  derivationIndependentOfF :=
    fun _ => True

  burdenFixed := True

  routeFixed :=
    fun r => r = DemoRoute.left

  verdictRuleFixed :=
    fun r => r = DemoRoute.left

  nonCircular :=
    fun _ => True

  symmetricEvidentiaryBurden :=
    fun _ => True

  auditable :=
    fun _ => True

theorem partialDemo_right_not_admitted :
    ¬ AdmissionEvidence partialDemo DemoRoute.right := by
  intro h
  cases h with
  | realizedTrial hReal _ _ _ =>
      simp [partialDemo] at hReal
  | closedDerivation hClosed _ _ _ =>
      simp [partialDemo] at hClosed
  | independentDomainTest _ hRoute _ _ _ _ _ _ =>
      simp [partialDemo] at hRoute

theorem partialDemo_right_has_no_F_bearing_witness :
    ¬ ∃ ar : AdmittedRoute partialDemo,
        ar.1 = DemoRoute.right := by
  exact
    nonadmitted_route_has_no_F_value
      partialDemo
      DemoRoute.right
      partialDemo_right_not_admitted

/-! --------------------------------------------------------------------------
Route identity is profile-bearing
---------------------------------------------------------------------------- -/

def swappedDemo :
    Assay Unit Unit Unit Unit DemoRoute where
  declaredStructure := ()
  declaredLevel := ()
  declaredScope := ()
  declaredBurden := ()
  snapshot
    | DemoRoute.left => demoShear
    | DemoRoute.right => demoDissolution
  comparable := fun _ _ => True
  realizedUnderBurden := fun _ => True
  inspectableOutcome := fun _ => True
  followsClosedCanon := fun _ => True
  derivationIndependentOfF := fun _ => True
  burdenFixed := True
  routeFixed := fun _ => True
  verdictRuleFixed := fun _ => True
  nonCircular := fun _ => True
  symmetricEvidentiaryBurden := fun _ => True
  auditable := fun _ => True

def swappedLeft :
    AdmittedRoute swappedDemo :=
  ⟨DemoRoute.left,
   AdmissionEvidence.realizedTrial
     (w := swappedDemo)
     (r := DemoRoute.left)
     trivial
     trivial
     demoShear_wf
     (by simp [swappedDemo, demoShear])⟩

def swappedRight :
    AdmittedRoute swappedDemo :=
  ⟨DemoRoute.right,
   AdmissionEvidence.realizedTrial
     (w := swappedDemo)
     (r := DemoRoute.right)
     trivial
     trivial
     demoDissolution_wf
     (by simp [swappedDemo, demoDissolution])⟩

theorem swappedDemo_left_value :
    value swappedDemo swappedLeft = Verdict.shear := by
  simp [value, classify, swappedDemo, swappedLeft, demoShear]

theorem swappedDemo_right_value :
    value swappedDemo swappedRight = Verdict.dissolution := by
  simp [value, classify, swappedDemo, swappedRight, demoDissolution]

theorem route_identity_is_profile_bearing :
    value differentiatedDemo leftAdmitted
      ≠ value swappedDemo swappedLeft
    ∧
    value differentiatedDemo rightAdmitted
      ≠ value swappedDemo swappedRight := by
  constructor
  · rw [differentiatedDemo_left_value, swappedDemo_left_value]
    decide
  · rw [differentiatedDemo_right_value, swappedDemo_right_value]
    decide

/-! --------------------------------------------------------------------------
F / H non-collapse witnesses
---------------------------------------------------------------------------- -/

theorem different_F_same_H :
    value differentiatedDemo leftAdmitted = Verdict.dissolution
    ∧ value differentiatedDemo rightAdmitted = Verdict.shear
    ∧
      HReadout.depth
        (HReadout.fromFoundational demoDissolution False False) = 0
    ∧
      HReadout.depth
        (HReadout.fromFoundational demoShear False False) = 0 := by
  have hDiss :
      FailureClosure.Dissolution demoDissolution := by
    simp [FailureClosure.Dissolution, demoDissolution]
  have hShear :
      FailureClosure.Shear demoShear := by
    simp [FailureClosure.Shear, demoShear]
  exact
    ⟨differentiatedDemo_left_value,
     differentiatedDemo_right_value,
     HReadout.dissolution_gives_h0
       demoDissolution demoDissolution_wf hDiss,
     HReadout.shear_gives_h0
       demoShear hShear⟩

theorem same_F_different_H :
    value uniformPassDemo uniformLeft = Verdict.pass
    ∧
      HReadout.depth
        (HReadout.fromFoundational demoPass False False) = 4
    ∧
      HReadout.depth
        (HReadout.fromFoundational demoPass True False) = 5
    ∧
      HReadout.depth
        (HReadout.fromFoundational demoPass True True) = 6 := by
  have hA :
      demoPass.authorizationIncorporates := by
    simp [demoPass]
  exact
    ⟨uniformPassDemo_left_value,
     HReadout.authorization_without_recognition_gives_h4
       demoPass demoPass_wf hA,
     HReadout.recognition_without_coherence_gives_h5
       demoPass demoPass_wf hA,
     HReadout.coherence_gives_h6
       demoPass demoPass_wf hA⟩

theorem F_and_H_are_mutually_nondetermining :
    (
      value differentiatedDemo leftAdmitted
        ≠ value differentiatedDemo rightAdmitted
      ∧
      HReadout.depth
        (HReadout.fromFoundational demoDissolution False False)
      =
      HReadout.depth
        (HReadout.fromFoundational demoShear False False)
    )
    ∧
    (
      value uniformPassDemo uniformLeft = Verdict.pass
      ∧
      HReadout.depth
        (HReadout.fromFoundational demoPass False False)
      ≠
      HReadout.depth
        (HReadout.fromFoundational demoPass True False)
    ) := by
  constructor
  · constructor
    · rw [differentiatedDemo_left_value, differentiatedDemo_right_value]
      decide
    · rw [different_F_same_H.2.2.1, different_F_same_H.2.2.2]
  · constructor
    · exact uniformPassDemo_left_value
    · rw [same_F_different_H.2.1, same_F_different_H.2.2.1]
      decide

theorem F_machine_checkpoint :
    Differentiated differentiatedDemo
    ∧ ¬ Differentiated uniformPassDemo
    ∧
    (
      value differentiatedDemo leftAdmitted = Verdict.dissolution
      ∧ value differentiatedDemo rightAdmitted = Verdict.shear
    )
    ∧
    (
      value uniformPassDemo uniformLeft = Verdict.pass
      ∧ value uniformPassDemo uniformRight = Verdict.pass
    )
    ∧
    (
      ¬ AdmissionEvidence partialDemo DemoRoute.right
    )
    ∧
    (
      value differentiatedDemo leftAdmitted
        ≠ value swappedDemo swappedLeft
      ∧
      value differentiatedDemo rightAdmitted
        ≠ value swappedDemo swappedRight
    )
    ∧
    (
      uniformLeft.1 ≠ uniformRight.1
      ∧
      value uniformPassDemo uniformLeft
        = value uniformPassDemo uniformRight
    )
    ∧
    (
      (
        value differentiatedDemo leftAdmitted
          ≠ value differentiatedDemo rightAdmitted
        ∧
        HReadout.depth
          (HReadout.fromFoundational demoDissolution False False)
        =
        HReadout.depth
          (HReadout.fromFoundational demoShear False False)
      )
      ∧
      (
        value uniformPassDemo uniformLeft = Verdict.pass
        ∧
        HReadout.depth
          (HReadout.fromFoundational demoPass False False)
        ≠
        HReadout.depth
          (HReadout.fromFoundational demoPass True False)
      )
    ) := by
  exact
    ⟨differentiatedDemo_is_differentiated,
     uniformPassDemo_not_differentiated,
     ⟨differentiatedDemo_left_value,
      differentiatedDemo_right_value⟩,
     ⟨uniformPassDemo_left_value,
      uniformPassDemo_right_value⟩,
     partialDemo_right_not_admitted,
     route_identity_is_profile_bearing,
     duplicate_verdicts_preserve_route_plurality,
     F_and_H_are_mutually_nondetermining⟩

end FReadout
end StructuralFlow


/-!
===============================================================================
L READOUT — PUBLIC THEOREM MODULE
Historical machine provenance: kernel attempt v0.1; full consolidated run on SF Universal Machine Kernel v1.5
===============================================================================

Purpose
-------
Machine-test L as an anchored simple-path ancestry profile over lawful ladder
instances.

Important graph-layer distinction:

* one LawfulLadder instance is an L node certificate;
* an L edge is cross-ladder ground dependency from one lawful ladder's earned
  coherent output into inherited coherent ground licensing a descendant ladder
  entry.

This kernel does not claim that arbitrary concrete Ladder.World instances have
already been heterogeneously packaged into one universal graph type.  It tests
the universal L readout semantics once lawful ladder-node and ground-dependency
evidence are supplied.
-/

namespace StructuralFlow
namespace LReadout

structure Graph (Node Ground : Type u) where
  lawfulLadderNode :
    Node -> Prop

  ancestryAnchor :
    Node -> Prop

  coherentOutputGround :
    Node -> Ground -> Prop

  entryLicensingGround :
    Node -> Ground -> Prop

  answersGround :
    Ground -> Ground -> Prop

  anchor_is_lawful :
    ∀ n, ancestryAnchor n -> lawfulLadderNode n

/--
Cross-ladder ancestry edge.

Literal ground identity is not required.  The parent output ground must answer
the descendant entry-licensing inherited ground.
-/
def Edge
    {Node Ground : Type u}
    (g : Graph Node Ground)
    (parent child : Node) : Prop :=
  g.lawfulLadderNode parent
  ∧ g.lawfulLadderNode child
  ∧ ∃ gp gc : Ground,
      g.coherentOutputGround parent gp
      ∧ g.entryLicensingGround child gc
      ∧ g.answersGround gp gc

theorem edge_parent_lawful
    {Node Ground : Type u}
    {g : Graph Node Ground}
    {parent child : Node}
    (h : Edge g parent child) :
    g.lawfulLadderNode parent := by
  exact h.1

theorem edge_child_lawful
    {Node Ground : Type u}
    {g : Graph Node Ground}
    {parent child : Node}
    (h : Edge g parent child) :
    g.lawfulLadderNode child := by
  exact h.2.1

/--
A simple anchored ancestry path.

Depth is carried in the index and increases by exactly one per L edge.
The `child ∉ visited` condition prevents repeated-node walk inflation.
-/
inductive Path
    {Node Ground : Type u}
    (g : Graph Node Ground) :
    Node -> Nat -> List Node -> Prop where

  | anchor
      {a : Node}
      (hAnchor : g.ancestryAnchor a) :
      Path g a 0 [a]

  | step
      {parent child : Node}
      {d : Nat}
      {visited : List Node}
      (hPath : Path g parent d visited)
      (hEdge : Edge g parent child)
      (hFresh : child ∉ visited) :
      Path g child (d + 1) (visited ++ [child])

def HasDepth
    {Node Ground : Type u}
    (g : Graph Node Ground)
    (target : Node)
    (d : Nat) : Prop :=
  ∃ visited : List Node,
    Path g target d visited

def Profile
    {Node Ground : Type u}
    (g : Graph Node Ground)
    (target : Node) : Nat -> Prop :=
  fun d => HasDepth g target d

theorem path_target_lawful
    {Node Ground : Type u}
    {g : Graph Node Ground}
    {target : Node}
    {d : Nat}
    {visited : List Node}
    (h : Path g target d visited) :
    g.lawfulLadderNode target := by
  cases h with
  | anchor hAnchor =>
      exact g.anchor_is_lawful _ hAnchor
  | step _ hEdge _ =>
      exact edge_child_lawful hEdge

/--
Depth zero is not automatically available to every lawful node.

It is available exactly to declared ancestry anchors.
-/
theorem hasDepth_zero_iff_anchor
    {Node Ground : Type u}
    (g : Graph Node Ground)
    (target : Node) :
    HasDepth g target 0
    ↔ g.ancestryAnchor target := by
  constructor
  · intro h
    rcases h with ⟨visited, hPath⟩
    cases hPath with
    | anchor hAnchor =>
        exact hAnchor
  · intro hAnchor
    exact
      ⟨[target], Path.anchor hAnchor⟩

theorem nonanchor_has_no_depth_zero
    {Node Ground : Type u}
    (g : Graph Node Ground)
    (target : Node)
    (hNotAnchor : ¬ g.ancestryAnchor target) :
    ¬ HasDepth g target 0 := by
  intro h
  exact hNotAnchor ((hasDepth_zero_iff_anchor g target).1 h)

/-! --------------------------------------------------------------------------
Finite branching / convergence witness
---------------------------------------------------------------------------- -/

inductive DemoNode where
  | root
  | left
  | right
  | leaf
  | orphan
deriving DecidableEq, Repr

inductive DemoGround where
  | g0
  | g1
  | g2
  | g3
  | g4
deriving DecidableEq, Repr

def demoOutput : DemoNode -> DemoGround
  | .root => .g0
  | .left => .g1
  | .right => .g2
  | .leaf => .g3
  | .orphan => .g4

def demoEntry : DemoNode -> DemoGround
  | .root => .g0
  | .left => .g0
  | .right => .g0
  | .leaf => .g3
  | .orphan => .g4

def demoAnswers : DemoGround -> DemoGround -> Prop
  | .g0, .g0 => True
  | .g0, .g3 => True
  | .g1, .g3 => True
  | .g2, .g3 => True
  | _, _ => False

def demoGraph : Graph DemoNode DemoGround where
  lawfulLadderNode := fun _ => True

  ancestryAnchor := fun n =>
    n = DemoNode.root

  coherentOutputGround := fun n g =>
    g = demoOutput n

  entryLicensingGround := fun n g =>
    g = demoEntry n

  answersGround :=
    demoAnswers

  anchor_is_lawful := by
    intro _n _h
    trivial

theorem root_left_edge :
    Edge demoGraph DemoNode.root DemoNode.left := by
  refine ⟨trivial, trivial, ?_⟩
  refine ⟨DemoGround.g0, DemoGround.g0, ?_, ?_, ?_⟩
  · rfl
  · rfl
  · simp [demoGraph, demoAnswers]

theorem root_right_edge :
    Edge demoGraph DemoNode.root DemoNode.right := by
  refine ⟨trivial, trivial, ?_⟩
  refine ⟨DemoGround.g0, DemoGround.g0, ?_, ?_, ?_⟩
  · rfl
  · rfl
  · simp [demoGraph, demoAnswers]

theorem root_leaf_edge :
    Edge demoGraph DemoNode.root DemoNode.leaf := by
  refine ⟨trivial, trivial, ?_⟩
  refine ⟨DemoGround.g0, DemoGround.g3, ?_, ?_, ?_⟩
  · rfl
  · rfl
  · simp [demoGraph, demoAnswers]

theorem left_leaf_edge :
    Edge demoGraph DemoNode.left DemoNode.leaf := by
  refine ⟨trivial, trivial, ?_⟩
  refine ⟨DemoGround.g1, DemoGround.g3, ?_, ?_, ?_⟩
  · rfl
  · rfl
  · simp [demoGraph, demoAnswers]

theorem right_leaf_edge :
    Edge demoGraph DemoNode.right DemoNode.leaf := by
  refine ⟨trivial, trivial, ?_⟩
  refine ⟨DemoGround.g2, DemoGround.g3, ?_, ?_, ?_⟩
  · rfl
  · rfl
  · simp [demoGraph, demoAnswers]

theorem rootPath :
    Path demoGraph DemoNode.root 0 [DemoNode.root] :=
  Path.anchor (by simp [demoGraph])

theorem rootLeftPath :
    Path demoGraph DemoNode.left 1 [DemoNode.root, DemoNode.left] := by
  simpa using
    Path.step
      rootPath
      root_left_edge
      (by simp)

theorem rootRightPath :
    Path demoGraph DemoNode.right 1 [DemoNode.root, DemoNode.right] := by
  simpa using
    Path.step
      rootPath
      root_right_edge
      (by simp)

theorem rootLeafDirectPath :
    Path demoGraph DemoNode.leaf 1 [DemoNode.root, DemoNode.leaf] := by
  simpa using
    Path.step
      rootPath
      root_leaf_edge
      (by simp)

theorem rootLeftLeafPath :
    Path demoGraph DemoNode.leaf 2
      [DemoNode.root, DemoNode.left, DemoNode.leaf] := by
  simpa using
    Path.step
      rootLeftPath
      left_leaf_edge
      (by simp)

theorem rootRightLeafPath :
    Path demoGraph DemoNode.leaf 2
      [DemoNode.root, DemoNode.right, DemoNode.leaf] := by
  simpa using
    Path.step
      rootRightPath
      right_leaf_edge
      (by simp)

theorem root_has_depth_zero :
    HasDepth demoGraph DemoNode.root 0 := by
  exact
    ⟨[DemoNode.root], rootPath⟩

theorem left_has_depth_one :
    HasDepth demoGraph DemoNode.left 1 := by
  exact
    ⟨[DemoNode.root, DemoNode.left], rootLeftPath⟩

theorem leaf_has_depth_one :
    HasDepth demoGraph DemoNode.leaf 1 := by
  exact
    ⟨[DemoNode.root, DemoNode.leaf], rootLeafDirectPath⟩

theorem leaf_has_depth_two :
    HasDepth demoGraph DemoNode.leaf 2 := by
  exact
    ⟨[DemoNode.root, DemoNode.left, DemoNode.leaf],
     rootLeftLeafPath⟩

theorem leaf_profile_retains_multiple_depths :
    Profile demoGraph DemoNode.leaf 1
    ∧ Profile demoGraph DemoNode.leaf 2
    ∧ (1 : Nat) ≠ 2 := by
  exact
    ⟨leaf_has_depth_one,
     leaf_has_depth_two,
     by decide⟩

/--
The two depth-2 witnesses reach the same target through distinct branch nodes.
This is lawful convergence, not ambiguity.
-/
theorem leaf_has_distinct_convergent_paths :
    Path demoGraph DemoNode.leaf 2
      [DemoNode.root, DemoNode.left, DemoNode.leaf]
    ∧
    Path demoGraph DemoNode.leaf 2
      [DemoNode.root, DemoNode.right, DemoNode.leaf] := by
  exact
    ⟨rootLeftLeafPath,
     rootRightLeafPath⟩

theorem orphan_is_lawful :
    demoGraph.lawfulLadderNode DemoNode.orphan := by
  trivial

theorem orphan_is_not_anchor :
    ¬ demoGraph.ancestryAnchor DemoNode.orphan := by
  simp [demoGraph]

theorem orphan_has_no_depth_zero :
    ¬ HasDepth demoGraph DemoNode.orphan 0 := by
  exact
    nonanchor_has_no_depth_zero
      demoGraph
      DemoNode.orphan
      orphan_is_not_anchor

theorem no_edge_to_orphan (parent : DemoNode) :
    ¬ Edge demoGraph parent DemoNode.orphan := by
  intro h
  rcases h with
    ⟨_hParent, _hChild, gp, gc, hOut, hEntry, hAnswer⟩
  simp [demoGraph, demoEntry] at hEntry
  subst gc
  cases parent <;>
    cases gp <;>
      simp [demoGraph, demoOutput, demoAnswers] at hOut hAnswer

theorem orphan_has_no_L_depth :
    ∀ d : Nat,
      ¬ HasDepth demoGraph DemoNode.orphan d := by
  intro d hDepth
  rcases hDepth with ⟨visited, hPath⟩
  cases hPath with
  | anchor hAnchor =>
      exact orphan_is_not_anchor hAnchor
  | step _ hEdge _ =>
      exact no_edge_to_orphan _ hEdge

/-!
Lawful nodehood alone is therefore insufficient for L position.
The orphan is a lawful ladder node but has no anchored ancestry depth.
-/
theorem lawful_node_does_not_imply_L_position :
    demoGraph.lawfulLadderNode DemoNode.orphan
    ∧
    (∀ d : Nat,
      ¬ Profile demoGraph DemoNode.orphan d) := by
  constructor
  · exact orphan_is_lawful
  · intro d
    exact orphan_has_no_L_depth d

/-! --------------------------------------------------------------------------
Cycle pressure: graph cycles do not license walk inflation
---------------------------------------------------------------------------- -/

inductive CycleNode where
  | root
  | child
deriving DecidableEq, Repr

inductive CycleGround where
  | a
  | b
deriving DecidableEq, Repr

def cycleOutput : CycleNode -> CycleGround
  | .root => .a
  | .child => .b

def cycleEntry : CycleNode -> CycleGround
  | .root => .b
  | .child => .a

def cycleAnswers : CycleGround -> CycleGround -> Prop
  | .a, .a => True
  | .b, .b => True
  | _, _ => False

def cycleGraph : Graph CycleNode CycleGround where
  lawfulLadderNode := fun _ => True
  ancestryAnchor := fun n => n = CycleNode.root
  coherentOutputGround := fun n g => g = cycleOutput n
  entryLicensingGround := fun n g => g = cycleEntry n
  answersGround := cycleAnswers
  anchor_is_lawful := by
    intro _n _h
    trivial

theorem cycle_root_child_edge :
    Edge cycleGraph CycleNode.root CycleNode.child := by
  refine ⟨trivial, trivial, ?_⟩
  refine ⟨CycleGround.a, CycleGround.a, ?_, ?_, ?_⟩
  · rfl
  · rfl
  · simp [cycleGraph, cycleAnswers]

theorem cycle_child_root_edge :
    Edge cycleGraph CycleNode.child CycleNode.root := by
  refine ⟨trivial, trivial, ?_⟩
  refine ⟨CycleGround.b, CycleGround.b, ?_, ?_, ?_⟩
  · rfl
  · rfl
  · simp [cycleGraph, cycleAnswers]

theorem cycleRootPath :
    Path cycleGraph CycleNode.root 0 [CycleNode.root] :=
  Path.anchor (by simp [cycleGraph])

theorem cycleRootChildPath :
    Path cycleGraph CycleNode.child 1
      [CycleNode.root, CycleNode.child] := by
  simpa using
    Path.step
      cycleRootPath
      cycle_root_child_edge
      (by simp)

theorem cycle_path_contains_root
    {target : CycleNode}
    {d : Nat}
    {visited : List CycleNode}
    (h : Path cycleGraph target d visited) :
    CycleNode.root ∈ visited := by
  induction h with
  | anchor hAnchor =>
      simp [cycleGraph] at hAnchor
      subst hAnchor
      simp
  | @step parent nextNode d visited hPath hEdge hFresh ih =>
      exact List.mem_append_left _ ih

/--
The graph contains both root -> child and child -> root.

Nevertheless, no positive-depth simple ancestry path may end by revisiting the
declared root, because the root is already present in every path's visited set.
-/
theorem cycle_root_has_only_depth_zero :
    ∀ d : Nat,
      HasDepth cycleGraph CycleNode.root d ->
      d = 0 := by
  intro d hDepth
  rcases hDepth with ⟨visited, hPath⟩
  cases hPath with
  | anchor _ =>
      rfl
  | @step parent nextNode dPrev visitedPrev hPrev hEdge hFresh =>
      have hRootMem :
          CycleNode.root ∈ visitedPrev :=
        cycle_path_contains_root hPrev
      exact (hFresh hRootMem).elim

theorem cycle_does_not_inflate_root_depth :
    Edge cycleGraph CycleNode.root CycleNode.child
    ∧ Edge cycleGraph CycleNode.child CycleNode.root
    ∧ HasDepth cycleGraph CycleNode.root 0
    ∧ HasDepth cycleGraph CycleNode.child 1
    ∧ ¬ HasDepth cycleGraph CycleNode.root 2 := by
  constructor
  · exact cycle_root_child_edge
  constructor
  · exact cycle_child_root_edge
  constructor
  · exact ⟨[CycleNode.root], cycleRootPath⟩
  constructor
  · exact
      ⟨[CycleNode.root, CycleNode.child],
       cycleRootChildPath⟩
  · intro hDepth2
    have hEq :
        (2 : Nat) = 0 :=
      cycle_root_has_only_depth_zero 2 hDepth2
    omega

/-! --------------------------------------------------------------------------
H / L non-collapse witnesses
---------------------------------------------------------------------------- -/

structure HLView where
  node : DemoNode
  current : HReadout.CurrentState

noncomputable def hDepthOfView (v : HLView) : Nat :=
  HReadout.depth v.current

def hasLDepthOfView (v : HLView) (d : Nat) : Prop :=
  Profile demoGraph v.node d

def coherentCurrent : HReadout.CurrentState :=
  HReadout.fromFoundational
    FReadout.demoPass
    True
    True

def authorizedCurrent : HReadout.CurrentState :=
  HReadout.fromFoundational
    FReadout.demoPass
    False
    False

def rootH6 : HLView where
  node := DemoNode.root
  current := coherentCurrent

def leftH6 : HLView where
  node := DemoNode.left
  current := coherentCurrent

def leftH4 : HLView where
  node := DemoNode.left
  current := authorizedCurrent

theorem coherentCurrent_depth_six :
    HReadout.depth coherentCurrent = 6 := by
  have hA :
      FReadout.demoPass.authorizationIncorporates := by
    simp [FReadout.demoPass]
  exact
    HReadout.coherence_gives_h6
      FReadout.demoPass
      FReadout.demoPass_wf
      hA

theorem authorizedCurrent_depth_four :
    HReadout.depth authorizedCurrent = 4 := by
  have hA :
      FReadout.demoPass.authorizationIncorporates := by
    simp [FReadout.demoPass]
  exact
    HReadout.authorization_without_recognition_gives_h4
      FReadout.demoPass
      FReadout.demoPass_wf
      hA

theorem left_is_not_anchor :
    ¬ demoGraph.ancestryAnchor DemoNode.left := by
  simp [demoGraph]

/--
Same H, different L:

both views carry the same current coherent H-state (H6), while one is the
declared L anchor and the other sits one ancestry edge downstream.
-/
theorem same_H_different_L :
    hDepthOfView rootH6 = 6
    ∧ hDepthOfView leftH6 = 6
    ∧ hasLDepthOfView rootH6 0
    ∧ ¬ hasLDepthOfView leftH6 0
    ∧ hasLDepthOfView leftH6 1 := by
  refine
    ⟨?_, ?_, ?_, ?_, ?_⟩
  · exact coherentCurrent_depth_six
  · exact coherentCurrent_depth_six
  · exact root_has_depth_zero
  · exact
      nonanchor_has_no_depth_zero
        demoGraph
        DemoNode.left
        left_is_not_anchor
  · exact left_has_depth_one

/--
Same L, different H:

both views refer to the same L-node and therefore have the same ancestry
position witness, while their current hinge-prefix readouts differ.
-/
theorem same_L_different_H :
    hasLDepthOfView leftH4 1
    ∧ hasLDepthOfView leftH6 1
    ∧ hDepthOfView leftH4 = 4
    ∧ hDepthOfView leftH6 = 6
    ∧ hDepthOfView leftH4 ≠ hDepthOfView leftH6 := by
  refine
    ⟨left_has_depth_one,
     left_has_depth_one,
     authorizedCurrent_depth_four,
     coherentCurrent_depth_six,
     ?_⟩
  change
    HReadout.depth authorizedCurrent
      ≠ HReadout.depth coherentCurrent
  rw [authorizedCurrent_depth_four, coherentCurrent_depth_six]
  decide

theorem H_and_L_are_mutually_nondetermining :
    (
      hDepthOfView rootH6 = hDepthOfView leftH6
      ∧
      hasLDepthOfView rootH6 0
      ∧
      ¬ hasLDepthOfView leftH6 0
    )
    ∧
    (
      hasLDepthOfView leftH4 1
      ∧ hasLDepthOfView leftH6 1
      ∧
      hDepthOfView leftH4 ≠ hDepthOfView leftH6
    ) := by
  constructor
  · constructor
    · rw [same_H_different_L.1, same_H_different_L.2.1]
    · exact
        ⟨same_H_different_L.2.2.1,
         same_H_different_L.2.2.2.1⟩
  · exact
      ⟨same_L_different_H.1,
       same_L_different_H.2.1,
       same_L_different_H.2.2.2.2⟩

theorem L_machine_checkpoint :
    Profile demoGraph DemoNode.root 0
    ∧ Profile demoGraph DemoNode.left 1
    ∧
    (
      Profile demoGraph DemoNode.leaf 1
      ∧ Profile demoGraph DemoNode.leaf 2
    )
    ∧
    (
      Path demoGraph DemoNode.leaf 2
        [DemoNode.root, DemoNode.left, DemoNode.leaf]
      ∧
      Path demoGraph DemoNode.leaf 2
        [DemoNode.root, DemoNode.right, DemoNode.leaf]
    )
    ∧
    demoGraph.lawfulLadderNode DemoNode.orphan
    ∧
    (∀ d : Nat,
      ¬ Profile demoGraph DemoNode.orphan d)
    ∧
    (
      Edge cycleGraph CycleNode.root CycleNode.child
      ∧ Edge cycleGraph CycleNode.child CycleNode.root
      ∧ ¬ HasDepth cycleGraph CycleNode.root 2
    )
    ∧
    (
      (
        hDepthOfView rootH6 = hDepthOfView leftH6
        ∧
        hasLDepthOfView rootH6 0
        ∧
        ¬ hasLDepthOfView leftH6 0
      )
      ∧
      (
        hasLDepthOfView leftH4 1
        ∧ hasLDepthOfView leftH6 1
        ∧
        hDepthOfView leftH4 ≠ hDepthOfView leftH6
      )
    ) := by
  exact
    ⟨root_has_depth_zero,
     left_has_depth_one,
     ⟨leaf_has_depth_one,
      leaf_has_depth_two⟩,
     leaf_has_distinct_convergent_paths,
     orphan_is_lawful,
     fun d => orphan_has_no_L_depth d,
     ⟨cycle_root_child_edge,
      cycle_child_root_edge,
      cycle_does_not_inflate_root_depth.2.2.2.2⟩,
     H_and_L_are_mutually_nondetermining⟩

/-! --------------------------------------------------------------------------
Heterogeneous adapter from closed Ladder objects into L ancestry
---------------------------------------------------------------------------- -/

/--
A parent-ground item is an actual source of the descendant ladder's entry when:

* the descendant declares it inherited;
* it is owned by the descendant ladder's coherent parent whole;
* some child-entry ground answers it;
* that child-entry ground supports the descendant entry burden.

This is inherited coherent ground that genuinely participates in entry, not
decorative inheritance.
-/
def EntrySource
    {ParentPiece ParentWhole ParentInvariant
      ChildPiece ChildWhole ChildInvariant
      ParentGround ChildGround Burden : Type u}
    (w :
      Ladder.World
        ParentPiece ParentWhole ParentInvariant
        ChildPiece ChildWhole ChildInvariant
        ParentGround ChildGround Burden)
    (gParent : ParentGround) : Prop :=
  w.inheritedGround gParent
  ∧
  w.parentWholeOwnsGround
    w.parentWorld.candidateWhole
    gParent
  ∧
  ∃ gChild : ChildGround,
    w.childEntryGround gChild
    ∧ w.answersInherited gParent gChild
    ∧ w.supportsEntry gChild w.entryBurden

theorem lawful_ladder_has_entry_source
    {ParentPiece ParentWhole ParentInvariant
      ChildPiece ChildWhole ChildInvariant
      ParentGround ChildGround Burden : Type u}
    (w :
      Ladder.World
        ParentPiece ParentWhole ParentInvariant
        ChildPiece ChildWhole ChildInvariant
        ParentGround ChildGround Burden)
    (hLawful : Ladder.LawfulLadder w) :
    ∃ gParent : ParentGround,
      EntrySource w gParent := by
  rcases hLawful with
    ⟨⟨_hParent,
       _hGroundAttached,
       _hLive,
       hEntryGrounded,
       _hFirstNew⟩,
     _hChild,
     _hLineage⟩
  rcases hEntryGrounded with
    ⟨gChild,
     ⟨hChildEntry,
      gParent,
      hInherited,
      hOwned,
      hAnswers⟩,
     hSupports⟩
  exact
    ⟨gParent,
     hInherited,
     hOwned,
     gChild,
     hChildEntry,
     hAnswers,
     hSupports⟩

/--
Existentially packaged lawful Ladder instance.

Each node carries its own piece / whole / invariant / ground / burden types.
Therefore one L ancestry family need not be homogeneous across ladder
instances.
-/
structure PackedLadder where
  ParentPiece : Type u
  ParentWhole : Type u
  ParentInvariant : Type u

  ChildPiece : Type u
  ChildWhole : Type u
  ChildInvariant : Type u

  ParentGround : Type u
  ChildGround : Type u
  Burden : Type u

  world :
    Ladder.World
      ParentPiece ParentWhole ParentInvariant
      ChildPiece ChildWhole ChildInvariant
      ParentGround ChildGround Burden

  lawful :
    Ladder.LawfulLadder world

def PackedEntrySource
    (p : PackedLadder)
    (gParent : p.ParentGround) : Prop :=
  EntrySource p.world gParent

theorem packed_ladder_has_entry_source
    (p : PackedLadder) :
    ∃ gParent : p.ParentGround,
      PackedEntrySource p gParent := by
  exact
    lawful_ladder_has_entry_source
      p.world
      p.lawful

/--
A heterogeneous family of already-lawful Ladder instances.

`groundsEntrySource` is intentionally stronger than generic answerability.
It is the domain-owned actual dependency relation saying that the prior
ladder's earned coherent child whole is what grounds / provides the descendant
ladder's inherited entry-source ground.

Identity is not required.
-/
structure HeteroFamily (Node : Type u) where
  ladderOf :
    Node -> PackedLadder.{u}

  groundsEntrySource :
    ∀ parent child : Node,
      (ladderOf parent).ChildWhole ->
      (ladderOf child).ParentGround ->
      Prop

/--
Cross-ladder L edge for heterogeneous Ladder instances.

Lawful nodehood is already carried by the PackedLadder endpoints.
The additional earned burden is actual ground dependency into an EntrySource
of the descendant ladder.
-/
def HeteroEdge
    {Node : Type u}
    (fam : HeteroFamily Node)
    (parent child : Node) : Prop :=
  ∃ gParent : (fam.ladderOf child).ParentGround,
    PackedEntrySource
      (fam.ladderOf child)
      gParent
    ∧
    fam.groundsEntrySource
      parent
      child
      (fam.ladderOf parent).world.childWorld.candidateWhole
      gParent

theorem heteroEdge_parent_lawful
    {Node : Type u}
    {fam : HeteroFamily Node}
    {parent child : Node}
    (_h : HeteroEdge fam parent child) :
    Ladder.LawfulLadder
      (fam.ladderOf parent).world :=
  (fam.ladderOf parent).lawful

theorem heteroEdge_child_lawful
    {Node : Type u}
    {fam : HeteroFamily Node}
    {parent child : Node}
    (_h : HeteroEdge fam parent child) :
    Ladder.LawfulLadder
      (fam.ladderOf child).world :=
  (fam.ladderOf child).lawful

/--
Simple anchored ancestry path directly over the heterogeneous Ladder family.

No repeated ladder-instance node is admitted in one counted path.
-/
inductive HPath
    {Node : Type u}
    (fam : HeteroFamily Node)
    (anchor : Node -> Prop) :
    Node -> Nat -> List Node -> Prop where

  | anchorPath
      {a : Node}
      (hAnchor : anchor a) :
      HPath fam anchor a 0 [a]

  | step
      {parent child : Node}
      {d : Nat}
      {visited : List Node}
      (hPath :
        HPath fam anchor parent d visited)
      (hEdge :
        HeteroEdge fam parent child)
      (hFresh :
        child ∉ visited) :
      HPath
        fam
        anchor
        child
        (d + 1)
        (visited ++ [child])

def HHasDepth
    {Node : Type u}
    (fam : HeteroFamily Node)
    (anchor : Node -> Prop)
    (target : Node)
    (d : Nat) : Prop :=
  ∃ visited : List Node,
    HPath fam anchor target d visited

def HProfile
    {Node : Type u}
    (fam : HeteroFamily Node)
    (anchor : Node -> Prop)
    (target : Node) : Nat -> Prop :=
  fun d =>
    HHasDepth fam anchor target d

theorem hHasDepth_zero_iff_anchor
    {Node : Type u}
    (fam : HeteroFamily Node)
    (anchor : Node -> Prop)
    (target : Node) :
    HHasDepth fam anchor target 0
    ↔ anchor target := by
  constructor
  · intro h
    rcases h with ⟨visited, hPath⟩
    cases hPath with
    | anchorPath hAnchor =>
        exact hAnchor
  · intro hAnchor
    exact
      ⟨[target],
       HPath.anchorPath hAnchor⟩

/-! --------------------------------------------------------------------------
Concrete heterogeneous-adapter witness
---------------------------------------------------------------------------- -/

def packedLadderSuccess : PackedLadder where
  ParentPiece := Coherence.TestPiece
  ParentWhole := Coherence.TestWhole
  ParentInvariant := Coherence.TestInvariant

  ChildPiece := Coherence.TestPiece
  ChildWhole := Coherence.TestWhole
  ChildInvariant := Coherence.TestInvariant

  ParentGround := Ladder.DemoParentGround
  ChildGround := Ladder.DemoChildGround
  Burden := Ladder.DemoBurden

  world := Ladder.ladderSuccess
  lawful := Ladder.ladderSuccess_lawful

inductive AdapterNode where
  | first
  | second
deriving DecidableEq, Repr

def heteroSuccessFamily :
    HeteroFamily AdapterNode where

  ladderOf :=
    fun _ =>
      packedLadderSuccess

  groundsEntrySource :=
    fun _parent _child _whole _ground =>
      True

def heteroNoBridgeFamily :
    HeteroFamily AdapterNode where

  ladderOf :=
    fun _ =>
      packedLadderSuccess

  groundsEntrySource :=
    fun _parent _child _whole _ground =>
      False

def heteroAnchor : AdapterNode -> Prop
  | .first => True
  | .second => False

theorem hetero_first_second_edge :
    HeteroEdge
      heteroSuccessFamily
      AdapterNode.first
      AdapterNode.second := by
  rcases
    packed_ladder_has_entry_source
      (heteroSuccessFamily.ladderOf AdapterNode.second)
  with
    ⟨gParent, hSource⟩
  exact
    ⟨gParent,
     hSource,
     trivial⟩

theorem hetero_both_nodes_lawful :
    Ladder.LawfulLadder
      (heteroSuccessFamily.ladderOf AdapterNode.first).world
    ∧
    Ladder.LawfulLadder
      (heteroSuccessFamily.ladderOf AdapterNode.second).world := by
  exact
    ⟨(heteroSuccessFamily.ladderOf AdapterNode.first).lawful,
     (heteroSuccessFamily.ladderOf AdapterNode.second).lawful⟩

theorem hetero_lawful_nodes_do_not_imply_edge :
    ¬ HeteroEdge
      heteroNoBridgeFamily
      AdapterNode.first
      AdapterNode.second := by
  intro h
  rcases h with
    ⟨_gParent,
     _hSource,
     hGrounds⟩
  exact hGrounds

theorem heteroRootPath :
    HPath
      heteroSuccessFamily
      heteroAnchor
      AdapterNode.first
      0
      [AdapterNode.first] :=
  HPath.anchorPath trivial

theorem heteroSecondPath :
    HPath
      heteroSuccessFamily
      heteroAnchor
      AdapterNode.second
      1
      [AdapterNode.first, AdapterNode.second] := by
  simpa using
    HPath.step
      heteroRootPath
      hetero_first_second_edge
      (by simp)

theorem hetero_root_depth_zero :
    HHasDepth
      heteroSuccessFamily
      heteroAnchor
      AdapterNode.first
      0 := by
  exact
    ⟨[AdapterNode.first],
     heteroRootPath⟩

theorem hetero_second_depth_one :
    HHasDepth
      heteroSuccessFamily
      heteroAnchor
      AdapterNode.second
      1 := by
  exact
    ⟨[AdapterNode.first, AdapterNode.second],
     heteroSecondPath⟩

theorem hetero_second_not_depth_zero :
    ¬ HHasDepth
      heteroSuccessFamily
      heteroAnchor
      AdapterNode.second
      0 := by
  intro h
  have hAnchor :
      heteroAnchor AdapterNode.second :=
    (hHasDepth_zero_iff_anchor
      heteroSuccessFamily
      heteroAnchor
      AdapterNode.second).1
      h
  simp [heteroAnchor] at hAnchor

/-! --------------------------------------------------------------------------
Multiple anchors remain lawful and non-unique
---------------------------------------------------------------------------- -/

def heteroMultiAnchor : AdapterNode -> Prop :=
  fun _ => True

theorem hetero_multiple_anchors_depth_zero :
    HHasDepth
      heteroSuccessFamily
      heteroMultiAnchor
      AdapterNode.first
      0
    ∧
    HHasDepth
      heteroSuccessFamily
      heteroMultiAnchor
      AdapterNode.second
      0 := by
  constructor
  · exact
      (hHasDepth_zero_iff_anchor
        heteroSuccessFamily
        heteroMultiAnchor
        AdapterNode.first).2
        trivial
  · exact
      (hHasDepth_zero_iff_anchor
        heteroSuccessFamily
        heteroMultiAnchor
        AdapterNode.second).2
        trivial

theorem L_heterogeneous_adapter_checkpoint :
    Ladder.LawfulLadder
      (heteroSuccessFamily.ladderOf AdapterNode.first).world
    ∧
    Ladder.LawfulLadder
      (heteroSuccessFamily.ladderOf AdapterNode.second).world
    ∧
    HeteroEdge
      heteroSuccessFamily
      AdapterNode.first
      AdapterNode.second
    ∧
    (
      Ladder.LawfulLadder
        (heteroNoBridgeFamily.ladderOf AdapterNode.first).world
      ∧
      Ladder.LawfulLadder
        (heteroNoBridgeFamily.ladderOf AdapterNode.second).world
      ∧
      ¬ HeteroEdge
        heteroNoBridgeFamily
        AdapterNode.first
        AdapterNode.second
    )
    ∧
    HHasDepth
      heteroSuccessFamily
      heteroAnchor
      AdapterNode.first
      0
    ∧
    HHasDepth
      heteroSuccessFamily
      heteroAnchor
      AdapterNode.second
      1
    ∧
    ¬ HHasDepth
      heteroSuccessFamily
      heteroAnchor
      AdapterNode.second
      0
    ∧
    (
      HHasDepth
        heteroSuccessFamily
        heteroMultiAnchor
        AdapterNode.first
        0
      ∧
      HHasDepth
        heteroSuccessFamily
        heteroMultiAnchor
        AdapterNode.second
        0
    ) := by
  exact
    ⟨hetero_both_nodes_lawful.1,
     hetero_both_nodes_lawful.2,
     hetero_first_second_edge,
     ⟨(heteroNoBridgeFamily.ladderOf AdapterNode.first).lawful,
      (heteroNoBridgeFamily.ladderOf AdapterNode.second).lawful,
      hetero_lawful_nodes_do_not_imply_edge⟩,
     hetero_root_depth_zero,
     hetero_second_depth_one,
     hetero_second_not_depth_zero,
     hetero_multiple_anchors_depth_zero⟩

/-! --------------------------------------------------------------------------
F / L profile non-collapse
---------------------------------------------------------------------------- -/

structure FLView where
  node : DemoNode
  assay :
    FReadout.Assay
      Unit Unit Unit Unit
      FReadout.DemoRoute

def fDifferentiatedOfView
    (v : FLView) : Prop :=
  FReadout.Differentiated v.assay

def hasLDepthOfFView
    (v : FLView)
    (d : Nat) : Prop :=
  Profile demoGraph v.node d

def rootUniformF : FLView where
  node := DemoNode.root
  assay := FReadout.uniformPassDemo

def leftUniformF : FLView where
  node := DemoNode.left
  assay := FReadout.uniformPassDemo

def leftDifferentiatedF : FLView where
  node := DemoNode.left
  assay := FReadout.differentiatedDemo

theorem same_F_profile_different_L :
    ¬ fDifferentiatedOfView rootUniformF
    ∧ ¬ fDifferentiatedOfView leftUniformF
    ∧ hasLDepthOfFView rootUniformF 0
    ∧ ¬ hasLDepthOfFView leftUniformF 0
    ∧ hasLDepthOfFView leftUniformF 1 := by
  refine
    ⟨?_, ?_, ?_, ?_, ?_⟩
  · exact FReadout.uniformPassDemo_not_differentiated
  · exact FReadout.uniformPassDemo_not_differentiated
  · exact root_has_depth_zero
  · exact
      nonanchor_has_no_depth_zero
        demoGraph
        DemoNode.left
        left_is_not_anchor
  · exact left_has_depth_one

theorem same_L_different_F_profile :
    hasLDepthOfFView leftUniformF 1
    ∧ hasLDepthOfFView leftDifferentiatedF 1
    ∧ ¬ fDifferentiatedOfView leftUniformF
    ∧ fDifferentiatedOfView leftDifferentiatedF := by
  exact
    ⟨left_has_depth_one,
     left_has_depth_one,
     FReadout.uniformPassDemo_not_differentiated,
     FReadout.differentiatedDemo_is_differentiated⟩

theorem F_and_L_are_mutually_nondetermining :
    (
      ¬ fDifferentiatedOfView rootUniformF
      ∧ ¬ fDifferentiatedOfView leftUniformF
      ∧ hasLDepthOfFView rootUniformF 0
      ∧ ¬ hasLDepthOfFView leftUniformF 0
    )
    ∧
    (
      hasLDepthOfFView leftUniformF 1
      ∧ hasLDepthOfFView leftDifferentiatedF 1
      ∧ ¬ fDifferentiatedOfView leftUniformF
      ∧ fDifferentiatedOfView leftDifferentiatedF
    ) := by
  exact
    ⟨⟨same_F_profile_different_L.1,
       same_F_profile_different_L.2.1,
       same_F_profile_different_L.2.2.1,
       same_F_profile_different_L.2.2.2.1⟩,
     same_L_different_F_profile⟩

theorem L_adapter_checkpoint :
    (
      Ladder.LawfulLadder
        (heteroSuccessFamily.ladderOf AdapterNode.first).world
      ∧
      Ladder.LawfulLadder
        (heteroSuccessFamily.ladderOf AdapterNode.second).world
      ∧
      HeteroEdge
        heteroSuccessFamily
        AdapterNode.first
        AdapterNode.second
    )
    ∧
    (
      Ladder.LawfulLadder
        (heteroNoBridgeFamily.ladderOf AdapterNode.first).world
      ∧
      Ladder.LawfulLadder
        (heteroNoBridgeFamily.ladderOf AdapterNode.second).world
      ∧
      ¬ HeteroEdge
        heteroNoBridgeFamily
        AdapterNode.first
        AdapterNode.second
    )
    ∧
    (
      HHasDepth
        heteroSuccessFamily
        heteroMultiAnchor
        AdapterNode.first
        0
      ∧
      HHasDepth
        heteroSuccessFamily
        heteroMultiAnchor
        AdapterNode.second
        0
    )
    ∧
    (
      (
        ¬ fDifferentiatedOfView rootUniformF
        ∧ ¬ fDifferentiatedOfView leftUniformF
        ∧ hasLDepthOfFView rootUniformF 0
        ∧ ¬ hasLDepthOfFView leftUniformF 0
      )
      ∧
      (
        hasLDepthOfFView leftUniformF 1
        ∧ hasLDepthOfFView leftDifferentiatedF 1
        ∧ ¬ fDifferentiatedOfView leftUniformF
        ∧ fDifferentiatedOfView leftDifferentiatedF
      )
    ) := by
  exact
    ⟨⟨hetero_both_nodes_lawful.1,
       hetero_both_nodes_lawful.2,
       hetero_first_second_edge⟩,
     ⟨(heteroNoBridgeFamily.ladderOf AdapterNode.first).lawful,
      (heteroNoBridgeFamily.ladderOf AdapterNode.second).lawful,
      hetero_lawful_nodes_do_not_imply_edge⟩,
     hetero_multiple_anchors_depth_zero,
     F_and_L_are_mutually_nondetermining⟩

end LReadout
end StructuralFlow


/-!
===============================================================================
STRUCTURAL FLOW — PUBLIC TRANSLATION / COMPOSITION THEOREM MODULE
===============================================================================

Purpose
-------
Public-kernel extraction of the universal realization / translation contract and
cross-domain composition grammar.

This public module intentionally excludes Workbench self-audit machinery for novel
candidate burdens and CURRENT KERNEL INSUFFICIENT. Those remain research-layer
machinery around, not inside, the public contract.

Semantic authority: current compatible Structural Flow TOE — Universal Canon
and Interaction Interface.
-/

namespace StructuralFlow
namespace UniversalTranslationContract

universe u

inductive Disposition where
  | discharged
  | violated
  | open
deriving DecidableEq, Repr

theorem disposition_not_discharged_cases
    (d : Disposition)
    (h : d ≠ Disposition.discharged) :
    d = Disposition.violated
    ∨ d = Disposition.open := by
  cases d <;> simp_all

/--
Fixed minimum burdens carried by every universal realization / translation
adjudication surface.
-/
inductive CoreBurden where
  | surfaceWarrant
  | sourceCarrierPin
  | objectPin
  | levelPin
  | scopePin
  | structuralPreservation
  | nonCircularity
  | identityFirewall
deriving DecidableEq, Repr

/--
Public universal translation contract packet.

Object-specific burdens are registered by the Structural Flow object being
translated. Domain burdens are divided into entry burdens, which participate in
translation admission, and downstream burdens, which remain domain-owned after
structural conformance.
-/
structure World
    (ObjectBurden DomainBurden : Type u) where

  coreState :
    CoreBurden -> Disposition

  coreEvidence :
    CoreBurden -> Disposition -> Prop

  coreWarrant :
    ∀ b,
      coreEvidence b (coreState b)

  objectRequired :
    ObjectBurden -> Prop

  objectState :
    ObjectBurden -> Disposition

  objectEvidence :
    ObjectBurden -> Disposition -> Prop

  objectWarrant :
    ∀ b,
      objectRequired b ->
      objectEvidence b (objectState b)

  domainEntryRequired :
    DomainBurden -> Prop

  domainDownstreamRequired :
    DomainBurden -> Prop

  domainRoleDisjoint :
    ∀ b,
      ¬ (domainEntryRequired b ∧ domainDownstreamRequired b)

  domainState :
    DomainBurden -> Disposition

  domainEvidence :
    DomainBurden -> Disposition -> Prop

  domainWarrant :
    ∀ b,
      (domainEntryRequired b ∨ domainDownstreamRequired b) ->
      domainEvidence b (domainState b)

/-! --------------------------------------------------------------------------
Exact located known failure / open certificates
---------------------------------------------------------------------------- -/

inductive KnownFailure
    {ObjectBurden DomainBurden : Type u}
    (w : World ObjectBurden DomainBurden) : Type u where

  | core
      (burden : CoreBurden)
      (failed :
        w.coreState burden = Disposition.violated)

  | object
      (burden : ObjectBurden)
      (required :
        w.objectRequired burden)
      (failed :
        w.objectState burden = Disposition.violated)

  | domainEntry
      (burden : DomainBurden)
      (required :
        w.domainEntryRequired burden)
      (failed :
        w.domainState burden = Disposition.violated)

inductive KnownOpen
    {ObjectBurden DomainBurden : Type u}
    (w : World ObjectBurden DomainBurden) : Type u where

  | core
      (burden : CoreBurden)
      (isOpen :
        w.coreState burden = Disposition.open)

  | object
      (burden : ObjectBurden)
      (required :
        w.objectRequired burden)
      (isOpen :
        w.objectState burden = Disposition.open)

  | domainEntry
      (burden : DomainBurden)
      (required :
        w.domainEntryRequired burden)
      (isOpen :
        w.domainState burden = Disposition.open)

/-! --------------------------------------------------------------------------
Public structural translation dispositions
---------------------------------------------------------------------------- -/

def GatingPass
    {ObjectBurden DomainBurden : Type u}
    (w : World ObjectBurden DomainBurden) : Prop :=
  (
    ∀ c : CoreBurden,
      w.coreState c = Disposition.discharged
  )
  ∧
  (
    ∀ o : ObjectBurden,
      w.objectRequired o ->
      w.objectState o = Disposition.discharged
  )
  ∧
  (
    ∀ d : DomainBurden,
      w.domainEntryRequired d ->
      w.domainState d = Disposition.discharged
  )

def NoLawfulTranslation
    {ObjectBurden DomainBurden : Type u}
    (w : World ObjectBurden DomainBurden) : Prop :=
  Nonempty (KnownFailure w)

def NotYetAdjudicable
    {ObjectBurden DomainBurden : Type u}
    (w : World ObjectBurden DomainBurden) : Prop :=
  (
    ¬ Nonempty (KnownFailure w)
  )
  ∧
  Nonempty (KnownOpen w)

def StructuralConforms
    {ObjectBurden DomainBurden : Type u}
    (w : World ObjectBurden DomainBurden) : Prop :=
  GatingPass w

/-! --------------------------------------------------------------------------
Downstream domain result after structural conformance
---------------------------------------------------------------------------- -/

def DomainOutcomeNegative
    {ObjectBurden DomainBurden : Type u}
    (w : World ObjectBurden DomainBurden) : Prop :=
  ∃ d : DomainBurden,
    w.domainDownstreamRequired d
    ∧ w.domainState d = Disposition.violated

def DomainBurdenOpen
    {ObjectBurden DomainBurden : Type u}
    (w : World ObjectBurden DomainBurden) : Prop :=
  ∃ d : DomainBurden,
    w.domainDownstreamRequired d
    ∧ w.domainState d = Disposition.open

def DomainBurdensClosed
    {ObjectBurden DomainBurden : Type u}
    (w : World ObjectBurden DomainBurden) : Prop :=
  ∀ d : DomainBurden,
    w.domainDownstreamRequired d ->
    w.domainState d = Disposition.discharged

/-! --------------------------------------------------------------------------
Failure / open certificates block structural conformance
---------------------------------------------------------------------------- -/

theorem knownFailure_blocks_gatingPass
    {ObjectBurden DomainBurden : Type u}
    {w : World ObjectBurden DomainBurden}
    (hFail : KnownFailure w) :
    ¬ GatingPass w := by
  intro hPass
  rcases hPass with
    ⟨hCore, hObject, hEntry⟩
  cases hFail with
  | core burden hFailed =>
      have hDischarged :
          w.coreState burden = Disposition.discharged :=
        hCore burden
      rw [hDischarged] at hFailed
      cases hFailed
  | object burden hRequired hFailed =>
      have hDischarged :
          w.objectState burden = Disposition.discharged :=
        hObject burden hRequired
      rw [hDischarged] at hFailed
      cases hFailed
  | domainEntry burden hRequired hFailed =>
      have hDischarged :
          w.domainState burden = Disposition.discharged :=
        hEntry burden hRequired
      rw [hDischarged] at hFailed
      cases hFailed

theorem knownOpen_blocks_gatingPass
    {ObjectBurden DomainBurden : Type u}
    {w : World ObjectBurden DomainBurden}
    (hOpen : KnownOpen w) :
    ¬ GatingPass w := by
  intro hPass
  rcases hPass with
    ⟨hCore, hObject, hEntry⟩
  cases hOpen with
  | core burden hIsOpen =>
      have hDischarged :
          w.coreState burden = Disposition.discharged :=
        hCore burden
      rw [hDischarged] at hIsOpen
      cases hIsOpen
  | object burden hRequired hIsOpen =>
      have hDischarged :
          w.objectState burden = Disposition.discharged :=
        hObject burden hRequired
      rw [hDischarged] at hIsOpen
      cases hIsOpen
  | domainEntry burden hRequired hIsOpen =>
      have hDischarged :
          w.domainState burden = Disposition.discharged :=
        hEntry burden hRequired
      rw [hDischarged] at hIsOpen
      cases hIsOpen

theorem gatingPass_of_no_failure_no_open
    {ObjectBurden DomainBurden : Type u}
    (w : World ObjectBurden DomainBurden)
    (hNoFail :
      ¬ Nonempty (KnownFailure w))
    (hNoOpen :
      ¬ Nonempty (KnownOpen w)) :
    GatingPass w := by
  refine ⟨?_, ?_, ?_⟩
  · intro c
    by_cases hDischarged :
        w.coreState c = Disposition.discharged
    · exact hDischarged
    · rcases
        disposition_not_discharged_cases
          (w.coreState c)
          hDischarged
      with hViolated | hOpenState
      · exfalso
        exact
          hNoFail
            ⟨KnownFailure.core c hViolated⟩
      · exfalso
        exact
          hNoOpen
            ⟨KnownOpen.core c hOpenState⟩
  · intro o hRequired
    by_cases hDischarged :
        w.objectState o = Disposition.discharged
    · exact hDischarged
    · rcases
        disposition_not_discharged_cases
          (w.objectState o)
          hDischarged
      with hViolated | hOpenState
      · exfalso
        exact
          hNoFail
            ⟨KnownFailure.object o hRequired hViolated⟩
      · exfalso
        exact
          hNoOpen
            ⟨KnownOpen.object o hRequired hOpenState⟩
  · intro d hRequired
    by_cases hDischarged :
        w.domainState d = Disposition.discharged
    · exact hDischarged
    · rcases
        disposition_not_discharged_cases
          (w.domainState d)
          hDischarged
      with hViolated | hOpenState
      · exfalso
        exact
          hNoFail
            ⟨KnownFailure.domainEntry d hRequired hViolated⟩
      · exfalso
        exact
          hNoOpen
            ⟨KnownOpen.domainEntry d hRequired hOpenState⟩

/-! --------------------------------------------------------------------------
Three-way public structural headline coverage
---------------------------------------------------------------------------- -/

theorem structural_headline_coverage
    {ObjectBurden DomainBurden : Type u}
    (w : World ObjectBurden DomainBurden) :
    NoLawfulTranslation w
    ∨ NotYetAdjudicable w
    ∨ StructuralConforms w := by
  classical
  by_cases hFail :
      Nonempty (KnownFailure w)
  · exact Or.inl hFail
  · right
    by_cases hOpen :
        Nonempty (KnownOpen w)
    · exact Or.inl ⟨hFail, hOpen⟩
    · right
      exact gatingPass_of_no_failure_no_open w hFail hOpen

theorem noLawfulTranslation_not_structuralConforms
    {ObjectBurden DomainBurden : Type u}
    {w : World ObjectBurden DomainBurden}
    (hNoTranslation : NoLawfulTranslation w) :
    ¬ StructuralConforms w := by
  intro hConforms
  rcases hNoTranslation with ⟨hFail⟩
  exact
    (knownFailure_blocks_gatingPass hFail)
      hConforms

theorem notYet_not_structuralConforms
    {ObjectBurden DomainBurden : Type u}
    {w : World ObjectBurden DomainBurden}
    (hNotYet : NotYetAdjudicable w) :
    ¬ StructuralConforms w := by
  intro hConforms
  rcases hNotYet.2 with ⟨hOpen⟩
  exact
    (knownOpen_blocks_gatingPass hOpen)
      hConforms

theorem noLawfulTranslation_not_notYet
    {ObjectBurden DomainBurden : Type u}
    {w : World ObjectBurden DomainBurden}
    (hNoTranslation : NoLawfulTranslation w) :
    ¬ NotYetAdjudicable w := by
  intro hNotYet
  exact hNotYet.1 hNoTranslation

/-! --------------------------------------------------------------------------
Downstream domain outcome coverage
---------------------------------------------------------------------------- -/

theorem downstream_domain_outcome_coverage
    {ObjectBurden DomainBurden : Type u}
    (w : World ObjectBurden DomainBurden) :
    DomainOutcomeNegative w
    ∨ DomainBurdenOpen w
    ∨ DomainBurdensClosed w := by
  classical
  by_cases hNeg :
      DomainOutcomeNegative w
  · exact Or.inl hNeg
  · right
    by_cases hOpen :
        DomainBurdenOpen w
    · exact Or.inl hOpen
    · right
      intro d hRequired
      by_cases hDischarged :
          w.domainState d = Disposition.discharged
      · exact hDischarged
      · rcases
          disposition_not_discharged_cases
            (w.domainState d)
            hDischarged
        with hViolated | hOpenState
        · exfalso
          exact
            hNeg
              ⟨d, hRequired, hViolated⟩
        · exfalso
          exact
            hOpen
              ⟨d, hRequired, hOpenState⟩

/-! --------------------------------------------------------------------------
Finite public-contract witness worlds
---------------------------------------------------------------------------- -/

inductive DemoObjectBurden where
  | preservation
deriving DecidableEq, Repr

inductive DemoDomainBurden where
  | entry
  | empirical
deriving DecidableEq, Repr

def demoCoreDischarged :
    CoreBurden -> Disposition :=
  fun _ => Disposition.discharged

def demoScopeFailed :
    CoreBurden -> Disposition
  | .scopePin => Disposition.violated
  | _ => Disposition.discharged

def demoEvidence
    {B : Type u} :
    B -> Disposition -> Prop :=
  fun _ _ => True

def demoObjectRequired :
    DemoObjectBurden -> Prop :=
  fun _ => True

def demoDomainEntryRequired :
    DemoDomainBurden -> Prop
  | .entry => True
  | .empirical => False

def demoDomainDownstreamRequired :
    DemoDomainBurden -> Prop
  | .entry => False
  | .empirical => True

theorem demoDomainRolesDisjoint :
    ∀ b : DemoDomainBurden,
      ¬ (
        demoDomainEntryRequired b
        ∧ demoDomainDownstreamRequired b
      ) := by
  intro b
  cases b <;> simp
    [demoDomainEntryRequired,
     demoDomainDownstreamRequired]

def cleanDomainState :
    DemoDomainBurden -> Disposition :=
  fun _ => Disposition.discharged

def openDownstreamDomainState :
    DemoDomainBurden -> Disposition
  | .entry => Disposition.discharged
  | .empirical => Disposition.open

def negativeDownstreamDomainState :
    DemoDomainBurden -> Disposition
  | .entry => Disposition.discharged
  | .empirical => Disposition.violated

def openObjectState :
    DemoObjectBurden -> Disposition :=
  fun _ => Disposition.open

def dischargedObjectState :
    DemoObjectBurden -> Disposition :=
  fun _ => Disposition.discharged

def cleanWorld :
    World DemoObjectBurden DemoDomainBurden where
  coreState := demoCoreDischarged
  coreEvidence := demoEvidence
  coreWarrant := by intro b; trivial
  objectRequired := demoObjectRequired
  objectState := dischargedObjectState
  objectEvidence := demoEvidence
  objectWarrant := by intro b hRequired; trivial
  domainEntryRequired := demoDomainEntryRequired
  domainDownstreamRequired := demoDomainDownstreamRequired
  domainRoleDisjoint := demoDomainRolesDisjoint
  domainState := cleanDomainState
  domainEvidence := demoEvidence
  domainWarrant := by intro b hRequired; trivial

def domainOpenWorld :
    World DemoObjectBurden DemoDomainBurden :=
  { cleanWorld with
      domainState := openDownstreamDomainState }

def domainNegativeWorld :
    World DemoObjectBurden DemoDomainBurden :=
  { cleanWorld with
      domainState := negativeDownstreamDomainState }

def scopeFailWorld :
    World DemoObjectBurden DemoDomainBurden :=
  { cleanWorld with
      coreState := demoScopeFailed }

def objectOpenWorld :
    World DemoObjectBurden DemoDomainBurden :=
  { cleanWorld with
      objectState := openObjectState }

theorem cleanWorld_gatingPass :
    GatingPass cleanWorld := by
  refine ⟨?_, ?_, ?_⟩
  · intro c
    rfl
  · intro o _hRequired
    rfl
  · intro d hRequired
    cases d with
    | entry => rfl
    | empirical =>
        change demoDomainEntryRequired DemoDomainBurden.empirical at hRequired
        simp [demoDomainEntryRequired] at hRequired

theorem cleanWorld_structuralConforms :
    StructuralConforms cleanWorld :=
  cleanWorld_gatingPass

theorem cleanWorld_domainClosed :
    DomainBurdensClosed cleanWorld := by
  intro d hRequired
  cases d with
  | entry =>
      change demoDomainDownstreamRequired DemoDomainBurden.entry at hRequired
      simp [demoDomainDownstreamRequired] at hRequired
  | empirical => rfl

theorem domainOpenWorld_structuralConforms :
    StructuralConforms domainOpenWorld := by
  refine ⟨?_, ?_, ?_⟩
  · intro c
    rfl
  · intro o _hRequired
    rfl
  · intro d hRequired
    cases d with
    | entry => rfl
    | empirical =>
        change demoDomainEntryRequired DemoDomainBurden.empirical at hRequired
        simp [demoDomainEntryRequired] at hRequired

theorem domainOpenWorld_domainOpen :
    DomainBurdenOpen domainOpenWorld := by
  exact
    ⟨DemoDomainBurden.empirical,
     by simp
       [domainOpenWorld,
        cleanWorld,
        demoDomainDownstreamRequired],
     by simp
       [domainOpenWorld,
        cleanWorld,
        openDownstreamDomainState]⟩

theorem domainNegativeWorld_structuralConforms :
    StructuralConforms domainNegativeWorld := by
  refine ⟨?_, ?_, ?_⟩
  · intro c
    rfl
  · intro o _hRequired
    rfl
  · intro d hRequired
    cases d with
    | entry => rfl
    | empirical =>
        change demoDomainEntryRequired DemoDomainBurden.empirical at hRequired
        simp [demoDomainEntryRequired] at hRequired

theorem domainNegativeWorld_negative :
    DomainOutcomeNegative domainNegativeWorld := by
  exact
    ⟨DemoDomainBurden.empirical,
     by simp
       [domainNegativeWorld,
        cleanWorld,
        demoDomainDownstreamRequired],
     by simp
       [domainNegativeWorld,
        cleanWorld,
        negativeDownstreamDomainState]⟩

theorem scopeFailWorld_noTranslation :
    NoLawfulTranslation scopeFailWorld := by
  exact
    ⟨KnownFailure.core
      CoreBurden.scopePin
      (by simp [scopeFailWorld, demoScopeFailed])⟩

theorem objectOpenWorld_no_known_failure :
    ¬ Nonempty (KnownFailure objectOpenWorld) := by
  intro h
  rcases h with ⟨hFail⟩
  cases hFail with
  | core burden hFailed =>
      cases burden <;>
        simp
          [objectOpenWorld,
           cleanWorld,
           demoCoreDischarged]
          at hFailed
  | object burden hRequired hFailed =>
      cases burden <;>
        simp
          [objectOpenWorld,
           openObjectState]
          at hFailed
  | domainEntry burden hRequired hFailed =>
      cases burden <;>
        simp
          [objectOpenWorld,
           cleanWorld,
           demoDomainEntryRequired,
           cleanDomainState]
          at hRequired hFailed

theorem objectOpenWorld_has_known_open :
    Nonempty (KnownOpen objectOpenWorld) := by
  exact
    ⟨KnownOpen.object
      DemoObjectBurden.preservation
      (by simp
        [objectOpenWorld,
         cleanWorld,
         demoObjectRequired])
      (by simp
        [objectOpenWorld,
         openObjectState])⟩

theorem objectOpenWorld_notYet :
    NotYetAdjudicable objectOpenWorld := by
  exact
    ⟨objectOpenWorld_no_known_failure,
     objectOpenWorld_has_known_open⟩

theorem universal_contract_public_checkpoint :
    (
      StructuralConforms cleanWorld
      ∧ DomainBurdensClosed cleanWorld
    )
    ∧
    (
      StructuralConforms domainOpenWorld
      ∧ DomainBurdenOpen domainOpenWorld
    )
    ∧
    (
      StructuralConforms domainNegativeWorld
      ∧ DomainOutcomeNegative domainNegativeWorld
    )
    ∧
    NoLawfulTranslation scopeFailWorld
    ∧
    NotYetAdjudicable objectOpenWorld := by
  exact
    ⟨⟨cleanWorld_structuralConforms,
       cleanWorld_domainClosed⟩,
     ⟨domainOpenWorld_structuralConforms,
       domainOpenWorld_domainOpen⟩,
     ⟨domainNegativeWorld_structuralConforms,
       domainNegativeWorld_negative⟩,
     scopeFailWorld_noTranslation,
     objectOpenWorld_notYet⟩

end UniversalTranslationContract
end StructuralFlow

/-!
===============================================================================
PUBLIC CROSS-DOMAIN TRANSLATION COMPOSITION — PUBLIC THEOREM MODULE
===============================================================================
Historical derivation line: public extraction v0.1.
-/

namespace StructuralFlow
namespace UniversalTranslationComposition

open StructuralFlow.UniversalTranslationContract

universe u

theorem structuralConforms_sourceCarrierPinned
    {ObjectBurden DomainBurden : Type u}
    {w : World ObjectBurden DomainBurden}
    (h : StructuralConforms w) :
    w.coreState CoreBurden.sourceCarrierPin
      = Disposition.discharged := by
  exact h.1 CoreBurden.sourceCarrierPin

/-! --------------------------------------------------------------------------
Heterogeneous sovereign seats
---------------------------------------------------------------------------- -/

structure SeatSystem (Seat : Type u) where
  objectBurden :
    Seat -> Type u
  domainBurden :
    Seat -> Type u
  world :
    (s : Seat) ->
      World
        (objectBurden s)
        (domainBurden s)

def SoloConforms
    {Seat : Type u}
    (seats : SeatSystem Seat)
    (s : Seat) : Prop :=
  StructuralConforms (seats.world s)

/-! --------------------------------------------------------------------------
Composition-specific universal bridge burdens
---------------------------------------------------------------------------- -/

/--
These are the five burdens added by composition after the ordinary universal
translation contract is applied to the bridge itself.

Bridge relation pin, non-circularity, identity firewall, level pin, scope pin,
and structural preservation remain inherited CoreBurden obligations rather than
additional bridge-specific universal burdens.
-/
inductive FixedBridgeBurden where
  | commonTargetAlignment
  | endpointSeatBinding
  | directionPin
  | independentAdmission
  | transferFirewall
deriving DecidableEq, Repr

inductive BridgeObjectBurden
    (Specific : Type u) : Type u where
  | fixed :
      FixedBridgeBurden ->
      BridgeObjectBurden Specific
  | specific :
      Specific ->
      BridgeObjectBurden Specific
deriving Repr

/-! --------------------------------------------------------------------------
Directed bridge systems
---------------------------------------------------------------------------- -/

structure BridgeSystem
    (Seat Bridge : Type u) where
  source :
    Bridge -> Seat
  target :
    Bridge -> Seat
  specificObjectBurden :
    Bridge -> Type u
  specificObjectRequired :
    (b : Bridge) ->
      specificObjectBurden b ->
      Prop
  domainBurden :
    Bridge -> Type u
  world :
    (b : Bridge) ->
      World
        (BridgeObjectBurden (specificObjectBurden b))
        (domainBurden b)
  allFixedBurdensRequired :
    ∀ b burden,
      (world b).objectRequired
        (BridgeObjectBurden.fixed burden)
  specificRegistration :
    ∀ b burden,
      (world b).objectRequired
        (BridgeObjectBurden.specific burden)
      ↔ specificObjectRequired b burden

/-! --------------------------------------------------------------------------
Cross-domain conformance
---------------------------------------------------------------------------- -/

def CrossDomainConforms
    {Seat Bridge : Type u}
    (seats : SeatSystem Seat)
    (bridges : BridgeSystem Seat Bridge)
    (b : Bridge) : Prop :=
  StructuralConforms
      (seats.world (bridges.source b))
  ∧
  StructuralConforms
      (seats.world (bridges.target b))
  ∧
  StructuralConforms
      (bridges.world b)

theorem crossDomain_source_survives
    {Seat Bridge : Type u}
    {seats : SeatSystem Seat}
    {bridges : BridgeSystem Seat Bridge}
    {b : Bridge}
    (h : CrossDomainConforms seats bridges b) :
    StructuralConforms
      (seats.world (bridges.source b)) :=
  h.1

theorem crossDomain_target_survives
    {Seat Bridge : Type u}
    {seats : SeatSystem Seat}
    {bridges : BridgeSystem Seat Bridge}
    {b : Bridge}
    (h : CrossDomainConforms seats bridges b) :
    StructuralConforms
      (seats.world (bridges.target b)) :=
  h.2.1

theorem crossDomain_bridge_conforms
    {Seat Bridge : Type u}
    {seats : SeatSystem Seat}
    {bridges : BridgeSystem Seat Bridge}
    {b : Bridge}
    (h : CrossDomainConforms seats bridges b) :
    StructuralConforms
      (bridges.world b) :=
  h.2.2

theorem bridgeConforms_all_fixed_burdens_discharged
    {Seat Bridge : Type u}
    {bridges : BridgeSystem Seat Bridge}
    {b : Bridge}
    (h : StructuralConforms (bridges.world b))
    (burden : FixedBridgeBurden) :
    (bridges.world b).objectState
        (BridgeObjectBurden.fixed burden)
      = Disposition.discharged := by
  exact
    h.2.1
      (BridgeObjectBurden.fixed burden)
      (bridges.allFixedBurdensRequired b burden)

theorem bridgeConforms_required_specific_burden_discharged
    {Seat Bridge : Type u}
    {bridges : BridgeSystem Seat Bridge}
    {b : Bridge}
    (h : StructuralConforms (bridges.world b))
    (burden : bridges.specificObjectBurden b)
    (hRequired :
      bridges.specificObjectRequired b burden) :
    (bridges.world b).objectState
        (BridgeObjectBurden.specific burden)
      = Disposition.discharged := by
  exact
    h.2.1
      (BridgeObjectBurden.specific burden)
      ((bridges.specificRegistration b burden).2 hRequired)

/-! --------------------------------------------------------------------------
Located public outcomes
---------------------------------------------------------------------------- -/

inductive LocatedNoLawfulTranslation
    {Seat Bridge : Type u}
    (seats : SeatSystem Seat)
    (bridges : BridgeSystem Seat Bridge) where
  | seat
      (s : Seat)
      (certificate :
        NoLawfulTranslation
          (seats.world s))
  | bridge
      (b : Bridge)
      (certificate :
        NoLawfulTranslation
          (bridges.world b))

inductive LocatedNotYetAdjudicable
    {Seat Bridge : Type u}
    (seats : SeatSystem Seat)
    (bridges : BridgeSystem Seat Bridge) where
  | seat
      (s : Seat)
      (certificate :
        NotYetAdjudicable
          (seats.world s))
  | bridge
      (b : Bridge)
      (certificate :
        NotYetAdjudicable
          (bridges.world b))

/-! --------------------------------------------------------------------------
Finite bridge witnesses
---------------------------------------------------------------------------- -/

inductive DemoBridgeSpecificBurden where
  | objectFidelity
deriving DecidableEq, Repr

def bridgeObjectRequired :
    BridgeObjectBurden DemoBridgeSpecificBurden -> Prop
  | .fixed _ => True
  | .specific DemoBridgeSpecificBurden.objectFidelity => False

def bridgeObjectRequiredWithSpecific :
    BridgeObjectBurden DemoBridgeSpecificBurden -> Prop
  | .fixed _ => True
  | .specific DemoBridgeSpecificBurden.objectFidelity => True

def bridgeObjectDischarged :
    BridgeObjectBurden DemoBridgeSpecificBurden -> Disposition :=
  fun _ => Disposition.discharged

def fixedBridgeFailureState
    (failed : FixedBridgeBurden) :
    BridgeObjectBurden DemoBridgeSpecificBurden -> Disposition
  | .fixed burden =>
      if burden = failed
      then Disposition.violated
      else Disposition.discharged
  | .specific _ => Disposition.discharged

def fixedBridgeOpenState
    (opened : FixedBridgeBurden) :
    BridgeObjectBurden DemoBridgeSpecificBurden -> Disposition
  | .fixed burden =>
      if burden = opened
      then Disposition.open
      else Disposition.discharged
  | .specific _ => Disposition.discharged

def specificBridgeFailureState :
    BridgeObjectBurden DemoBridgeSpecificBurden -> Disposition
  | .fixed _ => Disposition.discharged
  | .specific DemoBridgeSpecificBurden.objectFidelity =>
      Disposition.violated

def emptyRequired :
    Empty -> Prop :=
  fun e => nomatch e

def emptyState :
    Empty -> Disposition :=
  fun e => nomatch e

def emptyEvidence :
    Empty -> Disposition -> Prop :=
  fun e => nomatch e

def bridgeCleanWorld :
    World
      (BridgeObjectBurden DemoBridgeSpecificBurden)
      Empty where
  coreState := demoCoreDischarged
  coreEvidence := demoEvidence
  coreWarrant := by intro b; trivial
  objectRequired := bridgeObjectRequired
  objectState := bridgeObjectDischarged
  objectEvidence := demoEvidence
  objectWarrant := by intro b hRequired; trivial
  domainEntryRequired := emptyRequired
  domainDownstreamRequired := emptyRequired
  domainRoleDisjoint := by intro d; cases d
  domainState := emptyState
  domainEvidence := emptyEvidence
  domainWarrant := by intro d hRequired; cases d

def bridgeFixedFailureWorld
    (failed : FixedBridgeBurden) :
    World
      (BridgeObjectBurden DemoBridgeSpecificBurden)
      Empty :=
  { bridgeCleanWorld with
      objectState := fixedBridgeFailureState failed }

def bridgeFixedOpenWorld
    (opened : FixedBridgeBurden) :
    World
      (BridgeObjectBurden DemoBridgeSpecificBurden)
      Empty :=
  { bridgeCleanWorld with
      objectState := fixedBridgeOpenState opened }

def bridgeSpecificFailureWorld :
    World
      (BridgeObjectBurden DemoBridgeSpecificBurden)
      Empty where
  coreState := demoCoreDischarged
  coreEvidence := demoEvidence
  coreWarrant := by intro b; trivial
  objectRequired := bridgeObjectRequiredWithSpecific
  objectState := specificBridgeFailureState
  objectEvidence := demoEvidence
  objectWarrant := by intro b hRequired; trivial
  domainEntryRequired := emptyRequired
  domainDownstreamRequired := emptyRequired
  domainRoleDisjoint := by intro d; cases d
  domainState := emptyState
  domainEvidence := emptyEvidence
  domainWarrant := by intro d hRequired; cases d

theorem bridgeClean_conforms :
    StructuralConforms bridgeCleanWorld := by
  refine ⟨?_, ?_, ?_⟩
  · intro c
    rfl
  · intro o hRequired
    cases o with
    | fixed burden => rfl
    | specific burden =>
        cases burden
        simp [bridgeCleanWorld, bridgeObjectRequired] at hRequired
  · intro d hRequired
    cases d

theorem fixedFailure_noTranslation
    (failed : FixedBridgeBurden) :
    NoLawfulTranslation
      (bridgeFixedFailureWorld failed) := by
  exact
    ⟨KnownFailure.object
      (BridgeObjectBurden.fixed failed)
      (by simp
        [bridgeFixedFailureWorld,
         bridgeCleanWorld,
         bridgeObjectRequired])
      (by simp
        [bridgeFixedFailureWorld,
         fixedBridgeFailureState])⟩

theorem fixedOpen_no_known_failure
    (opened : FixedBridgeBurden) :
    ¬ Nonempty
      (KnownFailure
        (bridgeFixedOpenWorld opened)) := by
  intro h
  rcases h with ⟨hFail⟩
  cases hFail with
  | core burden hFailed =>
      cases burden <;>
        simp
          [bridgeFixedOpenWorld,
           bridgeCleanWorld,
           demoCoreDischarged]
          at hFailed
  | object burden hRequired hFailed =>
      cases burden with
      | fixed burden =>
          by_cases hEq : burden = opened
          · subst hEq
            simp
              [bridgeFixedOpenWorld,
               fixedBridgeOpenState]
              at hFailed
          · simp
              [bridgeFixedOpenWorld,
               fixedBridgeOpenState,
               hEq]
              at hFailed
      | specific burden =>
          cases burden
          simp
            [bridgeFixedOpenWorld,
             bridgeCleanWorld,
             bridgeObjectRequired]
            at hRequired
  | domainEntry burden hRequired hFailed =>
      cases burden

theorem fixedOpen_has_known_open
    (opened : FixedBridgeBurden) :
    Nonempty
      (KnownOpen
        (bridgeFixedOpenWorld opened)) := by
  exact
    ⟨KnownOpen.object
      (BridgeObjectBurden.fixed opened)
      (by simp
        [bridgeFixedOpenWorld,
         bridgeCleanWorld,
         bridgeObjectRequired])
      (by simp
        [bridgeFixedOpenWorld,
         fixedBridgeOpenState])⟩

theorem fixedOpen_notYet
    (opened : FixedBridgeBurden) :
    NotYetAdjudicable
      (bridgeFixedOpenWorld opened) := by
  exact
    ⟨fixedOpen_no_known_failure opened,
     fixedOpen_has_known_open opened⟩

theorem bridgeSpecificFailure_noTranslation :
    NoLawfulTranslation bridgeSpecificFailureWorld := by
  exact
    ⟨KnownFailure.object
      (BridgeObjectBurden.specific
        DemoBridgeSpecificBurden.objectFidelity)
      (by simp
        [bridgeSpecificFailureWorld,
         bridgeObjectRequiredWithSpecific])
      (by simp
        [bridgeSpecificFailureWorld,
         specificBridgeFailureState])⟩

/-! --------------------------------------------------------------------------
Demo seats / bridges
---------------------------------------------------------------------------- -/

inductive DemoSeat where
  | a
  | b
  | c
deriving DecidableEq, Repr

inductive DemoBridge where
  | ab
  | ba
  | abAlt
deriving DecidableEq, Repr

def cleanSeatSystem :
    SeatSystem DemoSeat where
  objectBurden := fun _ => DemoObjectBurden
  domainBurden := fun _ => DemoDomainBurden
  world := fun _ => cleanWorld

def bOpenSeatSystem :
    SeatSystem DemoSeat where
  objectBurden := fun _ => DemoObjectBurden
  domainBurden := fun _ => DemoDomainBurden
  world
    | .a => cleanWorld
    | .b => objectOpenWorld
    | .c => cleanWorld

def aFailSeatSystem :
    SeatSystem DemoSeat where
  objectBurden := fun _ => DemoObjectBurden
  domainBurden := fun _ => DemoDomainBurden
  world
    | .a => scopeFailWorld
    | .b => cleanWorld
    | .c => cleanWorld

def demoBridgeSource :
    DemoBridge -> DemoSeat
  | .ab => .a
  | .ba => .b
  | .abAlt => .a

def demoBridgeTarget :
    DemoBridge -> DemoSeat
  | .ab => .b
  | .ba => .a
  | .abAlt => .b

def noSpecificRequired :
    DemoBridgeSpecificBurden -> Prop :=
  fun _ => False

def specificRequired :
    DemoBridgeSpecificBurden -> Prop :=
  fun _ => True

def cleanBridgeSystem :
    BridgeSystem DemoSeat DemoBridge where
  source := demoBridgeSource
  target := demoBridgeTarget
  specificObjectBurden := fun _ => DemoBridgeSpecificBurden
  specificObjectRequired := fun _ => noSpecificRequired
  domainBurden := fun _ => Empty
  world := fun _ => bridgeCleanWorld
  allFixedBurdensRequired := by intro b burden; trivial
  specificRegistration := by
    intro b burden
    cases burden <;> rfl

def fixedFailureABBridgeSystem
    (failed : FixedBridgeBurden) :
    BridgeSystem DemoSeat DemoBridge where
  source := demoBridgeSource
  target := demoBridgeTarget
  specificObjectBurden := fun _ => DemoBridgeSpecificBurden
  specificObjectRequired := fun _ => noSpecificRequired
  domainBurden := fun _ => Empty
  world
    | .ab => bridgeFixedFailureWorld failed
    | .ba => bridgeCleanWorld
    | .abAlt => bridgeCleanWorld
  allFixedBurdensRequired := by intro b burden; cases b <;> trivial
  specificRegistration := by
    intro b burden
    cases b <;> cases burden <;> rfl

def openABBridgeSystem
    (opened : FixedBridgeBurden) :
    BridgeSystem DemoSeat DemoBridge where
  source := demoBridgeSource
  target := demoBridgeTarget
  specificObjectBurden := fun _ => DemoBridgeSpecificBurden
  specificObjectRequired := fun _ => noSpecificRequired
  domainBurden := fun _ => Empty
  world
    | .ab => bridgeFixedOpenWorld opened
    | .ba => bridgeCleanWorld
    | .abAlt => bridgeCleanWorld
  allFixedBurdensRequired := by intro b burden; cases b <;> trivial
  specificRegistration := by
    intro b burden
    cases b <;> cases burden <;> rfl

def forwardOnlyBridgeSystem :
    BridgeSystem DemoSeat DemoBridge where
  source := demoBridgeSource
  target := demoBridgeTarget
  specificObjectBurden := fun _ => DemoBridgeSpecificBurden
  specificObjectRequired := fun _ => noSpecificRequired
  domainBurden := fun _ => Empty
  world
    | .ab => bridgeCleanWorld
    | .ba => bridgeFixedFailureWorld FixedBridgeBurden.directionPin
    | .abAlt => bridgeCleanWorld
  allFixedBurdensRequired := by intro b burden; cases b <;> trivial
  specificRegistration := by
    intro b burden
    cases b <;> cases burden <;> rfl

def specificFailureABBridgeSystem :
    BridgeSystem DemoSeat DemoBridge where
  source := demoBridgeSource
  target := demoBridgeTarget
  specificObjectBurden := fun _ => DemoBridgeSpecificBurden
  specificObjectRequired
    | .ab => specificRequired
    | .ba => noSpecificRequired
    | .abAlt => noSpecificRequired
  domainBurden := fun _ => Empty
  world
    | .ab => bridgeSpecificFailureWorld
    | .ba => bridgeCleanWorld
    | .abAlt => bridgeCleanWorld
  allFixedBurdensRequired := by intro b burden; cases b <;> trivial
  specificRegistration := by
    intro b burden
    cases b <;> cases burden <;> rfl

/-! --------------------------------------------------------------------------
Public composition witnesses
---------------------------------------------------------------------------- -/

theorem solo_clean_conforms :
    SoloConforms cleanSeatSystem DemoSeat.a := by
  exact cleanWorld_structuralConforms

theorem solo_open_does_not_conform :
    ¬ SoloConforms bOpenSeatSystem DemoSeat.b := by
  exact
    notYet_not_structuralConforms
      objectOpenWorld_notYet

theorem clean_AB_cross_conforms :
    CrossDomainConforms
      cleanSeatSystem
      cleanBridgeSystem
      DemoBridge.ab := by
  exact
    ⟨cleanWorld_structuralConforms,
     cleanWorld_structuralConforms,
     bridgeClean_conforms⟩

theorem clean_AB_all_fixed_bridge_burdens_discharged :
    ∀ burden : FixedBridgeBurden,
      (cleanBridgeSystem.world DemoBridge.ab).objectState
        (BridgeObjectBurden.fixed burden)
      = Disposition.discharged := by
  intro burden
  exact
    bridgeConforms_all_fixed_burdens_discharged
      clean_AB_cross_conforms.2.2
      burden

theorem commonTargetMismatch_preserves_both_local_successes :
    StructuralConforms
      (cleanSeatSystem.world DemoSeat.a)
    ∧
    StructuralConforms
      (cleanSeatSystem.world DemoSeat.b)
    ∧
    NoLawfulTranslation
      ((fixedFailureABBridgeSystem
        FixedBridgeBurden.commonTargetAlignment).world DemoBridge.ab)
    ∧
    ¬ CrossDomainConforms
      cleanSeatSystem
      (fixedFailureABBridgeSystem
        FixedBridgeBurden.commonTargetAlignment)
      DemoBridge.ab := by
  refine
    ⟨cleanWorld_structuralConforms,
     cleanWorld_structuralConforms,
     fixedFailure_noTranslation
       FixedBridgeBurden.commonTargetAlignment,
     ?_⟩
  intro hCross
  exact
    (noLawfulTranslation_not_structuralConforms
      (fixedFailure_noTranslation
        FixedBridgeBurden.commonTargetAlignment))
      hCross.2.2

theorem wrongSeatBinding_preserves_both_local_successes :
    StructuralConforms
      (cleanSeatSystem.world DemoSeat.a)
    ∧
    StructuralConforms
      (cleanSeatSystem.world DemoSeat.b)
    ∧
    NoLawfulTranslation
      ((fixedFailureABBridgeSystem
        FixedBridgeBurden.endpointSeatBinding).world DemoBridge.ab)
    ∧
    ¬ CrossDomainConforms
      cleanSeatSystem
      (fixedFailureABBridgeSystem
        FixedBridgeBurden.endpointSeatBinding)
      DemoBridge.ab := by
  refine
    ⟨cleanWorld_structuralConforms,
     cleanWorld_structuralConforms,
     fixedFailure_noTranslation
       FixedBridgeBurden.endpointSeatBinding,
     ?_⟩
  intro hCross
  exact
    (noLawfulTranslation_not_structuralConforms
      (fixedFailure_noTranslation
        FixedBridgeBurden.endpointSeatBinding))
      hCross.2.2

theorem circularAdmission_preserves_both_local_successes :
    StructuralConforms
      (cleanSeatSystem.world DemoSeat.a)
    ∧
    StructuralConforms
      (cleanSeatSystem.world DemoSeat.b)
    ∧
    NoLawfulTranslation
      ((fixedFailureABBridgeSystem
        FixedBridgeBurden.independentAdmission).world DemoBridge.ab)
    ∧
    ¬ CrossDomainConforms
      cleanSeatSystem
      (fixedFailureABBridgeSystem
        FixedBridgeBurden.independentAdmission)
      DemoBridge.ab := by
  refine
    ⟨cleanWorld_structuralConforms,
     cleanWorld_structuralConforms,
     fixedFailure_noTranslation
       FixedBridgeBurden.independentAdmission,
     ?_⟩
  intro hCross
  exact
    (noLawfulTranslation_not_structuralConforms
      (fixedFailure_noTranslation
        FixedBridgeBurden.independentAdmission))
      hCross.2.2

theorem objectSpecificBridgeBurden_can_block_bridge :
    StructuralConforms
      (cleanSeatSystem.world DemoSeat.a)
    ∧
    StructuralConforms
      (cleanSeatSystem.world DemoSeat.b)
    ∧
    NoLawfulTranslation
      (specificFailureABBridgeSystem.world DemoBridge.ab)
    ∧
    ¬ CrossDomainConforms
      cleanSeatSystem
      specificFailureABBridgeSystem
      DemoBridge.ab := by
  refine
    ⟨cleanWorld_structuralConforms,
     cleanWorld_structuralConforms,
     bridgeSpecificFailure_noTranslation,
     ?_⟩
  intro hCross
  exact
    (noLawfulTranslation_not_structuralConforms
      bridgeSpecificFailure_noTranslation)
      hCross.2.2

theorem side_B_open_preserves_A :
    StructuralConforms
      (bOpenSeatSystem.world DemoSeat.a)
    ∧
    NotYetAdjudicable
      (bOpenSeatSystem.world DemoSeat.b)
    ∧
    ¬ CrossDomainConforms
      bOpenSeatSystem
      cleanBridgeSystem
      DemoBridge.ab := by
  refine
    ⟨cleanWorld_structuralConforms,
     objectOpenWorld_notYet,
     ?_⟩
  intro hCross
  exact
    (notYet_not_structuralConforms
      objectOpenWorld_notYet)
      hCross.2.1

theorem bridge_open_preserves_both_local_successes :
    StructuralConforms
      (cleanSeatSystem.world DemoSeat.a)
    ∧
    StructuralConforms
      (cleanSeatSystem.world DemoSeat.b)
    ∧
    NotYetAdjudicable
      ((openABBridgeSystem
        FixedBridgeBurden.transferFirewall).world DemoBridge.ab)
    ∧
    ¬ CrossDomainConforms
      cleanSeatSystem
      (openABBridgeSystem
        FixedBridgeBurden.transferFirewall)
      DemoBridge.ab := by
  refine
    ⟨cleanWorld_structuralConforms,
     cleanWorld_structuralConforms,
     fixedOpen_notYet FixedBridgeBurden.transferFirewall,
     ?_⟩
  intro hCross
  exact
    (notYet_not_structuralConforms
      (fixedOpen_notYet
        FixedBridgeBurden.transferFirewall))
      hCross.2.2

theorem side_A_failure_preserves_B :
    NoLawfulTranslation
      (aFailSeatSystem.world DemoSeat.a)
    ∧
    StructuralConforms
      (aFailSeatSystem.world DemoSeat.b)
    ∧
    ¬ CrossDomainConforms
      aFailSeatSystem
      cleanBridgeSystem
      DemoBridge.ab := by
  refine
    ⟨scopeFailWorld_noTranslation,
     cleanWorld_structuralConforms,
     ?_⟩
  intro hCross
  exact
    (noLawfulTranslation_not_structuralConforms
      scopeFailWorld_noTranslation)
      hCross.1

theorem forward_can_conform_while_reverse_fails :
    CrossDomainConforms
      cleanSeatSystem
      forwardOnlyBridgeSystem
      DemoBridge.ab
    ∧
    NoLawfulTranslation
      (forwardOnlyBridgeSystem.world DemoBridge.ba)
    ∧
    ¬ CrossDomainConforms
      cleanSeatSystem
      forwardOnlyBridgeSystem
      DemoBridge.ba := by
  refine
    ⟨?_,
     fixedFailure_noTranslation
       FixedBridgeBurden.directionPin,
     ?_⟩
  · exact
      ⟨cleanWorld_structuralConforms,
       cleanWorld_structuralConforms,
       bridgeClean_conforms⟩
  · intro hReverse
    exact
      (noLawfulTranslation_not_structuralConforms
        (fixedFailure_noTranslation
          FixedBridgeBurden.directionPin))
        hReverse.2.2

def demoMechanism :
    DemoSeat -> Prop
  | .a => True
  | .b => False
  | .c => True

def demoSurplusProperty :
    DemoSeat -> Prop
  | .a => True
  | .b => False
  | .c => False

theorem bridge_conformance_does_not_force_mechanism_transfer :
    CrossDomainConforms
      cleanSeatSystem
      cleanBridgeSystem
      DemoBridge.ab
    ∧ demoMechanism DemoSeat.a
    ∧ ¬ demoMechanism DemoSeat.b := by
  exact
    ⟨clean_AB_cross_conforms,
     trivial,
     by simp [demoMechanism]⟩

theorem bridge_conformance_does_not_force_surplus_transfer :
    CrossDomainConforms
      cleanSeatSystem
      cleanBridgeSystem
      DemoBridge.ab
    ∧ demoSurplusProperty DemoSeat.a
    ∧ ¬ demoSurplusProperty DemoSeat.b := by
  exact
    ⟨clean_AB_cross_conforms,
     trivial,
     by simp [demoSurplusProperty]⟩

theorem multiple_distinct_bridges_may_both_conform :
    DemoBridge.ab ≠ DemoBridge.abAlt
    ∧
    CrossDomainConforms
      cleanSeatSystem
      cleanBridgeSystem
      DemoBridge.ab
    ∧
    CrossDomainConforms
      cleanSeatSystem
      cleanBridgeSystem
      DemoBridge.abAlt := by
  exact
    ⟨by decide,
     clean_AB_cross_conforms,
     ⟨cleanWorld_structuralConforms,
      cleanWorld_structuralConforms,
      bridgeClean_conforms⟩⟩

def commonTargetFailureLocated :
    LocatedNoLawfulTranslation
      cleanSeatSystem
      (fixedFailureABBridgeSystem
        FixedBridgeBurden.commonTargetAlignment) :=
  LocatedNoLawfulTranslation.bridge
    DemoBridge.ab
    (fixedFailure_noTranslation
      FixedBridgeBurden.commonTargetAlignment)

def wrongSeatFailureLocated :
    LocatedNoLawfulTranslation
      cleanSeatSystem
      (fixedFailureABBridgeSystem
        FixedBridgeBurden.endpointSeatBinding) :=
  LocatedNoLawfulTranslation.bridge
    DemoBridge.ab
    (fixedFailure_noTranslation
      FixedBridgeBurden.endpointSeatBinding)

def bridgeOpenLocated :
    LocatedNotYetAdjudicable
      cleanSeatSystem
      (openABBridgeSystem
        FixedBridgeBurden.transferFirewall) :=
  LocatedNotYetAdjudicable.bridge
    DemoBridge.ab
    (fixedOpen_notYet
      FixedBridgeBurden.transferFirewall)

theorem multiSeat_contract_public_checkpoint :
    SoloConforms cleanSeatSystem DemoSeat.a
    ∧
    CrossDomainConforms
      cleanSeatSystem
      cleanBridgeSystem
      DemoBridge.ab
    ∧
    NoLawfulTranslation
      ((fixedFailureABBridgeSystem
        FixedBridgeBurden.commonTargetAlignment).world DemoBridge.ab)
    ∧
    NotYetAdjudicable
      ((openABBridgeSystem
        FixedBridgeBurden.transferFirewall).world DemoBridge.ab)
    ∧
    NoLawfulTranslation
      (forwardOnlyBridgeSystem.world DemoBridge.ba)
    ∧
    DemoBridge.ab ≠ DemoBridge.abAlt := by
  exact
    ⟨solo_clean_conforms,
     clean_AB_cross_conforms,
     fixedFailure_noTranslation
       FixedBridgeBurden.commonTargetAlignment,
     fixedOpen_notYet
       FixedBridgeBurden.transferFirewall,
     fixedFailure_noTranslation
       FixedBridgeBurden.directionPin,
     by decide⟩

end UniversalTranslationComposition
end StructuralFlow
