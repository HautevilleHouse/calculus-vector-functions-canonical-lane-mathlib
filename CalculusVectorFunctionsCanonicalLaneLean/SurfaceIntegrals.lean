import canonicalLaneMathlib.AdmissibleClass
import CalculusVectorFunctionsCanonicalLaneLean.VectorFieldStructure

namespace HautevilleHouse
namespace CalculusVectorFunctionsCanonicalLaneLean

structure SurfaceIntegralPackage {M : Type u} [TopologicalSpace M] [ChartedSpace ℝ M] {V : VectorFieldPackage M} where
  surface : Type v
  surfaceManifold : TopologicalSpace surface
  parameterization : surface → M
  smoothParameterization : Prop
  integrand : M → ℝ
  surfaceIntegralDefined : Prop
  orientationDependence : Prop
  fluxInterpretation : Prop

structure SurfaceIntegralEvidence {M : Type u} [TopologicalSpace M] [ChartedSpace ℝ M] {V : VectorFieldPackage M} (S : SurfaceIntegralPackage V) where
  smoothParameterizationClosed : S.smoothParameterization
  integrandClosed : S.integrand
  surfaceIntegralDefinedClosed : S.surfaceIntegralDefined
  orientationDependenceClosed : S.orientationDependence
  fluxInterpretationClosed : S.fluxInterpretation

def SurfaceIntegralClosed {M : Type u} [TopologicalSpace M] [ChartedSpace ℝ M] {V : VectorFieldPackage M} (S : SurfaceIntegralPackage V) : Prop :=
  S.smoothParameterization ∧ S.integrand ∧ S.surfaceIntegralDefined ∧ S.orientationDependence ∧ S.fluxInterpretation

theorem surface_integral_closed_from_evidence {M : Type u} [TopologicalSpace M] [ChartedSpace ℝ M] {V : VectorFieldPackage M} (S : SurfaceIntegralPackage V) (E : SurfaceIntegralEvidence S) : SurfaceIntegralClosed S := by
  exact And.intro E.smoothParameterizationClosed (And.intro E.integrandClosed (And.intro E.surfaceIntegralDefinedClosed (And.intro E.orientationDependenceClosed E.fluxInterpretationClosed)))

end CalculusVectorFunctionsCanonicalLaneLean
end HautevilleHouse