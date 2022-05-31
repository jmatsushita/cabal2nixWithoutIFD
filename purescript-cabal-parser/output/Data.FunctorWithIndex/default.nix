
let
  module = 
    { "Control.Semigroupoid" = import ../Control.Semigroupoid;
      "Data.Bifunctor" = import ../Data.Bifunctor;
      "Data.Const" = import ../Data.Const;
      "Data.Either" = import ../Data.Either;
      "Data.Function" = import ../Data.Function;
      "Data.Functor" = import ../Data.Functor;
      "Data.Functor.App" = import ../Data.Functor.App;
      "Data.Functor.Compose" = import ../Data.Functor.Compose;
      "Data.Functor.Coproduct" = import ../Data.Functor.Coproduct;
      "Data.Functor.Product" = import ../Data.Functor.Product;
      "Data.Identity" = import ../Data.Identity;
      "Data.Maybe" = import ../Data.Maybe;
      "Data.Maybe.First" = import ../Data.Maybe.First;
      "Data.Maybe.Last" = import ../Data.Maybe.Last;
      "Data.Monoid.Additive" = import ../Data.Monoid.Additive;
      "Data.Monoid.Conj" = import ../Data.Monoid.Conj;
      "Data.Monoid.Disj" = import ../Data.Monoid.Disj;
      "Data.Monoid.Dual" = import ../Data.Monoid.Dual;
      "Data.Monoid.Multiplicative" = import ../Data.Monoid.Multiplicative;
      "Data.Tuple" = import ../Data.Tuple;
      "Data.Unit" = import ../Data.Unit;
      "Prelude" = import ../Prelude;
    };
  foreign = import ./foreign.nix;
  mapWithIndexArray = foreign.mapWithIndexArray;
  FunctorWithIndex-Dict = x: x;
  mapWithIndex = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.mapWithIndex;
      __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/FunctorWithIndex.purs at 36:3 - 36:58";
    in
      __pattern0 __patternFail;
  mapDefault = dictFunctorWithIndex: f: mapWithIndex dictFunctorWithIndex (module."Data.Function".const f);
  functorWithIndexTuple = 
    { mapWithIndex = f: module."Data.Function".apply (module."Data.Functor".map module."Data.Tuple".functorTuple) (f module."Data.Unit".unit);
      "Functor0" = __unused: module."Data.Tuple".functorTuple;
    };
  functorWithIndexProduct = dictFunctorWithIndex: dictFunctorWithIndex1: 
    { mapWithIndex = f: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              fga = v;
            in
              module."Data.Bifunctor".bimap module."Data.Bifunctor".bifunctorTuple (mapWithIndex dictFunctorWithIndex (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn f1 module."Data.Either".Left)) (mapWithIndex dictFunctorWithIndex1 (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn f1 module."Data.Either".Right)) fga;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/FunctorWithIndex.purs at 79:1 - 80:110";
        in
          __pattern0 __patternFail;
      "Functor0" = __unused: module."Data.Functor.Product".functorProduct (dictFunctorWithIndex."Functor0" module."Prim".undefined) (dictFunctorWithIndex1."Functor0" module."Prim".undefined);
    };
  functorWithIndexMultiplicative = 
    { mapWithIndex = f: module."Data.Function".apply (module."Data.Functor".map module."Data.Monoid.Multiplicative".functorMultiplicative) (f module."Data.Unit".unit);
      "Functor0" = __unused: module."Data.Monoid.Multiplicative".functorMultiplicative;
    };
  functorWithIndexMaybe = 
    { mapWithIndex = f: module."Data.Function".apply (module."Data.Functor".map module."Data.Maybe".functorMaybe) (f module."Data.Unit".unit);
      "Functor0" = __unused: module."Data.Maybe".functorMaybe;
    };
  functorWithIndexLast = 
    { mapWithIndex = f: module."Data.Function".apply (module."Data.Functor".map module."Data.Maybe.Last".functorLast) (f module."Data.Unit".unit);
      "Functor0" = __unused: module."Data.Maybe.Last".functorLast;
    };
  functorWithIndexIdentity = 
    { mapWithIndex = f: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              a = v;
            in
              f1 module."Data.Unit".unit a;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/FunctorWithIndex.purs at 73:1 - 74:52";
        in
          __pattern0 __patternFail;
      "Functor0" = __unused: module."Data.Identity".functorIdentity;
    };
  functorWithIndexFirst = 
    { mapWithIndex = f: module."Data.Function".apply (module."Data.Functor".map module."Data.Maybe.First".functorFirst) (f module."Data.Unit".unit);
      "Functor0" = __unused: module."Data.Maybe.First".functorFirst;
    };
  functorWithIndexEither = 
    { mapWithIndex = f: module."Data.Function".apply (module."Data.Functor".map module."Data.Either".functorEither) (f module."Data.Unit".unit);
      "Functor0" = __unused: module."Data.Either".functorEither;
    };
  functorWithIndexDual = 
    { mapWithIndex = f: module."Data.Function".apply (module."Data.Functor".map module."Data.Monoid.Dual".functorDual) (f module."Data.Unit".unit);
      "Functor0" = __unused: module."Data.Monoid.Dual".functorDual;
    };
  functorWithIndexDisj = 
    { mapWithIndex = f: module."Data.Function".apply (module."Data.Functor".map module."Data.Monoid.Disj".functorDisj) (f module."Data.Unit".unit);
      "Functor0" = __unused: module."Data.Monoid.Disj".functorDisj;
    };
  functorWithIndexCoproduct = dictFunctorWithIndex: dictFunctorWithIndex1: 
    { mapWithIndex = f: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              e = v;
            in
              module."Data.Bifunctor".bimap module."Data.Bifunctor".bifunctorEither (mapWithIndex dictFunctorWithIndex (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn f1 module."Data.Either".Left)) (mapWithIndex dictFunctorWithIndex1 (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn f1 module."Data.Either".Right)) e;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/FunctorWithIndex.purs at 82:1 - 83:110";
        in
          __pattern0 __patternFail;
      "Functor0" = __unused: module."Data.Functor.Coproduct".functorCoproduct (dictFunctorWithIndex."Functor0" module."Prim".undefined) (dictFunctorWithIndex1."Functor0" module."Prim".undefined);
    };
  functorWithIndexConst = 
    { mapWithIndex = v: v1: 
        let
          __pattern0 = __fail: 
            let
              x = v1;
            in
              x;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/FunctorWithIndex.purs at 76:1 - 77:37";
        in
          __pattern0 __patternFail;
      "Functor0" = __unused: module."Data.Const".functorConst;
    };
  functorWithIndexConj = 
    { mapWithIndex = f: module."Data.Function".apply (module."Data.Functor".map module."Data.Monoid.Conj".functorConj) (f module."Data.Unit".unit);
      "Functor0" = __unused: module."Data.Monoid.Conj".functorConj;
    };
  functorWithIndexCompose = dictFunctorWithIndex: dictFunctorWithIndex1: 
    { mapWithIndex = f: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              fga = v;
            in
              module."Data.Function".apply module."Data.Functor.Compose".Compose (mapWithIndex dictFunctorWithIndex (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn (mapWithIndex dictFunctorWithIndex1) (module."Data.Tuple".curry f1)) fga);
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/FunctorWithIndex.purs at 85:1 - 86:87";
        in
          __pattern0 __patternFail;
      "Functor0" = __unused: module."Data.Functor.Compose".functorCompose (dictFunctorWithIndex."Functor0" module."Prim".undefined) (dictFunctorWithIndex1."Functor0" module."Prim".undefined);
    };
  functorWithIndexArray = 
    { mapWithIndex = mapWithIndexArray;
      "Functor0" = __unused: module."Data.Functor".functorArray;
    };
  functorWithIndexApp = dictFunctorWithIndex: 
    { mapWithIndex = f: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              x = v;
            in
              module."Data.Function".apply module."Data.Functor.App".App (mapWithIndex dictFunctorWithIndex f1 x);
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/FunctorWithIndex.purs at 88:1 - 89:50";
        in
          __pattern0 __patternFail;
      "Functor0" = __unused: module."Data.Functor.App".functorApp (dictFunctorWithIndex."Functor0" module."Prim".undefined);
    };
  functorWithIndexAdditive = 
    { mapWithIndex = f: module."Data.Function".apply (module."Data.Functor".map module."Data.Monoid.Additive".functorAdditive) (f module."Data.Unit".unit);
      "Functor0" = __unused: module."Data.Monoid.Additive".functorAdditive;
    };
in
  {inherit mapWithIndex mapDefault functorWithIndexArray functorWithIndexMaybe functorWithIndexFirst functorWithIndexLast functorWithIndexAdditive functorWithIndexDual functorWithIndexConj functorWithIndexDisj functorWithIndexMultiplicative functorWithIndexEither functorWithIndexTuple functorWithIndexIdentity functorWithIndexConst functorWithIndexProduct functorWithIndexCoproduct functorWithIndexCompose functorWithIndexApp;}