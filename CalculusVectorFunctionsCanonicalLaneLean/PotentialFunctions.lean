import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CalculusVectorFunctionsCanonicalLaneLean

structure PotentialFunctionsPackage where
  gradientDivergenceCurlPackage : GradientDivergenceCurlPackage
  conservativeCondition : Prop
  potentialExists : Prop
  uniquenessPotential : Prop
  scalarPotentialFormula : Prop
  vectorPotentialFormula : Prop

structure PotentialFunctionsEvidence (P : PotentialFunctionsPackage) where
  conservativeConditionClosed : P.conservativeCondition
  potentialExistsClosed : P.potentialExists
  uniquenessPotentialClosed : P.uniquenessPotential
  scalarPotentialFormulaClosed : P.scalarPotentialFormula
  vectorPotentialFormulaClosed : P.vectorPotentialFormula

def PotentialFunctionsClosed (P : PotentialFunctionsPackage) : Prop :=
  P.conservativeCondition ∧ P.potentialExists ∧ P.uniquenessPotential ∧
  P.scalarPotentialFormula ∧ P.vectorPotentialFormula

theorem potential_functions_closed_from_evidence
    (P : PotentialFunctionsPackage) (E : PotentialFunctionsEvidence P) :
    PotentialFunctionsClosed P := by
  exact And.intro E.conservativeConditionClosed
    (And.intro E.potentialExistsClosed
      (And.intro E.uniquenessPotentialClosed
        (And.intro E.scalarPotentialFormulaClosed E.vectorPotentialFormulaClosed)))

end CalculusVectorFunctionsCanonicalLaneLean
end HautevilleHouse
