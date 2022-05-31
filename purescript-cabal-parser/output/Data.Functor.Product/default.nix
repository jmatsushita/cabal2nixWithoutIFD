
let
  module = 
    { "Control.Applicative" = import ../Control.Applicative;
      "Control.Apply" = import ../Control.Apply;
      "Control.Bind" = import ../Control.Bind;
      "Control.Monad" = import ../Control.Monad;
      "Control.Semigroupoid" = import ../Control.Semigroupoid;
      "Data.Bifunctor" = import ../Data.Bifunctor;
      "Data.Eq" = import ../Data.Eq;
      "Data.Functor" = import ../Data.Functor;
      "Data.HeytingAlgebra" = import ../Data.HeytingAlgebra;
      "Data.Newtype" = import ../Data.Newtype;
      "Data.Ord" = import ../Data.Ord;
      "Data.Ordering" = import ../Data.Ordering;
      "Data.Semigroup" = import ../Data.Semigroup;
      "Data.Show" = import ../Data.Show;
      "Data.Tuple" = import ../Data.Tuple;
      "Prelude" = import ../Prelude;
    };
  Product = x: x;
  showProduct = dictShow: dictShow1: 
    { show = v: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Tuple"
              then 
                let
                  fa = v.__field0;
                  ga = v.__field1;
                in
                  module."Data.Semigroup".append module."Data.Semigroup".semigroupString "(product " (module."Data.Semigroup".append module."Data.Semigroup".semigroupString (module."Data.Show".show dictShow fa) (module."Data.Semigroup".append module."Data.Semigroup".semigroupString " " (module."Data.Semigroup".append module."Data.Semigroup".semigroupString (module."Data.Show".show dictShow1 ga) ")")))
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Product.purs at 44:1 - 45:81";
        in
          __pattern0 __patternFail;
    };
  product = fa: ga: module."Data.Tuple".Tuple fa ga;
  newtypeProduct = {"Coercible0" = __unused: module."Prim".undefined;};
  functorProduct = dictFunctor: dictFunctor1: 
    { map = f: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              fga = v;
            in
              module."Data.Bifunctor".bimap module."Data.Bifunctor".bifunctorTuple (module."Data.Functor".map dictFunctor f1) (module."Data.Functor".map dictFunctor1 f1) fga;
          __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Product.purs at 47:1 - 48:60";
        in
          __pattern0 __patternFail;
    };
  eq1Product = dictEq1: dictEq11: 
    { eq1 = dictEq: v: v1: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Tuple" && v1.__tag == "Tuple"
              then 
                let
                  l1 = v.__field0;
                  r1 = v.__field1;
                  l2 = v1.__field0;
                  r2 = v1.__field1;
                in
                  module."Data.HeytingAlgebra".conj module."Data.HeytingAlgebra".heytingAlgebraBoolean (module."Data.Eq".eq1 dictEq1 dictEq l1 l2) (module."Data.Eq".eq1 dictEq11 dictEq r1 r2)
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Product.purs at 32:1 - 33:79";
        in
          __pattern0 __patternFail;
    };
  eqProduct = dictEq1: dictEq11: dictEq: {eq = module."Data.Eq".eq1 (eq1Product dictEq1 dictEq11) dictEq;};
  ord1Product = dictOrd1: dictOrd11: 
    { compare1 = dictOrd: v: v1: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Tuple" && v1.__tag == "Tuple"
              then 
                let
                  l1 = v.__field0;
                  r1 = v.__field1;
                  l2 = v1.__field0;
                  r2 = v1.__field1;
                in
                  
                  let
                    v2 = module."Data.Ord".compare1 dictOrd1 dictOrd l1 l2;
                  in
                    
                    let
                      __pattern0 = __fail: if v2.__tag == "EQ" then module."Data.Ord".compare1 dictOrd11 dictOrd r1 r2 else __fail;
                      __pattern1 = __fail: 
                        let
                          o = v2;
                        in
                          o;
                      __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Product.purs at 40:5 - 42:13";
                    in
                      __pattern0 (__pattern1 __patternFail)
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Product.purs at 38:1 - 42:13";
        in
          __pattern0 __patternFail;
      "Eq10" = __unused: eq1Product (dictOrd1."Eq10" module."Prim".undefined) (dictOrd11."Eq10" module."Prim".undefined);
    };
  ordProduct = dictOrd1: dictOrd11: dictOrd: 
    { compare = module."Data.Ord".compare1 (ord1Product dictOrd1 dictOrd11) dictOrd;
      "Eq0" = __unused: eqProduct (dictOrd1."Eq10" module."Prim".undefined) (dictOrd11."Eq10" module."Prim".undefined) (dictOrd."Eq0" module."Prim".undefined);
    };
  bihoistProduct = natF: natG: v: 
    let
      __pattern0 = __fail: 
        let
          natF1 = natF;
          natG1 = natG;
          e = v;
        in
          module."Data.Bifunctor".bimap module."Data.Bifunctor".bifunctorTuple natF1 natG1 e;
      __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Product.purs at 19:1 - 24:17";
    in
      __pattern0 __patternFail;
  applyProduct = dictApply: dictApply1: 
    { apply = v: v1: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Tuple" && v1.__tag == "Tuple"
              then 
                let
                  f = v.__field0;
                  g = v.__field1;
                  a = v1.__field0;
                  b = v1.__field1;
                in
                  product (module."Control.Apply".apply dictApply f a) (module."Control.Apply".apply dictApply1 g b)
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Product.purs at 50:1 - 51:86";
        in
          __pattern0 __patternFail;
      "Functor0" = __unused: functorProduct (dictApply."Functor0" module."Prim".undefined) (dictApply1."Functor0" module."Prim".undefined);
    };
  bindProduct = dictBind: dictBind1: 
    { bind = v: f: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Tuple"
              then 
                let
                  fa = v.__field0;
                  ga = v.__field1;
                  f1 = f;
                in
                  product (module."Control.Bind".bind dictBind fa (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn module."Data.Tuple".fst (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn (module."Data.Newtype".unwrap module."Prim".undefined) f1))) (module."Control.Bind".bind dictBind1 ga (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn module."Data.Tuple".snd (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn (module."Data.Newtype".unwrap module."Prim".undefined) f1)))
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Product.purs at 56:1 - 58:72";
        in
          __pattern0 __patternFail;
      "Apply0" = __unused: applyProduct (dictBind."Apply0" module."Prim".undefined) (dictBind1."Apply0" module."Prim".undefined);
    };
  applicativeProduct = dictApplicative: dictApplicative1: 
    { pure = a: product (module."Control.Applicative".pure dictApplicative a) (module."Control.Applicative".pure dictApplicative1 a);
      "Apply0" = __unused: applyProduct (dictApplicative."Apply0" module."Prim".undefined) (dictApplicative1."Apply0" module."Prim".undefined);
    };
  monadProduct = dictMonad: dictMonad1: 
    { "Applicative0" = __unused: applicativeProduct (dictMonad."Applicative0" module."Prim".undefined) (dictMonad1."Applicative0" module."Prim".undefined);
      "Bind1" = __unused: bindProduct (dictMonad."Bind1" module."Prim".undefined) (dictMonad1."Bind1" module."Prim".undefined);
    };
in
  {inherit Product product bihoistProduct newtypeProduct eqProduct eq1Product ordProduct ord1Product showProduct functorProduct applyProduct applicativeProduct bindProduct monadProduct;}