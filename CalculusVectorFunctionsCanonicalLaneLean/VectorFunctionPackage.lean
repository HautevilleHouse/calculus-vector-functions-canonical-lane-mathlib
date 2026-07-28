import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CalculusVectorFunctionsCanonicalLaneLean.VectorCalculusFoundation

namespace HautevilleHouse
namespace CalculusVectorFunctionsCanonicalLaneLean

structure VectorFunctionPackage (n : Nat) where
  domain : EuclideanSpace n → Prop
  range : EuclideanSpace n
  continuity : Prop
  differentiability : Prop
  partialDerivativesExist : Prop
  partialDerivativesContinuous : Prop

structure VectorFunctionEvidence (n : Nat) (P : VectorFunctionPackage n) where
  continuityClosed : P.continuity
  differentiabilityClosed : P.differentiability
  partialDerivativesExistClosed : P.partialDerivativesExist
  partialDerivativesContinuousClosed : P.partialDerivativesContinuous

def VectorFunctionClosed (n : Nat) (P : VectorFunctionPackage n) : Prop :=
  P.continuity ∧ P.differentiability ∧ P.partialDerivativesExist ∧ P.partialDerivativesContinuous

theorem vector_function_closed_from_evidence (n : Nat) (P : VectorFunctionPackage n) (E : VectorFunctionEvidence n P) :
  VectorFunctionClosed n P := by
  exact And.intro E.continuityClosed (And.intro E.differentiabilityClosed
    (And.intro E.partialDerivativesExistClosed E.partialDerivativesContinuousClosed))

end CalculusVectorFunctionsCanonicalLaneLean
end HautevilleHouse