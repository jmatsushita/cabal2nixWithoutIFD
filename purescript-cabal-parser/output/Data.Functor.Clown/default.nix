
let
  module = 
    { "Control.Applicative" = import ../Control.Applicative;
      "Control.Apply" = import ../Control.Apply;
      "Control.Biapplicative" = import ../Control.Biapplicative;
      "Control.Biapply" = import ../Control.Biapply;
      "Data.Bifunctor" = import ../Data.Bifunctor;
      "Data.Eq" = import ../Data.Eq;
      "Data.Functor" = import ../Data.Functor;
      "Data.Functor.Contravariant" = import ../Data.Functor.Contravariant;
      "Data.Newtype" = import ../Data.Newtype;
      "Data.Ord" = import ../Data.Ord;
      "Data.Profunctor" = import ../Data.Profunctor;
      "Data.Semigroup" = import ../Data.Semigroup;
      "Data.Show" = import ../Data.Show;
      "Prelude" = import ../Prelude;
    };
  Clown = x: x;
  showClown = dictShow: 
    { show = v: 
        let
          __pattern0 = __fail: 
            let
              x = v;
            in
              module."Data.Semigroup".append module."Data.Semigroup".semigroupString "(Clown " (module."Data.Semigroup".append module."Data.Semigroup".semigroupString (module."Data.Show".show dictShow x) ")");
          __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Clown.purs at 25:1 - 26:46";
        in
          __pattern0 __patternFail;
    };
  profunctorClown = dictContravariant: 
    { dimap = f: v: v1: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              a = v1;
            in
              module."Data.Functor.Contravariant".cmap dictContravariant f1 a;
          __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Clown.purs at 40:1 - 41:41";
        in
          __pattern0 __patternFail;
    };
  ordClown = dictOrd: dictOrd;
  newtypeClown = {"Coercible0" = __unused: module."Prim".undefined;};
  hoistClown = f: v: 
    let
      __pattern0 = __fail: 
        let
          f1 = f;
          a = v;
        in
          f1 a;
      __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Clown.purs at 43:1 - 43:69";
    in
      __pattern0 __patternFail;
  functorClown = 
    { map = v: v1: 
        let
          __pattern0 = __fail: 
            let
              a = v1;
            in
              a;
          __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Clown.purs at 28:1 - 29:28";
        in
          __pattern0 __patternFail;
    };
  eqClown = dictEq: dictEq;
  bifunctorClown = dictFunctor: 
    { bimap = f: v: v1: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              a = v1;
            in
              module."Data.Functor".map dictFunctor f1 a;
          __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Clown.purs at 31:1 - 32:40";
        in
          __pattern0 __patternFail;
    };
  biapplyClown = dictApply: 
    { biapply = v: v1: 
        let
          __pattern0 = __fail: 
            let
              fg = v;
              xy = v1;
            in
              module."Control.Apply".apply dictApply fg xy;
          __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Clown.purs at 34:1 - 35:52";
        in
          __pattern0 __patternFail;
      "Bifunctor0" = __unused: bifunctorClown (dictApply."Functor0" module."Prim".undefined);
    };
  biapplicativeClown = dictApplicative: 
    { bipure = a: v: module."Control.Applicative".pure dictApplicative a;
      "Biapply0" = __unused: biapplyClown (dictApplicative."Apply0" module."Prim".undefined);
    };
in
  {inherit Clown hoistClown newtypeClown eqClown ordClown showClown functorClown bifunctorClown biapplyClown biapplicativeClown profunctorClown;}