
let
  module = 
    { "Control.Applicative" = import ../Control.Applicative;
      "Control.Apply" = import ../Control.Apply;
      "Control.Semigroupoid" = import ../Control.Semigroupoid;
      "Data.Const" = import ../Data.Const;
      "Data.Either" = import ../Data.Either;
      "Data.FoldableWithIndex" = import ../Data.FoldableWithIndex;
      "Data.Function" = import ../Data.Function;
      "Data.Functor" = import ../Data.Functor;
      "Data.Functor.App" = import ../Data.Functor.App;
      "Data.Functor.Compose" = import ../Data.Functor.Compose;
      "Data.Functor.Coproduct" = import ../Data.Functor.Coproduct;
      "Data.Functor.Product" = import ../Data.Functor.Product;
      "Data.FunctorWithIndex" = import ../Data.FunctorWithIndex;
      "Data.Identity" = import ../Data.Identity;
      "Data.Maybe" = import ../Data.Maybe;
      "Data.Maybe.First" = import ../Data.Maybe.First;
      "Data.Maybe.Last" = import ../Data.Maybe.Last;
      "Data.Monoid.Additive" = import ../Data.Monoid.Additive;
      "Data.Monoid.Conj" = import ../Data.Monoid.Conj;
      "Data.Monoid.Disj" = import ../Data.Monoid.Disj;
      "Data.Monoid.Dual" = import ../Data.Monoid.Dual;
      "Data.Monoid.Multiplicative" = import ../Data.Monoid.Multiplicative;
      "Data.Traversable" = import ../Data.Traversable;
      "Data.Traversable.Accum" = import ../Data.Traversable.Accum;
      "Data.Traversable.Accum.Internal" = import ../Data.Traversable.Accum.Internal;
      "Data.Tuple" = import ../Data.Tuple;
      "Data.Unit" = import ../Data.Unit;
      "Prelude" = import ../Prelude;
    };
  TraversableWithIndex-Dict = x: x;
  traverseWithIndexDefault = dictTraversableWithIndex: dictApplicative: f: module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn (module."Data.Traversable".sequence (dictTraversableWithIndex."Traversable2" module."Prim".undefined) dictApplicative) (module."Data.FunctorWithIndex".mapWithIndex (dictTraversableWithIndex."FunctorWithIndex0" module."Prim".undefined) f);
  traverseWithIndex = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.traverseWithIndex;
      __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/TraversableWithIndex.purs at 56:3 - 56:88";
    in
      __pattern0 __patternFail;
  traverseDefault = dictTraversableWithIndex: dictApplicative: f: traverseWithIndex dictTraversableWithIndex dictApplicative (module."Data.Function".const f);
  traversableWithIndexTuple = 
    { traverseWithIndex = dictApplicative: f: v: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Tuple"
              then 
                let
                  f1 = f;
                  x = v.__field0;
                  y = v.__field1;
                in
                  module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined) (module."Data.Tuple".Tuple x) (f1 module."Data.Unit".unit y)
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/TraversableWithIndex.purs at 99:1 - 100:57";
        in
          __pattern0 __patternFail;
      "FunctorWithIndex0" = __unused: module."Data.FunctorWithIndex".functorWithIndexTuple;
      "FoldableWithIndex1" = __unused: module."Data.FoldableWithIndex".foldableWithIndexTuple;
      "Traversable2" = __unused: module."Data.Traversable".traversableTuple;
    };
  traversableWithIndexProduct = dictTraversableWithIndex: dictTraversableWithIndex1: 
    { traverseWithIndex = dictApplicative: f: v: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Tuple"
              then 
                let
                  f1 = f;
                  fa = v.__field0;
                  ga = v.__field1;
                in
                  module."Control.Apply".lift2 (dictApplicative."Apply0" module."Prim".undefined) module."Data.Functor.Product".product (traverseWithIndex dictTraversableWithIndex dictApplicative (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn f1 module."Data.Either".Left) fa) (traverseWithIndex dictTraversableWithIndex1 dictApplicative (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn f1 module."Data.Either".Right) ga)
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/TraversableWithIndex.purs at 108:1 - 109:135";
        in
          __pattern0 __patternFail;
      "FunctorWithIndex0" = __unused: module."Data.FunctorWithIndex".functorWithIndexProduct (dictTraversableWithIndex."FunctorWithIndex0" module."Prim".undefined) (dictTraversableWithIndex1."FunctorWithIndex0" module."Prim".undefined);
      "FoldableWithIndex1" = __unused: module."Data.FoldableWithIndex".foldableWithIndexProduct (dictTraversableWithIndex."FoldableWithIndex1" module."Prim".undefined) (dictTraversableWithIndex1."FoldableWithIndex1" module."Prim".undefined);
      "Traversable2" = __unused: module."Data.Traversable".traversableProduct (dictTraversableWithIndex."Traversable2" module."Prim".undefined) (dictTraversableWithIndex1."Traversable2" module."Prim".undefined);
    };
  traversableWithIndexMultiplicative = 
    { traverseWithIndex = dictApplicative: f: module."Data.Function".apply (module."Data.Traversable".traverse module."Data.Traversable".traversableMultiplicative dictApplicative) (f module."Data.Unit".unit);
      "FunctorWithIndex0" = __unused: module."Data.FunctorWithIndex".functorWithIndexMultiplicative;
      "FoldableWithIndex1" = __unused: module."Data.FoldableWithIndex".foldableWithIndexMultiplicative;
      "Traversable2" = __unused: module."Data.Traversable".traversableMultiplicative;
    };
  traversableWithIndexMaybe = 
    { traverseWithIndex = dictApplicative: f: module."Data.Function".apply (module."Data.Traversable".traverse module."Data.Traversable".traversableMaybe dictApplicative) (f module."Data.Unit".unit);
      "FunctorWithIndex0" = __unused: module."Data.FunctorWithIndex".functorWithIndexMaybe;
      "FoldableWithIndex1" = __unused: module."Data.FoldableWithIndex".foldableWithIndexMaybe;
      "Traversable2" = __unused: module."Data.Traversable".traversableMaybe;
    };
  traversableWithIndexLast = 
    { traverseWithIndex = dictApplicative: f: module."Data.Function".apply (module."Data.Traversable".traverse module."Data.Traversable".traversableLast dictApplicative) (f module."Data.Unit".unit);
      "FunctorWithIndex0" = __unused: module."Data.FunctorWithIndex".functorWithIndexLast;
      "FoldableWithIndex1" = __unused: module."Data.FoldableWithIndex".foldableWithIndexLast;
      "Traversable2" = __unused: module."Data.Traversable".traversableLast;
    };
  traversableWithIndexIdentity = 
    { traverseWithIndex = dictApplicative: f: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              x = v;
            in
              module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined) module."Data.Identity".Identity (f1 module."Data.Unit".unit x);
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/TraversableWithIndex.purs at 102:1 - 103:59";
        in
          __pattern0 __patternFail;
      "FunctorWithIndex0" = __unused: module."Data.FunctorWithIndex".functorWithIndexIdentity;
      "FoldableWithIndex1" = __unused: module."Data.FoldableWithIndex".foldableWithIndexIdentity;
      "Traversable2" = __unused: module."Data.Traversable".traversableIdentity;
    };
  traversableWithIndexFirst = 
    { traverseWithIndex = dictApplicative: f: module."Data.Function".apply (module."Data.Traversable".traverse module."Data.Traversable".traversableFirst dictApplicative) (f module."Data.Unit".unit);
      "FunctorWithIndex0" = __unused: module."Data.FunctorWithIndex".functorWithIndexFirst;
      "FoldableWithIndex1" = __unused: module."Data.FoldableWithIndex".foldableWithIndexFirst;
      "Traversable2" = __unused: module."Data.Traversable".traversableFirst;
    };
  traversableWithIndexEither = 
    { traverseWithIndex = dictApplicative: v: v1: 
        let
          __pattern0 = __fail: 
            if v1.__tag == "Left"
              then 
                let
                  x = v1.__field0;
                in
                  module."Control.Applicative".pure dictApplicative (module."Data.Either".Left x)
              else __fail;
          __pattern1 = __fail: 
            if v1.__tag == "Right"
              then 
                let
                  f = v;
                  x = v1.__field0;
                in
                  module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined) module."Data.Either".Right (f module."Data.Unit".unit x)
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/TraversableWithIndex.purs at 95:1 - 97:53";
        in
          __pattern0 (__pattern1 __patternFail);
      "FunctorWithIndex0" = __unused: module."Data.FunctorWithIndex".functorWithIndexEither;
      "FoldableWithIndex1" = __unused: module."Data.FoldableWithIndex".foldableWithIndexEither;
      "Traversable2" = __unused: module."Data.Traversable".traversableEither;
    };
  traversableWithIndexDual = 
    { traverseWithIndex = dictApplicative: f: module."Data.Function".apply (module."Data.Traversable".traverse module."Data.Traversable".traversableDual dictApplicative) (f module."Data.Unit".unit);
      "FunctorWithIndex0" = __unused: module."Data.FunctorWithIndex".functorWithIndexDual;
      "FoldableWithIndex1" = __unused: module."Data.FoldableWithIndex".foldableWithIndexDual;
      "Traversable2" = __unused: module."Data.Traversable".traversableDual;
    };
  traversableWithIndexDisj = 
    { traverseWithIndex = dictApplicative: f: module."Data.Function".apply (module."Data.Traversable".traverse module."Data.Traversable".traversableDisj dictApplicative) (f module."Data.Unit".unit);
      "FunctorWithIndex0" = __unused: module."Data.FunctorWithIndex".functorWithIndexDisj;
      "FoldableWithIndex1" = __unused: module."Data.FoldableWithIndex".foldableWithIndexDisj;
      "Traversable2" = __unused: module."Data.Traversable".traversableDisj;
    };
  traversableWithIndexCoproduct = dictTraversableWithIndex: dictTraversableWithIndex1: 
    { traverseWithIndex = dictApplicative: f: module."Data.Functor.Coproduct".coproduct (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn (module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined) (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn module."Data.Functor.Coproduct".Coproduct module."Data.Either".Left)) (traverseWithIndex dictTraversableWithIndex dictApplicative (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn f module."Data.Either".Left))) (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn (module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined) (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn module."Data.Functor.Coproduct".Coproduct module."Data.Either".Right)) (traverseWithIndex dictTraversableWithIndex1 dictApplicative (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn f module."Data.Either".Right)));
      "FunctorWithIndex0" = __unused: module."Data.FunctorWithIndex".functorWithIndexCoproduct (dictTraversableWithIndex."FunctorWithIndex0" module."Prim".undefined) (dictTraversableWithIndex1."FunctorWithIndex0" module."Prim".undefined);
      "FoldableWithIndex1" = __unused: module."Data.FoldableWithIndex".foldableWithIndexCoproduct (dictTraversableWithIndex."FoldableWithIndex1" module."Prim".undefined) (dictTraversableWithIndex1."FoldableWithIndex1" module."Prim".undefined);
      "Traversable2" = __unused: module."Data.Traversable".traversableCoproduct (dictTraversableWithIndex."Traversable2" module."Prim".undefined) (dictTraversableWithIndex1."Traversable2" module."Prim".undefined);
    };
  traversableWithIndexConst = 
    { traverseWithIndex = dictApplicative: v: v1: 
        let
          __pattern0 = __fail: 
            let
              x = v1;
            in
              module."Control.Applicative".pure dictApplicative x;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/TraversableWithIndex.purs at 105:1 - 106:49";
        in
          __pattern0 __patternFail;
      "FunctorWithIndex0" = __unused: module."Data.FunctorWithIndex".functorWithIndexConst;
      "FoldableWithIndex1" = __unused: module."Data.FoldableWithIndex".foldableWithIndexConst;
      "Traversable2" = __unused: module."Data.Traversable".traversableConst;
    };
  traversableWithIndexConj = 
    { traverseWithIndex = dictApplicative: f: module."Data.Function".apply (module."Data.Traversable".traverse module."Data.Traversable".traversableConj dictApplicative) (f module."Data.Unit".unit);
      "FunctorWithIndex0" = __unused: module."Data.FunctorWithIndex".functorWithIndexConj;
      "FoldableWithIndex1" = __unused: module."Data.FoldableWithIndex".foldableWithIndexConj;
      "Traversable2" = __unused: module."Data.Traversable".traversableConj;
    };
  traversableWithIndexCompose = dictTraversableWithIndex: dictTraversableWithIndex1: 
    { traverseWithIndex = dictApplicative: f: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              fga = v;
            in
              module."Data.Function".apply (module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined) module."Data.Functor.Compose".Compose) (traverseWithIndex dictTraversableWithIndex dictApplicative (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn (traverseWithIndex dictTraversableWithIndex1 dictApplicative) (module."Data.Tuple".curry f1)) fga);
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/TraversableWithIndex.purs at 116:1 - 117:106";
        in
          __pattern0 __patternFail;
      "FunctorWithIndex0" = __unused: module."Data.FunctorWithIndex".functorWithIndexCompose (dictTraversableWithIndex."FunctorWithIndex0" module."Prim".undefined) (dictTraversableWithIndex1."FunctorWithIndex0" module."Prim".undefined);
      "FoldableWithIndex1" = __unused: module."Data.FoldableWithIndex".foldableWithIndexCompose (dictTraversableWithIndex."FoldableWithIndex1" module."Prim".undefined) (dictTraversableWithIndex1."FoldableWithIndex1" module."Prim".undefined);
      "Traversable2" = __unused: module."Data.Traversable".traversableCompose (dictTraversableWithIndex."Traversable2" module."Prim".undefined) (dictTraversableWithIndex1."Traversable2" module."Prim".undefined);
    };
  traversableWithIndexArray = 
    { traverseWithIndex = dictApplicative: traverseWithIndexDefault traversableWithIndexArray dictApplicative;
      "FunctorWithIndex0" = __unused: module."Data.FunctorWithIndex".functorWithIndexArray;
      "FoldableWithIndex1" = __unused: module."Data.FoldableWithIndex".foldableWithIndexArray;
      "Traversable2" = __unused: module."Data.Traversable".traversableArray;
    };
  traversableWithIndexApp = dictTraversableWithIndex: 
    { traverseWithIndex = dictApplicative: f: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              x = v;
            in
              module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined) module."Data.Functor.App".App (traverseWithIndex dictTraversableWithIndex dictApplicative f1 x);
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/TraversableWithIndex.purs at 119:1 - 120:62";
        in
          __pattern0 __patternFail;
      "FunctorWithIndex0" = __unused: module."Data.FunctorWithIndex".functorWithIndexApp (dictTraversableWithIndex."FunctorWithIndex0" module."Prim".undefined);
      "FoldableWithIndex1" = __unused: module."Data.FoldableWithIndex".foldableWithIndexApp (dictTraversableWithIndex."FoldableWithIndex1" module."Prim".undefined);
      "Traversable2" = __unused: module."Data.Traversable".traversableApp (dictTraversableWithIndex."Traversable2" module."Prim".undefined);
    };
  traversableWithIndexAdditive = 
    { traverseWithIndex = dictApplicative: f: module."Data.Function".apply (module."Data.Traversable".traverse module."Data.Traversable".traversableAdditive dictApplicative) (f module."Data.Unit".unit);
      "FunctorWithIndex0" = __unused: module."Data.FunctorWithIndex".functorWithIndexAdditive;
      "FoldableWithIndex1" = __unused: module."Data.FoldableWithIndex".foldableWithIndexAdditive;
      "Traversable2" = __unused: module."Data.Traversable".traversableAdditive;
    };
  mapAccumRWithIndex = dictTraversableWithIndex: f: s0: xs: module."Data.Traversable.Accum.Internal".stateR (traverseWithIndex dictTraversableWithIndex module."Data.Traversable.Accum.Internal".applicativeStateR (i: a: s: f i s a) xs) s0;
  scanrWithIndex = dictTraversableWithIndex: f: b0: xs: 
    ( mapAccumRWithIndex dictTraversableWithIndex 
      ( i: b: a: 
        let
          b' = f i a b;
        in
          
          { accum = b';
            value = b';
          }
      ) b0 xs
    ).value;
  mapAccumLWithIndex = dictTraversableWithIndex: f: s0: xs: module."Data.Traversable.Accum.Internal".stateL (traverseWithIndex dictTraversableWithIndex module."Data.Traversable.Accum.Internal".applicativeStateL (i: a: s: f i s a) xs) s0;
  scanlWithIndex = dictTraversableWithIndex: f: b0: xs: 
    ( mapAccumLWithIndex dictTraversableWithIndex 
      ( i: b: a: 
        let
          b' = f i b a;
        in
          
          { accum = b';
            value = b';
          }
      ) b0 xs
    ).value;
  forWithIndex = dictApplicative: dictTraversableWithIndex: module."Data.Function".flip (traverseWithIndex dictTraversableWithIndex dictApplicative);
in
  
  { inherit traverseWithIndex traverseWithIndexDefault forWithIndex scanlWithIndex mapAccumLWithIndex scanrWithIndex mapAccumRWithIndex traverseDefault traversableWithIndexArray traversableWithIndexMaybe traversableWithIndexFirst traversableWithIndexLast traversableWithIndexAdditive traversableWithIndexDual traversableWithIndexConj traversableWithIndexDisj traversableWithIndexMultiplicative traversableWithIndexEither traversableWithIndexTuple traversableWithIndexIdentity traversableWithIndexConst traversableWithIndexProduct traversableWithIndexCoproduct traversableWithIndexCompose traversableWithIndexApp;
    inherit (module."Data.Traversable.Accum");
  }