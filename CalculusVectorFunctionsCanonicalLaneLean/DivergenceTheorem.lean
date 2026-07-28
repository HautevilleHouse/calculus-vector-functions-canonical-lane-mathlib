import canonicalLaneMathlib.AdmissibleClass
import CalculusVectorFunctionsCanonicalLaneLean.VectorFieldStructure

namespace HautevilleHouse
namespace CalculusVectorFunctionsCanonicalLaneLean

structure DivergenceTheoremPackage {M : Type u} [TopologicalSpace M] [ChartedSpace ℝ M] {V : VectorFieldPackage M} where
  manifoldWithBoundary : Prop
  vectorFieldSmooth : Prop
  divergenceDefined : Prop
  volumeForm : Type v
  boundaryOrientation : Prop
  divergenceIntegralEquality : Prop

structure DivergenceTheoremEvidence {M : Type u} [TopologicalSpace M] [ChartedSpace ℝ M] {V : VectorFieldPackage M} (D : DivergenceTheoremPackage V) where
  manifoldWithBoundaryClosed : D.manifoldWithBoundary
  vectorFieldSmoothClosed : D.vectorFieldSmooth
  divergenceDefinedClosed : D.divergenceDefined
  boundaryOrientationClosed : D.boundaryOrientation
  divergenceIntegralEqualityClosed : D.divergenceIntegralEquality

def DivergenceTheoremClosed {M : Type u} [TopologicalSpace M] [ChartedSpace ℝ M] {V : VectorFieldPackage M} (D : DivergenceTheoremPackage V) : Prop :=
  D.manifoldWithBoundary ∧ D.vectorFieldSmooth ∧ D.divergenceDefined ∧ D.boundaryOrientation ∧ D.divergenceIntegralEquality

theorem divergence_theorem_closed_from_evidence {M : Type u} [TopologicalSpace M] [ChartedSpace ℝ M] {V : VectorFieldPackage M} (D : DivergenceTheoremPackage V) (E : DivergenceTheoremEvidence D) : DivergenceTheoremClosed D := by
  exact And.intro E.manifoldWithBoundaryClosed (And.intro E.vectorFieldSmoothClosed (And.intro E.divergenceDefinedClosed (And.intro E.boundaryOrientationClosed E.divergenceIntegralEqualityClosed)))

end CalculusVectorFunctionsCanonicalLaneLean
end HautevilleHouse