
let
  module = 
    { "Control.Applicative" = import ../Control.Applicative;
      "Control.Apply" = import ../Control.Apply;
      "Control.Bind" = import ../Control.Bind;
      "Control.Monad" = import ../Control.Monad;
      "Data.Bounded" = import ../Data.Bounded;
      "Data.Eq" = import ../Data.Eq;
      "Data.Functor" = import ../Data.Functor;
      "Data.Ord" = import ../Data.Ord;
      "Data.Semigroup" = import ../Data.Semigroup;
      "Data.Show" = import ../Data.Show;
      "Prelude" = import ../Prelude;
    };
  Last = x: x;
  showLast = dictShow: 
    { show = v: 
        let
          __pattern0 = __fail: 
            let
              a = v;
            in
              module."Data.Semigroup".append module."Data.Semigroup".semigroupString "(Last " (module."Data.Semigroup".append module."Data.Semigroup".semigroupString (module."Data.Show".show dictShow a) ")");
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Semigroup/Last.purs at 23:1 - 24:44";
        in
          __pattern0 __patternFail;
    };
  semigroupLast = {append = v: x: x;};
  ordLast = dictOrd: dictOrd;
  functorLast = 
    { map = f: m: 
        let
          __pattern0 = __fail: 
            let
              v = m;
            in
              f v;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Semigroup/Last.purs at 26:1 - 26:44";
        in
          __pattern0 __patternFail;
    };
  eqLast = dictEq: dictEq;
  eq1Last = {eq1 = dictEq: module."Data.Eq".eq (eqLast dictEq);};
  ord1Last = 
    { compare1 = dictOrd: module."Data.Ord".compare (ordLast dictOrd);
      "Eq10" = __unused: eq1Last;
    };
  boundedLast = dictBounded: dictBounded;
  applyLast = 
    { apply = v: v1: 
        let
          __pattern0 = __fail: 
            let
              f = v;
              x = v1;
            in
              f x;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Semigroup/Last.purs at 28:1 - 29:39";
        in
          __pattern0 __patternFail;
      "Functor0" = __unused: functorLast;
    };
  bindLast = 
    { bind = v: f: 
        let
          __pattern0 = __fail: 
            let
              x = v;
              f1 = f;
            in
              f1 x;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Semigroup/Last.purs at 34:1 - 35:24";
        in
          __pattern0 __patternFail;
      "Apply0" = __unused: applyLast;
    };
  applicativeLast = 
    { pure = Last;
      "Apply0" = __unused: applyLast;
    };
  monadLast = 
    { "Applicative0" = __unused: applicativeLast;
      "Bind1" = __unused: bindLast;
    };
in
  {inherit Last eqLast eq1Last ordLast ord1Last boundedLast showLast functorLast applyLast applicativeLast bindLast monadLast semigroupLast;}