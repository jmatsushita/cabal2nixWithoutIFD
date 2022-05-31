
let
  module = 
    { "Control.Applicative" = import ../Control.Applicative;
      "Control.Apply" = import ../Control.Apply;
      "Control.Biapplicative" = import ../Control.Biapplicative;
      "Control.Biapply" = import ../Control.Biapply;
      "Control.Bind" = import ../Control.Bind;
      "Control.Monad" = import ../Control.Monad;
      "Control.Semigroupoid" = import ../Control.Semigroupoid;
      "Data.Bifunctor" = import ../Data.Bifunctor;
      "Data.Either" = import ../Data.Either;
      "Data.Eq" = import ../Data.Eq;
      "Data.Function" = import ../Data.Function;
      "Data.Functor" = import ../Data.Functor;
      "Data.Newtype" = import ../Data.Newtype;
      "Data.Ord" = import ../Data.Ord;
      "Data.Profunctor" = import ../Data.Profunctor;
      "Data.Profunctor.Choice" = import ../Data.Profunctor.Choice;
      "Data.Semigroup" = import ../Data.Semigroup;
      "Data.Show" = import ../Data.Show;
      "Prelude" = import ../Prelude;
    };
  Joker = x: x;
  showJoker = dictShow: 
    { show = v: 
        let
          __pattern0 = __fail: 
            let
              x = v;
            in
              module."Data.Semigroup".append module."Data.Semigroup".semigroupString "(Joker " (module."Data.Semigroup".append module."Data.Semigroup".semigroupString (module."Data.Show".show dictShow x) ")");
          __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Joker.purs at 26:1 - 27:46";
        in
          __pattern0 __patternFail;
    };
  profunctorJoker = dictFunctor: 
    { dimap = v: g: v1: 
        let
          __pattern0 = __fail: 
            let
              g1 = g;
              a = v1;
            in
              module."Data.Functor".map dictFunctor g1 a;
          __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Joker.purs at 52:1 - 53:40";
        in
          __pattern0 __patternFail;
    };
  ordJoker = dictOrd: dictOrd;
  newtypeJoker = {"Coercible0" = __unused: module."Prim".undefined;};
  hoistJoker = f: v: 
    let
      __pattern0 = __fail: 
        let
          f1 = f;
          a = v;
        in
          f1 a;
      __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Joker.purs at 59:1 - 59:69";
    in
      __pattern0 __patternFail;
  functorJoker = dictFunctor: 
    { map = f: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              a = v;
            in
              module."Data.Functor".map dictFunctor f1 a;
          __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Joker.purs at 29:1 - 30:36";
        in
          __pattern0 __patternFail;
    };
  eqJoker = dictEq: dictEq;
  choiceJoker = dictFunctor: 
    { left = v: 
        let
          __pattern0 = __fail: 
            let
              f = v;
            in
              module."Data.Function".apply Joker (module."Data.Functor".map dictFunctor module."Data.Either".Left f);
          __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Joker.purs at 55:1 - 57:40";
        in
          __pattern0 __patternFail;
      right = v: 
        let
          __pattern0 = __fail: 
            let
              f = v;
            in
              module."Data.Function".apply Joker (module."Data.Functor".map dictFunctor module."Data.Either".Right f);
          __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Joker.purs at 55:1 - 57:40";
        in
          __pattern0 __patternFail;
      "Profunctor0" = __unused: profunctorJoker dictFunctor;
    };
  bifunctorJoker = dictFunctor: 
    { bimap = v: g: v1: 
        let
          __pattern0 = __fail: 
            let
              g1 = g;
              a = v1;
            in
              module."Data.Functor".map dictFunctor g1 a;
          __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Joker.purs at 43:1 - 44:40";
        in
          __pattern0 __patternFail;
    };
  biapplyJoker = dictApply: 
    { biapply = v: v1: 
        let
          __pattern0 = __fail: 
            let
              fg = v;
              xy = v1;
            in
              module."Control.Apply".apply dictApply fg xy;
          __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Joker.purs at 46:1 - 47:52";
        in
          __pattern0 __patternFail;
      "Bifunctor0" = __unused: bifunctorJoker (dictApply."Functor0" module."Prim".undefined);
    };
  biapplicativeJoker = dictApplicative: 
    { bipure = v: b: module."Control.Applicative".pure dictApplicative b;
      "Biapply0" = __unused: biapplyJoker (dictApplicative."Apply0" module."Prim".undefined);
    };
  applyJoker = dictApply: 
    { apply = v: v1: 
        let
          __pattern0 = __fail: 
            let
              f = v;
              g = v1;
            in
              module."Data.Function".apply Joker (module."Control.Apply".apply dictApply f g);
          __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Joker.purs at 32:1 - 33:48";
        in
          __pattern0 __patternFail;
      "Functor0" = __unused: functorJoker (dictApply."Functor0" module."Prim".undefined);
    };
  bindJoker = dictBind: 
    { bind = v: amb: 
        let
          __pattern0 = __fail: 
            let
              ma = v;
              amb1 = amb;
            in
              module."Data.Function".apply Joker (module."Control.Bind".bind dictBind ma (module."Control.Semigroupoid".composeFlipped module."Control.Semigroupoid".semigroupoidFn amb1 (module."Data.Newtype".un module."Prim".undefined Joker)));
          __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Joker.purs at 38:1 - 39:58";
        in
          __pattern0 __patternFail;
      "Apply0" = __unused: applyJoker (dictBind."Apply0" module."Prim".undefined);
    };
  applicativeJoker = dictApplicative: 
    { pure = module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn Joker (module."Control.Applicative".pure dictApplicative);
      "Apply0" = __unused: applyJoker (dictApplicative."Apply0" module."Prim".undefined);
    };
  monadJoker = dictMonad: 
    { "Applicative0" = __unused: applicativeJoker (dictMonad."Applicative0" module."Prim".undefined);
      "Bind1" = __unused: bindJoker (dictMonad."Bind1" module."Prim".undefined);
    };
in
  {inherit Joker hoistJoker newtypeJoker eqJoker ordJoker showJoker functorJoker applyJoker applicativeJoker bindJoker monadJoker bifunctorJoker biapplyJoker biapplicativeJoker profunctorJoker choiceJoker;}