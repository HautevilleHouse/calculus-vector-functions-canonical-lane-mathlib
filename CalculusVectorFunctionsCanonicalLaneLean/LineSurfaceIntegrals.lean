import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CalculusVectorFunctionsCanonicalLaneLean

structure LineSurfaceIntegralsPackage where
  vectorFieldPackage : VectorFieldPackage
  lineIntegralDefined : Prop
  surfaceIntegralDefined : Prop
  fundamentalTheoremLine : Prop
  stokesTheorem : Prop
  divergenceTheorem : Prop

structure LineSurfaceIntegralsEvidence (L : LineSurfaceIntegralsPackage) where
  lineIntegralDefinedClosed : L.lineIntegralDefined
  surfaceIntegralDefinedClosed : L.surfaceIntegralDefined
  fundamentalTheoremLineClosed : L.fundamentalTheoremLine
  stokesTheoremClosed : L.stokesTheorem
  divergenceTheoremClosed : L.divergenceTheorem

def LineSurfaceIntegralsClosed (L : LineSurfaceIntegralsPackage) : Prop :=
  L.lineIntegralDefined ∧ L.surfaceIntegralDefined ∧
  L.fundamentalTheoremLine ∧ L.stokesTheorem ∧ L.divergenceTheorem

theorem line_surface_integrals_closed_from_evidence
    (L : LineSurfaceIntegralsPackage) (E : LineSurfaceIntegralsEvidence L) :
    LineSurfaceIntegralsClosed L := by
  exact And.intro E.lineIntegralDefinedClosed
    (And.intro E.surfaceIntegralDefinedClosed
      (And.intro E.fundamentalTheoremLineClosed
        (And.intro E.stokesTheoremClosed E.divergenceTheoremClosed)))

end CalculusVectorFunctionsCanonicalLaneLean
end HautevilleHouse
