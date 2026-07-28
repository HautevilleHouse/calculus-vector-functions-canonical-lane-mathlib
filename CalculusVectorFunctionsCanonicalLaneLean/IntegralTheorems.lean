import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CalculusVectorFunctionsCanonicalLaneLean

structure LineIntegralPackage where
  path : Type
  vectorField : VectorFieldObject
  integrand : path → ℝ
  lineIntegralDefined : Prop
  fundamentalTheorem : Prop

structure LineIntegralEvidence (L : LineIntegralPackage) where
  lineIntegralDefinedClosed : L.lineIntegralDefined
  fundamentalTheoremClosed : L.fundamentalTheorem

def LineIntegralClosed (L : LineIntegralPackage) : Prop :=
  L.lineIntegralDefined ∧ L.fundamentalTheorem

theorem line_integral_closed_from_evidence (L : LineIntegralPackage) (E : LineIntegralEvidence L) :
    LineIntegralClosed L :=
  And.intro E.lineIntegralDefinedClosed E.fundamentalTheoremClosed

structure SurfaceIntegralPackage where
  surface : Type
  vectorField : VectorFieldObject
  fluxIntegral : ℝ
  stokesTheorem : Prop
  divergenceTheorem : Prop

structure SurfaceIntegralEvidence (S : SurfaceIntegralPackage) where
  stokesTheoremClosed : S.stokesTheorem
  divergenceTheoremClosed : S.divergenceTheorem

def SurfaceIntegralClosed (S : SurfaceIntegralPackage) : Prop :=
  S.stokesTheorem ∧ S.divergenceTheorem

theorem surface_integral_closed_from_evidence (S : SurfaceIntegralPackage) (E : SurfaceIntegralEvidence S) :
    SurfaceIntegralClosed S :=
  And.intro E.stokesTheoremClosed E.divergenceTheoremClosed

end CalculusVectorFunctionsCanonicalLaneLean
end HautevilleHouse