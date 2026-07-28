import canonicalLaneMathlib.AdmissibleClass
import CalculusVectorFunctionsCanonicalLaneLean.VectorFieldStructure

namespace HautevilleHouse
namespace CalculusVectorFunctionsCanonicalLaneLean

structure CurveIntegralPackage {M : Type u} [TopologicalSpace M] [ChartedSpace ℝ M] {V : VectorFieldPackage M} where
  curve : ℝ → M
  curveSmooth : Prop
  integrand : M → ℝ
  lineIntegralDefined : Prop
  reparameterizationInvariance : Prop
  fundamentalTheorem : Prop

structure CurveIntegralEvidence {M : Type u} [TopologicalSpace M] [ChartedSpace ℝ M] {V : VectorFieldPackage M} (C : CurveIntegralPackage V) where
  curveSmoothClosed : C.curveSmooth
  integrandClosed : C.integrand
  lineIntegralDefinedClosed : C.lineIntegralDefined
  reparameterizationInvarianceClosed : C.reparameterizationInvariance
  fundamentalTheoremClosed : C.fundamentalTheorem

def CurveIntegralClosed {M : Type u} [TopologicalSpace M] [ChartedSpace ℝ M] {V : VectorFieldPackage M} (C : CurveIntegralPackage V) : Prop :=
  C.curveSmooth ∧ C.integrand ∧ C.lineIntegralDefined ∧ C.reparameterizationInvariance ∧ C.fundamentalTheorem

theorem curve_integral_closed_from_evidence {M : Type u} [TopologicalSpace M] [ChartedSpace ℝ M] {V : VectorFieldPackage M} (C : CurveIntegralPackage V) (E : CurveIntegralEvidence C) : CurveIntegralClosed C := by
  exact And.intro E.curveSmoothClosed (And.intro E.integrandClosed (And.intro E.lineIntegralDefinedClosed (And.intro E.reparameterizationInvarianceClosed E.fundamentalTheoremClosed)))

end CalculusVectorFunctionsCanonicalLaneLean
end HautevilleHouse