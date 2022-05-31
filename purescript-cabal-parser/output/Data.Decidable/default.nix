
let
  module = 
    { "Control.Category" = import ../Control.Category;
      "Data.Comparison" = import ../Data.Comparison;
      "Data.Decide" = import ../Data.Decide;
      "Data.Divisible" = import ../Data.Divisible;
      "Data.Equivalence" = import ../Data.Equivalence;
      "Data.Op" = import ../Data.Op;
      "Data.Predicate" = import ../Data.Predicate;
      "Data.Void" = import ../Data.Void;
      "Prelude" = import ../Prelude;
    };
  Decidable-Dict = x: x;
  lose = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.lose;
      __patternFail = builtins.throw "Pattern match failure in .spago/contravariant/master/src/Data/Decidable.purs at 14:3 - 14:39";
    in
      __pattern0 __patternFail;
  lost = dictDecidable: lose dictDecidable (module."Control.Category".identity module."Control.Category".categoryFn);
  decidablePredicate = 
    { lose = f: a: module."Data.Void".absurd (f a);
      "Decide0" = __unused: module."Data.Decide".choosePredicate;
      "Divisible1" = __unused: module."Data.Divisible".divisiblePredicate;
    };
  decidableOp = dictMonoid: 
    { lose = f: a: module."Data.Void".absurd (f a);
      "Decide0" = __unused: module."Data.Decide".chooseOp (dictMonoid."Semigroup0" module."Prim".undefined);
      "Divisible1" = __unused: module."Data.Divisible".divisibleOp dictMonoid;
    };
  decidableEquivalence = 
    { lose = f: a: module."Data.Void".absurd (f a);
      "Decide0" = __unused: module."Data.Decide".chooseEquivalence;
      "Divisible1" = __unused: module."Data.Divisible".divisibleEquivalence;
    };
  decidableComparison = 
    { lose = f: a: v: module."Data.Void".absurd (f a);
      "Decide0" = __unused: module."Data.Decide".chooseComparison;
      "Divisible1" = __unused: module."Data.Divisible".divisibleComparison;
    };
in
  {inherit lose lost decidableComparison decidableEquivalence decidablePredicate decidableOp;}