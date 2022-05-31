
let
  module = 
    { "Control.Applicative" = import ../Control.Applicative;
      "Control.Apply" = import ../Control.Apply;
      "Control.Biapplicative" = import ../Control.Biapplicative;
      "Control.Biapply" = import ../Control.Biapply;
      "Data.Bifunctor" = import ../Data.Bifunctor;
      "Data.Eq" = import ../Data.Eq;
      "Data.Functor" = import ../Data.Functor;
      "Data.Newtype" = import ../Data.Newtype;
      "Data.Ord" = import ../Data.Ord;
      "Data.Semigroup" = import ../Data.Semigroup;
      "Data.Show" = import ../Data.Show;
      "Prelude" = import ../Prelude;
    };
  Join = x: x;
  showJoin = dictShow: 
    { show = v: 
        let
          __pattern0 = __fail: 
            let
              x = v;
            in
              module."Data.Semigroup".append module."Data.Semigroup".semigroupString "(Join " (module."Data.Semigroup".append module."Data.Semigroup".semigroupString (module."Data.Show".show dictShow x) ")");
          __patternFail = builtins.throw "Pattern match failure in .spago/bifunctors/master/src/Data/Bifunctor/Join.purs at 21:1 - 22:44";
        in
          __pattern0 __patternFail;
    };
  ordJoin = dictOrd: dictOrd;
  newtypeJoin = {"Coercible0" = __unused: module."Prim".undefined;};
  eqJoin = dictEq: dictEq;
  bifunctorJoin = dictBifunctor: 
    { map = f: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              a = v;
            in
              module."Data.Bifunctor".bimap dictBifunctor f1 f1 a;
          __patternFail = builtins.throw "Pattern match failure in .spago/bifunctors/master/src/Data/Bifunctor/Join.purs at 24:1 - 25:38";
        in
          __pattern0 __patternFail;
    };
  biapplyJoin = dictBiapply: 
    { apply = v: v1: 
        let
          __pattern0 = __fail: 
            let
              f = v;
              a = v1;
            in
              module."Control.Biapply".biapply dictBiapply f a;
          __patternFail = builtins.throw "Pattern match failure in .spago/bifunctors/master/src/Data/Bifunctor/Join.purs at 27:1 - 28:45";
        in
          __pattern0 __patternFail;
      "Functor0" = __unused: bifunctorJoin (dictBiapply."Bifunctor0" module."Prim".undefined);
    };
  biapplicativeJoin = dictBiapplicative: 
    { pure = a: module."Control.Biapplicative".bipure dictBiapplicative a a;
      "Apply0" = __unused: biapplyJoin (dictBiapplicative."Biapply0" module."Prim".undefined);
    };
in
  {inherit Join newtypeJoin eqJoin ordJoin showJoin bifunctorJoin biapplyJoin biapplicativeJoin;}