
let
  module = 
    { "Control.Applicative" = import ../Control.Applicative;
      "Control.Apply" = import ../Control.Apply;
      "Control.Bind" = import ../Control.Bind;
      "Control.Comonad" = import ../Control.Comonad;
      "Control.Extend" = import ../Control.Extend;
      "Control.Lazy" = import ../Control.Lazy;
      "Control.Monad" = import ../Control.Monad;
      "Control.Semigroupoid" = import ../Control.Semigroupoid;
      "Data.BooleanAlgebra" = import ../Data.BooleanAlgebra;
      "Data.Bounded" = import ../Data.Bounded;
      "Data.CommutativeRing" = import ../Data.CommutativeRing;
      "Data.Eq" = import ../Data.Eq;
      "Data.Function" = import ../Data.Function;
      "Data.Functor" = import ../Data.Functor;
      "Data.Functor.Invariant" = import ../Data.Functor.Invariant;
      "Data.Generic.Rep" = import ../Data.Generic.Rep;
      "Data.HeytingAlgebra" = import ../Data.HeytingAlgebra;
      "Data.Monoid" = import ../Data.Monoid;
      "Data.Ord" = import ../Data.Ord;
      "Data.Ordering" = import ../Data.Ordering;
      "Data.Ring" = import ../Data.Ring;
      "Data.Semigroup" = import ../Data.Semigroup;
      "Data.Semiring" = import ../Data.Semiring;
      "Data.Show" = import ../Data.Show;
      "Data.Unit" = import ../Data.Unit;
      "Prelude" = import ../Prelude;
    };
  Tuple = value0: value1: 
    { __tag = "Tuple";
      __field0 = value0;
      __field1 = value1;
    };
  uncurry = f: v: 
    let
      __pattern0 = __fail: 
        if v.__tag == "Tuple"
          then 
            let
              f1 = f;
              a = v.__field0;
              b = v.__field1;
            in
              f1 a b
          else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/tuples/master/src/Data/Tuple.purs at 130:1 - 130:57";
    in
      __pattern0 __patternFail;
  swap = v: 
    let
      __pattern0 = __fail: 
        if v.__tag == "Tuple"
          then 
            let
              a = v.__field0;
              b = v.__field1;
            in
              Tuple b a
          else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/tuples/master/src/Data/Tuple.purs at 134:1 - 134:43";
    in
      __pattern0 __patternFail;
  snd = v: 
    let
      __pattern0 = __fail: 
        if v.__tag == "Tuple"
          then 
            let
              b = v.__field1;
            in
              b
          else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/tuples/master/src/Data/Tuple.purs at 122:1 - 122:34";
    in
      __pattern0 __patternFail;
  showTuple = dictShow: dictShow1: 
    { show = v: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Tuple"
              then 
                let
                  a = v.__field0;
                  b = v.__field1;
                in
                  module."Data.Semigroup".append module."Data.Semigroup".semigroupString "(Tuple " (module."Data.Semigroup".append module."Data.Semigroup".semigroupString (module."Data.Show".show dictShow a) (module."Data.Semigroup".append module."Data.Semigroup".semigroupString " " (module."Data.Semigroup".append module."Data.Semigroup".semigroupString (module."Data.Show".show dictShow1 b) ")")))
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/tuples/master/src/Data/Tuple.purs at 20:1 - 21:65";
        in
          __pattern0 __patternFail;
    };
  semiringTuple = dictSemiring: dictSemiring1: 
    { add = v: v1: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Tuple" && v1.__tag == "Tuple"
              then 
                let
                  x1 = v.__field0;
                  y1 = v.__field1;
                  x2 = v1.__field0;
                  y2 = v1.__field1;
                in
                  Tuple (module."Data.Semiring".add dictSemiring x1 x2) (module."Data.Semiring".add dictSemiring1 y1 y2)
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/tuples/master/src/Data/Tuple.purs at 56:1 - 60:25";
        in
          __pattern0 __patternFail;
      one = Tuple (module."Data.Semiring".one dictSemiring) (module."Data.Semiring".one dictSemiring1);
      mul = v: v1: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Tuple" && v1.__tag == "Tuple"
              then 
                let
                  x1 = v.__field0;
                  y1 = v.__field1;
                  x2 = v1.__field0;
                  y2 = v1.__field1;
                in
                  Tuple (module."Data.Semiring".mul dictSemiring x1 x2) (module."Data.Semiring".mul dictSemiring1 y1 y2)
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/tuples/master/src/Data/Tuple.purs at 56:1 - 60:25";
        in
          __pattern0 __patternFail;
      zero = Tuple (module."Data.Semiring".zero dictSemiring) (module."Data.Semiring".zero dictSemiring1);
    };
  semigroupoidTuple = 
    { compose = v: v1: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Tuple" && v1.__tag == "Tuple"
              then 
                let
                  c = v.__field1;
                  a = v1.__field0;
                in
                  Tuple a c
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/tuples/master/src/Data/Tuple.purs at 41:1 - 42:46";
        in
          __pattern0 __patternFail;
    };
  semigroupTuple = dictSemigroup: dictSemigroup1: 
    { append = v: v1: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Tuple" && v1.__tag == "Tuple"
              then 
                let
                  a1 = v.__field0;
                  b1 = v.__field1;
                  a2 = v1.__field0;
                  b2 = v1.__field1;
                in
                  Tuple (module."Data.Semigroup".append dictSemigroup a1 a2) (module."Data.Semigroup".append dictSemigroup1 b1 b2)
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/tuples/master/src/Data/Tuple.purs at 50:1 - 51:67";
        in
          __pattern0 __patternFail;
    };
  ringTuple = dictRing: dictRing1: 
    { sub = v: v1: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Tuple" && v1.__tag == "Tuple"
              then 
                let
                  x1 = v.__field0;
                  y1 = v.__field1;
                  x2 = v1.__field0;
                  y2 = v1.__field1;
                in
                  Tuple (module."Data.Ring".sub dictRing x1 x2) (module."Data.Ring".sub dictRing1 y1 y2)
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/tuples/master/src/Data/Tuple.purs at 62:1 - 63:66";
        in
          __pattern0 __patternFail;
      "Semiring0" = __unused: semiringTuple (dictRing."Semiring0" module."Prim".undefined) (dictRing1."Semiring0" module."Prim".undefined);
    };
  monoidTuple = dictMonoid: dictMonoid1: 
    { mempty = Tuple (module."Data.Monoid".mempty dictMonoid) (module."Data.Monoid".mempty dictMonoid1);
      "Semigroup0" = __unused: semigroupTuple (dictMonoid."Semigroup0" module."Prim".undefined) (dictMonoid1."Semigroup0" module."Prim".undefined);
    };
  heytingAlgebraTuple = dictHeytingAlgebra: dictHeytingAlgebra1: 
    { tt = Tuple (module."Data.HeytingAlgebra".tt dictHeytingAlgebra) (module."Data.HeytingAlgebra".tt dictHeytingAlgebra1);
      ff = Tuple (module."Data.HeytingAlgebra".ff dictHeytingAlgebra) (module."Data.HeytingAlgebra".ff dictHeytingAlgebra1);
      implies = v: v1: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Tuple" && v1.__tag == "Tuple"
              then 
                let
                  x1 = v.__field0;
                  y1 = v.__field1;
                  x2 = v1.__field0;
                  y2 = v1.__field1;
                in
                  Tuple (module."Data.HeytingAlgebra".implies dictHeytingAlgebra x1 x2) (module."Data.HeytingAlgebra".implies dictHeytingAlgebra1 y1 y2)
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/tuples/master/src/Data/Tuple.purs at 67:1 - 73:42";
        in
          __pattern0 __patternFail;
      conj = v: v1: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Tuple" && v1.__tag == "Tuple"
              then 
                let
                  x1 = v.__field0;
                  y1 = v.__field1;
                  x2 = v1.__field0;
                  y2 = v1.__field1;
                in
                  Tuple (module."Data.HeytingAlgebra".conj dictHeytingAlgebra x1 x2) (module."Data.HeytingAlgebra".conj dictHeytingAlgebra1 y1 y2)
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/tuples/master/src/Data/Tuple.purs at 67:1 - 73:42";
        in
          __pattern0 __patternFail;
      disj = v: v1: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Tuple" && v1.__tag == "Tuple"
              then 
                let
                  x1 = v.__field0;
                  y1 = v.__field1;
                  x2 = v1.__field0;
                  y2 = v1.__field1;
                in
                  Tuple (module."Data.HeytingAlgebra".disj dictHeytingAlgebra x1 x2) (module."Data.HeytingAlgebra".disj dictHeytingAlgebra1 y1 y2)
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/tuples/master/src/Data/Tuple.purs at 67:1 - 73:42";
        in
          __pattern0 __patternFail;
      not = v: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Tuple"
              then 
                let
                  x = v.__field0;
                  y = v.__field1;
                in
                  Tuple (module."Data.HeytingAlgebra".not dictHeytingAlgebra x) (module."Data.HeytingAlgebra".not dictHeytingAlgebra1 y)
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/tuples/master/src/Data/Tuple.purs at 67:1 - 73:42";
        in
          __pattern0 __patternFail;
    };
  genericTuple = 
    { to = x: 
        let
          __pattern0 = __fail: 
            if x.__tag == "Product"
              then 
                let
                  arg = x.__field0;
                  arg1 = x.__field1;
                in
                  Tuple arg arg1
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/tuples/master/src/Data/Tuple.purs at 85:1 - 85:54";
        in
          __pattern0 __patternFail;
      from = x: 
        let
          __pattern0 = __fail: 
            if x.__tag == "Tuple"
              then 
                let
                  arg = x.__field0;
                  arg1 = x.__field1;
                in
                  module."Data.Generic.Rep".Product arg arg1
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/tuples/master/src/Data/Tuple.purs at 85:1 - 85:54";
        in
          __pattern0 __patternFail;
    };
  functorTuple = 
    { map = f: m: 
        let
          __pattern0 = __fail: 
            if m.__tag == "Tuple"
              then 
                let
                  v = m.__field0;
                  v1 = m.__field1;
                in
                  Tuple v (f v1)
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/tuples/master/src/Data/Tuple.purs at 83:1 - 83:50";
        in
          __pattern0 __patternFail;
    };
  invariantTuple = {imap = module."Data.Functor.Invariant".imapF functorTuple;};
  fst = v: 
    let
      __pattern0 = __fail: 
        if v.__tag == "Tuple"
          then 
            let
              a = v.__field0;
            in
              a
          else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/tuples/master/src/Data/Tuple.purs at 118:1 - 118:34";
    in
      __pattern0 __patternFail;
  lazyTuple = dictLazy: dictLazy1: {defer = f: Tuple (module."Data.Function".apply (module."Control.Lazy".defer dictLazy) (v: fst (f module."Data.Unit".unit))) (module."Data.Function".apply (module."Control.Lazy".defer dictLazy1) (v: snd (f module."Data.Unit".unit)));};
  extendTuple = 
    { extend = f: v: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Tuple"
              then 
                let
                  f1 = f;
                  t = v;
                  a = v.__field0;
                in
                  Tuple a (f1 t)
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/tuples/master/src/Data/Tuple.purs at 108:1 - 109:41";
        in
          __pattern0 __patternFail;
      "Functor0" = __unused: functorTuple;
    };
  eqTuple = dictEq: dictEq1: 
    { eq = x: y: 
        let
          __pattern0 = __fail: 
            if x.__tag == "Tuple" && y.__tag == "Tuple"
              then 
                let
                  l = x.__field0;
                  l1 = x.__field1;
                  r = y.__field0;
                  r1 = y.__field1;
                in
                  module."Data.HeytingAlgebra".conj module."Data.HeytingAlgebra".heytingAlgebraBoolean (module."Data.Eq".eq dictEq l r) (module."Data.Eq".eq dictEq1 l1 r1)
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/tuples/master/src/Data/Tuple.purs at 25:1 - 25:58";
        in
          __pattern0 __patternFail;
    };
  ordTuple = dictOrd: dictOrd1: 
    { compare = x: y: 
        let
          __pattern0 = __fail: 
            if x.__tag == "Tuple" && y.__tag == "Tuple"
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
                      __patternFail = builtins.throw "Pattern match failure in .spago/tuples/master/src/Data/Tuple.purs at 33:1 - 33:62";
                    in
                      __pattern0 (__pattern1 (__pattern2 __patternFail))
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/tuples/master/src/Data/Tuple.purs at 33:1 - 33:62";
        in
          __pattern0 __patternFail;
      "Eq0" = __unused: eqTuple (dictOrd."Eq0" module."Prim".undefined) (dictOrd1."Eq0" module."Prim".undefined);
    };
  eq1Tuple = dictEq: {eq1 = dictEq1: module."Data.Eq".eq (eqTuple dictEq dictEq1);};
  ord1Tuple = dictOrd: 
    { compare1 = dictOrd1: module."Data.Ord".compare (ordTuple dictOrd dictOrd1);
      "Eq10" = __unused: eq1Tuple (dictOrd."Eq0" module."Prim".undefined);
    };
  curry = f: a: b: f (Tuple a b);
  comonadTuple = 
    { extract = snd;
      "Extend0" = __unused: extendTuple;
    };
  commutativeRingTuple = dictCommutativeRing: dictCommutativeRing1: {"Ring0" = __unused: ringTuple (dictCommutativeRing."Ring0" module."Prim".undefined) (dictCommutativeRing1."Ring0" module."Prim".undefined);};
  boundedTuple = dictBounded: dictBounded1: 
    { top = Tuple (module."Data.Bounded".top dictBounded) (module."Data.Bounded".top dictBounded1);
      bottom = Tuple (module."Data.Bounded".bottom dictBounded) (module."Data.Bounded".bottom dictBounded1);
      "Ord0" = __unused: ordTuple (dictBounded."Ord0" module."Prim".undefined) (dictBounded1."Ord0" module."Prim".undefined);
    };
  booleanAlgebraTuple = dictBooleanAlgebra: dictBooleanAlgebra1: {"HeytingAlgebra0" = __unused: heytingAlgebraTuple (dictBooleanAlgebra."HeytingAlgebra0" module."Prim".undefined) (dictBooleanAlgebra1."HeytingAlgebra0" module."Prim".undefined);};
  applyTuple = dictSemigroup: 
    { apply = v: v1: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Tuple" && v1.__tag == "Tuple"
              then 
                let
                  a1 = v.__field0;
                  f = v.__field1;
                  a2 = v1.__field0;
                  x = v1.__field1;
                in
                  Tuple (module."Data.Semigroup".append dictSemigroup a1 a2) (f x)
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/tuples/master/src/Data/Tuple.purs at 96:1 - 97:59";
        in
          __pattern0 __patternFail;
      "Functor0" = __unused: functorTuple;
    };
  bindTuple = dictSemigroup: 
    { bind = v: f: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Tuple"
              then 
                let
                  a1 = v.__field0;
                  b = v.__field1;
                  f1 = f;
                in
                  
                  let
                    v1 = f1 b;
                  in
                    
                    let
                      __pattern0 = __fail: 
                        if v1.__tag == "Tuple"
                          then 
                            let
                              a2 = v1.__field0;
                              c = v1.__field1;
                            in
                              Tuple (module."Data.Semigroup".append dictSemigroup a1 a2) c
                          else __fail;
                      __patternFail = builtins.throw "Pattern match failure in .spago/tuples/master/src/Data/Tuple.purs at 103:25 - 104:37";
                    in
                      __pattern0 __patternFail
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/tuples/master/src/Data/Tuple.purs at 102:1 - 104:37";
        in
          __pattern0 __patternFail;
      "Apply0" = __unused: applyTuple dictSemigroup;
    };
  applicativeTuple = dictMonoid: 
    { pure = Tuple (module."Data.Monoid".mempty dictMonoid);
      "Apply0" = __unused: applyTuple (dictMonoid."Semigroup0" module."Prim".undefined);
    };
  monadTuple = dictMonoid: 
    { "Applicative0" = __unused: applicativeTuple dictMonoid;
      "Bind1" = __unused: bindTuple (dictMonoid."Semigroup0" module."Prim".undefined);
    };
in
  {inherit Tuple fst snd curry uncurry swap showTuple eqTuple eq1Tuple ordTuple ord1Tuple boundedTuple semigroupoidTuple semigroupTuple monoidTuple semiringTuple ringTuple commutativeRingTuple heytingAlgebraTuple booleanAlgebraTuple functorTuple genericTuple invariantTuple applyTuple applicativeTuple bindTuple monadTuple extendTuple comonadTuple lazyTuple;}