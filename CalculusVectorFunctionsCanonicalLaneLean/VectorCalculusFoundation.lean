import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CalculusVectorFunctionsCanonicalLaneLean

structure EuclideanSpace (n : Nat) where
  coord : Fin n → ℝ

def euclideanNorm {n : Nat} (v : EuclideanSpace n) : ℝ :=
  Real.sqrt (∑ i : Fin n, (v.coord i)^2)

structure VectorField (n : Nat) where
  toFun : EuclideanSpace n → EuclideanSpace n

def divergence {n : Nat} (F : VectorField n) : EuclideanSpace n → ℝ :=
  λ x => ∑ i : Fin n, (partialDeriv i (F.toFun) x)

structure ScalarField (n : Nat) where
  toFun : EuclideanSpace n → ℝ

structure PartialDerivative (n : Nat) where
  direction : Fin n
  derivative : ScalarField n

structure Gradient (n : Nat) where
  field : ScalarField n
  derivative : VectorField n

structure Curl (n : Nat) where
  field : VectorField n
  rotation : VectorField n

theorem divergence_of_gradient (n : Nat) (f : ScalarField n) (g : Gradient n) :
  divergence g.derivative = 0 := by
  sorry

end CalculusVectorFunctionsCanonicalLaneLean
end HautevilleHouse