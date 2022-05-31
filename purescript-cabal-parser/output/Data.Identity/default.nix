
let
  module = 
    { "Control.Alt" = import ../Control.Alt;
      "Control.Applicative" = import ../Control.Applicative;
      "Control.Apply" = import ../Control.Apply;
      "Control.Bind" = import ../Control.Bind;
      "Control.Comonad" = import ../Control.Comonad;
      "Control.Extend" = import ../Control.Extend;
      "Control.Lazy" = import ../Control.Lazy;
      "Control.Monad" = import ../Control.Monad;
      "Data.BooleanAlgebra" = import ../Data.BooleanAlgebra;
      "Data.Bounded" = import ../Data.Bounded;
      "Data.CommutativeRing" = import ../Data.CommutativeRing;
      "Data.Eq" = import ../Data.Eq;
      "Data.EuclideanRing" = import ../Data.EuclideanRing;
      "Data.Functor" = import ../Data.Functor;
      "Data.Functor.Invariant" = import ../Data.Functor.Invariant;
      "Data.HeytingAlgebra" = import ../Data.HeytingAlgebra;
      "Data.Monoid" = import ../Data.Monoid;
      "Data.Newtype" = import ../Data.Newtype;
      "Data.Ord" = import ../Data.Ord;
      "Data.Ring" = import ../Data.Ring;
      "Data.Semigroup" = import ../Data.Semigroup;
      "Data.Semiring" = import ../Data.Semiring;
      "Data.Show" = import ../Data.Show;
      "Prelude" = import ../Prelude;
    };
  Identity = x: x;
  showIdentity = dictShow: 
    { show = v: 
        let
          __pattern0 = __fail: 
            let
              x = v;
            in
              module."Data.Semigroup".append module."Data.Semigroup".semigroupString "(Identity " (module."Data.Semigroup".append module."Data.Semigroup".semigroupString (module."Data.Show".show dictShow x) ")");
          __patternFail = builtins.throw "Pattern match failure in .spago/identity/master/src/Data/Identity.purs at 42:1 - 43:52";
        in
          __pattern0 __patternFail;
    };
  semiringIdentity = dictSemiring: dictSemiring;
  semigroupIdentity = dictSemigroup: dictSemigroup;
  ringIdentity = dictRing: dictRing;
  ordIdentity = dictOrd: dictOrd;
  newtypeIdentity = {"Coercible0" = __unused: module."Prim".undefined;};
  monoidIdentity = dictMonoid: dictMonoid;
  lazyIdentity = dictLazy: dictLazy;
  heytingAlgebraIdentity = dictHeytingAlgebra: dictHeytingAlgebra;
  functorIdentity = 
    { map = f: m: 
        let
          __pattern0 = __fail: 
            let
              v = m;
            in
              f v;
          __patternFail = builtins.throw "Pattern match failure in .spago/identity/master/src/Data/Identity.purs at 49:1 - 49:52";
        in
          __pattern0 __patternFail;
    };
  invariantIdentity = {imap = module."Data.Functor.Invariant".imapF functorIdentity;};
  extendIdentity = 
    { extend = f: m: f m;
      "Functor0" = __unused: functorIdentity;
    };
  euclideanRingIdentity = dictEuclideanRing: dictEuclideanRing;
  eqIdentity = dictEq: dictEq;
  eq1Identity = {eq1 = dictEq: module."Data.Eq".eq (eqIdentity dictEq);};
  ord1Identity = 
    { compare1 = dictOrd: module."Data.Ord".compare (ordIdentity dictOrd);
      "Eq10" = __unused: eq1Identity;
    };
  comonadIdentity = 
    { extract = v: 
        let
          __pattern0 = __fail: 
            let
              x = v;
            in
              x;
          __patternFail = builtins.throw "Pattern match failure in .spago/identity/master/src/Data/Identity.purs at 71:1 - 72:27";
        in
          __pattern0 __patternFail;
      "Extend0" = __unused: extendIdentity;
    };
  commutativeRingIdentity = dictCommutativeRing: dictCommutativeRing;
  boundedIdentity = dictBounded: dictBounded;
  booleanAlgebraIdentity = dictBooleanAlgebra: dictBooleanAlgebra;
  applyIdentity = 
    { apply = v: v1: 
        let
          __pattern0 = __fail: 
            let
              f = v;
              x = v1;
            in
              f x;
          __patternFail = builtins.throw "Pattern match failure in .spago/identity/master/src/Data/Identity.purs at 57:1 - 58:51";
        in
          __pattern0 __patternFail;
      "Functor0" = __unused: functorIdentity;
    };
  bindIdentity = 
    { bind = v: f: 
        let
          __pattern0 = __fail: 
            let
              m = v;
              f1 = f;
            in
              f1 m;
          __patternFail = builtins.throw "Pattern match failure in .spago/identity/master/src/Data/Identity.purs at 63:1 - 64:28";
        in
          __pattern0 __patternFail;
      "Apply0" = __unused: applyIdentity;
    };
  applicativeIdentity = 
    { pure = Identity;
      "Apply0" = __unused: applyIdentity;
    };
  monadIdentity = 
    { "Applicative0" = __unused: applicativeIdentity;
      "Bind1" = __unused: bindIdentity;
    };
  altIdentity = 
    { alt = x: v: x;
      "Functor0" = __unused: functorIdentity;
    };
in
  {inherit Identity newtypeIdentity eqIdentity ordIdentity boundedIdentity heytingAlgebraIdentity booleanAlgebraIdentity semigroupIdentity monoidIdentity semiringIdentity euclideanRingIdentity ringIdentity commutativeRingIdentity lazyIdentity showIdentity eq1Identity ord1Identity functorIdentity invariantIdentity altIdentity applyIdentity applicativeIdentity bindIdentity monadIdentity extendIdentity comonadIdentity;}