
let
  module = 
    { "Control.Applicative" = import ../Control.Applicative;
      "Control.Apply" = import ../Control.Apply;
      "Control.Bind" = import ../Control.Bind;
      "Control.Monad" = import ../Control.Monad;
      "Data.Bounded" = import ../Data.Bounded;
      "Data.Eq" = import ../Data.Eq;
      "Data.Functor" = import ../Data.Functor;
      "Data.HeytingAlgebra" = import ../Data.HeytingAlgebra;
      "Data.Monoid" = import ../Data.Monoid;
      "Data.Ord" = import ../Data.Ord;
      "Data.Semigroup" = import ../Data.Semigroup;
      "Data.Semiring" = import ../Data.Semiring;
      "Data.Show" = import ../Data.Show;
      "Prelude" = import ../Prelude;
    };
  Conj = x: x;
  showConj = dictShow: 
    { show = v: 
        let
          __pattern0 = __fail: 
            let
              a = v;
            in
              module."Data.Semigroup".append module."Data.Semigroup".semigroupString "(Conj " (module."Data.Semigroup".append module."Data.Semigroup".semigroupString (module."Data.Show".show dictShow a) ")");
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Monoid/Conj.purs at 25:1 - 26:44";
        in
          __pattern0 __patternFail;
    };
  semiringConj = dictHeytingAlgebra: 
    { zero = module."Data.HeytingAlgebra".tt dictHeytingAlgebra;
      one = module."Data.HeytingAlgebra".ff dictHeytingAlgebra;
      add = v: v1: 
        let
          __pattern0 = __fail: 
            let
              a = v;
              b = v1;
            in
              module."Data.HeytingAlgebra".conj dictHeytingAlgebra a b;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Monoid/Conj.purs at 47:1 - 51:42";
        in
          __pattern0 __patternFail;
      mul = v: v1: 
        let
          __pattern0 = __fail: 
            let
              a = v;
              b = v1;
            in
              module."Data.HeytingAlgebra".disj dictHeytingAlgebra a b;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Monoid/Conj.purs at 47:1 - 51:42";
        in
          __pattern0 __patternFail;
    };
  semigroupConj = dictHeytingAlgebra: 
    { append = v: v1: 
        let
          __pattern0 = __fail: 
            let
              a = v;
              b = v1;
            in
              module."Data.HeytingAlgebra".conj dictHeytingAlgebra a b;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Monoid/Conj.purs at 41:1 - 42:45";
        in
          __pattern0 __patternFail;
    };
  ordConj = dictOrd: dictOrd;
  monoidConj = dictHeytingAlgebra: 
    { mempty = module."Data.HeytingAlgebra".tt dictHeytingAlgebra;
      "Semigroup0" = __unused: semigroupConj dictHeytingAlgebra;
    };
  functorConj = 
    { map = f: m: 
        let
          __pattern0 = __fail: 
            let
              v = m;
            in
              f v;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Monoid/Conj.purs at 28:1 - 28:44";
        in
          __pattern0 __patternFail;
    };
  eqConj = dictEq: dictEq;
  eq1Conj = {eq1 = dictEq: module."Data.Eq".eq (eqConj dictEq);};
  ord1Conj = 
    { compare1 = dictOrd: module."Data.Ord".compare (ordConj dictOrd);
      "Eq10" = __unused: eq1Conj;
    };
  boundedConj = dictBounded: dictBounded;
  applyConj = 
    { apply = v: v1: 
        let
          __pattern0 = __fail: 
            let
              f = v;
              x = v1;
            in
              f x;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Monoid/Conj.purs at 30:1 - 31:39";
        in
          __pattern0 __patternFail;
      "Functor0" = __unused: functorConj;
    };
  bindConj = 
    { bind = v: f: 
        let
          __pattern0 = __fail: 
            let
              x = v;
              f1 = f;
            in
              f1 x;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Monoid/Conj.purs at 36:1 - 37:24";
        in
          __pattern0 __patternFail;
      "Apply0" = __unused: applyConj;
    };
  applicativeConj = 
    { pure = Conj;
      "Apply0" = __unused: applyConj;
    };
  monadConj = 
    { "Applicative0" = __unused: applicativeConj;
      "Bind1" = __unused: bindConj;
    };
in
  {inherit Conj eqConj eq1Conj ordConj ord1Conj boundedConj showConj functorConj applyConj applicativeConj bindConj monadConj semigroupConj monoidConj semiringConj;}