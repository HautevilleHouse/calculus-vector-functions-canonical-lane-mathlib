import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CalculusVectorFunctionsCanonicalLaneLean

structure GradientDivergenceCurlPackage where
  vectorFieldPackage : VectorFieldPackage
  gradientDefined : Prop
  divergenceDefined : Prop
  curlDefined : Prop
  gradientFormula : Prop
  divergenceFormula : Prop
  curlFormula : Prop

structure GradientDivergenceCurlEvidence (G : GradientDivergenceCurlPackage) where
  gradientDefinedClosed : G.gradientDefined
  divergenceDefinedClosed : G.divergenceDefined
  curlDefinedClosed : G.curlDefined
  gradientFormulaClosed : G.gradientFormula
  divergenceFormulaClosed : G.divergenceFormula
  curlFormulaClosed : G.curlFormula

def GradientDivergenceCurlClosed (G : GradientDivergenceCurlPackage) : Prop :=
  G.gradientDefined ∧ G.divergenceDefined ∧ G.curlDefined ∧
  G.gradientFormula ∧ G.divergenceFormula ∧ G.curlFormula

theorem gradient_divergence_curl_closed_from_evidence
    (G : GradientDivergenceCurlPackage) (E : GradientDivergenceCurlEvidence G) :
    GradientDivergenceCurlClosed G := by
  exact And.intro E.gradientDefinedClosed
    (And.intro E.divergenceDefinedClosed
      (And.intro E.curlDefinedClosed
        (And.intro E.gradientFormulaClosed
          (And.intro E.divergenceFormulaClosed E.curlFormulaClosed))))

end CalculusVectorFunctionsCanonicalLaneLean
end HautevilleHouse
