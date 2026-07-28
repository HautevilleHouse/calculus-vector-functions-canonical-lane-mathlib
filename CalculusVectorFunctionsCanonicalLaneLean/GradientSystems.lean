import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CalculusVectorFunctionsCanonicalLaneLean

structure VectorFieldObject where
  domain : Type
  codomain : Type
  field : domain → codomain
  differentiable : Prop
  gradient : domain → codomain
  gradientMatches : (∀ x, gradient x = derivative field x) -- placeholder

structure AdmissibleClass where
  object : VectorFieldObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def bridgeClosed (A : AdmissibleClass) : Prop :=
  A.object.differentiable ∧ A.object.gradientMatches

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A :=
  by
    exact And.intro A.object.differentiable A.object.gradientMatches

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A :=
  A.gateWitness

end CalculusVectorFunctionsCanonicalLaneLean
end HautevilleHouse