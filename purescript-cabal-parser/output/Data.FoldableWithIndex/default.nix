
let
  module = 
    { "Control.Applicative" = import ../Control.Applicative;
      "Control.Apply" = import ../Control.Apply;
      "Control.Bind" = import ../Control.Bind;
      "Control.Category" = import ../Control.Category;
      "Control.Semigroupoid" = import ../Control.Semigroupoid;
      "Data.Const" = import ../Data.Const;
      "Data.Either" = import ../Data.Either;
      "Data.Foldable" = import ../Data.Foldable;
      "Data.Function" = import ../Data.Function;
      "Data.Functor.App" = import ../Data.Functor.App;
      "Data.Functor.Compose" = import ../Data.Functor.Compose;
      "Data.Functor.Coproduct" = import ../Data.Functor.Coproduct;
      "Data.Functor.Product" = import ../Data.Functor.Product;
      "Data.FunctorWithIndex" = import ../Data.FunctorWithIndex;
      "Data.Identity" = import ../Data.Identity;
      "Data.Maybe" = import ../Data.Maybe;
      "Data.Maybe.First" = import ../Data.Maybe.First;
      "Data.Maybe.Last" = import ../Data.Maybe.Last;
      "Data.Monoid" = import ../Data.Monoid;
      "Data.Monoid.Additive" = import ../Data.Monoid.Additive;
      "Data.Monoid.Conj" = import ../Data.Monoid.Conj;
      "Data.Monoid.Disj" = import ../Data.Monoid.Disj;
      "Data.Monoid.Dual" = import ../Data.Monoid.Dual;
      "Data.Monoid.Endo" = import ../Data.Monoid.Endo;
      "Data.Monoid.Multiplicative" = import ../Data.Monoid.Multiplicative;
      "Data.Newtype" = import ../Data.Newtype;
      "Data.Semigroup" = import ../Data.Semigroup;
      "Data.Tuple" = import ../Data.Tuple;
      "Data.Unit" = import ../Data.Unit;
      "Prelude" = import ../Prelude;
    };
  FoldableWithIndex-Dict = x: x;
  foldrWithIndex = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.foldrWithIndex;
      __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/FoldableWithIndex.purs at 63:3 - 63:68";
    in
      __pattern0 __patternFail;
  traverseWithIndex_ = dictApplicative: dictFoldableWithIndex: f: foldrWithIndex dictFoldableWithIndex (i: module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn (module."Control.Apply".applySecond (dictApplicative."Apply0" module."Prim".undefined)) (f i)) (module."Control.Applicative".pure dictApplicative module."Data.Unit".unit);
  forWithIndex_ = dictApplicative: dictFoldableWithIndex: module."Data.Function".flip (traverseWithIndex_ dictApplicative dictFoldableWithIndex);
  foldrDefault = dictFoldableWithIndex: f: foldrWithIndex dictFoldableWithIndex (module."Data.Function".const f);
  foldlWithIndex = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.foldlWithIndex;
      __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/FoldableWithIndex.purs at 64:3 - 64:68";
    in
      __pattern0 __patternFail;
  foldlDefault = dictFoldableWithIndex: f: foldlWithIndex dictFoldableWithIndex (module."Data.Function".const f);
  foldableWithIndexTuple = 
    { foldrWithIndex = f: z: v: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Tuple"
              then 
                let
                  f1 = f;
                  z1 = z;
                  x = v.__field1;
                in
                  f1 module."Data.Unit".unit x z1
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/FoldableWithIndex.purs at 172:1 - 175:44";
        in
          __pattern0 __patternFail;
      foldlWithIndex = f: z: v: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Tuple"
              then 
                let
                  f1 = f;
                  z1 = z;
                  x = v.__field1;
                in
                  f1 module."Data.Unit".unit z1 x
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/FoldableWithIndex.purs at 172:1 - 175:44";
        in
          __pattern0 __patternFail;
      foldMapWithIndex = dictMonoid: f: v: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Tuple"
              then 
                let
                  f1 = f;
                  x = v.__field1;
                in
                  f1 module."Data.Unit".unit x
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/FoldableWithIndex.purs at 172:1 - 175:44";
        in
          __pattern0 __patternFail;
      "Foldable0" = __unused: module."Data.Foldable".foldableTuple;
    };
  foldableWithIndexMultiplicative = 
    { foldrWithIndex = f: module."Data.Function".apply (module."Data.Foldable".foldr module."Data.Foldable".foldableMultiplicative) (f module."Data.Unit".unit);
      foldlWithIndex = f: module."Data.Function".apply (module."Data.Foldable".foldl module."Data.Foldable".foldableMultiplicative) (f module."Data.Unit".unit);
      foldMapWithIndex = dictMonoid: f: module."Data.Function".apply (module."Data.Foldable".foldMap module."Data.Foldable".foldableMultiplicative dictMonoid) (f module."Data.Unit".unit);
      "Foldable0" = __unused: module."Data.Foldable".foldableMultiplicative;
    };
  foldableWithIndexMaybe = 
    { foldrWithIndex = f: module."Data.Function".apply (module."Data.Foldable".foldr module."Data.Foldable".foldableMaybe) (f module."Data.Unit".unit);
      foldlWithIndex = f: module."Data.Function".apply (module."Data.Foldable".foldl module."Data.Foldable".foldableMaybe) (f module."Data.Unit".unit);
      foldMapWithIndex = dictMonoid: f: module."Data.Function".apply (module."Data.Foldable".foldMap module."Data.Foldable".foldableMaybe dictMonoid) (f module."Data.Unit".unit);
      "Foldable0" = __unused: module."Data.Foldable".foldableMaybe;
    };
  foldableWithIndexLast = 
    { foldrWithIndex = f: module."Data.Function".apply (module."Data.Foldable".foldr module."Data.Foldable".foldableLast) (f module."Data.Unit".unit);
      foldlWithIndex = f: module."Data.Function".apply (module."Data.Foldable".foldl module."Data.Foldable".foldableLast) (f module."Data.Unit".unit);
      foldMapWithIndex = dictMonoid: f: module."Data.Function".apply (module."Data.Foldable".foldMap module."Data.Foldable".foldableLast dictMonoid) (f module."Data.Unit".unit);
      "Foldable0" = __unused: module."Data.Foldable".foldableLast;
    };
  foldableWithIndexIdentity = 
    { foldrWithIndex = f: z: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              z1 = z;
              x = v;
            in
              f1 module."Data.Unit".unit x z1;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/FoldableWithIndex.purs at 177:1 - 180:45";
        in
          __pattern0 __patternFail;
      foldlWithIndex = f: z: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              z1 = z;
              x = v;
            in
              f1 module."Data.Unit".unit z1 x;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/FoldableWithIndex.purs at 177:1 - 180:45";
        in
          __pattern0 __patternFail;
      foldMapWithIndex = dictMonoid: f: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              x = v;
            in
              f1 module."Data.Unit".unit x;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/FoldableWithIndex.purs at 177:1 - 180:45";
        in
          __pattern0 __patternFail;
      "Foldable0" = __unused: module."Data.Foldable".foldableIdentity;
    };
  foldableWithIndexFirst = 
    { foldrWithIndex = f: module."Data.Function".apply (module."Data.Foldable".foldr module."Data.Foldable".foldableFirst) (f module."Data.Unit".unit);
      foldlWithIndex = f: module."Data.Function".apply (module."Data.Foldable".foldl module."Data.Foldable".foldableFirst) (f module."Data.Unit".unit);
      foldMapWithIndex = dictMonoid: f: module."Data.Function".apply (module."Data.Foldable".foldMap module."Data.Foldable".foldableFirst dictMonoid) (f module."Data.Unit".unit);
      "Foldable0" = __unused: module."Data.Foldable".foldableFirst;
    };
  foldableWithIndexEither = 
    { foldrWithIndex = v: z: v1: 
        let
          __pattern0 = __fail: 
            if v1.__tag == "Left"
              then 
                let
                  z1 = z;
                in
                  z1
              else __fail;
          __pattern1 = __fail: 
            if v1.__tag == "Right"
              then 
                let
                  f = v;
                  z1 = z;
                  x = v1.__field0;
                in
                  f module."Data.Unit".unit x z1
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/FoldableWithIndex.purs at 164:1 - 170:42";
        in
          __pattern0 (__pattern1 __patternFail);
      foldlWithIndex = v: z: v1: 
        let
          __pattern0 = __fail: 
            if v1.__tag == "Left"
              then 
                let
                  z1 = z;
                in
                  z1
              else __fail;
          __pattern1 = __fail: 
            if v1.__tag == "Right"
              then 
                let
                  f = v;
                  z1 = z;
                  x = v1.__field0;
                in
                  f module."Data.Unit".unit z1 x
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/FoldableWithIndex.purs at 164:1 - 170:42";
        in
          __pattern0 (__pattern1 __patternFail);
      foldMapWithIndex = dictMonoid: v: v1: 
        let
          __pattern0 = __fail: if v1.__tag == "Left" then module."Data.Monoid".mempty dictMonoid else __fail;
          __pattern1 = __fail: 
            if v1.__tag == "Right"
              then 
                let
                  f = v;
                  x = v1.__field0;
                in
                  f module."Data.Unit".unit x
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/FoldableWithIndex.purs at 164:1 - 170:42";
        in
          __pattern0 (__pattern1 __patternFail);
      "Foldable0" = __unused: module."Data.Foldable".foldableEither;
    };
  foldableWithIndexDual = 
    { foldrWithIndex = f: module."Data.Function".apply (module."Data.Foldable".foldr module."Data.Foldable".foldableDual) (f module."Data.Unit".unit);
      foldlWithIndex = f: module."Data.Function".apply (module."Data.Foldable".foldl module."Data.Foldable".foldableDual) (f module."Data.Unit".unit);
      foldMapWithIndex = dictMonoid: f: module."Data.Function".apply (module."Data.Foldable".foldMap module."Data.Foldable".foldableDual dictMonoid) (f module."Data.Unit".unit);
      "Foldable0" = __unused: module."Data.Foldable".foldableDual;
    };
  foldableWithIndexDisj = 
    { foldrWithIndex = f: module."Data.Function".apply (module."Data.Foldable".foldr module."Data.Foldable".foldableDisj) (f module."Data.Unit".unit);
      foldlWithIndex = f: module."Data.Function".apply (module."Data.Foldable".foldl module."Data.Foldable".foldableDisj) (f module."Data.Unit".unit);
      foldMapWithIndex = dictMonoid: f: module."Data.Function".apply (module."Data.Foldable".foldMap module."Data.Foldable".foldableDisj dictMonoid) (f module."Data.Unit".unit);
      "Foldable0" = __unused: module."Data.Foldable".foldableDisj;
    };
  foldableWithIndexConst = 
    { foldrWithIndex = v: z: v1: z;
      foldlWithIndex = v: z: v1: z;
      foldMapWithIndex = dictMonoid: v: v1: module."Data.Monoid".mempty dictMonoid;
      "Foldable0" = __unused: module."Data.Foldable".foldableConst;
    };
  foldableWithIndexConj = 
    { foldrWithIndex = f: module."Data.Function".apply (module."Data.Foldable".foldr module."Data.Foldable".foldableConj) (f module."Data.Unit".unit);
      foldlWithIndex = f: module."Data.Function".apply (module."Data.Foldable".foldl module."Data.Foldable".foldableConj) (f module."Data.Unit".unit);
      foldMapWithIndex = dictMonoid: f: module."Data.Function".apply (module."Data.Foldable".foldMap module."Data.Foldable".foldableConj dictMonoid) (f module."Data.Unit".unit);
      "Foldable0" = __unused: module."Data.Foldable".foldableConj;
    };
  foldableWithIndexAdditive = 
    { foldrWithIndex = f: module."Data.Function".apply (module."Data.Foldable".foldr module."Data.Foldable".foldableAdditive) (f module."Data.Unit".unit);
      foldlWithIndex = f: module."Data.Function".apply (module."Data.Foldable".foldl module."Data.Foldable".foldableAdditive) (f module."Data.Unit".unit);
      foldMapWithIndex = dictMonoid: f: module."Data.Function".apply (module."Data.Foldable".foldMap module."Data.Foldable".foldableAdditive dictMonoid) (f module."Data.Unit".unit);
      "Foldable0" = __unused: module."Data.Foldable".foldableAdditive;
    };
  foldWithIndexM = dictFoldableWithIndex: dictMonad: f: a0: foldlWithIndex dictFoldableWithIndex (i: ma: b: module."Control.Bind".bind (dictMonad."Bind1" module."Prim".undefined) ma (module."Data.Function".flip (f i) b)) (module."Control.Applicative".pure (dictMonad."Applicative0" module."Prim".undefined) a0);
  foldMapWithIndexDefaultR = dictFoldableWithIndex: dictMonoid: f: foldrWithIndex dictFoldableWithIndex (i: x: acc: module."Data.Semigroup".append (dictMonoid."Semigroup0" module."Prim".undefined) (f i x) acc) (module."Data.Monoid".mempty dictMonoid);
  foldableWithIndexArray = 
    { foldrWithIndex = f: z: module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn 
        ( module."Data.Foldable".foldr module."Data.Foldable".foldableArray 
          ( v: 
            let
              __pattern0 = __fail: 
                if v.__tag == "Tuple"
                  then 
                    let
                      i = v.__field0;
                      x = v.__field1;
                    in
                      y: f i x y
                  else __fail;
              __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/FoldableWithIndex.purs at 120:31 - 120:56";
            in
              __pattern0 __patternFail
          ) z
        ) (module."Data.FunctorWithIndex".mapWithIndex module."Data.FunctorWithIndex".functorWithIndexArray module."Data.Tuple".Tuple);
      foldlWithIndex = f: z: module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn 
        ( module."Data.Foldable".foldl module."Data.Foldable".foldableArray 
          ( y: v: 
            let
              __pattern0 = __fail: 
                if v.__tag == "Tuple"
                  then 
                    let
                      i = v.__field0;
                      x = v.__field1;
                    in
                      f i y x
                  else __fail;
              __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/FoldableWithIndex.purs at 121:31 - 121:56";
            in
              __pattern0 __patternFail
          ) z
        ) (module."Data.FunctorWithIndex".mapWithIndex module."Data.FunctorWithIndex".functorWithIndexArray module."Data.Tuple".Tuple);
      foldMapWithIndex = dictMonoid: foldMapWithIndexDefaultR foldableWithIndexArray dictMonoid;
      "Foldable0" = __unused: module."Data.Foldable".foldableArray;
    };
  foldMapWithIndexDefaultL = dictFoldableWithIndex: dictMonoid: f: foldlWithIndex dictFoldableWithIndex (i: acc: x: module."Data.Semigroup".append (dictMonoid."Semigroup0" module."Prim".undefined) acc (f i x)) (module."Data.Monoid".mempty dictMonoid);
  foldMapWithIndex = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.foldMapWithIndex;
      __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/FoldableWithIndex.purs at 65:3 - 65:72";
    in
      __pattern0 __patternFail;
  foldableWithIndexApp = dictFoldableWithIndex: 
    { foldrWithIndex = f: z: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              z1 = z;
              x = v;
            in
              foldrWithIndex dictFoldableWithIndex f1 z1 x;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/FoldableWithIndex.purs at 202:1 - 205:52";
        in
          __pattern0 __patternFail;
      foldlWithIndex = f: z: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              z1 = z;
              x = v;
            in
              foldlWithIndex dictFoldableWithIndex f1 z1 x;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/FoldableWithIndex.purs at 202:1 - 205:52";
        in
          __pattern0 __patternFail;
      foldMapWithIndex = dictMonoid: f: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              x = v;
            in
              foldMapWithIndex dictFoldableWithIndex dictMonoid f1 x;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/FoldableWithIndex.purs at 202:1 - 205:52";
        in
          __pattern0 __patternFail;
      "Foldable0" = __unused: module."Data.Foldable".foldableApp (dictFoldableWithIndex."Foldable0" module."Prim".undefined);
    };
  foldableWithIndexCompose = dictFoldableWithIndex: dictFoldableWithIndex1: 
    { foldrWithIndex = f: i: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              i1 = i;
              fga = v;
            in
              foldrWithIndex dictFoldableWithIndex (a: module."Data.Function".flip (foldrWithIndex dictFoldableWithIndex1 (module."Data.Tuple".curry f1 a))) i1 fga;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/FoldableWithIndex.purs at 197:1 - 200:89";
        in
          __pattern0 __patternFail;
      foldlWithIndex = f: i: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              i1 = i;
              fga = v;
            in
              foldlWithIndex dictFoldableWithIndex (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn (foldlWithIndex dictFoldableWithIndex1) (module."Data.Tuple".curry f1)) i1 fga;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/FoldableWithIndex.purs at 197:1 - 200:89";
        in
          __pattern0 __patternFail;
      foldMapWithIndex = dictMonoid: f: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              fga = v;
            in
              foldMapWithIndex dictFoldableWithIndex dictMonoid (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn (foldMapWithIndex dictFoldableWithIndex1 dictMonoid) (module."Data.Tuple".curry f1)) fga;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/FoldableWithIndex.purs at 197:1 - 200:89";
        in
          __pattern0 __patternFail;
      "Foldable0" = __unused: module."Data.Foldable".foldableCompose (dictFoldableWithIndex."Foldable0" module."Prim".undefined) (dictFoldableWithIndex1."Foldable0" module."Prim".undefined);
    };
  foldableWithIndexCoproduct = dictFoldableWithIndex: dictFoldableWithIndex1: 
    { foldrWithIndex = f: z: module."Data.Functor.Coproduct".coproduct (foldrWithIndex dictFoldableWithIndex (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn f module."Data.Either".Left) z) (foldrWithIndex dictFoldableWithIndex1 (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn f module."Data.Either".Right) z);
      foldlWithIndex = f: z: module."Data.Functor.Coproduct".coproduct (foldlWithIndex dictFoldableWithIndex (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn f module."Data.Either".Left) z) (foldlWithIndex dictFoldableWithIndex1 (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn f module."Data.Either".Right) z);
      foldMapWithIndex = dictMonoid: f: module."Data.Functor.Coproduct".coproduct (foldMapWithIndex dictFoldableWithIndex dictMonoid (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn f module."Data.Either".Left)) (foldMapWithIndex dictFoldableWithIndex1 dictMonoid (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn f module."Data.Either".Right));
      "Foldable0" = __unused: module."Data.Foldable".foldableCoproduct (dictFoldableWithIndex."Foldable0" module."Prim".undefined) (dictFoldableWithIndex1."Foldable0" module."Prim".undefined);
    };
  foldableWithIndexProduct = dictFoldableWithIndex: dictFoldableWithIndex1: 
    { foldrWithIndex = f: z: v: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Tuple"
              then 
                let
                  f1 = f;
                  z1 = z;
                  fa = v.__field0;
                  ga = v.__field1;
                in
                  foldrWithIndex dictFoldableWithIndex (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn f1 module."Data.Either".Left) (foldrWithIndex dictFoldableWithIndex1 (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn f1 module."Data.Either".Right) z1 ga) fa
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/FoldableWithIndex.purs at 187:1 - 190:117";
        in
          __pattern0 __patternFail;
      foldlWithIndex = f: z: v: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Tuple"
              then 
                let
                  f1 = f;
                  z1 = z;
                  fa = v.__field0;
                  ga = v.__field1;
                in
                  foldlWithIndex dictFoldableWithIndex1 (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn f1 module."Data.Either".Right) (foldlWithIndex dictFoldableWithIndex (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn f1 module."Data.Either".Left) z1 fa) ga
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/FoldableWithIndex.purs at 187:1 - 190:117";
        in
          __pattern0 __patternFail;
      foldMapWithIndex = dictMonoid: f: v: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Tuple"
              then 
                let
                  f1 = f;
                  fa = v.__field0;
                  ga = v.__field1;
                in
                  module."Data.Semigroup".append (dictMonoid."Semigroup0" module."Prim".undefined) (foldMapWithIndex dictFoldableWithIndex dictMonoid (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn f1 module."Data.Either".Left) fa) (foldMapWithIndex dictFoldableWithIndex1 dictMonoid (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn f1 module."Data.Either".Right) ga)
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/FoldableWithIndex.purs at 187:1 - 190:117";
        in
          __pattern0 __patternFail;
      "Foldable0" = __unused: module."Data.Foldable".foldableProduct (dictFoldableWithIndex."Foldable0" module."Prim".undefined) (dictFoldableWithIndex1."Foldable0" module."Prim".undefined);
    };
  foldlWithIndexDefault = dictFoldableWithIndex: c: u: xs: module."Data.Newtype".unwrap module."Prim".undefined (module."Data.Newtype".unwrap module."Prim".undefined (foldMapWithIndex dictFoldableWithIndex (module."Data.Monoid.Dual".monoidDual (module."Data.Monoid.Endo".monoidEndo module."Control.Category".categoryFn)) (i: module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn module."Data.Monoid.Dual".Dual (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn module."Data.Monoid.Endo".Endo (module."Data.Function".flip (c i)))) xs)) u;
  foldrWithIndexDefault = dictFoldableWithIndex: c: u: xs: module."Data.Newtype".unwrap module."Prim".undefined (foldMapWithIndex dictFoldableWithIndex (module."Data.Monoid.Endo".monoidEndo module."Control.Category".categoryFn) (i: module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn module."Data.Monoid.Endo".Endo (c i)) xs) u;
  surroundMapWithIndex = dictFoldableWithIndex: dictSemigroup: d: t: f: 
    let
      joined = i: a: m: module."Data.Semigroup".append dictSemigroup d (module."Data.Semigroup".append dictSemigroup (t i a) m);
    in
      module."Data.Newtype".unwrap module."Prim".undefined (foldMapWithIndex dictFoldableWithIndex (module."Data.Monoid.Endo".monoidEndo module."Control.Category".categoryFn) joined f) d;
  foldMapDefault = dictFoldableWithIndex: dictMonoid: f: foldMapWithIndex dictFoldableWithIndex dictMonoid (module."Data.Function".const f);
  findWithIndex = dictFoldableWithIndex: p: 
    let
      go = v: v1: v2: 
        let
          __pattern0 = __fail: 
            if v1.__tag == "Nothing"
              then 
                let
                  i = v;
                  x = v2;
                in
                  
                  if p i x
                    then module."Data.Maybe".Just 
                      { index = i;
                        value = x;
                      }
                    else __fail
              else __fail;
          __pattern1 = __fail: 
            let
              r = v1;
            in
              r;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/FoldableWithIndex.purs at 324:5 - 328:42";
        in
          __pattern0 (__pattern1 __patternFail);
    in
      foldlWithIndex dictFoldableWithIndex go module."Data.Maybe".Nothing;
  findMapWithIndex = dictFoldableWithIndex: f: 
    let
      go = v: v1: v2: 
        let
          __pattern0 = __fail: 
            if v1.__tag == "Nothing"
              then 
                let
                  i = v;
                  x = v2;
                in
                  f i x
              else __fail;
          __pattern1 = __fail: 
            let
              r = v1;
            in
              r;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/FoldableWithIndex.purs at 342:5 - 346:17";
        in
          __pattern0 (__pattern1 __patternFail);
    in
      foldlWithIndex dictFoldableWithIndex go module."Data.Maybe".Nothing;
  anyWithIndex = dictFoldableWithIndex: dictHeytingAlgebra: t: module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn (module."Data.Newtype".unwrap module."Prim".undefined) (foldMapWithIndex dictFoldableWithIndex (module."Data.Monoid.Disj".monoidDisj dictHeytingAlgebra) (i: module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn module."Data.Monoid.Disj".Disj (t i)));
  allWithIndex = dictFoldableWithIndex: dictHeytingAlgebra: t: module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn (module."Data.Newtype".unwrap module."Prim".undefined) (foldMapWithIndex dictFoldableWithIndex (module."Data.Monoid.Conj".monoidConj dictHeytingAlgebra) (i: module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn module."Data.Monoid.Conj".Conj (t i)));
in
  {inherit foldrWithIndex foldlWithIndex foldMapWithIndex foldrWithIndexDefault foldlWithIndexDefault foldMapWithIndexDefaultR foldMapWithIndexDefaultL foldWithIndexM traverseWithIndex_ forWithIndex_ surroundMapWithIndex allWithIndex anyWithIndex findWithIndex findMapWithIndex foldrDefault foldlDefault foldMapDefault foldableWithIndexArray foldableWithIndexMaybe foldableWithIndexFirst foldableWithIndexLast foldableWithIndexAdditive foldableWithIndexDual foldableWithIndexDisj foldableWithIndexConj foldableWithIndexMultiplicative foldableWithIndexEither foldableWithIndexTuple foldableWithIndexIdentity foldableWithIndexConst foldableWithIndexProduct foldableWithIndexCoproduct foldableWithIndexCompose foldableWithIndexApp;}