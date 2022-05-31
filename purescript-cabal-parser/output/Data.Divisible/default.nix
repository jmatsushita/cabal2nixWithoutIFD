
let
  module = 
    { "Data.Comparison" = import ../Data.Comparison;
      "Data.Divide" = import ../Data.Divide;
      "Data.Equivalence" = import ../Data.Equivalence;
      "Data.Function" = import ../Data.Function;
      "Data.Monoid" = import ../Data.Monoid;
      "Data.Op" = import ../Data.Op;
      "Data.Ordering" = import ../Data.Ordering;
      "Data.Predicate" = import ../Data.Predicate;
      "Prelude" = import ../Prelude;
    };
  Divisible-Dict = x: x;
  divisiblePredicate = 
    { conquer = module."Data.Function".const true;
      "Divide0" = __unused: module."Data.Divide".dividePredicate;
    };
  divisibleOp = dictMonoid: 
    { conquer = module."Data.Function".apply module."Data.Op".Op (module."Data.Function".const (module."Data.Monoid".mempty dictMonoid));
      "Divide0" = __unused: module."Data.Divide".divideOp (dictMonoid."Semigroup0" module."Prim".undefined);
    };
  divisibleEquivalence = 
    { conquer = module."Data.Function".apply module."Data.Equivalence".Equivalence (v: v1: true);
      "Divide0" = __unused: module."Data.Divide".divideEquivalence;
    };
  divisibleComparison = 
    { conquer = module."Data.Function".apply module."Data.Comparison".Comparison (v: v1: module."Data.Ordering".EQ);
      "Divide0" = __unused: module."Data.Divide".divideComparison;
    };
  conquer = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.conquer;
      __patternFail = builtins.throw "Pattern match failure in .spago/contravariant/master/src/Data/Divisible.purs at 13:3 - 13:27";
    in
      __pattern0 __patternFail;
in
  {inherit conquer divisibleComparison divisibleEquivalence divisiblePredicate divisibleOp;}