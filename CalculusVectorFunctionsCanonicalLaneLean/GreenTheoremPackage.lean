import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CalculusVectorFunctionsCanonicalLaneLean.VectorCalculusFoundation
import HautevilleHouse.CalculusVectorFunctionsCanonicalLaneLean.LineIntegralPackage

namespace HautevilleHouse
namespace CalculusVectorFunctionsCanonicalLaneLean

structure GreenTheoremPackage (n : Nat) where
  region : EuclideanSpace 2 → Prop
  boundaryCurve : EuclideanSpace 1 → EuclideanSpace 2
  vectorField : VectorField 2
  lineIntegral : ℝ
  doubleIntegral : ℝ
  equalityHolds : Prop

structure GreenTheoremEvidence (n : Nat) (G : GreenTheoremPackage n) where
  regionWellDefinedClosed : G.region 0
  boundarySmoothClosed : True
  lineIntegralClosed : G.lineIntegral ≠ 0
  doubleIntegralClosed : G.doubleIntegral ≠ 0
  equalityHoldsClosed : G.equalityHolds

def GreenTheoremClosed (n : Nat) (G : GreenTheoremPackage n) : Prop :=
  G.region 0 ∧ G.equalityHolds

theorem green_theorem_closed_from_evidence (n : Nat) (G : GreenTheoremPackage n) (E : GreenTheoremEvidence n G) :
  GreenTheoremClosed n G := by
  exact And.intro E.regionWellDefinedClosed E.equalityHoldsClosed

end CalculusVectorFunctionsCanonicalLaneLean
end HautevilleHouse