
let
  module = 
    { "Control.Applicative" = import ../Control.Applicative;
      "Control.Apply" = import ../Control.Apply;
      "Control.Category" = import ../Control.Category;
      "Data.Bifoldable" = import ../Data.Bifoldable;
      "Data.Bifunctor" = import ../Data.Bifunctor;
      "Data.Const" = import ../Data.Const;
      "Data.Either" = import ../Data.Either;
      "Data.Functor" = import ../Data.Functor;
      "Data.Functor.Clown" = import ../Data.Functor.Clown;
      "Data.Functor.Flip" = import ../Data.Functor.Flip;
      "Data.Functor.Joker" = import ../Data.Functor.Joker;
      "Data.Functor.Product2" = import ../Data.Functor.Product2;
      "Data.Traversable" = import ../Data.Traversable;
      "Data.Tuple" = import ../Data.Tuple;
      "Prelude" = import ../Prelude;
    };
  Bitraversable-Dict = x: x;
  bitraverse = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.bitraverse;
      __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Bitraversable.purs at 38:3 - 38:98";
    in
      __pattern0 __patternFail;
  lfor = dictBitraversable: dictApplicative: t: f: bitraverse dictBitraversable dictApplicative f (module."Control.Applicative".pure dictApplicative) t;
  ltraverse = dictBitraversable: dictApplicative: f: bitraverse dictBitraversable dictApplicative f (module."Control.Applicative".pure dictApplicative);
  rfor = dictBitraversable: dictApplicative: t: f: bitraverse dictBitraversable dictApplicative (module."Control.Applicative".pure dictApplicative) f t;
  rtraverse = dictBitraversable: dictApplicative: bitraverse dictBitraversable dictApplicative (module."Control.Applicative".pure dictApplicative);
  bitraversableTuple = 
    { bitraverse = dictApplicative: f: g: v: 
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
                  module."Control.Apply".apply (dictApplicative."Apply0" module."Prim".undefined) (module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined) module."Data.Tuple".Tuple (f1 a)) (g1 b)
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Bitraversable.purs at 63:1 - 65:45";
        in
          __pattern0 __patternFail;
      bisequence = dictApplicative: v: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Tuple"
              then 
                let
                  a = v.__field0;
                  b = v.__field1;
                in
                  module."Control.Apply".apply (dictApplicative."Apply0" module."Prim".undefined) (module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined) module."Data.Tuple".Tuple a) b
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Bitraversable.purs at 63:1 - 65:45";
        in
          __pattern0 __patternFail;
      "Bifunctor0" = __unused: module."Data.Bifunctor".bifunctorTuple;
      "Bifoldable1" = __unused: module."Data.Bifoldable".bifoldableTuple;
    };
  bitraversableJoker = dictTraversable: 
    { bitraverse = dictApplicative: v: r: v1: 
        let
          __pattern0 = __fail: 
            let
              r1 = r;
              f = v1;
            in
              module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined) module."Data.Functor.Joker".Joker (module."Data.Traversable".traverse dictTraversable dictApplicative r1 f);
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Bitraversable.purs at 45:1 - 47:46";
        in
          __pattern0 __patternFail;
      bisequence = dictApplicative: v: 
        let
          __pattern0 = __fail: 
            let
              f = v;
            in
              module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined) module."Data.Functor.Joker".Joker (module."Data.Traversable".sequence dictTraversable dictApplicative f);
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Bitraversable.purs at 45:1 - 47:46";
        in
          __pattern0 __patternFail;
      "Bifunctor0" = __unused: module."Data.Functor.Joker".bifunctorJoker (dictTraversable."Functor0" module."Prim".undefined);
      "Bifoldable1" = __unused: module."Data.Bifoldable".bifoldableJoker (dictTraversable."Foldable1" module."Prim".undefined);
    };
  bitraversableEither = 
    { bitraverse = dictApplicative: v: v1: v2: 
        let
          __pattern0 = __fail: 
            if v2.__tag == "Left"
              then 
                let
                  f = v;
                  a = v2.__field0;
                in
                  module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined) module."Data.Either".Left (f a)
              else __fail;
          __pattern1 = __fail: 
            if v2.__tag == "Right"
              then 
                let
                  g = v1;
                  b = v2.__field0;
                in
                  module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined) module."Data.Either".Right (g b)
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Bitraversable.purs at 57:1 - 61:37";
        in
          __pattern0 (__pattern1 __patternFail);
      bisequence = dictApplicative: v: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Left"
              then 
                let
                  a = v.__field0;
                in
                  module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined) module."Data.Either".Left a
              else __fail;
          __pattern1 = __fail: 
            if v.__tag == "Right"
              then 
                let
                  b = v.__field0;
                in
                  module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined) module."Data.Either".Right b
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Bitraversable.purs at 57:1 - 61:37";
        in
          __pattern0 (__pattern1 __patternFail);
      "Bifunctor0" = __unused: module."Data.Bifunctor".bifunctorEither;
      "Bifoldable1" = __unused: module."Data.Bifoldable".bifoldableEither;
    };
  bitraversableConst = 
    { bitraverse = dictApplicative: f: v: v1: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              a = v1;
            in
              module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined) module."Data.Const".Const (f1 a);
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Bitraversable.purs at 67:1 - 69:37";
        in
          __pattern0 __patternFail;
      bisequence = dictApplicative: v: 
        let
          __pattern0 = __fail: 
            let
              a = v;
            in
              module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined) module."Data.Const".Const a;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Bitraversable.purs at 67:1 - 69:37";
        in
          __pattern0 __patternFail;
      "Bifunctor0" = __unused: module."Data.Bifunctor".bifunctorConst;
      "Bifoldable1" = __unused: module."Data.Bifoldable".bifoldableConst;
    };
  bitraversableClown = dictTraversable: 
    { bitraverse = dictApplicative: l: v: v1: 
        let
          __pattern0 = __fail: 
            let
              l1 = l;
              f = v1;
            in
              module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined) module."Data.Functor.Clown".Clown (module."Data.Traversable".traverse dictTraversable dictApplicative l1 f);
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Bitraversable.purs at 41:1 - 43:46";
        in
          __pattern0 __patternFail;
      bisequence = dictApplicative: v: 
        let
          __pattern0 = __fail: 
            let
              f = v;
            in
              module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined) module."Data.Functor.Clown".Clown (module."Data.Traversable".sequence dictTraversable dictApplicative f);
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Bitraversable.purs at 41:1 - 43:46";
        in
          __pattern0 __patternFail;
      "Bifunctor0" = __unused: module."Data.Functor.Clown".bifunctorClown (dictTraversable."Functor0" module."Prim".undefined);
      "Bifoldable1" = __unused: module."Data.Bifoldable".bifoldableClown (dictTraversable."Foldable1" module."Prim".undefined);
    };
  bisequenceDefault = dictBitraversable: dictApplicative: bitraverse dictBitraversable dictApplicative (module."Control.Category".identity module."Control.Category".categoryFn) (module."Control.Category".identity module."Control.Category".categoryFn);
  bisequence = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.bisequence;
      __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Bitraversable.purs at 39:3 - 39:74";
    in
      __pattern0 __patternFail;
  bitraversableFlip = dictBitraversable: 
    { bitraverse = dictApplicative: r: l: v: 
        let
          __pattern0 = __fail: 
            let
              r1 = r;
              l1 = l;
              p = v;
            in
              module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined) module."Data.Functor.Flip".Flip (bitraverse dictBitraversable dictApplicative l1 r1 p);
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Bitraversable.purs at 49:1 - 51:46";
        in
          __pattern0 __patternFail;
      bisequence = dictApplicative: v: 
        let
          __pattern0 = __fail: 
            let
              p = v;
            in
              module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined) module."Data.Functor.Flip".Flip (bisequence dictBitraversable dictApplicative p);
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Bitraversable.purs at 49:1 - 51:46";
        in
          __pattern0 __patternFail;
      "Bifunctor0" = __unused: module."Data.Functor.Flip".bifunctorFlip (dictBitraversable."Bifunctor0" module."Prim".undefined);
      "Bifoldable1" = __unused: module."Data.Bifoldable".bifoldableFlip (dictBitraversable."Bifoldable1" module."Prim".undefined);
    };
  bitraversableProduct2 = dictBitraversable: dictBitraversable1: 
    { bitraverse = dictApplicative: l: r: v: 
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
                  module."Control.Apply".apply (dictApplicative."Apply0" module."Prim".undefined) (module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined) module."Data.Functor.Product2".Product2 (bitraverse dictBitraversable dictApplicative l1 r1 f)) (bitraverse dictBitraversable1 dictApplicative l1 r1 g)
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Bitraversable.purs at 53:1 - 55:73";
        in
          __pattern0 __patternFail;
      bisequence = dictApplicative: v: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Product2"
              then 
                let
                  f = v.__field0;
                  g = v.__field1;
                in
                  module."Control.Apply".apply (dictApplicative."Apply0" module."Prim".undefined) (module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined) module."Data.Functor.Product2".Product2 (bisequence dictBitraversable dictApplicative f)) (bisequence dictBitraversable1 dictApplicative g)
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Bitraversable.purs at 53:1 - 55:73";
        in
          __pattern0 __patternFail;
      "Bifunctor0" = __unused: module."Data.Functor.Product2".bifunctorProduct2 (dictBitraversable."Bifunctor0" module."Prim".undefined) (dictBitraversable1."Bifunctor0" module."Prim".undefined);
      "Bifoldable1" = __unused: module."Data.Bifoldable".bifoldableProduct2 (dictBitraversable."Bifoldable1" module."Prim".undefined) (dictBitraversable1."Bifoldable1" module."Prim".undefined);
    };
  bitraverseDefault = dictBitraversable: dictApplicative: f: g: t: bisequence dictBitraversable dictApplicative (module."Data.Bifunctor".bimap (dictBitraversable."Bifunctor0" module."Prim".undefined) f g t);
  bifor = dictBitraversable: dictApplicative: t: f: g: bitraverse dictBitraversable dictApplicative f g t;
in
  
  { inherit bitraverse bisequence bitraverseDefault bisequenceDefault ltraverse rtraverse bifor lfor rfor bitraversableClown bitraversableJoker bitraversableFlip bitraversableProduct2 bitraversableEither bitraversableTuple bitraversableConst;
    inherit (module."Data.Bifoldable") biall biany bifold bifoldMap bifoldMapDefaultL bifoldMapDefaultR bifoldl bifoldlDefault bifoldr bifoldrDefault bifor_ bisequence_ bitraverse_;
  }