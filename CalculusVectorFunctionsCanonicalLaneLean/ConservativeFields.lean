import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CalculusVectorFunctionsCanonicalLaneLean

structure ConservativeFieldsPackage (A : AdmissibleClass) where
  gradientField : Prop
  pathIndependence : Prop
  potentialFunctionExists : Prop
  fundamentalTheoremHolds : Prop

structure ConservativeFieldsEvidence {A : AdmissibleClass} (C : ConservativeFieldsPackage A) where
  gradientFieldClosed : C.gradientField
  pathIndependenceClosed : C.pathIndependence
  potentialFunctionExistsClosed : C.potentialFunctionExists
  fundamentalTheoremHoldsClosed : C.fundamentalTheoremHolds

def ConservativeFieldsClosed {A : AdmissibleClass} (C : ConservativeFieldsPackage A) : Prop :=
  C.gradientField ∧ C.pathIndependence ∧ C.potentialFunctionExists ∧ C.fundamentalTheoremHolds

theorem conservative_fields_closed_from_evidence {A : AdmissibleClass}
    (C : ConservativeFieldsPackage A) (E : ConservativeFieldsEvidence C) : ConservativeFieldsClosed C := by
  exact And.intro E.gradientFieldClosed
    (And.intro E.pathIndependenceClosed
      (And.intro E.potentialFunctionExistsClosed E.fundamentalTheoremHoldsClosed))

end CalculusVectorFunctionsCanonicalLaneLean
end HautevilleHouse