
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
      "Data.Show" = import ../Data.Show;
      "Prelude" = import ../Prelude;
    };
  Dual = x: x;
  showDual = dictShow: 
    { show = v: 
        let
          __pattern0 = __fail: 
            let
              a = v;
            in
              module."Data.Semigroup".append module."Data.Semigroup".semigroupString "(Dual " (module."Data.Semigroup".append module."Data.Semigroup".semigroupString (module."Data.Show".show dictShow a) ")");
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Monoid/Dual.purs at 24:1 - 25:44";
        in
          __pattern0 __patternFail;
    };
  semigroupDual = dictSemigroup: 
    { append = v: v1: 
        let
          __pattern0 = __fail: 
            let
              x = v;
              y = v1;
            in
              module."Data.Semigroup".append dictSemigroup y x;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Monoid/Dual.purs at 40:1 - 41:43";
        in
          __pattern0 __patternFail;
    };
  ordDual = dictOrd: dictOrd;
  monoidDual = dictMonoid: 
    { mempty = module."Data.Monoid".mempty dictMonoid;
      "Semigroup0" = __unused: semigroupDual (dictMonoid."Semigroup0" module."Prim".undefined);
    };
  functorDual = 
    { map = f: m: 
        let
          __pattern0 = __fail: 
            let
              v = m;
            in
              f v;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Monoid/Dual.purs at 27:1 - 27:44";
        in
          __pattern0 __patternFail;
    };
  eqDual = dictEq: dictEq;
  eq1Dual = {eq1 = dictEq: module."Data.Eq".eq (eqDual dictEq);};
  ord1Dual = 
    { compare1 = dictOrd: module."Data.Ord".compare (ordDual dictOrd);
      "Eq10" = __unused: eq1Dual;
    };
  boundedDual = dictBounded: dictBounded;
  applyDual = 
    { apply = v: v1: 
        let
          __pattern0 = __fail: 
            let
              f = v;
              x = v1;
            in
              f x;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Monoid/Dual.purs at 29:1 - 30:39";
        in
          __pattern0 __patternFail;
      "Functor0" = __unused: functorDual;
    };
  bindDual = 
    { bind = v: f: 
        let
          __pattern0 = __fail: 
            let
              x = v;
              f1 = f;
            in
              f1 x;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Monoid/Dual.purs at 35:1 - 36:24";
        in
          __pattern0 __patternFail;
      "Apply0" = __unused: applyDual;
    };
  applicativeDual = 
    { pure = Dual;
      "Apply0" = __unused: applyDual;
    };
  monadDual = 
    { "Applicative0" = __unused: applicativeDual;
      "Bind1" = __unused: bindDual;
    };
in
  {inherit Dual eqDual eq1Dual ordDual ord1Dual boundedDual showDual functorDual applyDual applicativeDual bindDual monadDual semigroupDual monoidDual;}