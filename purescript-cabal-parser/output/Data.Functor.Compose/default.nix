
let
  module = 
    { "Control.Alt" = import ../Control.Alt;
      "Control.Alternative" = import ../Control.Alternative;
      "Control.Applicative" = import ../Control.Applicative;
      "Control.Apply" = import ../Control.Apply;
      "Control.Plus" = import ../Control.Plus;
      "Control.Semigroupoid" = import ../Control.Semigroupoid;
      "Data.Eq" = import ../Data.Eq;
      "Data.Function" = import ../Data.Function;
      "Data.Functor" = import ../Data.Functor;
      "Data.Functor.App" = import ../Data.Functor.App;
      "Data.Newtype" = import ../Data.Newtype;
      "Data.Ord" = import ../Data.Ord;
      "Data.Semigroup" = import ../Data.Semigroup;
      "Data.Show" = import ../Data.Show;
      "Prelude" = import ../Prelude;
    };
  Compose = x: x;
  showCompose = dictShow: 
    { show = v: 
        let
          __pattern0 = __fail: 
            let
              fga = v;
            in
              module."Data.Semigroup".append module."Data.Semigroup".semigroupString "(Compose " (module."Data.Semigroup".append module."Data.Semigroup".semigroupString (module."Data.Show".show dictShow fga) ")");
          __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Compose.purs at 40:1 - 41:54";
        in
          __pattern0 __patternFail;
    };
  newtypeCompose = {"Coercible0" = __unused: module."Prim".undefined;};
  functorCompose = dictFunctor: dictFunctor1: 
    { map = f: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              fga = v;
            in
              module."Data.Function".apply Compose (module."Data.Functor".map dictFunctor (module."Data.Functor".map dictFunctor1 f1) fga);
          __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Compose.purs at 43:1 - 44:48";
        in
          __pattern0 __patternFail;
    };
  eqCompose = dictEq1: dictEq11: dictEq: 
    { eq = v: v1: 
        let
          __pattern0 = __fail: 
            let
              fga1 = v;
              fga2 = v1;
            in
              module."Data.Eq".eq1 dictEq1 (module."Data.Functor.App".eqApp dictEq11 dictEq) (module."Data.Functor.App".hoistLiftApp fga1) (module."Data.Functor.App".hoistLiftApp fga2);
          __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Compose.purs at 28:1 - 30:48";
        in
          __pattern0 __patternFail;
    };
  ordCompose = dictOrd1: dictOrd11: dictOrd: 
    { compare = v: v1: 
        let
          __pattern0 = __fail: 
            let
              fga1 = v;
              fga2 = v1;
            in
              module."Data.Ord".compare1 dictOrd1 (module."Data.Functor.App".ordApp dictOrd11 dictOrd) (module."Data.Functor.App".hoistLiftApp fga1) (module."Data.Functor.App".hoistLiftApp fga2);
          __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Compose.purs at 34:1 - 36:53";
        in
          __pattern0 __patternFail;
      "Eq0" = __unused: eqCompose (dictOrd1."Eq10" module."Prim".undefined) (dictOrd11."Eq10" module."Prim".undefined) (dictOrd."Eq0" module."Prim".undefined);
    };
  eq1Compose = dictEq1: dictEq11: {eq1 = dictEq: module."Data.Eq".eq (eqCompose dictEq1 dictEq11 dictEq);};
  ord1Compose = dictOrd1: dictOrd11: 
    { compare1 = dictOrd: module."Data.Ord".compare (ordCompose dictOrd1 dictOrd11 dictOrd);
      "Eq10" = __unused: eq1Compose (dictOrd1."Eq10" module."Prim".undefined) (dictOrd11."Eq10" module."Prim".undefined);
    };
  bihoistCompose = dictFunctor: natF: natG: v: 
    let
      __pattern0 = __fail: 
        let
          natF1 = natF;
          natG1 = natG;
          fga = v;
        in
          natF1 (module."Data.Functor".map dictFunctor natG1 fga);
      __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Compose.purs at 17:1 - 23:17";
    in
      __pattern0 __patternFail;
  applyCompose = dictApply: dictApply1: 
    { apply = v: v1: 
        let
          __pattern0 = __fail: 
            let
              f = v;
              x = v1;
            in
              module."Data.Function".apply Compose (module."Control.Apply".apply dictApply (module."Data.Functor".map (dictApply."Functor0" module."Prim".undefined) (module."Control.Apply".apply dictApply1) f) x);
          __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Compose.purs at 46:1 - 47:62";
        in
          __pattern0 __patternFail;
      "Functor0" = __unused: functorCompose (dictApply."Functor0" module."Prim".undefined) (dictApply1."Functor0" module."Prim".undefined);
    };
  applicativeCompose = dictApplicative: dictApplicative1: 
    { pure = module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn Compose (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn (module."Control.Applicative".pure dictApplicative) (module."Control.Applicative".pure dictApplicative1));
      "Apply0" = __unused: applyCompose (dictApplicative."Apply0" module."Prim".undefined) (dictApplicative1."Apply0" module."Prim".undefined);
    };
  altCompose = dictAlt: dictFunctor: 
    { alt = v: v1: 
        let
          __pattern0 = __fail: 
            let
              a = v;
              b = v1;
            in
              module."Data.Function".apply Compose (module."Control.Alt".alt dictAlt a b);
          __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Compose.purs at 52:1 - 53:50";
        in
          __pattern0 __patternFail;
      "Functor0" = __unused: functorCompose (dictAlt."Functor0" module."Prim".undefined) dictFunctor;
    };
  plusCompose = dictPlus: dictFunctor: 
    { empty = module."Control.Plus".empty dictPlus;
      "Alt0" = __unused: altCompose (dictPlus."Alt0" module."Prim".undefined) dictFunctor;
    };
  alternativeCompose = dictAlternative: dictApplicative: 
    { "Applicative0" = __unused: applicativeCompose (dictAlternative."Applicative0" module."Prim".undefined) dictApplicative;
      "Plus1" = __unused: plusCompose (dictAlternative."Plus1" module."Prim".undefined) ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined);
    };
in
  {inherit Compose bihoistCompose newtypeCompose eqCompose eq1Compose ordCompose ord1Compose showCompose functorCompose applyCompose applicativeCompose altCompose plusCompose alternativeCompose;}