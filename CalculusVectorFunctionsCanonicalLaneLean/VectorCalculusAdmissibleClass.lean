import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CalculusVectorFunctionsCanonicalLaneLean

structure VectorCalculusAdmittedObject where
  space : Type
  dimension : Nat
  vectorFunction : space → space
  scalarFunction : space → ℝ
  smooth : Prop
  conclusion : Prop

structure AdmissibleClass where
  object : VectorCalculusAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  (A.object.conclusion) ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CalculusVectorFunctionsCanonicalLaneLean
end HautevilleHouse