import canonicalLaneMathlib.AdmissibleClass
import CalculusVectorFunctionsCanonicalLaneLean.VectorFieldStructure

namespace HautevilleHouse
namespace CalculusVectorFunctionsCanonicalLaneLean

structure StokesTheoremPackage {M : Type u} [TopologicalSpace M] [ChartedSpace ℝ M] {V : VectorFieldPackage M} where
  differentialForm : Type v
  exteriorDerivative : Type w
  manifoldWithBoundary : Prop
  formDegree : Nat
  integralOverManifold : Prop
  integralOverBoundary : Prop
  stokesEquality : Prop

structure StokesTheoremEvidence {M : Type u} [TopologicalSpace M] [ChartedSpace ℝ M] {V : VectorFieldPackage M} (S : StokesTheoremPackage V) where
  differentialFormClosed : S.differentialForm
  exteriorDerivativeClosed : S.exteriorDerivative
  manifoldWithBoundaryClosed : S.manifoldWithBoundary
  integralOverManifoldClosed : S.integralOverManifold
  integralOverBoundaryClosed : S.integralOverBoundary
  stokesEqualityClosed : S.stokesEquality

def StokesTheoremClosed {M : Type u} [TopologicalSpace M] [ChartedSpace ℝ M] {V : VectorFieldPackage M} (S : StokesTheoremPackage V) : Prop :=
  S.differentialForm ∧ S.exteriorDerivative ∧ S.manifoldWithBoundary ∧ S.integralOverManifold ∧ S.integralOverBoundary ∧ S.stokesEquality

theorem stokes_theorem_closed_from_evidence {M : Type u} [TopologicalSpace M] [ChartedSpace ℝ M] {V : VectorFieldPackage M} (S : StokesTheoremPackage V) (E : StokesTheoremEvidence S) : StokesTheoremClosed S := by
  exact And.intro E.differentialFormClosed (And.intro E.exteriorDerivativeClosed (And.intro E.manifoldWithBoundaryClosed (And.intro E.integralOverManifoldClosed (And.intro E.integralOverBoundaryClosed E.stokesEqualityClosed))))

end CalculusVectorFunctionsCanonicalLaneLean
end HautevilleHouse