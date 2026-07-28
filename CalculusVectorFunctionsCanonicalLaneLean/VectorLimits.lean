import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CalculusVectorFunctionsCanonicalLaneLean

structure VectorLimitPackage (A : AdmissibleClass) where
  pointLimitDefined : Prop
  continuityAtPoint : Prop
  sequentialCharacterization : Prop

structure VectorLimitEvidence {A : AdmissibleClass} (V : VectorLimitPackage A) where
  pointLimitDefinedClosed : V.pointLimitDefined
  continuityAtPointClosed : V.continuityAtPoint
  sequentialCharacterizationClosed : V.sequentialCharacterization

def VectorLimitClosed {A : AdmissibleClass} (V : VectorLimitPackage A) : Prop :=
  V.pointLimitDefined ∧ V.continuityAtPoint ∧ V.sequentialCharacterization

theorem vector_limit_closed_from_evidence {A : AdmissibleClass}
    (V : VectorLimitPackage A) (E : VectorLimitEvidence V) : VectorLimitClosed V := by
  exact And.intro E.pointLimitDefinedClosed
    (And.intro E.continuityAtPointClosed E.sequentialCharacterizationClosed)

end CalculusVectorFunctionsCanonicalLaneLean
end HautevilleHouse