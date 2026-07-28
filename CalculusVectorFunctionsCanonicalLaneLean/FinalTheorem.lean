import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CalculusVectorFunctionsCanonicalLaneLean.GradientSystems
import HautevilleHouse.CalculusVectorFunctionsCanonicalLaneLean.IntegralTheorems

namespace HautevilleHouse
namespace CalculusVectorFunctionsCanonicalLaneLean

def ConstrainedVectorCalculusClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_vector_calculus_endgame (A : AdmissibleClass) :
    ConstrainedVectorCalculusClosure A :=
  And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CalculusVectorFunctionsCanonicalLaneLean
end HautevilleHouse