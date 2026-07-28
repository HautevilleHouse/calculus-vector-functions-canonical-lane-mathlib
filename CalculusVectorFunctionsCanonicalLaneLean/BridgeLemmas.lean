import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CalculusVectorFunctionsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  VectorWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end CalculusVectorFunctionsCanonicalLaneLean
end HautevilleHouse
