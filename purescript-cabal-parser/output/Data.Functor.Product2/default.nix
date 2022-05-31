
let
  module = 
    { "Control.Biapplicative" = import ../Control.Biapplicative;
      "Control.Biapply" = import ../Control.Biapply;
      "Data.Bifunctor" = import ../Data.Bifunctor;
      "Data.Eq" = import ../Data.Eq;
      "Data.Functor" = import ../Data.Functor;
      "Data.HeytingAlgebra" = import ../Data.HeytingAlgebra;
      "Data.Ord" = import ../Data.Ord;
      "Data.Ordering" = import ../Data.Ordering;
      "Data.Profunctor" = import ../Data.Profunctor;
      "Data.Semigroup" = import ../Data.Semigroup;
      "Data.Show" = import ../Data.Show;
      "Prelude" = import ../Prelude;
    };
  Product2 = value0: value1: 
    { __tag = "Product2";
      __field0 = value0;
      __field1 = value1;
    };
  showProduct2 = dictShow: dictShow1: 
    { show = v: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Product2"
              then 
                let
                  x = v.__field0;
                  y = v.__field1;
                in
                  module."Data.Semigroup".append module."Data.Semigroup".semigroupString "(Product2 " (module."Data.Semigroup".append module."Data.Semigroup".semigroupString (module."Data.Show".show dictShow x) (module."Data.Semigroup".append module."Data.Semigroup".semigroupString " " (module."Data.Semigroup".append module."Data.Semigroup".semigroupString (module."Data.Show".show dictShow1 y) ")")))
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Product2.purs at 24:1 - 25:71";
        in
          __pattern0 __patternFail;
    };
  profunctorProduct2 = dictProfunctor: dictProfunctor1: 
    { dimap = f: g: v: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Product2"
              then 
                let
                  f1 = f;
                  g1 = g;
                  x = v.__field0;
                  y = v.__field1;
                in
                  Product2 (module."Data.Profunctor".dimap dictProfunctor f1 g1 x) (module."Data.Profunctor".dimap dictProfunctor1 f1 g1 y)
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Product2.purs at 39:1 - 40:66";
        in
          __pattern0 __patternFail;
    };
  functorProduct2 = dictFunctor: dictFunctor1: 
    { map = f: v: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Product2"
              then 
                let
                  f1 = f;
                  x = v.__field0;
                  y = v.__field1;
                in
                  Product2 (module."Data.Functor".map dictFunctor f1 x) (module."Data.Functor".map dictFunctor1 f1 y)
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Product2.purs at 27:1 - 28:54";
        in
          __pattern0 __patternFail;
    };
  eqProduct2 = dictEq: dictEq1: 
    { eq = x: y: 
        let
          __pattern0 = __fail: 
            if x.__tag == "Product2" && y.__tag == "Product2"
              then 
                let
                  l = x.__field0;
                  l1 = x.__field1;
                  r = y.__field0;
                  r1 = y.__field1;
                in
                  module."Data.HeytingAlgebra".conj module."Data.HeytingAlgebra".heytingAlgebraBoolean (module."Data.Eq".eq dictEq l r) (module."Data.Eq".eq dictEq1 l1 r1)
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Product2.purs at 20:1 - 20:80";
        in
          __pattern0 __patternFail;
    };
  ordProduct2 = dictOrd: dictOrd1: 
    { compare = x: y: 
        let
          __pattern0 = __fail: 
            if x.__tag == "Product2" && y.__tag == "Product2"
              then 
                let
                  l = x.__field0;
                  l1 = x.__field1;
                  r = y.__field0;
                  r1 = y.__field1;
                in
                  
                  let
                    v = module."Data.Ord".compare dictOrd l r;
                  in
                    
                    let
                      __pattern0 = __fail: if v.__tag == "LT" then module."Data.Ordering".LT else __fail;
                      __pattern1 = __fail: if v.__tag == "GT" then module."Data.Ordering".GT else __fail;
                      __pattern2 = __fail: module."Data.Ord".compare dictOrd1 l1 r1;
                      __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Product2.purs at 22:1 - 22:84";
                    in
                      __pattern0 (__pattern1 (__pattern2 __patternFail))
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Product2.purs at 22:1 - 22:84";
        in
          __pattern0 __patternFail;
      "Eq0" = __unused: eqProduct2 (dictOrd."Eq0" module."Prim".undefined) (dictOrd1."Eq0" module."Prim".undefined);
    };
  bifunctorProduct2 = dictBifunctor: dictBifunctor1: 
    { bimap = f: g: v: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Product2"
              then 
                let
                  f1 = f;
                  g1 = g;
                  x = v.__field0;
                  y = v.__field1;
                in
                  Product2 (module."Data.Bifunctor".bimap dictBifunctor f1 g1 x) (module."Data.Bifunctor".bimap dictBifunctor1 f1 g1 y)
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Product2.purs at 30:1 - 31:66";
        in
          __pattern0 __patternFail;
    };
  biapplyProduct2 = dictBiapply: dictBiapply1: 
    { biapply = v: v1: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Product2" && v1.__tag == "Product2"
              then 
                let
                  w = v.__field0;
                  x = v.__field1;
                  y = v1.__field0;
                  z = v1.__field1;
                in
                  Product2 (module."Control.Biapply".biapply dictBiapply w y) (module."Control.Biapply".biapply dictBiapply1 x z)
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Product2.purs at 33:1 - 34:79";
        in
          __pattern0 __patternFail;
      "Bifunctor0" = __unused: bifunctorProduct2 (dictBiapply."Bifunctor0" module."Prim".undefined) (dictBiapply1."Bifunctor0" module."Prim".undefined);
    };
  biapplicativeProduct2 = dictBiapplicative: dictBiapplicative1: 
    { bipure = a: b: Product2 (module."Control.Biapplicative".bipure dictBiapplicative a b) (module."Control.Biapplicative".bipure dictBiapplicative1 a b);
      "Biapply0" = __unused: biapplyProduct2 (dictBiapplicative."Biapply0" module."Prim".undefined) (dictBiapplicative1."Biapply0" module."Prim".undefined);
    };
in
  {inherit Product2 eqProduct2 ordProduct2 showProduct2 functorProduct2 bifunctorProduct2 biapplyProduct2 biapplicativeProduct2 profunctorProduct2;}