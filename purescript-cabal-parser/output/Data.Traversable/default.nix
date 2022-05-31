
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
      "Data.Traversable.Accum" = import ../Data.Traversable.Accum;
      "Data.Traversable.Accum.Internal" = import ../Data.Traversable.Accum.Internal;
      "Data.Tuple" = import ../Data.Tuple;
      "Prelude" = import ../Prelude;
    };
  foreign = import ./foreign.nix;
  traverseArrayImpl = foreign.traverseArrayImpl;
  Traversable-Dict = x: x;
  traverse = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.traverse;
      __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Traversable.purs at 80:3 - 80:74";
    in
      __pattern0 __patternFail;
  traversableTuple = 
    { traverse = dictApplicative: f: v: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Tuple"
              then 
                let
                  f1 = f;
                  x = v.__field0;
                  y = v.__field1;
                in
                  module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined) (module."Data.Tuple".Tuple x) (f1 y)
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Traversable.purs at 155:1 - 157:39";
        in
          __pattern0 __patternFail;
      sequence = dictApplicative: v: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Tuple"
              then 
                let
                  x = v.__field0;
                  y = v.__field1;
                in
                  module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined) (module."Data.Tuple".Tuple x) y
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Traversable.purs at 155:1 - 157:39";
        in
          __pattern0 __patternFail;
      "Functor0" = __unused: module."Data.Tuple".functorTuple;
      "Foldable1" = __unused: module."Data.Foldable".foldableTuple;
    };
  traversableMultiplicative = 
    { traverse = dictApplicative: f: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              x = v;
            in
              module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined) module."Data.Monoid.Multiplicative".Multiplicative (f1 x);
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Traversable.purs at 145:1 - 147:53";
        in
          __pattern0 __patternFail;
      sequence = dictApplicative: v: 
        let
          __pattern0 = __fail: 
            let
              x = v;
            in
              module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined) module."Data.Monoid.Multiplicative".Multiplicative x;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Traversable.purs at 145:1 - 147:53";
        in
          __pattern0 __patternFail;
      "Functor0" = __unused: module."Data.Monoid.Multiplicative".functorMultiplicative;
      "Foldable1" = __unused: module."Data.Foldable".foldableMultiplicative;
    };
  traversableMaybe = 
    { traverse = dictApplicative: v: v1: 
        let
          __pattern0 = __fail: if v1.__tag == "Nothing" then module."Control.Applicative".pure dictApplicative module."Data.Maybe".Nothing else __fail;
          __pattern1 = __fail: 
            if v1.__tag == "Just"
              then 
                let
                  f = v;
                  x = v1.__field0;
                in
                  module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined) module."Data.Maybe".Just (f x)
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Traversable.purs at 115:1 - 119:33";
        in
          __pattern0 (__pattern1 __patternFail);
      sequence = dictApplicative: v: 
        let
          __pattern0 = __fail: if v.__tag == "Nothing" then module."Control.Applicative".pure dictApplicative module."Data.Maybe".Nothing else __fail;
          __pattern1 = __fail: 
            if v.__tag == "Just"
              then 
                let
                  x = v.__field0;
                in
                  module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined) module."Data.Maybe".Just x
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Traversable.purs at 115:1 - 119:33";
        in
          __pattern0 (__pattern1 __patternFail);
      "Functor0" = __unused: module."Data.Maybe".functorMaybe;
      "Foldable1" = __unused: module."Data.Foldable".foldableMaybe;
    };
  traversableIdentity = 
    { traverse = dictApplicative: f: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              x = v;
            in
              module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined) module."Data.Identity".Identity (f1 x);
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Traversable.purs at 159:1 - 161:41";
        in
          __pattern0 __patternFail;
      sequence = dictApplicative: v: 
        let
          __pattern0 = __fail: 
            let
              x = v;
            in
              module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined) module."Data.Identity".Identity x;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Traversable.purs at 159:1 - 161:41";
        in
          __pattern0 __patternFail;
      "Functor0" = __unused: module."Data.Identity".functorIdentity;
      "Foldable1" = __unused: module."Data.Foldable".foldableIdentity;
    };
  traversableEither = 
    { traverse = dictApplicative: v: v1: 
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
                  module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined) module."Data.Either".Right (f x)
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Traversable.purs at 149:1 - 153:36";
        in
          __pattern0 (__pattern1 __patternFail);
      sequence = dictApplicative: v: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Left"
              then 
                let
                  x = v.__field0;
                in
                  module."Control.Applicative".pure dictApplicative (module."Data.Either".Left x)
              else __fail;
          __pattern1 = __fail: 
            if v.__tag == "Right"
              then 
                let
                  x = v.__field0;
                in
                  module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined) module."Data.Either".Right x
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Traversable.purs at 149:1 - 153:36";
        in
          __pattern0 (__pattern1 __patternFail);
      "Functor0" = __unused: module."Data.Either".functorEither;
      "Foldable1" = __unused: module."Data.Foldable".foldableEither;
    };
  traversableDual = 
    { traverse = dictApplicative: f: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              x = v;
            in
              module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined) module."Data.Monoid.Dual".Dual (f1 x);
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Traversable.purs at 133:1 - 135:33";
        in
          __pattern0 __patternFail;
      sequence = dictApplicative: v: 
        let
          __pattern0 = __fail: 
            let
              x = v;
            in
              module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined) module."Data.Monoid.Dual".Dual x;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Traversable.purs at 133:1 - 135:33";
        in
          __pattern0 __patternFail;
      "Functor0" = __unused: module."Data.Monoid.Dual".functorDual;
      "Foldable1" = __unused: module."Data.Foldable".foldableDual;
    };
  traversableDisj = 
    { traverse = dictApplicative: f: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              x = v;
            in
              module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined) module."Data.Monoid.Disj".Disj (f1 x);
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Traversable.purs at 141:1 - 143:33";
        in
          __pattern0 __patternFail;
      sequence = dictApplicative: v: 
        let
          __pattern0 = __fail: 
            let
              x = v;
            in
              module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined) module."Data.Monoid.Disj".Disj x;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Traversable.purs at 141:1 - 143:33";
        in
          __pattern0 __patternFail;
      "Functor0" = __unused: module."Data.Monoid.Disj".functorDisj;
      "Foldable1" = __unused: module."Data.Foldable".foldableDisj;
    };
  traversableConst = 
    { traverse = dictApplicative: v: v1: 
        let
          __pattern0 = __fail: 
            let
              x = v1;
            in
              module."Control.Applicative".pure dictApplicative x;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Traversable.purs at 163:1 - 165:38";
        in
          __pattern0 __patternFail;
      sequence = dictApplicative: v: 
        let
          __pattern0 = __fail: 
            let
              x = v;
            in
              module."Control.Applicative".pure dictApplicative x;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Traversable.purs at 163:1 - 165:38";
        in
          __pattern0 __patternFail;
      "Functor0" = __unused: module."Data.Const".functorConst;
      "Foldable1" = __unused: module."Data.Foldable".foldableConst;
    };
  traversableConj = 
    { traverse = dictApplicative: f: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              x = v;
            in
              module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined) module."Data.Monoid.Conj".Conj (f1 x);
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Traversable.purs at 137:1 - 139:33";
        in
          __pattern0 __patternFail;
      sequence = dictApplicative: v: 
        let
          __pattern0 = __fail: 
            let
              x = v;
            in
              module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined) module."Data.Monoid.Conj".Conj x;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Traversable.purs at 137:1 - 139:33";
        in
          __pattern0 __patternFail;
      "Functor0" = __unused: module."Data.Monoid.Conj".functorConj;
      "Foldable1" = __unused: module."Data.Foldable".foldableConj;
    };
  traversableCompose = dictTraversable: dictTraversable1: 
    { traverse = dictApplicative: f: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              fga = v;
            in
              module."Data.Function".apply (module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined) module."Data.Functor.Compose".Compose) (traverse dictTraversable dictApplicative (traverse dictTraversable1 dictApplicative f1) fga);
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Traversable.purs at 179:1 - 181:31";
        in
          __pattern0 __patternFail;
      sequence = dictApplicative: traverse (traversableCompose dictTraversable dictTraversable1) dictApplicative (module."Control.Category".identity module."Control.Category".categoryFn);
      "Functor0" = __unused: module."Data.Functor.Compose".functorCompose (dictTraversable."Functor0" module."Prim".undefined) (dictTraversable1."Functor0" module."Prim".undefined);
      "Foldable1" = __unused: module."Data.Foldable".foldableCompose (dictTraversable."Foldable1" module."Prim".undefined) (dictTraversable1."Foldable1" module."Prim".undefined);
    };
  traversableAdditive = 
    { traverse = dictApplicative: f: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              x = v;
            in
              module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined) module."Data.Monoid.Additive".Additive (f1 x);
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Traversable.purs at 129:1 - 131:41";
        in
          __pattern0 __patternFail;
      sequence = dictApplicative: v: 
        let
          __pattern0 = __fail: 
            let
              x = v;
            in
              module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined) module."Data.Monoid.Additive".Additive x;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Traversable.purs at 129:1 - 131:41";
        in
          __pattern0 __patternFail;
      "Functor0" = __unused: module."Data.Monoid.Additive".functorAdditive;
      "Foldable1" = __unused: module."Data.Foldable".foldableAdditive;
    };
  sequenceDefault = dictTraversable: dictApplicative: traverse dictTraversable dictApplicative (module."Control.Category".identity module."Control.Category".categoryFn);
  traversableArray = 
    { traverse = dictApplicative: traverseArrayImpl (module."Control.Apply".apply (dictApplicative."Apply0" module."Prim".undefined)) (module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined)) (module."Control.Applicative".pure dictApplicative);
      sequence = dictApplicative: sequenceDefault traversableArray dictApplicative;
      "Functor0" = __unused: module."Data.Functor".functorArray;
      "Foldable1" = __unused: module."Data.Foldable".foldableArray;
    };
  sequence = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.sequence;
      __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Traversable.purs at 81:3 - 81:62";
    in
      __pattern0 __patternFail;
  traversableApp = dictTraversable: 
    { traverse = dictApplicative: f: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              x = v;
            in
              module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined) module."Data.Functor.App".App (traverse dictTraversable dictApplicative f1 x);
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Traversable.purs at 183:1 - 185:40";
        in
          __pattern0 __patternFail;
      sequence = dictApplicative: v: 
        let
          __pattern0 = __fail: 
            let
              x = v;
            in
              module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined) module."Data.Functor.App".App (sequence dictTraversable dictApplicative x);
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Traversable.purs at 183:1 - 185:40";
        in
          __pattern0 __patternFail;
      "Functor0" = __unused: module."Data.Functor.App".functorApp (dictTraversable."Functor0" module."Prim".undefined);
      "Foldable1" = __unused: module."Data.Foldable".foldableApp (dictTraversable."Foldable1" module."Prim".undefined);
    };
  traversableCoproduct = dictTraversable: dictTraversable1: 
    { traverse = dictApplicative: f: module."Data.Functor.Coproduct".coproduct (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn (module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined) (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn module."Data.Functor.Coproduct".Coproduct module."Data.Either".Left)) (traverse dictTraversable dictApplicative f)) (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn (module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined) (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn module."Data.Functor.Coproduct".Coproduct module."Data.Either".Right)) (traverse dictTraversable1 dictApplicative f));
      sequence = dictApplicative: module."Data.Functor.Coproduct".coproduct (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn (module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined) (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn module."Data.Functor.Coproduct".Coproduct module."Data.Either".Left)) (sequence dictTraversable dictApplicative)) (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn (module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined) (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn module."Data.Functor.Coproduct".Coproduct module."Data.Either".Right)) (sequence dictTraversable1 dictApplicative));
      "Functor0" = __unused: module."Data.Functor.Coproduct".functorCoproduct (dictTraversable."Functor0" module."Prim".undefined) (dictTraversable1."Functor0" module."Prim".undefined);
      "Foldable1" = __unused: module."Data.Foldable".foldableCoproduct (dictTraversable."Foldable1" module."Prim".undefined) (dictTraversable1."Foldable1" module."Prim".undefined);
    };
  traversableFirst = 
    { traverse = dictApplicative: f: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              x = v;
            in
              module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined) module."Data.Maybe.First".First (traverse traversableMaybe dictApplicative f1 x);
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Traversable.purs at 121:1 - 123:44";
        in
          __pattern0 __patternFail;
      sequence = dictApplicative: v: 
        let
          __pattern0 = __fail: 
            let
              x = v;
            in
              module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined) module."Data.Maybe.First".First (sequence traversableMaybe dictApplicative x);
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Traversable.purs at 121:1 - 123:44";
        in
          __pattern0 __patternFail;
      "Functor0" = __unused: module."Data.Maybe.First".functorFirst;
      "Foldable1" = __unused: module."Data.Foldable".foldableFirst;
    };
  traversableLast = 
    { traverse = dictApplicative: f: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              x = v;
            in
              module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined) module."Data.Maybe.Last".Last (traverse traversableMaybe dictApplicative f1 x);
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Traversable.purs at 125:1 - 127:42";
        in
          __pattern0 __patternFail;
      sequence = dictApplicative: v: 
        let
          __pattern0 = __fail: 
            let
              x = v;
            in
              module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined) module."Data.Maybe.Last".Last (sequence traversableMaybe dictApplicative x);
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Traversable.purs at 125:1 - 127:42";
        in
          __pattern0 __patternFail;
      "Functor0" = __unused: module."Data.Maybe.Last".functorLast;
      "Foldable1" = __unused: module."Data.Foldable".foldableLast;
    };
  traversableProduct = dictTraversable: dictTraversable1: 
    { traverse = dictApplicative: f: v: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Tuple"
              then 
                let
                  f1 = f;
                  fa = v.__field0;
                  ga = v.__field1;
                in
                  module."Control.Apply".lift2 (dictApplicative."Apply0" module."Prim".undefined) module."Data.Functor.Product".product (traverse dictTraversable dictApplicative f1 fa) (traverse dictTraversable1 dictApplicative f1 ga)
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Traversable.purs at 167:1 - 169:79";
        in
          __pattern0 __patternFail;
      sequence = dictApplicative: v: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Tuple"
              then 
                let
                  fa = v.__field0;
                  ga = v.__field1;
                in
                  module."Control.Apply".lift2 (dictApplicative."Apply0" module."Prim".undefined) module."Data.Functor.Product".product (sequence dictTraversable dictApplicative fa) (sequence dictTraversable1 dictApplicative ga)
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Traversable.purs at 167:1 - 169:79";
        in
          __pattern0 __patternFail;
      "Functor0" = __unused: module."Data.Functor.Product".functorProduct (dictTraversable."Functor0" module."Prim".undefined) (dictTraversable1."Functor0" module."Prim".undefined);
      "Foldable1" = __unused: module."Data.Foldable".foldableProduct (dictTraversable."Foldable1" module."Prim".undefined) (dictTraversable1."Foldable1" module."Prim".undefined);
    };
  traverseDefault = dictTraversable: dictApplicative: f: ta: sequence dictTraversable dictApplicative (module."Data.Functor".map (dictTraversable."Functor0" module."Prim".undefined) f ta);
  mapAccumR = dictTraversable: f: s0: xs: module."Data.Traversable.Accum.Internal".stateR (traverse dictTraversable module."Data.Traversable.Accum.Internal".applicativeStateR (a: s: f s a) xs) s0;
  scanr = dictTraversable: f: b0: xs: 
    ( mapAccumR dictTraversable 
      ( b: a: 
        let
          b' = f a b;
        in
          
          { accum = b';
            value = b';
          }
      ) b0 xs
    ).value;
  mapAccumL = dictTraversable: f: s0: xs: module."Data.Traversable.Accum.Internal".stateL (traverse dictTraversable module."Data.Traversable.Accum.Internal".applicativeStateL (a: s: f s a) xs) s0;
  scanl = dictTraversable: f: b0: xs: 
    ( mapAccumL dictTraversable 
      ( b: a: 
        let
          b' = f b a;
        in
          
          { accum = b';
            value = b';
          }
      ) b0 xs
    ).value;
  for = dictApplicative: dictTraversable: x: f: traverse dictTraversable dictApplicative f x;
in
  
  { inherit traverse sequence traverseDefault sequenceDefault for scanl scanr mapAccumL mapAccumR traversableArray traversableMaybe traversableFirst traversableLast traversableAdditive traversableDual traversableConj traversableDisj traversableMultiplicative traversableEither traversableTuple traversableIdentity traversableConst traversableProduct traversableCoproduct traversableCompose traversableApp;
    inherit (module."Data.Foldable") all and any elem find fold foldMap foldMapDefaultL foldMapDefaultR foldl foldlDefault foldr foldrDefault for_ intercalate maximum maximumBy minimum minimumBy notElem oneOf or- sequence_ sum traverse_;
    inherit (module."Data.Traversable.Accum");
  }