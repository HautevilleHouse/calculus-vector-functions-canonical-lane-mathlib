import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CalculusVectorFunctionsCanonicalLaneLean

structure VectorDerivativePackage (A : AdmissibleClass) where
  derivativeExists : Prop
  linearApproximation : Prop
  partialDerivativesExist : Prop
  chainRuleHolds : Prop

structure VectorDerivativeEvidence {A : AdmissibleClass} (D : VectorDerivativePackage A) where
  derivativeExistsClosed : D.derivativeExists
  linearApproximationClosed : D.linearApproximation
  partialDerivativesExistClosed : D.partialDerivativesExist
  chainRuleHoldsClosed : D.chainRuleHolds

def VectorDerivativeClosed {A : AdmissibleClass} (D : VectorDerivativePackage A) : Prop :=
  D.derivativeExists ∧ D.linearApproximation ∧ D.partialDerivativesExist ∧ D.chainRuleHolds

theorem vector_derivative_closed_from_evidence {A : AdmissibleClass}
    (D : VectorDerivativePackage A) (E : VectorDerivativeEvidence D) : VectorDerivativeClosed D := by
  exact And.intro E.derivativeExistsClosed
    (And.intro E.linearApproximationClosed
      (And.intro E.partialDerivativesExistClosed E.chainRuleHoldsClosed))

end CalculusVectorFunctionsCanonicalLaneLean
end HautevilleHouse