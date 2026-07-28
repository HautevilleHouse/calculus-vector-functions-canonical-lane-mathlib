import CalculusVectorFunctionsCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace CalculusVectorFunctionsCanonicalLaneLean

structure GradientPackage where
  scalarField : Type
  vectorField : Type
  gradientDefined : Prop
  gradientLinear : Prop
  gradientSmooth : Prop

structure DivergencePackage where
  vectorField : Type
  scalarField : Type
  divergenceDefined : Prop
  divergenceLinear : Prop
  divergenceSmooth : Prop

structure CurlPackage where
  vectorField : Type
  vectorFieldOut : Type
  curlDefined : Prop
  curlLinear : Prop
  curlSmooth : Prop

end CalculusVectorFunctionsCanonicalLaneLean
end HautevilleHouse