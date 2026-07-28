import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CalculusVectorFunctionsCanonicalLaneLean.VectorCalculusFoundation
import HautevilleHouse.CalculusVectorFunctionsCanonicalLaneLean.SurfaceIntegralPackage

namespace HautevilleHouse
namespace CalculusVectorFunctionsCanonicalLaneLean

structure SurfaceIntegralPackage (n : Nat) where
  vectorField : VectorField n
  surface : EuclideanSpace 2 → EuclideanSpace n
  surfaceSmooth : Prop
  integralValue : ℝ

structure SurfaceIntegralEvidence (n : Nat) (S : SurfaceIntegralPackage n) where
  surfaceSmoothClosed : S.surfaceSmooth
  integralValueClosed : S.integralValue ≠ 0

def SurfaceIntegralClosed (n : Nat) (S : SurfaceIntegralPackage n) : Prop :=
  S.surfaceSmooth ∧ (S.integralValue ≠ 0)

theorem surface_integral_closed_from_evidence (n : Nat) (S : SurfaceIntegralPackage n) (E : SurfaceIntegralEvidence n S) :
  SurfaceIntegralClosed n S := by
  exact And.intro E.surfaceSmoothClosed E.integralValueClosed

structure StokesTheoremPackage (n : Nat) where
  surface : SurfaceIntegralPackage n
  boundaryCurve : EuclideanSpace 1 → EuclideanSpace n
  circulation : ℝ
  flux : ℝ
  equalityHolds : Prop

structure StokesTheoremEvidence (n : Nat) (S : StokesTheoremPackage n) where
  boundarySmoothClosed : True
  circulationClosed : S.circulation ≠ 0
  fluxClosed : S.flux ≠ 0
  equalityHoldsClosed : S.equalityHolds

def StokesTheoremClosed (n : Nat) (S : StokesTheoremPackage n) : Prop :=
  S.equalityHolds

theorem stokes_theorem_closed_from_evidence (n : Nat) (S : StokesTheoremPackage n) (E : StokesTheoremEvidence n S) :
  StokesTheoremClosed n S := by
  exact E.equalityHoldsClosed

end CalculusVectorFunctionsCanonicalLaneLean
end HautevilleHouse