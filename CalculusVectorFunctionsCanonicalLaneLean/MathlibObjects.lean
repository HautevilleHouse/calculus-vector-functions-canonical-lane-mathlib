import canonicalLaneMathlib
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace CalculusVectorFunctionsCanonicalLaneLean

structure VectorFieldSpace where
  domain : Type
  topology : TopologicalSpace domain
  scalarField : Type
  vectorField : Type

structure VectorAdmittedObject where
  space : VectorFieldSpace
  smoothScalarField : Prop
  smoothVectorField : Prop
  conservative : Prop
  conclusion : conservative

def VectorWitnessClosed (O : VectorAdmittedObject) : Prop :=
  O.conservative

end CalculusVectorFunctionsCanonicalLaneLean
end HautevilleHouse