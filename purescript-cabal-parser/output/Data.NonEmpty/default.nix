
let
  module = 
    { "Control.Alt" = import ../Control.Alt;
      "Control.Alternative" = import ../Control.Alternative;
      "Control.Applicative" = import ../Control.Applicative;
      "Control.Apply" = import ../Control.Apply;
      "Control.Plus" = import ../Control.Plus;
      "Control.Semigroupoid" = import ../Control.Semigroupoid;
      "Data.Eq" = import ../Data.Eq;
      "Data.Foldable" = import ../Data.Foldable;
      "Data.FoldableWithIndex" = import ../Data.FoldableWithIndex;
      "Data.Function" = import ../Data.Function;
      "Data.Functor" = import ../Data.Functor;
      "Data.FunctorWithIndex" = import ../Data.FunctorWithIndex;
      "Data.HeytingAlgebra" = import ../Data.HeytingAlgebra;
      "Data.Maybe" = import ../Data.Maybe;
      "Data.Ord" = import ../Data.Ord;
      "Data.Ordering" = import ../Data.Ordering;
      "Data.Semigroup" = import ../Data.Semigroup;
      "Data.Semigroup.Foldable" = import ../Data.Semigroup.Foldable;
      "Data.Show" = import ../Data.Show;
      "Data.Traversable" = import ../Data.Traversable;
      "Data.TraversableWithIndex" = import ../Data.TraversableWithIndex;
      "Data.Tuple" = import ../Data.Tuple;
      "Data.Unfoldable" = import ../Data.Unfoldable;
      "Data.Unfoldable1" = import ../Data.Unfoldable1;
      "Prelude" = import ../Prelude;
      "Prim.TypeError" = import ../Prim.TypeError;
    };
  NonEmpty = value0: value1: 
    { __tag = "NonEmpty";
      __field0 = value0;
      __field1 = value1;
    };
  unfoldable1NonEmpty = dictUnfoldable: {unfoldr1 = f: b: module."Data.Function".apply (module."Data.Tuple".uncurry NonEmpty) (module."Data.Functor".map module."Data.Tuple".functorTuple (module."Data.Unfoldable".unfoldr dictUnfoldable (module."Data.Functor".map module."Data.Maybe".functorMaybe f)) (f b));};
  tail = v: 
    let
      __pattern0 = __fail: 
        if v.__tag == "NonEmpty"
          then 
            let
              xs = v.__field1;
            in
              xs
          else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/nonempty/master/src/Data/NonEmpty.purs at 120:1 - 120:40";
    in
      __pattern0 __patternFail;
  singleton = dictPlus: a: NonEmpty a (module."Control.Plus".empty dictPlus);
  showNonEmpty = dictShow: dictShow1: 
    { show = v: 
        let
          __pattern0 = __fail: 
            if v.__tag == "NonEmpty"
              then 
                let
                  a = v.__field0;
                  fa = v.__field1;
                in
                  module."Data.Semigroup".append module."Data.Semigroup".semigroupString "(NonEmpty " (module."Data.Semigroup".append module."Data.Semigroup".semigroupString (module."Data.Show".show dictShow a) (module."Data.Semigroup".append module."Data.Semigroup".semigroupString " " (module."Data.Semigroup".append module."Data.Semigroup".semigroupString (module."Data.Show".show dictShow1 fa) ")")))
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/nonempty/master/src/Data/NonEmpty.purs at 123:1 - 124:67";
        in
          __pattern0 __patternFail;
    };
  oneOf = dictAlternative: v: 
    let
      __pattern0 = __fail: 
        if v.__tag == "NonEmpty"
          then 
            let
              a = v.__field0;
              fa = v.__field1;
            in
              module."Control.Alt".alt ((dictAlternative."Plus1" module."Prim".undefined)."Alt0" module."Prim".undefined) (module."Control.Applicative".pure (dictAlternative."Applicative0" module."Prim".undefined) a) fa
          else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/nonempty/master/src/Data/NonEmpty.purs at 104:1 - 104:58";
    in
      __pattern0 __patternFail;
  head = v: 
    let
      __pattern0 = __fail: 
        if v.__tag == "NonEmpty"
          then 
            let
              x = v.__field0;
            in
              x
          else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/nonempty/master/src/Data/NonEmpty.purs at 112:1 - 112:38";
    in
      __pattern0 __patternFail;
  functorNonEmpty = dictFunctor: 
    { map = f: m: 
        let
          __pattern0 = __fail: 
            if m.__tag == "NonEmpty"
              then 
                let
                  v = m.__field0;
                  v1 = m.__field1;
                in
                  NonEmpty (f v) (module."Data.Functor".map dictFunctor f v1)
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/nonempty/master/src/Data/NonEmpty.purs at 134:1 - 134:69";
        in
          __pattern0 __patternFail;
    };
  functorWithIndex = dictFunctorWithIndex: 
    { mapWithIndex = f: v: 
        let
          __pattern0 = __fail: 
            if v.__tag == "NonEmpty"
              then 
                let
                  f1 = f;
                  a = v.__field0;
                  fa = v.__field1;
                in
                  NonEmpty (f1 module."Data.Maybe".Nothing a) (module."Data.FunctorWithIndex".mapWithIndex dictFunctorWithIndex (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn f1 module."Data.Maybe".Just) fa)
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/nonempty/master/src/Data/NonEmpty.purs at 136:1 - 139:73";
        in
          __pattern0 __patternFail;
      "Functor0" = __unused: functorNonEmpty (dictFunctorWithIndex."Functor0" module."Prim".undefined);
    };
  fromNonEmpty = f: v: 
    let
      __pattern0 = __fail: 
        if v.__tag == "NonEmpty"
          then 
            let
              f1 = f;
              a = v.__field0;
              fa = v.__field1;
            in
              f1 a fa
          else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/nonempty/master/src/Data/NonEmpty.purs at 89:1 - 89:67";
    in
      __pattern0 __patternFail;
  foldableNonEmpty = dictFoldable: 
    { foldMap = dictMonoid: f: v: 
        let
          __pattern0 = __fail: 
            if v.__tag == "NonEmpty"
              then 
                let
                  f1 = f;
                  a = v.__field0;
                  fa = v.__field1;
                in
                  module."Data.Semigroup".append (dictMonoid."Semigroup0" module."Prim".undefined) (f1 a) (module."Data.Foldable".foldMap dictFoldable dictMonoid f1 fa)
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/nonempty/master/src/Data/NonEmpty.purs at 141:1 - 144:43";
        in
          __pattern0 __patternFail;
      foldl = f: b: v: 
        let
          __pattern0 = __fail: 
            if v.__tag == "NonEmpty"
              then 
                let
                  f1 = f;
                  b1 = b;
                  a = v.__field0;
                  fa = v.__field1;
                in
                  module."Data.Foldable".foldl dictFoldable f1 (f1 b1 a) fa
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/nonempty/master/src/Data/NonEmpty.purs at 141:1 - 144:43";
        in
          __pattern0 __patternFail;
      foldr = f: b: v: 
        let
          __pattern0 = __fail: 
            if v.__tag == "NonEmpty"
              then 
                let
                  f1 = f;
                  b1 = b;
                  a = v.__field0;
                  fa = v.__field1;
                in
                  f1 a (module."Data.Foldable".foldr dictFoldable f1 b1 fa)
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/nonempty/master/src/Data/NonEmpty.purs at 141:1 - 144:43";
        in
          __pattern0 __patternFail;
    };
  foldableWithIndexNonEmpty = dictFoldableWithIndex: 
    { foldMapWithIndex = dictMonoid: f: v: 
        let
          __pattern0 = __fail: 
            if v.__tag == "NonEmpty"
              then 
                let
                  f1 = f;
                  a = v.__field0;
                  fa = v.__field1;
                in
                  module."Data.Semigroup".append (dictMonoid."Semigroup0" module."Prim".undefined) (f1 module."Data.Maybe".Nothing a) (module."Data.FoldableWithIndex".foldMapWithIndex dictFoldableWithIndex dictMonoid (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn f1 module."Data.Maybe".Just) fa)
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/nonempty/master/src/Data/NonEmpty.purs at 146:1 - 151:80";
        in
          __pattern0 __patternFail;
      foldlWithIndex = f: b: v: 
        let
          __pattern0 = __fail: 
            if v.__tag == "NonEmpty"
              then 
                let
                  f1 = f;
                  b1 = b;
                  a = v.__field0;
                  fa = v.__field1;
                in
                  module."Data.FoldableWithIndex".foldlWithIndex dictFoldableWithIndex (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn f1 module."Data.Maybe".Just) (f1 module."Data.Maybe".Nothing b1 a) fa
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/nonempty/master/src/Data/NonEmpty.purs at 146:1 - 151:80";
        in
          __pattern0 __patternFail;
      foldrWithIndex = f: b: v: 
        let
          __pattern0 = __fail: 
            if v.__tag == "NonEmpty"
              then 
                let
                  f1 = f;
                  b1 = b;
                  a = v.__field0;
                  fa = v.__field1;
                in
                  f1 module."Data.Maybe".Nothing a (module."Data.FoldableWithIndex".foldrWithIndex dictFoldableWithIndex (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn f1 module."Data.Maybe".Just) b1 fa)
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/nonempty/master/src/Data/NonEmpty.purs at 146:1 - 151:80";
        in
          __pattern0 __patternFail;
      "Foldable0" = __unused: foldableNonEmpty (dictFoldableWithIndex."Foldable0" module."Prim".undefined);
    };
  traversableNonEmpty = dictTraversable: 
    { sequence = dictApplicative: v: 
        let
          __pattern0 = __fail: 
            if v.__tag == "NonEmpty"
              then 
                let
                  a = v.__field0;
                  fa = v.__field1;
                in
                  module."Control.Apply".apply (dictApplicative."Apply0" module."Prim".undefined) (module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined) NonEmpty a) (module."Data.Traversable".sequence dictTraversable dictApplicative fa)
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/nonempty/master/src/Data/NonEmpty.purs at 153:1 - 155:60";
        in
          __pattern0 __patternFail;
      traverse = dictApplicative: f: v: 
        let
          __pattern0 = __fail: 
            if v.__tag == "NonEmpty"
              then 
                let
                  f1 = f;
                  a = v.__field0;
                  fa = v.__field1;
                in
                  module."Control.Apply".apply (dictApplicative."Apply0" module."Prim".undefined) (module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined) NonEmpty (f1 a)) (module."Data.Traversable".traverse dictTraversable dictApplicative f1 fa)
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/nonempty/master/src/Data/NonEmpty.purs at 153:1 - 155:60";
        in
          __pattern0 __patternFail;
      "Functor0" = __unused: functorNonEmpty (dictTraversable."Functor0" module."Prim".undefined);
      "Foldable1" = __unused: foldableNonEmpty (dictTraversable."Foldable1" module."Prim".undefined);
    };
  traversableWithIndexNonEmpty = dictTraversableWithIndex: 
    { traverseWithIndex = dictApplicative: f: v: 
        let
          __pattern0 = __fail: 
            if v.__tag == "NonEmpty"
              then 
                let
                  f1 = f;
                  a = v.__field0;
                  fa = v.__field1;
                in
                  module."Control.Apply".apply (dictApplicative."Apply0" module."Prim".undefined) (module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined) NonEmpty (f1 module."Data.Maybe".Nothing a)) (module."Data.TraversableWithIndex".traverseWithIndex dictTraversableWithIndex dictApplicative (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn f1 module."Data.Maybe".Just) fa)
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/nonempty/master/src/Data/NonEmpty.purs at 157:1 - 161:67";
        in
          __pattern0 __patternFail;
      "FunctorWithIndex0" = __unused: functorWithIndex (dictTraversableWithIndex."FunctorWithIndex0" module."Prim".undefined);
      "FoldableWithIndex1" = __unused: foldableWithIndexNonEmpty (dictTraversableWithIndex."FoldableWithIndex1" module."Prim".undefined);
      "Traversable2" = __unused: traversableNonEmpty (dictTraversableWithIndex."Traversable2" module."Prim".undefined);
    };
  foldable1NonEmpty = dictFoldable: 
    { foldMap1 = dictSemigroup: f: v: 
        let
          __pattern0 = __fail: 
            if v.__tag == "NonEmpty"
              then 
                let
                  f1 = f;
                  a = v.__field0;
                  fa = v.__field1;
                in
                  module."Data.Foldable".foldl dictFoldable (s: a1: module."Data.Semigroup".append dictSemigroup s (f1 a1)) (f1 a) fa
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/nonempty/master/src/Data/NonEmpty.purs at 163:1 - 166:36";
        in
          __pattern0 __patternFail;
      foldr1 = f: v: 
        let
          __pattern0 = __fail: 
            if v.__tag == "NonEmpty"
              then 
                let
                  f1 = f;
                  a = v.__field0;
                  fa = v.__field1;
                in
                  module."Data.Function".apply (module."Data.Maybe".maybe a (f1 a)) (module."Data.Foldable".foldr dictFoldable (a1: module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn module."Data.Maybe".Just (module."Data.Maybe".maybe a1 (f1 a1))) module."Data.Maybe".Nothing fa)
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/nonempty/master/src/Data/NonEmpty.purs at 163:1 - 166:36";
        in
          __pattern0 __patternFail;
      foldl1 = f: v: 
        let
          __pattern0 = __fail: 
            if v.__tag == "NonEmpty"
              then 
                let
                  f1 = f;
                  a = v.__field0;
                  fa = v.__field1;
                in
                  module."Data.Foldable".foldl dictFoldable f1 a fa
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/nonempty/master/src/Data/NonEmpty.purs at 163:1 - 166:36";
        in
          __pattern0 __patternFail;
      "Foldable0" = __unused: foldableNonEmpty dictFoldable;
    };
  foldl1 = dictFoldable: dictWarn: module."Data.Semigroup.Foldable".foldl1 (foldable1NonEmpty dictFoldable);
  eqNonEmpty = dictEq1: dictEq: 
    { eq = x: y: 
        let
          __pattern0 = __fail: 
            if x.__tag == "NonEmpty" && y.__tag == "NonEmpty"
              then 
                let
                  l = x.__field0;
                  l1 = x.__field1;
                  r = y.__field0;
                  r1 = y.__field1;
                in
                  module."Data.HeytingAlgebra".conj module."Data.HeytingAlgebra".heytingAlgebraBoolean (module."Data.Eq".eq dictEq l r) (module."Data.Eq".eq1 dictEq1 dictEq l1 r1)
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/nonempty/master/src/Data/NonEmpty.purs at 126:1 - 126:65";
        in
          __pattern0 __patternFail;
    };
  ordNonEmpty = dictOrd1: dictOrd: 
    { compare = x: y: 
        let
          __pattern0 = __fail: 
            if x.__tag == "NonEmpty" && y.__tag == "NonEmpty"
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
                      __pattern2 = __fail: module."Data.Ord".compare1 dictOrd1 dictOrd l1 r1;
                      __patternFail = builtins.throw "Pattern match failure in .spago/nonempty/master/src/Data/NonEmpty.purs at 130:1 - 130:69";
                    in
                      __pattern0 (__pattern1 (__pattern2 __patternFail))
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/nonempty/master/src/Data/NonEmpty.purs at 130:1 - 130:69";
        in
          __pattern0 __patternFail;
      "Eq0" = __unused: eqNonEmpty (dictOrd1."Eq10" module."Prim".undefined) (dictOrd."Eq0" module."Prim".undefined);
    };
  eq1NonEmpty = dictEq1: {eq1 = dictEq: module."Data.Eq".eq (eqNonEmpty dictEq1 dictEq);};
  ord1NonEmpty = dictOrd1: 
    { compare1 = dictOrd: module."Data.Ord".compare (ordNonEmpty dictOrd1 dictOrd);
      "Eq10" = __unused: eq1NonEmpty (dictOrd1."Eq10" module."Prim".undefined);
    };
in
  {inherit NonEmpty singleton foldl1 fromNonEmpty oneOf head tail showNonEmpty eqNonEmpty eq1NonEmpty ordNonEmpty ord1NonEmpty functorNonEmpty functorWithIndex foldableNonEmpty foldableWithIndexNonEmpty traversableNonEmpty traversableWithIndexNonEmpty foldable1NonEmpty unfoldable1NonEmpty;}