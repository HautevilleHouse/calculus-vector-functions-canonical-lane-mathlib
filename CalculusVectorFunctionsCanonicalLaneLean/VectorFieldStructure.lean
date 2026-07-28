import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CalculusVectorFunctionsCanonicalLaneLean

structure VectorFieldPackage (M : Type u) [TopologicalSpace M] [ChartedSpace ℝ M] where
  tangentBundle : Type v
  sectionType : Type w
  pointwiseVector : M → tangentBundle
  smoothness : Prop
  linearStructure : Prop
  lieBracket : Prop

structure VectorFieldEvidence {M : Type u} [TopologicalSpace M] [ChartedSpace ℝ M] (V : VectorFieldPackage M) where
  smoothnessClosed : V.smoothness
  linearStructureClosed : V.linearStructure
  lieBracketClosed : V.lieBracket

def VectorFieldClosed {M : Type u} [TopologicalSpace M] [ChartedSpace ℝ M] (V : VectorFieldPackage M) : Prop :=
  V.smoothness ∧ V.linearStructure ∧ V.lieBracket

theorem vector_field_closed_from_evidence {M : Type u} [TopologicalSpace M] [ChartedSpace ℝ M] (V : VectorFieldPackage M) (E : VectorFieldEvidence V) : VectorFieldClosed V := by
  exact And.intro E.smoothnessClosed (And.intro E.linearStructureClosed E.lieBracketClosed)

end CalculusVectorFunctionsCanonicalLaneLean
end HautevilleHouse