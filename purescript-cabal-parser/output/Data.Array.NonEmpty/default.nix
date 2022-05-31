
let
  module = 
    { "Control.Alternative" = import ../Control.Alternative;
      "Control.Bind" = import ../Control.Bind;
      "Control.Lazy" = import ../Control.Lazy;
      "Control.Semigroupoid" = import ../Control.Semigroupoid;
      "Data.Array" = import ../Data.Array;
      "Data.Array.NonEmpty.Internal" = import ../Data.Array.NonEmpty.Internal;
      "Data.Bifunctor" = import ../Data.Bifunctor;
      "Data.Boolean" = import ../Data.Boolean;
      "Data.Eq" = import ../Data.Eq;
      "Data.Foldable" = import ../Data.Foldable;
      "Data.Function" = import ../Data.Function;
      "Data.Functor" = import ../Data.Functor;
      "Data.Maybe" = import ../Data.Maybe;
      "Data.NonEmpty" = import ../Data.NonEmpty;
      "Data.Ord" = import ../Data.Ord;
      "Data.Ring" = import ../Data.Ring;
      "Data.Semigroup" = import ../Data.Semigroup;
      "Data.Semigroup.Foldable" = import ../Data.Semigroup.Foldable;
      "Data.Semiring" = import ../Data.Semiring;
      "Data.Tuple" = import ../Data.Tuple;
      "Data.Unfoldable" = import ../Data.Unfoldable;
      "Data.Unfoldable1" = import ../Data.Unfoldable1;
      "Partial.Unsafe" = import ../Partial.Unsafe;
      "Prelude" = import ../Prelude;
      "Prim.TypeError" = import ../Prim.TypeError;
      "Unsafe.Coerce" = import ../Unsafe.Coerce;
    };
  unsafeFromArrayF = module."Unsafe.Coerce".unsafeCoerce;
  unsafeFromArray = module."Data.Array.NonEmpty.Internal".NonEmptyArray;
  toArray = v: 
    let
      __pattern0 = __fail: 
        let
          xs = v;
        in
          xs;
      __patternFail = builtins.throw "Pattern match failure in .spago/arrays/master/src/Data/Array/NonEmpty.purs at 174:1 - 174:48";
    in
      __pattern0 __patternFail;
  unionBy' = eq: xs: module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn unsafeFromArray (module."Data.Array".unionBy eq (toArray xs));
  union' = dictEq: unionBy' (module."Data.Eq".eq dictEq);
  unionBy = eq: xs: module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn (unionBy' eq xs) toArray;
  union = dictEq: unionBy (module."Data.Eq".eq dictEq);
  unzip = module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn (module."Data.Bifunctor".bimap module."Data.Bifunctor".bifunctorTuple unsafeFromArray unsafeFromArray) (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn module."Data.Array".unzip toArray);
  updateAt = i: x: module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn unsafeFromArrayF (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn (module."Data.Array".updateAt i x) toArray);
  zip = xs: ys: module."Data.Function".apply unsafeFromArray (module."Data.Array".zip (toArray xs) (toArray ys));
  zipWith = f: xs: ys: module."Data.Function".apply unsafeFromArray (module."Data.Array".zipWith f (toArray xs) (toArray ys));
  zipWithA = dictApplicative: f: xs: ys: module."Data.Function".apply unsafeFromArrayF (module."Data.Array".zipWithA dictApplicative f (toArray xs) (toArray ys));
  splitAt = i: xs: module."Data.Function".apply (module."Data.Array".splitAt i) (toArray xs);
  some = dictAlternative: dictLazy: module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn unsafeFromArrayF (module."Data.Array".some dictAlternative dictLazy);
  snoc' = xs: x: module."Data.Function".apply unsafeFromArray (module."Data.Array".snoc xs x);
  snoc = xs: x: module."Data.Function".apply unsafeFromArray (module."Data.Array".snoc (toArray xs) x);
  singleton = module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn unsafeFromArray module."Data.Array".singleton;
  replicate = i: x: module."Data.Function".apply unsafeFromArray (module."Data.Array".replicate (module."Data.Ord".max module."Data.Ord".ordInt 1 i) x);
  range = x: y: module."Data.Function".apply unsafeFromArray (module."Data.Array".range x y);
  modifyAt = i: f: module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn unsafeFromArrayF (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn (module."Data.Array".modifyAt i f) toArray);
  intersectBy' = eq: xs: module."Data.Array".intersectBy eq (toArray xs);
  intersectBy = eq: xs: module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn (intersectBy' eq xs) toArray;
  intersect' = dictEq: intersectBy' (module."Data.Eq".eq dictEq);
  intersect = dictEq: intersectBy (module."Data.Eq".eq dictEq);
  intercalate = dictSemigroup: module."Data.Semigroup.Foldable".intercalate module."Data.Array.NonEmpty.Internal".foldable1NonEmptyArray dictSemigroup;
  insertAt = i: x: module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn unsafeFromArrayF (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn (module."Data.Array".insertAt i x) toArray);
  fromFoldable1 = dictFoldable1: module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn unsafeFromArray (module."Data.Array".fromFoldable (dictFoldable1."Foldable0" module."Prim".undefined));
  fromArray = xs: 
    let
      __pattern0 = __fail: 
        let
          xs1 = xs;
        in
          if module."Data.Ord".greaterThan module."Data.Ord".ordInt (module."Data.Array".length xs1) 0 then module."Data.Maybe".Just (unsafeFromArray xs1) else if module."Data.Boolean".otherwise then module."Data.Maybe".Nothing else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/arrays/master/src/Data/Array/NonEmpty.purs at 159:1 - 159:58";
    in
      __pattern0 __patternFail;
  fromFoldable = dictFoldable: module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn fromArray (module."Data.Array".fromFoldable dictFoldable);
  foldr1 = module."Data.Semigroup.Foldable".foldr1 module."Data.Array.NonEmpty.Internal".foldable1NonEmptyArray;
  foldl1 = module."Data.Semigroup.Foldable".foldl1 module."Data.Array.NonEmpty.Internal".foldable1NonEmptyArray;
  foldMap1 = dictSemigroup: module."Data.Semigroup.Foldable".foldMap1 module."Data.Array.NonEmpty.Internal".foldable1NonEmptyArray dictSemigroup;
  fold1 = dictSemigroup: module."Data.Semigroup.Foldable".fold1 module."Data.Array.NonEmpty.Internal".foldable1NonEmptyArray dictSemigroup;
  difference' = dictEq: xs: module."Data.Function".apply (module."Data.Array".difference dictEq) (toArray xs);
  cons' = x: xs: module."Data.Function".apply unsafeFromArray (module."Data.Array".cons x xs);
  fromNonEmpty = v: 
    let
      __pattern0 = __fail: 
        if v.__tag == "NonEmpty"
          then 
            let
              x = v.__field0;
              xs = v.__field1;
            in
              cons' x xs
          else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/arrays/master/src/Data/Array/NonEmpty.purs at 171:1 - 171:62";
    in
      __pattern0 __patternFail;
  concatMap = module."Data.Function".flip (module."Control.Bind".bind module."Data.Array.NonEmpty.Internal".bindNonEmptyArray);
  concat = module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn unsafeFromArray (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn module."Data.Array".concat (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn toArray (module."Data.Functor".map module."Data.Array.NonEmpty.Internal".functorNonEmptyArray toArray)));
  appendArray = xs: ys: module."Data.Function".apply unsafeFromArray (module."Data.Semigroup".append module."Data.Semigroup".semigroupArray (toArray xs) ys);
  alterAt = i: f: module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn (module."Data.Array".alterAt i f) toArray;
  adaptMaybe = f: module."Data.Function".apply module."Partial.Unsafe".unsafePartial (dictPartial: module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn (module."Data.Maybe".fromJust module."Prim".undefined) (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn f toArray));
  head = adaptMaybe module."Data.Array".head;
  init = adaptMaybe module."Data.Array".init;
  last = adaptMaybe module."Data.Array".last;
  tail = adaptMaybe module."Data.Array".tail;
  uncons = adaptMaybe module."Data.Array".uncons;
  toNonEmpty = module."Control.Semigroupoid".composeFlipped module."Control.Semigroupoid".semigroupoidFn uncons 
    ( v: 
      let
        __pattern0 = __fail: 
          let
            x = v.head;
            xs = v.tail;
          in
            module."Data.NonEmpty".NonEmpty x xs;
        __patternFail = builtins.throw "Pattern match failure in .spago/arrays/master/src/Data/Array/NonEmpty.purs at 178:25 - 178:56";
      in
        __pattern0 __patternFail
    );
  unsnoc = adaptMaybe module."Data.Array".unsnoc;
  adaptAny = f: module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn f toArray;
  all = p: module."Data.Function".apply adaptAny (module."Data.Array".all p);
  any = p: module."Data.Function".apply adaptAny (module."Data.Array".any p);
  catMaybes = adaptAny module."Data.Array".catMaybes;
  delete = dictEq: x: module."Data.Function".apply adaptAny (module."Data.Array".delete dictEq x);
  deleteAt = i: module."Data.Function".apply adaptAny (module."Data.Array".deleteAt i);
  deleteBy = f: x: module."Data.Function".apply adaptAny (module."Data.Array".deleteBy f x);
  difference = dictEq: xs: module."Data.Function".apply adaptAny (difference' dictEq xs);
  drop = i: module."Data.Function".apply adaptAny (module."Data.Array".drop i);
  dropEnd = i: module."Data.Function".apply adaptAny (module."Data.Array".dropEnd i);
  dropWhile = f: module."Data.Function".apply adaptAny (module."Data.Array".dropWhile f);
  elem = dictEq: x: module."Data.Function".apply adaptAny (module."Data.Array".elem dictEq x);
  elemIndex = dictEq: x: module."Data.Function".apply adaptAny (module."Data.Array".elemIndex dictEq x);
  elemLastIndex = dictEq: x: module."Data.Function".apply adaptAny (module."Data.Array".elemLastIndex dictEq x);
  filter = f: module."Data.Function".apply adaptAny (module."Data.Array".filter f);
  filterA = dictApplicative: f: module."Data.Function".apply adaptAny (module."Data.Array".filterA dictApplicative f);
  find = p: module."Data.Function".apply adaptAny (module."Data.Array".find p);
  findIndex = p: module."Data.Function".apply adaptAny (module."Data.Array".findIndex p);
  findLastIndex = x: module."Data.Function".apply adaptAny (module."Data.Array".findLastIndex x);
  findMap = p: module."Data.Function".apply adaptAny (module."Data.Array".findMap p);
  foldM = dictMonad: f: acc: module."Data.Function".apply adaptAny (module."Data.Array".foldM dictMonad f acc);
  index = adaptAny module."Data.Array".index;
  length = adaptAny module."Data.Array".length;
  mapMaybe = f: module."Data.Function".apply adaptAny (module."Data.Array".mapMaybe f);
  notElem = dictEq: x: module."Data.Function".apply adaptAny (module."Data.Array".notElem dictEq x);
  partition = f: module."Data.Function".apply adaptAny (module."Data.Array".partition f);
  slice = start: end: module."Data.Function".apply adaptAny (module."Data.Array".slice start end);
  span = f: module."Data.Function".apply adaptAny (module."Data.Array".span f);
  take = i: module."Data.Function".apply adaptAny (module."Data.Array".take i);
  takeEnd = i: module."Data.Function".apply adaptAny (module."Data.Array".takeEnd i);
  takeWhile = f: module."Data.Function".apply adaptAny (module."Data.Array".takeWhile f);
  toUnfoldable = dictUnfoldable: adaptAny (module."Data.Array".toUnfoldable dictUnfoldable);
  unsafeAdapt = f: module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn unsafeFromArray (adaptAny f);
  cons = x: module."Data.Function".apply unsafeAdapt (module."Data.Array".cons x);
  group = dictEq: module."Data.Function".apply unsafeAdapt (module."Data.Array".group dictEq);
  group' = dictWarn: dictOrd: module."Data.Function".apply unsafeAdapt (module."Data.Array".groupAll dictOrd);
  groupAllBy = op: module."Data.Function".apply unsafeAdapt (module."Data.Array".groupAllBy op);
  groupAll = dictOrd: groupAllBy (module."Data.Ord".compare dictOrd);
  groupBy = op: module."Data.Function".apply unsafeAdapt (module."Data.Array".groupBy op);
  insert = dictOrd: x: module."Data.Function".apply unsafeAdapt (module."Data.Array".insert dictOrd x);
  insertBy = f: x: module."Data.Function".apply unsafeAdapt (module."Data.Array".insertBy f x);
  intersperse = x: module."Data.Function".apply unsafeAdapt (module."Data.Array".intersperse x);
  mapWithIndex = f: module."Data.Function".apply unsafeAdapt (module."Data.Array".mapWithIndex f);
  modifyAtIndices = dictFoldable: is: f: module."Data.Function".apply unsafeAdapt (module."Data.Array".modifyAtIndices dictFoldable is f);
  nub = dictOrd: unsafeAdapt (module."Data.Array".nub dictOrd);
  nubBy = f: module."Data.Function".apply unsafeAdapt (module."Data.Array".nubBy f);
  nubByEq = f: module."Data.Function".apply unsafeAdapt (module."Data.Array".nubByEq f);
  nubEq = dictEq: unsafeAdapt (module."Data.Array".nubEq dictEq);
  reverse = unsafeAdapt module."Data.Array".reverse;
  scanl = f: x: module."Data.Function".apply unsafeAdapt (module."Data.Array".scanl f x);
  scanr = f: x: module."Data.Function".apply unsafeAdapt (module."Data.Array".scanr f x);
  sort = dictOrd: unsafeAdapt (module."Data.Array".sort dictOrd);
  sortBy = f: module."Data.Function".apply unsafeAdapt (module."Data.Array".sortBy f);
  sortWith = dictOrd: f: module."Data.Function".apply unsafeAdapt (module."Data.Array".sortWith dictOrd f);
  updateAtIndices = dictFoldable: pairs: module."Data.Function".apply unsafeAdapt (module."Data.Array".updateAtIndices dictFoldable pairs);
  unsafeIndex = dictPartial: adaptAny (module."Data.Array".unsafeIndex module."Prim".undefined);
  toUnfoldable1 = dictUnfoldable1: xs: 
    let
      len = length xs;
      f = i: module."Data.Function".apply (module."Data.Tuple".Tuple (module."Partial.Unsafe".unsafePartial (dictPartial: unsafeIndex module."Prim".undefined) xs i)) 
        ( 
          let
            __pattern0 = __fail: if module."Data.Ord".lessThan module."Data.Ord".ordInt i (module."Data.Ring".sub module."Data.Ring".ringInt len 1) then module."Data.Maybe".Just (module."Data.Semiring".add module."Data.Semiring".semiringInt i 1) else __fail;
            __pattern1 = __fail: module."Data.Maybe".Nothing;
            __patternFail = builtins.throw "Pattern match failure in .spago/arrays/master/src/Data/Array/NonEmpty.purs at 194:11 - 194:58";
          in
            __pattern0 (__pattern1 __patternFail)
        );
    in
      module."Data.Unfoldable1".unfoldr1 dictUnfoldable1 f 0;
in
  
  { inherit fromArray fromNonEmpty toArray toNonEmpty fromFoldable fromFoldable1 toUnfoldable toUnfoldable1 singleton range replicate some length cons cons' snoc snoc' appendArray insert insertBy head last tail init uncons unsnoc index elem notElem elemIndex elemLastIndex find findMap findIndex findLastIndex insertAt deleteAt updateAt updateAtIndices modifyAt modifyAtIndices alterAt intersperse reverse concat concatMap filter partition splitAt filterA mapMaybe catMaybes mapWithIndex foldl1 foldr1 foldMap1 fold1 intercalate scanl scanr sort sortBy sortWith slice take takeEnd takeWhile drop dropEnd dropWhile span group groupAll group' groupBy groupAllBy nub nubBy nubEq nubByEq union union' unionBy unionBy' delete deleteBy difference difference' intersect intersect' intersectBy intersectBy' zipWith zipWithA zip unzip any all foldM unsafeIndex;
    inherit (module."Data.Array.NonEmpty.Internal");
  }