import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CalculusVectorFunctionsCanonicalLaneLean

structure VectorFieldPackage where
  manifold : Type u
  topology : TopologicalSpace manifold
  smoothStructure : Type v
  vectorField : manifold → Type w
  smoothComponent : Prop
  continuity : Prop

structure VectorFieldEvidence (V : VectorFieldPackage) where
  smoothComponentClosed : V.smoothComponent
  continuityClosed : V.continuity

def VectorFieldClosed (V : VectorFieldPackage) : Prop :=
  V.smoothComponent ∧ V.continuity

theorem vector_field_closed_from_evidence (V : VectorFieldPackage) (E : VectorFieldEvidence V) :
    VectorFieldClosed V := by
  exact And.intro E.smoothComponentClosed E.continuityClosed

end CalculusVectorFunctionsCanonicalLaneLean
end HautevilleHouse
