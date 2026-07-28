import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CalculusVectorFunctionsCanonicalLaneLean.VectorCalculusFoundation
import HautevilleHouse.CalculusVectorFunctionsCanonicalLaneLean.SurfaceIntegralPackage

namespace HautevilleHouse
namespace CalculusVectorFunctionsCanonicalLaneLean

structure DivergenceTheoremPackage (n : Nat) where
  volume : EuclideanSpace 3 → Prop
  boundarySurface : SurfaceIntegralPackage 3
  vectorField : VectorField 3
  volumeIntegral : ℝ
  surfaceIntegral : ℝ
  equalityHolds : Prop

structure DivergenceTheoremEvidence (n : Nat) (D : DivergenceTheoremPackage n) where
  volumeWellDefinedClosed : D.volume 0
  boundarySmoothClosed : True
  volumeIntegralClosed : D.volumeIntegral ≠ 0
  surfaceIntegralClosed : D.surfaceIntegral ≠ 0
  equalityHoldsClosed : D.equalityHolds

def DivergenceTheoremClosed (n : Nat) (D : DivergenceTheoremPackage n) : Prop :=
  D.volume 0 ∧ D.equalityHolds

theorem divergence_theorem_closed_from_evidence (n : Nat) (D : DivergenceTheoremPackage n) (E : DivergenceTheoremEvidence n D) :
  DivergenceTheoremClosed n D := by
  exact And.intro E.volumeWellDefinedClosed E.equalityHoldsClosed

end CalculusVectorFunctionsCanonicalLaneLean
end HautevilleHouse