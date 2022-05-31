
let
  module = 
    { "Control.Alt" = import ../Control.Alt;
      "Control.Applicative" = import ../Control.Applicative;
      "Control.Apply" = import ../Control.Apply;
      "Control.Bind" = import ../Control.Bind;
      "Control.Category" = import ../Control.Category;
      "Control.Plus" = import ../Control.Plus;
      "Control.Semigroupoid" = import ../Control.Semigroupoid;
      "Data.Const" = import ../Data.Const;
      "Data.Either" = import ../Data.Either;
      "Data.Eq" = import ../Data.Eq;
      "Data.Function" = import ../Data.Function;
      "Data.Functor.App" = import ../Data.Functor.App;
      "Data.Functor.Compose" = import ../Data.Functor.Compose;
      "Data.Functor.Coproduct" = import ../Data.Functor.Coproduct;
      "Data.Functor.Product" = import ../Data.Functor.Product;
      "Data.HeytingAlgebra" = import ../Data.HeytingAlgebra;
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
      "Data.Ord" = import ../Data.Ord;
      "Data.Ordering" = import ../Data.Ordering;
      "Data.Semigroup" = import ../Data.Semigroup;
      "Data.Semiring" = import ../Data.Semiring;
      "Data.Tuple" = import ../Data.Tuple;
      "Data.Unit" = import ../Data.Unit;
      "Prelude" = import ../Prelude;
    };
  foreign = import ./foreign.nix;
  foldrArray = foreign.foldrArray;
  foldlArray = foreign.foldlArray;
  Foldable-Dict = x: x;
  foldr = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.foldr;
      __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 74:3 - 74:54";
    in
      __pattern0 __patternFail;
  indexr = dictFoldable: idx: 
    let
      go = a: cursor: 
        let
          __pattern0 = __fail: if cursor.elem.__tag == "Just" then cursor else __fail;
          __pattern1 = __fail: 
            let
              __pattern0 = __fail: 
                if module."Data.Eq".eq module."Data.Eq".eqInt cursor.pos idx
                  then 
                    { elem = module."Data.Maybe".Just a;
                      pos = cursor.pos;
                    }
                  else __fail;
              __pattern1 = __fail: 
                { pos = module."Data.Semiring".add module."Data.Semiring".semiringInt cursor.pos 1;
                  elem = cursor.elem;
                };
              __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 413:9 - 415:58";
            in
              __pattern0 (__pattern1 __patternFail);
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 410:5 - 415:58";
        in
          __pattern0 (__pattern1 __patternFail);
    in
      module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn (v: v.elem) 
      ( foldr dictFoldable go 
        { elem = module."Data.Maybe".Nothing;
          pos = 0;
        }
      );
  null = dictFoldable: foldr dictFoldable (v: v1: false) true;
  oneOf = dictFoldable: dictPlus: foldr dictFoldable (module."Control.Alt".alt (dictPlus."Alt0" module."Prim".undefined)) (module."Control.Plus".empty dictPlus);
  oneOfMap = dictFoldable: dictPlus: f: foldr dictFoldable (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn (module."Control.Alt".alt (dictPlus."Alt0" module."Prim".undefined)) f) (module."Control.Plus".empty dictPlus);
  traverse_ = dictApplicative: dictFoldable: f: foldr dictFoldable (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn (module."Control.Apply".applySecond (dictApplicative."Apply0" module."Prim".undefined)) f) (module."Control.Applicative".pure dictApplicative module."Data.Unit".unit);
  for_ = dictApplicative: dictFoldable: module."Data.Function".flip (traverse_ dictApplicative dictFoldable);
  sequence_ = dictApplicative: dictFoldable: traverse_ dictApplicative dictFoldable (module."Control.Category".identity module."Control.Category".categoryFn);
  foldl = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.foldl;
      __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 75:3 - 75:54";
    in
      __pattern0 __patternFail;
  indexl = dictFoldable: idx: 
    let
      go = cursor: a: 
        let
          __pattern0 = __fail: if cursor.elem.__tag == "Just" then cursor else __fail;
          __pattern1 = __fail: 
            let
              __pattern0 = __fail: 
                if module."Data.Eq".eq module."Data.Eq".eqInt cursor.pos idx
                  then 
                    { elem = module."Data.Maybe".Just a;
                      pos = cursor.pos;
                    }
                  else __fail;
              __pattern1 = __fail: 
                { pos = module."Data.Semiring".add module."Data.Semiring".semiringInt cursor.pos 1;
                  elem = cursor.elem;
                };
              __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 401:9 - 403:58";
            in
              __pattern0 (__pattern1 __patternFail);
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 398:5 - 403:58";
        in
          __pattern0 (__pattern1 __patternFail);
    in
      module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn (v: v.elem) 
      ( foldl dictFoldable go 
        { elem = module."Data.Maybe".Nothing;
          pos = 0;
        }
      );
  intercalate = dictFoldable: dictMonoid: sep: xs: 
    let
      go = v: x: 
        let
          __pattern0 = __fail: 
            if v.init
              then 
                let
                  x1 = x;
                in
                  
                  { init = false;
                    acc = x1;
                  }
              else __fail;
          __pattern1 = __fail: 
            let
              acc = v.acc;
              x1 = x;
            in
              
              { init = false;
                acc = module."Data.Semigroup".append (dictMonoid."Semigroup0" module."Prim".undefined) acc (module."Data.Semigroup".append (dictMonoid."Semigroup0" module."Prim".undefined) sep x1);
              };
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 311:3 - 311:48";
        in
          __pattern0 (__pattern1 __patternFail);
    in
      
      ( foldl dictFoldable go 
        { init = true;
          acc = module."Data.Monoid".mempty dictMonoid;
        } xs
      ).acc;
  length = dictFoldable: dictSemiring: foldl dictFoldable (c: v: module."Data.Semiring".add dictSemiring (module."Data.Semiring".one dictSemiring) c) (module."Data.Semiring".zero dictSemiring);
  maximumBy = dictFoldable: cmp: 
    let
      max' = v: v1: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Nothing"
              then 
                let
                  x = v1;
                in
                  module."Data.Maybe".Just x
              else __fail;
          __pattern1 = __fail: 
            if v.__tag == "Just"
              then 
                let
                  x = v.__field0;
                  y = v1;
                in
                  module."Data.Maybe".Just 
                  ( 
                    let
                      __pattern0 = __fail: if module."Data.Eq".eq module."Data.Ordering".eqOrdering (cmp x y) module."Data.Ordering".GT then x else __fail;
                      __pattern1 = __fail: y;
                      __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 442:27 - 442:57";
                    in
                      __pattern0 (__pattern1 __patternFail)
                  )
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 441:3 - 441:27";
        in
          __pattern0 (__pattern1 __patternFail);
    in
      foldl dictFoldable max' module."Data.Maybe".Nothing;
  maximum = dictOrd: dictFoldable: maximumBy dictFoldable (module."Data.Ord".compare dictOrd);
  minimumBy = dictFoldable: cmp: 
    let
      min' = v: v1: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Nothing"
              then 
                let
                  x = v1;
                in
                  module."Data.Maybe".Just x
              else __fail;
          __pattern1 = __fail: 
            if v.__tag == "Just"
              then 
                let
                  x = v.__field0;
                  y = v1;
                in
                  module."Data.Maybe".Just 
                  ( 
                    let
                      __pattern0 = __fail: if module."Data.Eq".eq module."Data.Ordering".eqOrdering (cmp x y) module."Data.Ordering".LT then x else __fail;
                      __pattern1 = __fail: y;
                      __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 455:27 - 455:57";
                    in
                      __pattern0 (__pattern1 __patternFail)
                  )
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 454:3 - 454:27";
        in
          __pattern0 (__pattern1 __patternFail);
    in
      foldl dictFoldable min' module."Data.Maybe".Nothing;
  minimum = dictOrd: dictFoldable: minimumBy dictFoldable (module."Data.Ord".compare dictOrd);
  product = dictFoldable: dictSemiring: foldl dictFoldable (module."Data.Semiring".mul dictSemiring) (module."Data.Semiring".one dictSemiring);
  sum = dictFoldable: dictSemiring: foldl dictFoldable (module."Data.Semiring".add dictSemiring) (module."Data.Semiring".zero dictSemiring);
  foldableTuple = 
    { foldr = f: z: v: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Tuple"
              then 
                let
                  f1 = f;
                  z1 = z;
                  x = v.__field1;
                in
                  f1 x z1
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 189:1 - 192:30";
        in
          __pattern0 __patternFail;
      foldl = f: z: v: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Tuple"
              then 
                let
                  f1 = f;
                  z1 = z;
                  x = v.__field1;
                in
                  f1 z1 x
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 189:1 - 192:30";
        in
          __pattern0 __patternFail;
      foldMap = dictMonoid: f: v: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Tuple"
              then 
                let
                  f1 = f;
                  x = v.__field1;
                in
                  f1 x
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 189:1 - 192:30";
        in
          __pattern0 __patternFail;
    };
  foldableMultiplicative = 
    { foldr = f: z: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              z1 = z;
              x = v;
            in
              f1 x z1;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 176:1 - 179:37";
        in
          __pattern0 __patternFail;
      foldl = f: z: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              z1 = z;
              x = v;
            in
              f1 z1 x;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 176:1 - 179:37";
        in
          __pattern0 __patternFail;
      foldMap = dictMonoid: f: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              x = v;
            in
              f1 x;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 176:1 - 179:37";
        in
          __pattern0 __patternFail;
    };
  foldableMaybe = 
    { foldr = v: z: v1: 
        let
          __pattern0 = __fail: 
            if v1.__tag == "Nothing"
              then 
                let
                  z1 = z;
                in
                  z1
              else __fail;
          __pattern1 = __fail: 
            if v1.__tag == "Just"
              then 
                let
                  f = v;
                  z1 = z;
                  x = v1.__field0;
                in
                  f x z1
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 138:1 - 144:27";
        in
          __pattern0 (__pattern1 __patternFail);
      foldl = v: z: v1: 
        let
          __pattern0 = __fail: 
            if v1.__tag == "Nothing"
              then 
                let
                  z1 = z;
                in
                  z1
              else __fail;
          __pattern1 = __fail: 
            if v1.__tag == "Just"
              then 
                let
                  f = v;
                  z1 = z;
                  x = v1.__field0;
                in
                  f z1 x
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 138:1 - 144:27";
        in
          __pattern0 (__pattern1 __patternFail);
      foldMap = dictMonoid: v: v1: 
        let
          __pattern0 = __fail: if v1.__tag == "Nothing" then module."Data.Monoid".mempty dictMonoid else __fail;
          __pattern1 = __fail: 
            if v1.__tag == "Just"
              then 
                let
                  f = v;
                  x = v1.__field0;
                in
                  f x
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 138:1 - 144:27";
        in
          __pattern0 (__pattern1 __patternFail);
    };
  foldableIdentity = 
    { foldr = f: z: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              z1 = z;
              x = v;
            in
              f1 x z1;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 194:1 - 197:31";
        in
          __pattern0 __patternFail;
      foldl = f: z: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              z1 = z;
              x = v;
            in
              f1 z1 x;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 194:1 - 197:31";
        in
          __pattern0 __patternFail;
      foldMap = dictMonoid: f: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              x = v;
            in
              f1 x;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 194:1 - 197:31";
        in
          __pattern0 __patternFail;
    };
  foldableEither = 
    { foldr = v: z: v1: 
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
                  f x z1
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 181:1 - 187:28";
        in
          __pattern0 (__pattern1 __patternFail);
      foldl = v: z: v1: 
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
                  f z1 x
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 181:1 - 187:28";
        in
          __pattern0 (__pattern1 __patternFail);
      foldMap = dictMonoid: v: v1: 
        let
          __pattern0 = __fail: if v1.__tag == "Left" then module."Data.Monoid".mempty dictMonoid else __fail;
          __pattern1 = __fail: 
            if v1.__tag == "Right"
              then 
                let
                  f = v;
                  x = v1.__field0;
                in
                  f x
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 181:1 - 187:28";
        in
          __pattern0 (__pattern1 __patternFail);
    };
  foldableDual = 
    { foldr = f: z: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              z1 = z;
              x = v;
            in
              f1 x z1;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 161:1 - 164:27";
        in
          __pattern0 __patternFail;
      foldl = f: z: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              z1 = z;
              x = v;
            in
              f1 z1 x;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 161:1 - 164:27";
        in
          __pattern0 __patternFail;
      foldMap = dictMonoid: f: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              x = v;
            in
              f1 x;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 161:1 - 164:27";
        in
          __pattern0 __patternFail;
    };
  foldableDisj = 
    { foldr = f: z: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              z1 = z;
              x = v;
            in
              f1 x z1;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 166:1 - 169:27";
        in
          __pattern0 __patternFail;
      foldl = f: z: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              z1 = z;
              x = v;
            in
              f1 z1 x;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 166:1 - 169:27";
        in
          __pattern0 __patternFail;
      foldMap = dictMonoid: f: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              x = v;
            in
              f1 x;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 166:1 - 169:27";
        in
          __pattern0 __patternFail;
    };
  foldableConst = 
    { foldr = v: z: v1: z;
      foldl = v: z: v1: z;
      foldMap = dictMonoid: v: v1: module."Data.Monoid".mempty dictMonoid;
    };
  foldableConj = 
    { foldr = f: z: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              z1 = z;
              x = v;
            in
              f1 x z1;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 171:1 - 174:27";
        in
          __pattern0 __patternFail;
      foldl = f: z: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              z1 = z;
              x = v;
            in
              f1 z1 x;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 171:1 - 174:27";
        in
          __pattern0 __patternFail;
      foldMap = dictMonoid: f: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              x = v;
            in
              f1 x;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 171:1 - 174:27";
        in
          __pattern0 __patternFail;
    };
  foldableAdditive = 
    { foldr = f: z: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              z1 = z;
              x = v;
            in
              f1 x z1;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 156:1 - 159:31";
        in
          __pattern0 __patternFail;
      foldl = f: z: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              z1 = z;
              x = v;
            in
              f1 z1 x;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 156:1 - 159:31";
        in
          __pattern0 __patternFail;
      foldMap = dictMonoid: f: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              x = v;
            in
              f1 x;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 156:1 - 159:31";
        in
          __pattern0 __patternFail;
    };
  foldMapDefaultR = dictFoldable: dictMonoid: f: foldr dictFoldable (x: acc: module."Data.Semigroup".append (dictMonoid."Semigroup0" module."Prim".undefined) (f x) acc) (module."Data.Monoid".mempty dictMonoid);
  foldableArray = 
    { foldr = foldrArray;
      foldl = foldlArray;
      foldMap = dictMonoid: foldMapDefaultR foldableArray dictMonoid;
    };
  foldMapDefaultL = dictFoldable: dictMonoid: f: foldl dictFoldable (acc: x: module."Data.Semigroup".append (dictMonoid."Semigroup0" module."Prim".undefined) acc (f x)) (module."Data.Monoid".mempty dictMonoid);
  foldMap = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.foldMap;
      __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 76:3 - 76:58";
    in
      __pattern0 __patternFail;
  foldableApp = dictFoldable: 
    { foldr = f: i: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              i1 = i;
              x = v;
            in
              foldr dictFoldable f1 i1 x;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 219:1 - 222:34";
        in
          __pattern0 __patternFail;
      foldl = f: i: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              i1 = i;
              x = v;
            in
              foldl dictFoldable f1 i1 x;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 219:1 - 222:34";
        in
          __pattern0 __patternFail;
      foldMap = dictMonoid: f: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              x = v;
            in
              foldMap dictFoldable dictMonoid f1 x;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 219:1 - 222:34";
        in
          __pattern0 __patternFail;
    };
  foldableCompose = dictFoldable: dictFoldable1: 
    { foldr = f: i: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              i1 = i;
              fga = v;
            in
              foldr dictFoldable (module."Data.Function".flip (foldr dictFoldable1 f1)) i1 fga;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 214:1 - 217:52";
        in
          __pattern0 __patternFail;
      foldl = f: i: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              i1 = i;
              fga = v;
            in
              foldl dictFoldable (foldl dictFoldable1 f1) i1 fga;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 214:1 - 217:52";
        in
          __pattern0 __patternFail;
      foldMap = dictMonoid: f: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              fga = v;
            in
              foldMap dictFoldable dictMonoid (foldMap dictFoldable1 dictMonoid f1) fga;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 214:1 - 217:52";
        in
          __pattern0 __patternFail;
    };
  foldableCoproduct = dictFoldable: dictFoldable1: 
    { foldr = f: z: module."Data.Functor.Coproduct".coproduct (foldr dictFoldable f z) (foldr dictFoldable1 f z);
      foldl = f: z: module."Data.Functor.Coproduct".coproduct (foldl dictFoldable f z) (foldl dictFoldable1 f z);
      foldMap = dictMonoid: f: module."Data.Functor.Coproduct".coproduct (foldMap dictFoldable dictMonoid f) (foldMap dictFoldable1 dictMonoid f);
    };
  foldableFirst = 
    { foldr = f: z: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              z1 = z;
              x = v;
            in
              foldr foldableMaybe f1 z1 x;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 146:1 - 149:36";
        in
          __pattern0 __patternFail;
      foldl = f: z: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              z1 = z;
              x = v;
            in
              foldl foldableMaybe f1 z1 x;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 146:1 - 149:36";
        in
          __pattern0 __patternFail;
      foldMap = dictMonoid: f: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              x = v;
            in
              foldMap foldableMaybe dictMonoid f1 x;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 146:1 - 149:36";
        in
          __pattern0 __patternFail;
    };
  foldableLast = 
    { foldr = f: z: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              z1 = z;
              x = v;
            in
              foldr foldableMaybe f1 z1 x;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 151:1 - 154:35";
        in
          __pattern0 __patternFail;
      foldl = f: z: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              z1 = z;
              x = v;
            in
              foldl foldableMaybe f1 z1 x;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 151:1 - 154:35";
        in
          __pattern0 __patternFail;
      foldMap = dictMonoid: f: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              x = v;
            in
              foldMap foldableMaybe dictMonoid f1 x;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 151:1 - 154:35";
        in
          __pattern0 __patternFail;
    };
  foldableProduct = dictFoldable: dictFoldable1: 
    { foldr = f: z: v: 
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
                  foldr dictFoldable f1 (foldr dictFoldable1 f1 z1 ga) fa
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 204:1 - 207:67";
        in
          __pattern0 __patternFail;
      foldl = f: z: v: 
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
                  foldl dictFoldable1 f1 (foldl dictFoldable f1 z1 fa) ga
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 204:1 - 207:67";
        in
          __pattern0 __patternFail;
      foldMap = dictMonoid: f: v: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Tuple"
              then 
                let
                  f1 = f;
                  fa = v.__field0;
                  ga = v.__field1;
                in
                  module."Data.Semigroup".append (dictMonoid."Semigroup0" module."Prim".undefined) (foldMap dictFoldable dictMonoid f1 fa) (foldMap dictFoldable1 dictMonoid f1 ga)
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 204:1 - 207:67";
        in
          __pattern0 __patternFail;
    };
  foldlDefault = dictFoldable: c: u: xs: module."Data.Newtype".unwrap module."Prim".undefined (module."Data.Newtype".unwrap module."Prim".undefined (foldMap dictFoldable (module."Data.Monoid.Dual".monoidDual (module."Data.Monoid.Endo".monoidEndo module."Control.Category".categoryFn)) (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn module."Data.Monoid.Dual".Dual (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn module."Data.Monoid.Endo".Endo (module."Data.Function".flip c))) xs)) u;
  foldrDefault = dictFoldable: c: u: xs: module."Data.Newtype".unwrap module."Prim".undefined (foldMap dictFoldable (module."Data.Monoid.Endo".monoidEndo module."Control.Category".categoryFn) (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn module."Data.Monoid.Endo".Endo c) xs) u;
  lookup = dictFoldable: dictEq: a: module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn (module."Data.Newtype".unwrap module."Prim".undefined) 
    ( foldMap dictFoldable module."Data.Maybe.First".monoidFirst 
      ( v: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Tuple"
              then 
                let
                  a' = v.__field0;
                  b = v.__field1;
                in
                  
                  let
                    __pattern0 = __fail: if module."Data.Eq".eq dictEq a a' then module."Data.Maybe".Just b else __fail;
                    __pattern1 = __fail: module."Data.Maybe".Nothing;
                    __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 471:55 - 471:90";
                  in
                    __pattern0 (__pattern1 __patternFail)
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 471:31 - 471:91";
        in
          __pattern0 __patternFail
      )
    );
  surroundMap = dictFoldable: dictSemigroup: d: t: f: 
    let
      joined = a: m: module."Data.Semigroup".append dictSemigroup d (module."Data.Semigroup".append dictSemigroup (t a) m);
    in
      module."Data.Newtype".unwrap module."Prim".undefined (foldMap dictFoldable (module."Data.Monoid.Endo".monoidEndo module."Control.Category".categoryFn) joined f) d;
  surround = dictFoldable: dictSemigroup: d: surroundMap dictFoldable dictSemigroup d (module."Control.Category".identity module."Control.Category".categoryFn);
  foldM = dictFoldable: dictMonad: f: b0: foldl dictFoldable (b: a: module."Control.Bind".bind (dictMonad."Bind1" module."Prim".undefined) b (module."Data.Function".flip f a)) (module."Control.Applicative".pure (dictMonad."Applicative0" module."Prim".undefined) b0);
  fold = dictFoldable: dictMonoid: foldMap dictFoldable dictMonoid (module."Control.Category".identity module."Control.Category".categoryFn);
  findMap = dictFoldable: p: 
    let
      go = v: v1: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Nothing"
              then 
                let
                  x = v1;
                in
                  p x
              else __fail;
          __pattern1 = __fail: 
            let
              r = v;
            in
              r;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 428:3 - 428:21";
        in
          __pattern0 (__pattern1 __patternFail);
    in
      foldl dictFoldable go module."Data.Maybe".Nothing;
  find = dictFoldable: p: 
    let
      go = v: v1: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Nothing"
              then 
                let
                  x = v1;
                in
                  if p x then module."Data.Maybe".Just x else __fail
              else __fail;
          __pattern1 = __fail: 
            let
              r = v;
            in
              r;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Foldable.purs at 421:3 - 421:30";
        in
          __pattern0 (__pattern1 __patternFail);
    in
      foldl dictFoldable go module."Data.Maybe".Nothing;
  any = dictFoldable: dictHeytingAlgebra: module."Data.Newtype".alaF module."Prim".undefined module."Prim".undefined module."Prim".undefined module."Prim".undefined module."Data.Monoid.Disj".Disj (foldMap dictFoldable (module."Data.Monoid.Disj".monoidDisj dictHeytingAlgebra));
  elem = dictFoldable: dictEq: module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn (any dictFoldable module."Data.HeytingAlgebra".heytingAlgebraBoolean) (module."Data.Eq".eq dictEq);
  notElem = dictFoldable: dictEq: x: module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn (module."Data.HeytingAlgebra".not module."Data.HeytingAlgebra".heytingAlgebraBoolean) (elem dictFoldable dictEq x);
  or- = dictFoldable: dictHeytingAlgebra: any dictFoldable dictHeytingAlgebra (module."Control.Category".identity module."Control.Category".categoryFn);
  all = dictFoldable: dictHeytingAlgebra: module."Data.Newtype".alaF module."Prim".undefined module."Prim".undefined module."Prim".undefined module."Prim".undefined module."Data.Monoid.Conj".Conj (foldMap dictFoldable (module."Data.Monoid.Conj".monoidConj dictHeytingAlgebra));
  and = dictFoldable: dictHeytingAlgebra: all dictFoldable dictHeytingAlgebra (module."Control.Category".identity module."Control.Category".categoryFn);
in
  {inherit foldr foldl foldMap foldrDefault foldlDefault foldMapDefaultL foldMapDefaultR fold foldM traverse_ for_ sequence_ oneOf oneOfMap intercalate surroundMap surround and or- all any sum product elem notElem indexl indexr find findMap maximum maximumBy minimum minimumBy null length lookup foldableArray foldableMaybe foldableFirst foldableLast foldableAdditive foldableDual foldableDisj foldableConj foldableMultiplicative foldableEither foldableTuple foldableIdentity foldableConst foldableProduct foldableCoproduct foldableCompose foldableApp;}