
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
  Additive = x: x;
  showAdditive = dictShow: 
    { show = v: 
        let
          __pattern0 = __fail: 
            let
              a = v;
            in
              module."Data.Semigroup".append module."Data.Semigroup".semigroupString "(Additive " (module."Data.Semigroup".append module."Data.Semigroup".semigroupString (module."Data.Show".show dictShow a) ")");
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Monoid/Additive.purs at 24:1 - 25:52";
        in
          __pattern0 __patternFail;
    };
  semigroupAdditive = dictSemiring: 
    { append = v: v1: 
        let
          __pattern0 = __fail: 
            let
              a = v;
              b = v1;
            in
              module."Data.Semiring".add dictSemiring a b;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Monoid/Additive.purs at 40:1 - 41:54";
        in
          __pattern0 __patternFail;
    };
  ordAdditive = dictOrd: dictOrd;
  monoidAdditive = dictSemiring: 
    { mempty = module."Data.Semiring".zero dictSemiring;
      "Semigroup0" = __unused: semigroupAdditive dictSemiring;
    };
  functorAdditive = 
    { map = f: m: 
        let
          __pattern0 = __fail: 
            let
              v = m;
            in
              f v;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Monoid/Additive.purs at 27:1 - 27:52";
        in
          __pattern0 __patternFail;
    };
  eqAdditive = dictEq: dictEq;
  eq1Additive = {eq1 = dictEq: module."Data.Eq".eq (eqAdditive dictEq);};
  ord1Additive = 
    { compare1 = dictOrd: module."Data.Ord".compare (ordAdditive dictOrd);
      "Eq10" = __unused: eq1Additive;
    };
  boundedAdditive = dictBounded: dictBounded;
  applyAdditive = 
    { apply = v: v1: 
        let
          __pattern0 = __fail: 
            let
              f = v;
              x = v1;
            in
              f x;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Monoid/Additive.purs at 29:1 - 30:51";
        in
          __pattern0 __patternFail;
      "Functor0" = __unused: functorAdditive;
    };
  bindAdditive = 
    { bind = v: f: 
        let
          __pattern0 = __fail: 
            let
              x = v;
              f1 = f;
            in
              f1 x;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Monoid/Additive.purs at 35:1 - 36:28";
        in
          __pattern0 __patternFail;
      "Apply0" = __unused: applyAdditive;
    };
  applicativeAdditive = 
    { pure = Additive;
      "Apply0" = __unused: applyAdditive;
    };
  monadAdditive = 
    { "Applicative0" = __unused: applicativeAdditive;
      "Bind1" = __unused: bindAdditive;
    };
in
  {inherit Additive eqAdditive eq1Additive ordAdditive ord1Additive boundedAdditive showAdditive functorAdditive applyAdditive applicativeAdditive bindAdditive monadAdditive semigroupAdditive monoidAdditive;}