
let
  module = 
    { "Control.Applicative" = import ../Control.Applicative;
      "Control.Apply" = import ../Control.Apply;
      "Control.Category" = import ../Control.Category;
      "Control.Semigroupoid" = import ../Control.Semigroupoid;
      "Data.Const" = import ../Data.Const;
      "Data.Either" = import ../Data.Either;
      "Data.Foldable" = import ../Data.Foldable;
      "Data.Function" = import ../Data.Function;
      "Data.Functor.Clown" = import ../Data.Functor.Clown;
      "Data.Functor.Flip" = import ../Data.Functor.Flip;
      "Data.Functor.Joker" = import ../Data.Functor.Joker;
      "Data.Functor.Product2" = import ../Data.Functor.Product2;
      "Data.Monoid" = import ../Data.Monoid;
      "Data.Monoid.Conj" = import ../Data.Monoid.Conj;
      "Data.Monoid.Disj" = import ../Data.Monoid.Disj;
      "Data.Monoid.Dual" = import ../Data.Monoid.Dual;
      "Data.Monoid.Endo" = import ../Data.Monoid.Endo;
      "Data.Newtype" = import ../Data.Newtype;
      "Data.Semigroup" = import ../Data.Semigroup;
      "Data.Tuple" = import ../Data.Tuple;
      "Data.Unit" = import ../Data.Unit;
      "Prelude" = import ../Prelude;
    };
  Bifoldable-Dict = x: x;
  bifoldr = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.bifoldr;
      __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Bifoldable.purs at 38:3 - 38:77";
    in
      __pattern0 __patternFail;
  bitraverse_ = dictBifoldable: dictApplicative: f: g: bifoldr dictBifoldable (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn (module."Control.Apply".applySecond (dictApplicative."Apply0" module."Prim".undefined)) f) (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn (module."Control.Apply".applySecond (dictApplicative."Apply0" module."Prim".undefined)) g) (module."Control.Applicative".pure dictApplicative module."Data.Unit".unit);
  bifor_ = dictBifoldable: dictApplicative: t: f: g: bitraverse_ dictBifoldable dictApplicative f g t;
  bisequence_ = dictBifoldable: dictApplicative: bitraverse_ dictBifoldable dictApplicative (module."Control.Category".identity module."Control.Category".categoryFn) (module."Control.Category".identity module."Control.Category".categoryFn);
  bifoldl = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.bifoldl;
      __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Bifoldable.purs at 39:3 - 39:77";
    in
      __pattern0 __patternFail;
  bifoldableTuple = 
    { bifoldMap = dictMonoid: f: g: v: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Tuple"
              then 
                let
                  f1 = f;
                  g1 = g;
                  a = v.__field0;
                  b = v.__field1;
                in
                  module."Data.Semigroup".append (dictMonoid."Semigroup0" module."Prim".undefined) (f1 a) (g1 b)
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Bifoldable.purs at 70:1 - 73:42";
        in
          __pattern0 __patternFail;
      bifoldr = f: g: z: v: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Tuple"
              then 
                let
                  f1 = f;
                  g1 = g;
                  z1 = z;
                  a = v.__field0;
                  b = v.__field1;
                in
                  f1 a (g1 b z1)
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Bifoldable.purs at 70:1 - 73:42";
        in
          __pattern0 __patternFail;
      bifoldl = f: g: z: v: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Tuple"
              then 
                let
                  f1 = f;
                  g1 = g;
                  z1 = z;
                  a = v.__field0;
                  b = v.__field1;
                in
                  g1 (f1 z1 a) b
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Bifoldable.purs at 70:1 - 73:42";
        in
          __pattern0 __patternFail;
    };
  bifoldableJoker = dictFoldable: 
    { bifoldr = v: r: u: v1: 
        let
          __pattern0 = __fail: 
            let
              r1 = r;
              u1 = u;
              f = v1;
            in
              module."Data.Foldable".foldr dictFoldable r1 u1 f;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Bifoldable.purs at 47:1 - 50:40";
        in
          __pattern0 __patternFail;
      bifoldl = v: r: u: v1: 
        let
          __pattern0 = __fail: 
            let
              r1 = r;
              u1 = u;
              f = v1;
            in
              module."Data.Foldable".foldl dictFoldable r1 u1 f;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Bifoldable.purs at 47:1 - 50:40";
        in
          __pattern0 __patternFail;
      bifoldMap = dictMonoid: v: r: v1: 
        let
          __pattern0 = __fail: 
            let
              r1 = r;
              f = v1;
            in
              module."Data.Foldable".foldMap dictFoldable dictMonoid r1 f;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Bifoldable.purs at 47:1 - 50:40";
        in
          __pattern0 __patternFail;
    };
  bifoldableEither = 
    { bifoldr = v: v1: z: v2: 
        let
          __pattern0 = __fail: 
            if v2.__tag == "Left"
              then 
                let
                  f = v;
                  z1 = z;
                  a = v2.__field0;
                in
                  f a z1
              else __fail;
          __pattern1 = __fail: 
            if v2.__tag == "Right"
              then 
                let
                  g = v1;
                  z1 = z;
                  b = v2.__field0;
                in
                  g b z1
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Bifoldable.purs at 62:1 - 68:32";
        in
          __pattern0 (__pattern1 __patternFail);
      bifoldl = v: v1: z: v2: 
        let
          __pattern0 = __fail: 
            if v2.__tag == "Left"
              then 
                let
                  f = v;
                  z1 = z;
                  a = v2.__field0;
                in
                  f z1 a
              else __fail;
          __pattern1 = __fail: 
            if v2.__tag == "Right"
              then 
                let
                  g = v1;
                  z1 = z;
                  b = v2.__field0;
                in
                  g z1 b
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Bifoldable.purs at 62:1 - 68:32";
        in
          __pattern0 (__pattern1 __patternFail);
      bifoldMap = dictMonoid: v: v1: v2: 
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
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Bifoldable.purs at 62:1 - 68:32";
        in
          __pattern0 (__pattern1 __patternFail);
    };
  bifoldableConst = 
    { bifoldr = f: v: z: v1: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              z1 = z;
              a = v1;
            in
              f1 a z1;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Bifoldable.purs at 75:1 - 78:32";
        in
          __pattern0 __patternFail;
      bifoldl = f: v: z: v1: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              z1 = z;
              a = v1;
            in
              f1 z1 a;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Bifoldable.purs at 75:1 - 78:32";
        in
          __pattern0 __patternFail;
      bifoldMap = dictMonoid: f: v: v1: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              a = v1;
            in
              f1 a;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Bifoldable.purs at 75:1 - 78:32";
        in
          __pattern0 __patternFail;
    };
  bifoldableClown = dictFoldable: 
    { bifoldr = l: v: u: v1: 
        let
          __pattern0 = __fail: 
            let
              l1 = l;
              u1 = u;
              f = v1;
            in
              module."Data.Foldable".foldr dictFoldable l1 u1 f;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Bifoldable.purs at 42:1 - 45:40";
        in
          __pattern0 __patternFail;
      bifoldl = l: v: u: v1: 
        let
          __pattern0 = __fail: 
            let
              l1 = l;
              u1 = u;
              f = v1;
            in
              module."Data.Foldable".foldl dictFoldable l1 u1 f;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Bifoldable.purs at 42:1 - 45:40";
        in
          __pattern0 __patternFail;
      bifoldMap = dictMonoid: l: v: v1: 
        let
          __pattern0 = __fail: 
            let
              l1 = l;
              f = v1;
            in
              module."Data.Foldable".foldMap dictFoldable dictMonoid l1 f;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Bifoldable.purs at 42:1 - 45:40";
        in
          __pattern0 __patternFail;
    };
  bifoldMapDefaultR = dictBifoldable: dictMonoid: f: g: bifoldr dictBifoldable (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn (module."Data.Semigroup".append (dictMonoid."Semigroup0" module."Prim".undefined)) f) (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn (module."Data.Semigroup".append (dictMonoid."Semigroup0" module."Prim".undefined)) g) (module."Data.Monoid".mempty dictMonoid);
  bifoldMapDefaultL = dictBifoldable: dictMonoid: f: g: bifoldl dictBifoldable (m: a: module."Data.Semigroup".append (dictMonoid."Semigroup0" module."Prim".undefined) m (f a)) (m: b: module."Data.Semigroup".append (dictMonoid."Semigroup0" module."Prim".undefined) m (g b)) (module."Data.Monoid".mempty dictMonoid);
  bifoldMap = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.bifoldMap;
      __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Bifoldable.purs at 40:3 - 40:76";
    in
      __pattern0 __patternFail;
  bifoldableFlip = dictBifoldable: 
    { bifoldr = r: l: u: v: 
        let
          __pattern0 = __fail: 
            let
              r1 = r;
              l1 = l;
              u1 = u;
              p = v;
            in
              bifoldr dictBifoldable l1 r1 u1 p;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Bifoldable.purs at 52:1 - 55:43";
        in
          __pattern0 __patternFail;
      bifoldl = r: l: u: v: 
        let
          __pattern0 = __fail: 
            let
              r1 = r;
              l1 = l;
              u1 = u;
              p = v;
            in
              bifoldl dictBifoldable l1 r1 u1 p;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Bifoldable.purs at 52:1 - 55:43";
        in
          __pattern0 __patternFail;
      bifoldMap = dictMonoid: r: l: v: 
        let
          __pattern0 = __fail: 
            let
              r1 = r;
              l1 = l;
              p = v;
            in
              bifoldMap dictBifoldable dictMonoid l1 r1 p;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Bifoldable.purs at 52:1 - 55:43";
        in
          __pattern0 __patternFail;
    };
  bifoldlDefault = dictBifoldable: f: g: z: p: module."Data.Newtype".unwrap module."Prim".undefined (module."Data.Newtype".unwrap module."Prim".undefined (bifoldMap dictBifoldable (module."Data.Monoid.Dual".monoidDual (module."Data.Monoid.Endo".monoidEndo module."Control.Category".categoryFn)) (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn module."Data.Monoid.Dual".Dual (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn module."Data.Monoid.Endo".Endo (module."Data.Function".flip f))) (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn module."Data.Monoid.Dual".Dual (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn module."Data.Monoid.Endo".Endo (module."Data.Function".flip g))) p)) z;
  bifoldrDefault = dictBifoldable: f: g: z: p: module."Data.Newtype".unwrap module."Prim".undefined (bifoldMap dictBifoldable (module."Data.Monoid.Endo".monoidEndo module."Control.Category".categoryFn) (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn module."Data.Monoid.Endo".Endo f) (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn module."Data.Monoid.Endo".Endo g) p) z;
  bifoldableProduct2 = dictBifoldable: dictBifoldable1: 
    { bifoldr = l: r: u: m: bifoldrDefault (bifoldableProduct2 dictBifoldable dictBifoldable1) l r u m;
      bifoldl = l: r: u: m: bifoldlDefault (bifoldableProduct2 dictBifoldable dictBifoldable1) l r u m;
      bifoldMap = dictMonoid: l: r: v: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Product2"
              then 
                let
                  l1 = l;
                  r1 = r;
                  f = v.__field0;
                  g = v.__field1;
                in
                  module."Data.Semigroup".append (dictMonoid."Semigroup0" module."Prim".undefined) (bifoldMap dictBifoldable dictMonoid l1 r1 f) (bifoldMap dictBifoldable1 dictMonoid l1 r1 g)
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Bifoldable.purs at 57:1 - 60:68";
        in
          __pattern0 __patternFail;
    };
  bifold = dictBifoldable: dictMonoid: bifoldMap dictBifoldable dictMonoid (module."Control.Category".identity module."Control.Category".categoryFn) (module."Control.Category".identity module."Control.Category".categoryFn);
  biany = dictBifoldable: dictBooleanAlgebra: p: q: module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn (module."Data.Newtype".unwrap module."Prim".undefined) (bifoldMap dictBifoldable (module."Data.Monoid.Disj".monoidDisj (dictBooleanAlgebra."HeytingAlgebra0" module."Prim".undefined)) (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn module."Data.Monoid.Disj".Disj p) (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn module."Data.Monoid.Disj".Disj q));
  biall = dictBifoldable: dictBooleanAlgebra: p: q: module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn (module."Data.Newtype".unwrap module."Prim".undefined) (bifoldMap dictBifoldable (module."Data.Monoid.Conj".monoidConj (dictBooleanAlgebra."HeytingAlgebra0" module."Prim".undefined)) (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn module."Data.Monoid.Conj".Conj p) (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn module."Data.Monoid.Conj".Conj q));
in
  {inherit bifoldMap bifoldl bifoldr bifoldrDefault bifoldlDefault bifoldMapDefaultR bifoldMapDefaultL bifold bitraverse_ bifor_ bisequence_ biany biall bifoldableClown bifoldableJoker bifoldableFlip bifoldableProduct2 bifoldableEither bifoldableTuple bifoldableConst;}