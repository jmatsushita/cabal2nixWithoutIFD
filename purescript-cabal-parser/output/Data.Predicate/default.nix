
let
  module = 
    { "Control.Semigroupoid" = import ../Control.Semigroupoid;
      "Data.BooleanAlgebra" = import ../Data.BooleanAlgebra;
      "Data.Functor.Contravariant" = import ../Data.Functor.Contravariant;
      "Data.HeytingAlgebra" = import ../Data.HeytingAlgebra;
      "Data.Newtype" = import ../Data.Newtype;
      "Prelude" = import ../Prelude;
    };
  Predicate = x: x;
  newtypePredicate = {"Coercible0" = __unused: module."Prim".undefined;};
  heytingAlgebraPredicate = module."Data.HeytingAlgebra".heytingAlgebraFunction module."Data.HeytingAlgebra".heytingAlgebraBoolean;
  contravariantPredicate = 
    { cmap = f: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              g = v;
            in
              module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn g f1;
          __patternFail = builtins.throw "Pattern match failure in .spago/contravariant/master/src/Data/Predicate.purs at 17:1 - 18:45";
        in
          __pattern0 __patternFail;
    };
  booleanAlgebraPredicate = module."Data.BooleanAlgebra".booleanAlgebraFn module."Data.BooleanAlgebra".booleanAlgebraBoolean;
in
  {inherit Predicate newtypePredicate heytingAlgebraPredicate booleanAlgebraPredicate contravariantPredicate;}