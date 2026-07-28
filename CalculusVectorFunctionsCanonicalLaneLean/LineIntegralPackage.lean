import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CalculusVectorFunctionsCanonicalLaneLean.VectorCalculusFoundation
import HautevilleHouse.CalculusVectorFunctionsCanonicalLaneLean.VectorFunctionPackage

namespace HautevilleHouse
namespace CalculusVectorFunctionsCanonicalLaneLean

structure LineIntegralPackage (n : Nat) where
  vectorField : VectorField n
  curve : EuclideanSpace 1 → EuclideanSpace n
  curveSmooth : Prop
  integralValue : ℝ
  fundamentalTheorem : Prop
  conservativity : Prop

structure LineIntegralEvidence (n : Nat) (L : LineIntegralPackage n) where
  curveSmoothClosed : L.curveSmooth
  integralValueClosed : L.integralValue ≠ 0
  fundamentalTheoremClosed : L.fundamentalTheorem
  conservativityClosed : L.conservativity

def LineIntegralClosed (n : Nat) (L : LineIntegralPackage n) : Prop :=
  L.curveSmooth ∧ (L.integralValue ≠ 0) ∧ L.fundamentalTheorem ∧ L.conservativity

theorem line_integral_closed_from_evidence (n : Nat) (L : LineIntegralPackage n) (E : LineIntegralEvidence n L) :
  LineIntegralClosed n L := by
  exact And.intro E.curveSmoothClosed (And.intro E.integralValueClosed
    (And.intro E.fundamentalTheoremClosed E.conservativityClosed))

end CalculusVectorFunctionsCanonicalLaneLean
end HautevilleHouse