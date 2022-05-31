
let
  module = 
    { "Control.Applicative" = import ../Control.Applicative;
      "Control.Apply" = import ../Control.Apply;
      "Control.Bind" = import ../Control.Bind;
      "Control.Monad" = import ../Control.Monad;
      "Data.Bounded" = import ../Data.Bounded;
      "Data.Eq" = import ../Data.Eq;
      "Data.Functor" = import ../Data.Functor;
      "Data.Monoid" = import ../Data.Monoid;
      "Data.Ord" = import ../Data.Ord;
      "Data.Semigroup" = import ../Data.Semigroup;
      "Data.Semiring" = import ../Data.Semiring;
      "Data.Show" = import ../Data.Show;
      "Prelude" = import ../Prelude;
    };
  Multiplicative = x: x;
  showMultiplicative = dictShow: 
    { show = v: 
        let
          __pattern0 = __fail: 
            let
              a = v;
            in
              module."Data.Semigroup".append module."Data.Semigroup".semigroupString "(Multiplicative " (module."Data.Semigroup".append module."Data.Semigroup".semigroupString (module."Data.Show".show dictShow a) ")");
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Monoid/Multiplicative.purs at 24:1 - 25:64";
        in
          __pattern0 __patternFail;
    };
  semigroupMultiplicative = dictSemiring: 
    { append = v: v1: 
        let
          __pattern0 = __fail: 
            let
              a = v;
              b = v1;
            in
              module."Data.Semiring".mul dictSemiring a b;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Monoid/Multiplicative.purs at 40:1 - 41:72";
        in
          __pattern0 __patternFail;
    };
  ordMultiplicative = dictOrd: dictOrd;
  monoidMultiplicative = dictSemiring: 
    { mempty = module."Data.Semiring".one dictSemiring;
      "Semigroup0" = __unused: semigroupMultiplicative dictSemiring;
    };
  functorMultiplicative = 
    { map = f: m: 
        let
          __pattern0 = __fail: 
            let
              v = m;
            in
              f v;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Monoid/Multiplicative.purs at 27:1 - 27:64";
        in
          __pattern0 __patternFail;
    };
  eqMultiplicative = dictEq: dictEq;
  eq1Multiplicative = {eq1 = dictEq: module."Data.Eq".eq (eqMultiplicative dictEq);};
  ord1Multiplicative = 
    { compare1 = dictOrd: module."Data.Ord".compare (ordMultiplicative dictOrd);
      "Eq10" = __unused: eq1Multiplicative;
    };
  boundedMultiplicative = dictBounded: dictBounded;
  applyMultiplicative = 
    { apply = v: v1: 
        let
          __pattern0 = __fail: 
            let
              f = v;
              x = v1;
            in
              f x;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Monoid/Multiplicative.purs at 29:1 - 30:69";
        in
          __pattern0 __patternFail;
      "Functor0" = __unused: functorMultiplicative;
    };
  bindMultiplicative = 
    { bind = v: f: 
        let
          __pattern0 = __fail: 
            let
              x = v;
              f1 = f;
            in
              f1 x;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Monoid/Multiplicative.purs at 35:1 - 36:34";
        in
          __pattern0 __patternFail;
      "Apply0" = __unused: applyMultiplicative;
    };
  applicativeMultiplicative = 
    { pure = Multiplicative;
      "Apply0" = __unused: applyMultiplicative;
    };
  monadMultiplicative = 
    { "Applicative0" = __unused: applicativeMultiplicative;
      "Bind1" = __unused: bindMultiplicative;
    };
in
  {inherit Multiplicative eqMultiplicative eq1Multiplicative ordMultiplicative ord1Multiplicative boundedMultiplicative showMultiplicative functorMultiplicative applyMultiplicative applicativeMultiplicative bindMultiplicative monadMultiplicative semigroupMultiplicative monoidMultiplicative;}