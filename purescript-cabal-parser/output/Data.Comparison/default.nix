
let
  module = 
    { "Data.Function" = import ../Data.Function;
      "Data.Functor.Contravariant" = import ../Data.Functor.Contravariant;
      "Data.Monoid" = import ../Data.Monoid;
      "Data.Newtype" = import ../Data.Newtype;
      "Data.Ord" = import ../Data.Ord;
      "Data.Ordering" = import ../Data.Ordering;
      "Data.Semigroup" = import ../Data.Semigroup;
      "Prelude" = import ../Prelude;
    };
  Comparison = x: x;
  semigroupComparison = 
    { append = v: v1: 
        let
          __pattern0 = __fail: 
            let
              p = v;
              q = v1;
            in
              module."Data.Semigroup".append (module."Data.Semigroup".semigroupFn (module."Data.Semigroup".semigroupFn module."Data.Ordering".semigroupOrdering)) p q;
          __patternFail = builtins.throw "Pattern match failure in .spago/contravariant/master/src/Data/Comparison.purs at 17:1 - 18:61";
        in
          __pattern0 __patternFail;
    };
  newtypeComparison = {"Coercible0" = __unused: module."Prim".undefined;};
  monoidComparison = 
    { mempty = v: v1: module."Data.Ordering".EQ;
      "Semigroup0" = __unused: semigroupComparison;
    };
  defaultComparison = dictOrd: module."Data.Ord".compare dictOrd;
  contravariantComparison = 
    { cmap = f: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              g = v;
            in
              module."Data.Function".on g f1;
          __patternFail = builtins.throw "Pattern match failure in .spago/contravariant/master/src/Data/Comparison.purs at 14:1 - 15:48";
        in
          __pattern0 __patternFail;
    };
in
  {inherit Comparison defaultComparison newtypeComparison contravariantComparison semigroupComparison monoidComparison;}