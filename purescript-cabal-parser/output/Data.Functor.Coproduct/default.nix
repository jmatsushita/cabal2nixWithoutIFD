
let
  module = 
    { "Control.Comonad" = import ../Control.Comonad;
      "Control.Extend" = import ../Control.Extend;
      "Control.Semigroupoid" = import ../Control.Semigroupoid;
      "Data.Bifunctor" = import ../Data.Bifunctor;
      "Data.Either" = import ../Data.Either;
      "Data.Eq" = import ../Data.Eq;
      "Data.Functor" = import ../Data.Functor;
      "Data.Newtype" = import ../Data.Newtype;
      "Data.Ord" = import ../Data.Ord;
      "Data.Ordering" = import ../Data.Ordering;
      "Data.Semigroup" = import ../Data.Semigroup;
      "Data.Show" = import ../Data.Show;
      "Prelude" = import ../Prelude;
    };
  Coproduct = x: x;
  showCoproduct = dictShow: dictShow1: 
    { show = v: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Left"
              then 
                let
                  fa = v.__field0;
                in
                  module."Data.Semigroup".append module."Data.Semigroup".semigroupString "(left " (module."Data.Semigroup".append module."Data.Semigroup".semigroupString (module."Data.Show".show dictShow fa) ")")
              else __fail;
          __pattern1 = __fail: 
            if v.__tag == "Right"
              then 
                let
                  ga = v.__field0;
                in
                  module."Data.Semigroup".append module."Data.Semigroup".semigroupString "(right " (module."Data.Semigroup".append module."Data.Semigroup".semigroupString (module."Data.Show".show dictShow1 ga) ")")
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Coproduct.purs at 63:1 - 65:60";
        in
          __pattern0 (__pattern1 __patternFail);
    };
  right = ga: module."Data.Either".Right ga;
  newtypeCoproduct = {"Coercible0" = __unused: module."Prim".undefined;};
  left = fa: module."Data.Either".Left fa;
  functorCoproduct = dictFunctor: dictFunctor1: 
    { map = f: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              e = v;
            in
              module."Data.Bifunctor".bimap module."Data.Bifunctor".bifunctorEither (module."Data.Functor".map dictFunctor f1) (module."Data.Functor".map dictFunctor1 f1) e;
          __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Coproduct.purs at 67:1 - 68:60";
        in
          __pattern0 __patternFail;
    };
  eq1Coproduct = dictEq1: dictEq11: 
    { eq1 = dictEq: v: v1: 
        let
          __pattern0 = __fail: 
            let
              x = v;
              y = v1;
            in
              
              let
                __pattern0 = __fail: 
                  if x.__tag == "Left" && y.__tag == "Left"
                    then 
                      let
                        fa = x.__field0;
                        ga = y.__field0;
                      in
                        module."Data.Eq".eq1 dictEq1 dictEq fa ga
                    else __fail;
                __pattern1 = __fail: 
                  if x.__tag == "Right" && y.__tag == "Right"
                    then 
                      let
                        fa = x.__field0;
                        ga = y.__field0;
                      in
                        module."Data.Eq".eq1 dictEq11 dictEq fa ga
                    else __fail;
                __pattern2 = __fail: false;
                __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Coproduct.purs at 47:5 - 50:20";
              in
                __pattern0 (__pattern1 (__pattern2 __patternFail));
          __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Coproduct.purs at 45:1 - 50:20";
        in
          __pattern0 __patternFail;
    };
  eqCoproduct = dictEq1: dictEq11: dictEq: {eq = module."Data.Eq".eq1 (eq1Coproduct dictEq1 dictEq11) dictEq;};
  ord1Coproduct = dictOrd1: dictOrd11: 
    { compare1 = dictOrd: v: v1: 
        let
          __pattern0 = __fail: 
            let
              x = v;
              y = v1;
            in
              
              let
                __pattern0 = __fail: 
                  if x.__tag == "Left" && y.__tag == "Left"
                    then 
                      let
                        fa = x.__field0;
                        ga = y.__field0;
                      in
                        module."Data.Ord".compare1 dictOrd1 dictOrd fa ga
                    else __fail;
                __pattern1 = __fail: if x.__tag == "Left" then module."Data.Ordering".LT else __fail;
                __pattern2 = __fail: if y.__tag == "Left" then module."Data.Ordering".GT else __fail;
                __pattern3 = __fail: 
                  if x.__tag == "Right" && y.__tag == "Right"
                    then 
                      let
                        fa = x.__field0;
                        ga = y.__field0;
                      in
                        module."Data.Ord".compare1 dictOrd11 dictOrd fa ga
                    else __fail;
                __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Coproduct.purs at 57:5 - 61:43";
              in
                __pattern0 (__pattern1 (__pattern2 (__pattern3 __patternFail)));
          __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Coproduct.purs at 55:1 - 61:43";
        in
          __pattern0 __patternFail;
      "Eq10" = __unused: eq1Coproduct (dictOrd1."Eq10" module."Prim".undefined) (dictOrd11."Eq10" module."Prim".undefined);
    };
  ordCoproduct = dictOrd1: dictOrd11: dictOrd: 
    { compare = module."Data.Ord".compare1 (ord1Coproduct dictOrd1 dictOrd11) dictOrd;
      "Eq0" = __unused: eqCoproduct (dictOrd1."Eq10" module."Prim".undefined) (dictOrd11."Eq10" module."Prim".undefined) (dictOrd."Eq0" module."Prim".undefined);
    };
  coproduct = v: v1: v2: 
    let
      __pattern0 = __fail: 
        if v2.__tag == "Left"
          then 
            let
              f = v;
              a = v2.__field0;
            in
              f a
          else __fail;
      __pattern1 = __fail: 
        if v2.__tag == "Right"
          then 
            let
              g = v1;
              b = v2.__field0;
            in
              g b
          else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Coproduct.purs at 27:1 - 27:78";
    in
      __pattern0 (__pattern1 __patternFail);
  extendCoproduct = dictExtend: dictExtend1: 
    { extend = f: module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn Coproduct (coproduct (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn module."Data.Either".Left (module."Control.Extend".extend dictExtend (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn f (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn Coproduct module."Data.Either".Left)))) (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn module."Data.Either".Right (module."Control.Extend".extend dictExtend1 (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn f (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn Coproduct module."Data.Either".Right)))));
      "Functor0" = __unused: functorCoproduct (dictExtend."Functor0" module."Prim".undefined) (dictExtend1."Functor0" module."Prim".undefined);
    };
  comonadCoproduct = dictComonad: dictComonad1: 
    { extract = coproduct (module."Control.Comonad".extract dictComonad) (module."Control.Comonad".extract dictComonad1);
      "Extend0" = __unused: extendCoproduct (dictComonad."Extend0" module."Prim".undefined) (dictComonad1."Extend0" module."Prim".undefined);
    };
  bihoistCoproduct = natF: natG: v: 
    let
      __pattern0 = __fail: 
        let
          natF1 = natF;
          natG1 = natG;
          e = v;
        in
          module."Data.Bifunctor".bimap module."Data.Bifunctor".bifunctorEither natF1 natG1 e;
      __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Coproduct.purs at 32:1 - 37:19";
    in
      __pattern0 __patternFail;
in
  {inherit Coproduct left right coproduct bihoistCoproduct newtypeCoproduct eqCoproduct eq1Coproduct ordCoproduct ord1Coproduct showCoproduct functorCoproduct extendCoproduct comonadCoproduct;}