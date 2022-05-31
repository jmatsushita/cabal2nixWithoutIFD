
let
  module = 
    { "Control.Alt" = import ../Control.Alt;
      "Control.Alternative" = import ../Control.Alternative;
      "Control.Applicative" = import ../Control.Applicative;
      "Control.Apply" = import ../Control.Apply;
      "Control.Bind" = import ../Control.Bind;
      "Control.Category" = import ../Control.Category;
      "Control.Lazy" = import ../Control.Lazy;
      "Control.Monad.ST" = import ../Control.Monad.ST;
      "Control.Monad.ST.Internal" = import ../Control.Monad.ST.Internal;
      "Control.Semigroupoid" = import ../Control.Semigroupoid;
      "Data.Array.NonEmpty.Internal" = import ../Data.Array.NonEmpty.Internal;
      "Data.Array.ST" = import ../Data.Array.ST;
      "Data.Array.ST.Iterator" = import ../Data.Array.ST.Iterator;
      "Data.Boolean" = import ../Data.Boolean;
      "Data.Eq" = import ../Data.Eq;
      "Data.Foldable" = import ../Data.Foldable;
      "Data.Function" = import ../Data.Function;
      "Data.Functor" = import ../Data.Functor;
      "Data.HeytingAlgebra" = import ../Data.HeytingAlgebra;
      "Data.Maybe" = import ../Data.Maybe;
      "Data.Ord" = import ../Data.Ord;
      "Data.Ordering" = import ../Data.Ordering;
      "Data.Ring" = import ../Data.Ring;
      "Data.Semigroup" = import ../Data.Semigroup;
      "Data.Semiring" = import ../Data.Semiring;
      "Data.Traversable" = import ../Data.Traversable;
      "Data.Tuple" = import ../Data.Tuple;
      "Data.Unfoldable" = import ../Data.Unfoldable;
      "Partial.Unsafe" = import ../Partial.Unsafe;
      "Prelude" = import ../Prelude;
      "Prim.TypeError" = import ../Prim.TypeError;
    };
  foreign = import ./foreign.nix;
  fromFoldableImpl = foreign.fromFoldableImpl;
  range = foreign.range;
  replicate = foreign.replicate;
  length = foreign.length;
  unconsImpl = foreign.unconsImpl;
  indexImpl = foreign.indexImpl;
  findMapImpl = foreign.findMapImpl;
  findIndexImpl = foreign.findIndexImpl;
  findLastIndexImpl = foreign.findLastIndexImpl;
  _insertAt = foreign._insertAt;
  _deleteAt = foreign._deleteAt;
  _updateAt = foreign._updateAt;
  reverse = foreign.reverse;
  concat = foreign.concat;
  filter = foreign.filter;
  partition = foreign.partition;
  scanl = foreign.scanl;
  scanr = foreign.scanr;
  sortByImpl = foreign.sortByImpl;
  slice = foreign.slice;
  zipWith = foreign.zipWith;
  any = foreign.any;
  all = foreign.all;
  unsafeIndexImpl = foreign.unsafeIndexImpl;
  zipWithA = dictApplicative: f: xs: ys: module."Data.Traversable".sequence module."Data.Traversable".traversableArray dictApplicative (zipWith f xs ys);
  zip = zipWith module."Data.Tuple".Tuple;
  updateAtIndices = dictFoldable: us: xs: module."Control.Monad.ST.Internal".run 
    ( module."Data.Array.ST".withArray 
      ( res: module."Data.Foldable".traverse_ module."Control.Monad.ST.Internal".applicativeST dictFoldable 
        ( v: 
          let
            __pattern0 = __fail: 
              if v.__tag == "Tuple"
                then 
                  let
                    i = v.__field0;
                    a = v.__field1;
                  in
                    module."Data.Array.ST".poke i a res
                else __fail;
            __patternFail = builtins.throw "Pattern match failure in .spago/arrays/master/src/Data/Array.purs at 756:45 - 756:77";
          in
            __pattern0 __patternFail
        ) us
      ) xs
    );
  updateAt = _updateAt module."Data.Maybe".Just module."Data.Maybe".Nothing;
  unsafeIndex = dictPartial: unsafeIndexImpl;
  uncons = unconsImpl (module."Data.Function".const module."Data.Maybe".Nothing) 
    ( x: xs: module."Data.Maybe".Just 
      { head = x;
        tail = xs;
      }
    );
  toUnfoldable = dictUnfoldable: xs: 
    let
      len = length xs;
      f = i: 
        let
          __pattern0 = __fail: 
            let
              i1 = i;
            in
              if module."Data.Ord".lessThan module."Data.Ord".ordInt i1 len then module."Data.Maybe".Just (module."Data.Tuple".Tuple (module."Partial.Unsafe".unsafePartial (dictPartial: unsafeIndex module."Prim".undefined xs i1)) (module."Data.Semiring".add module."Data.Semiring".semiringInt i1 1)) else if module."Data.Boolean".otherwise then module."Data.Maybe".Nothing else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/arrays/master/src/Data/Array.purs at 158:3 - 160:26";
        in
          __pattern0 __patternFail;
    in
      module."Data.Unfoldable".unfoldr dictUnfoldable f 0;
  take = n: xs: 
    let
      __pattern0 = __fail: if module."Data.Ord".lessThan module."Data.Ord".ordInt n 1 then [] else __fail;
      __pattern1 = __fail: slice 0 n xs;
      __patternFail = builtins.throw "Pattern match failure in .spago/arrays/master/src/Data/Array.purs at 876:13 - 876:47";
    in
      __pattern0 (__pattern1 __patternFail);
  tail = unconsImpl (module."Data.Function".const module."Data.Maybe".Nothing) (v: xs: module."Data.Maybe".Just xs);
  splitAt = i: xs: 
    let
      __pattern0 = __fail: 
        let
          i1 = i;
          xs1 = xs;
        in
          
          if module."Data.Ord".lessThanOrEq module."Data.Ord".ordInt i1 0
            then 
              { before = [];
                after = xs1;
              }
            else __fail;
      __pattern1 = __fail: 
        let
          i1 = i;
          xs1 = xs;
        in
          
          { before = slice 0 i1 xs1;
            after = slice i1 (length xs1) xs1;
          };
      __patternFail = builtins.throw "Pattern match failure in .spago/arrays/master/src/Data/Array.purs at 692:1 - 692:79";
    in
      __pattern0 (__pattern1 __patternFail);
  sortBy = comp: sortByImpl comp 
    ( v: 
      let
        __pattern0 = __fail: if v.__tag == "GT" then 1 else __fail;
        __pattern1 = __fail: if v.__tag == "EQ" then 0 else __fail;
        __pattern2 = __fail: if v.__tag == "LT" then module."Data.Ring".negate module."Data.Ring".ringInt 1 else __fail;
        __patternFail = builtins.throw "Pattern match failure in .spago/arrays/master/src/Data/Array.purs at 831:31 - 834:11";
      in
        __pattern0 (__pattern1 (__pattern2 __patternFail))
    );
  sortWith = dictOrd: f: sortBy (module."Data.Ord".comparing dictOrd f);
  sort = dictOrd: xs: sortBy (module."Data.Ord".compare dictOrd) xs;
  snoc = xs: x: module."Control.Monad.ST.Internal".run (module."Data.Array.ST".withArray (module."Data.Array.ST".push x) xs);
  singleton = a: [a];
  null = xs: module."Data.Eq".eq module."Data.Eq".eqInt (length xs) 0;
  nubByEq = eq: xs: module."Control.Monad.ST.Internal".run (module."Control.Bind".bind module."Control.Monad.ST.Internal".bindST module."Data.Array.ST".new (arr: module."Control.Bind".discard module."Control.Bind".discardUnit module."Control.Monad.ST.Internal".bindST (module."Control.Monad.ST.Internal".foreach xs (x: module."Control.Bind".bind module."Control.Monad.ST.Internal".bindST (module."Data.Functor".map module."Control.Monad.ST.Internal".functorST (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn (module."Data.HeytingAlgebra".not module."Data.HeytingAlgebra".heytingAlgebraBoolean) (any (v: eq v x))) (module."Data.Array.ST".unsafeFreeze arr)) (e: module."Data.Function".apply (module."Control.Applicative".when module."Control.Monad.ST.Internal".applicativeST e) (module."Data.Function".apply (module."Data.Functor".void module."Control.Monad.ST.Internal".functorST) (module."Data.Array.ST".push x arr))))) (__unused: module."Data.Array.ST".unsafeFreeze arr)));
  nubEq = dictEq: nubByEq (module."Data.Eq".eq dictEq);
  modifyAtIndices = dictFoldable: is: f: xs: module."Control.Monad.ST.Internal".run (module."Data.Array.ST".withArray (res: module."Data.Foldable".traverse_ module."Control.Monad.ST.Internal".applicativeST dictFoldable (i: module."Data.Array.ST".modify i f res) is) xs);
  mapWithIndex = f: xs: zipWith f (range 0 (module."Data.Ring".sub module."Data.Ring".ringInt (length xs) 1)) xs;
  intersperse = a: arr: 
    let
      v = length arr;
    in
      
      let
        __pattern0 = __fail: 
          let
            len = v;
          in
            
            if module."Data.Ord".lessThan module."Data.Ord".ordInt len 2
              then arr
              else 
                if module."Data.Boolean".otherwise
                  then module."Data.Array.ST".run 
                    ( 
                      let
                        unsafeGetElem = idx: module."Partial.Unsafe".unsafePartial (dictPartial: unsafeIndex module."Prim".undefined arr idx);
                      in
                        module."Control.Bind".bind module."Control.Monad.ST.Internal".bindST module."Data.Array.ST".new (out: module."Control.Bind".bind module."Control.Monad.ST.Internal".bindST (module."Data.Array.ST".push (unsafeGetElem 0) out) (__unused: module."Control.Bind".discard module."Control.Bind".discardUnit module."Control.Monad.ST.Internal".bindST (module."Control.Monad.ST.Internal".for 1 len (idx: module."Control.Bind".bind module."Control.Monad.ST.Internal".bindST (module."Data.Array.ST".push a out) (__unused: module."Data.Functor".void module."Control.Monad.ST.Internal".functorST (module."Data.Array.ST".push (unsafeGetElem idx) out)))) (__unused: module."Control.Applicative".pure module."Control.Monad.ST.Internal".applicativeST out)))
                    )
                  else __fail;
        __patternFail = builtins.throw "Pattern match failure in .spago/arrays/master/src/Data/Array.purs at 613:21 - 622:19";
      in
        __pattern0 __patternFail;
  intercalate = dictMonoid: module."Data.Foldable".intercalate module."Data.Foldable".foldableArray dictMonoid;
  insertAt = _insertAt module."Data.Maybe".Just module."Data.Maybe".Nothing;
  init = xs: 
    let
      __pattern0 = __fail: 
        let
          xs1 = xs;
        in
          if null xs1 then module."Data.Maybe".Nothing else if module."Data.Boolean".otherwise then module."Data.Maybe".Just (slice (module."Data.Semiring".zero module."Data.Semiring".semiringInt) (module."Data.Ring".sub module."Data.Ring".ringInt (length xs1) (module."Data.Semiring".one module."Data.Semiring".semiringInt)) xs1) else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/arrays/master/src/Data/Array.purs at 340:1 - 340:45";
    in
      __pattern0 __patternFail;
  index = indexImpl module."Data.Maybe".Just module."Data.Maybe".Nothing;
  last = xs: index xs (module."Data.Ring".sub module."Data.Ring".ringInt (length xs) 1);
  unsnoc = xs: module."Control.Apply".apply module."Data.Maybe".applyMaybe 
    ( module."Data.Functor".map module."Data.Maybe".functorMaybe 
      ( v: v1: 
        { init = v;
          last = v1;
        }
      ) (init xs)
    ) (last xs);
  modifyAt = i: f: xs: 
    let
      go = x: updateAt i (f x) xs;
    in
      module."Data.Maybe".maybe module."Data.Maybe".Nothing go (index xs i);
  span = p: arr: 
    let
      go = i: 
        let
          v = index arr i;
        in
          
          let
            __pattern0 = __fail: 
              if v.__tag == "Just"
                then 
                  let
                    x = v.__field0;
                  in
                    
                    let
                      __pattern0 = __fail: if p x then go (module."Data.Semiring".add module."Data.Semiring".semiringInt i 1) else __fail;
                      __pattern1 = __fail: module."Data.Maybe".Just i;
                      __patternFail = builtins.throw "Pattern match failure in .spago/arrays/master/src/Data/Array.purs at 967:17 - 967:51";
                    in
                      __pattern0 (__pattern1 __patternFail)
                else __fail;
            __pattern1 = __fail: if v.__tag == "Nothing" then module."Data.Maybe".Nothing else __fail;
            __patternFail = builtins.throw "Pattern match failure in .spago/arrays/master/src/Data/Array.purs at 966:5 - 968:25";
          in
            __pattern0 (__pattern1 __patternFail);
      breakIndex = go 0;
    in
      
      let
        __pattern0 = __fail: 
          if breakIndex.__tag == "Just" && breakIndex.__field0 == 0
            then 
              { init = [];
                rest = arr;
              }
            else __fail;
        __pattern1 = __fail: 
          if breakIndex.__tag == "Just"
            then 
              let
                i = breakIndex.__field0;
              in
                
                { init = slice 0 i arr;
                  rest = slice i (length arr) arr;
                }
            else __fail;
        __pattern2 = __fail: 
          if breakIndex.__tag == "Nothing"
            then 
              { init = arr;
                rest = [];
              }
            else __fail;
        __patternFail = builtins.throw "Pattern match failure in .spago/arrays/master/src/Data/Array.purs at 953:3 - 959:30";
      in
        __pattern0 (__pattern1 (__pattern2 __patternFail));
  takeWhile = p: xs: (span p xs).init;
  unzip = xs: module."Control.Monad.ST.Internal".run 
    ( module."Control.Bind".bind module."Control.Monad.ST.Internal".bindST module."Data.Array.ST".new 
      ( fsts: module."Control.Bind".bind module."Control.Monad.ST.Internal".bindST module."Data.Array.ST".new 
        ( snds: module."Control.Bind".bind module."Control.Monad.ST.Internal".bindST (module."Data.Array.ST.Iterator".iterator (v: index xs v)) 
          ( iter: module."Control.Bind".discard module."Control.Bind".discardUnit module."Control.Monad.ST.Internal".bindST 
            ( module."Data.Array.ST.Iterator".iterate iter 
              ( v: 
                let
                  __pattern0 = __fail: 
                    if v.__tag == "Tuple"
                      then 
                        let
                          fst = v.__field0;
                          snd = v.__field1;
                        in
                          module."Control.Bind".discard module."Control.Bind".discardUnit module."Control.Monad.ST.Internal".bindST (module."Data.Function".apply (module."Data.Functor".void module."Control.Monad.ST.Internal".functorST) (module."Data.Array.ST".push fst fsts)) (__unused: module."Data.Function".apply (module."Data.Functor".void module."Control.Monad.ST.Internal".functorST) (module."Data.Array.ST".push snd snds))
                      else __fail;
                  __patternFail = builtins.throw "Pattern match failure in .spago/arrays/master/src/Data/Array.purs at 1229:23 - 1231:31";
                in
                  __pattern0 __patternFail
              )
            ) (__unused: module."Control.Bind".bind module."Control.Monad.ST.Internal".bindST (module."Data.Array.ST".unsafeFreeze fsts) (fsts': module."Control.Bind".bind module."Control.Monad.ST.Internal".bindST (module."Data.Array.ST".unsafeFreeze snds) (snds': module."Data.Function".apply (module."Control.Applicative".pure module."Control.Monad.ST.Internal".applicativeST) (module."Data.Tuple".Tuple fsts' snds'))))
          )
        )
      )
    );
  head = xs: index xs 0;
  nubBy = comp: xs: 
    let
      indexedAndSorted = sortBy (x: y: comp (module."Data.Tuple".snd x) (module."Data.Tuple".snd y)) (mapWithIndex module."Data.Tuple".Tuple xs);
    in
      
      let
        v = head indexedAndSorted;
      in
        
        let
          __pattern0 = __fail: if v.__tag == "Nothing" then [] else __fail;
          __pattern1 = __fail: 
            if v.__tag == "Just"
              then 
                let
                  x = v.__field0;
                in
                  module."Data.Function".apply (module."Data.Functor".map module."Data.Functor".functorArray module."Data.Tuple".snd) 
                  ( module."Data.Function".apply (sortWith module."Data.Ord".ordInt module."Data.Tuple".fst) 
                    ( module."Control.Monad.ST.Internal".run 
                      ( module."Control.Bind".bind module."Control.Monad.ST.Internal".bindST (module."Data.Function".apply module."Data.Array.ST".unsafeThaw (singleton x)) 
                        ( result: module."Control.Bind".discard module."Control.Bind".discardUnit module."Control.Monad.ST.Internal".bindST 
                          ( module."Control.Monad.ST.Internal".foreach indexedAndSorted 
                            ( v1: 
                              let
                                __pattern0 = __fail: 
                                  if v1.__tag == "Tuple"
                                    then 
                                      let
                                        pair = v1;
                                        x' = v1.__field1;
                                      in
                                        module."Control.Bind".bind module."Control.Monad.ST.Internal".bindST (module."Data.Functor".map module."Control.Monad.ST.Internal".functorST (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn module."Data.Tuple".snd (module."Partial.Unsafe".unsafePartial (dictPartial: module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn (module."Data.Maybe".fromJust module."Prim".undefined) last))) (module."Data.Array.ST".unsafeFreeze result)) (lst: module."Data.Function".apply (module."Control.Applicative".when module."Control.Monad.ST.Internal".applicativeST (module."Data.Eq".notEq module."Data.Ordering".eqOrdering (comp lst x') module."Data.Ordering".EQ)) (module."Data.Function".apply (module."Data.Functor".void module."Control.Monad.ST.Internal".functorST) (module."Data.Array.ST".push pair result)))
                                    else __fail;
                                __patternFail = builtins.throw "Pattern match failure in .spago/arrays/master/src/Data/Array.purs at 1055:34 - 1057:62";
                              in
                                __pattern0 __patternFail
                            )
                          ) (__unused: module."Data.Array.ST".unsafeFreeze result)
                        )
                      )
                    )
                  )
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/arrays/master/src/Data/Array.purs at 1050:17 - 1058:29";
        in
          __pattern0 (__pattern1 __patternFail);
  nub = dictOrd: nubBy (module."Data.Ord".compare dictOrd);
  groupBy = op: xs: module."Control.Monad.ST.Internal".run (module."Control.Bind".bind module."Control.Monad.ST.Internal".bindST module."Data.Array.ST".new (result: module."Control.Bind".bind module."Control.Monad.ST.Internal".bindST (module."Data.Array.ST.Iterator".iterator (v: index xs v)) (iter: module."Control.Bind".discard module."Control.Bind".discardUnit module."Control.Monad.ST.Internal".bindST (module."Data.Array.ST.Iterator".iterate iter (x: module."Data.Functor".void module."Control.Monad.ST.Internal".functorST (module."Control.Bind".bind module."Control.Monad.ST.Internal".bindST module."Data.Array.ST".new (sub: module."Control.Bind".bind module."Control.Monad.ST.Internal".bindST (module."Data.Array.ST".push x sub) (__unused: module."Control.Bind".discard module."Control.Bind".discardUnit module."Control.Monad.ST.Internal".bindST (module."Data.Array.ST.Iterator".pushWhile (op x) iter sub) (__unused: module."Control.Bind".bind module."Control.Monad.ST.Internal".bindST (module."Data.Array.ST".unsafeFreeze sub) (grp: module."Data.Array.ST".push grp result))))))) (__unused: module."Data.Array.ST".unsafeFreeze result))));
  groupAllBy = cmp: module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn (groupBy (x: y: module."Data.Eq".eq module."Data.Ordering".eqOrdering (cmp x y) module."Data.Ordering".EQ)) (sortBy cmp);
  groupAll = dictOrd: groupAllBy (module."Data.Ord".compare dictOrd);
  group' = dictWarn: dictOrd: groupAll dictOrd;
  group = dictEq: xs: groupBy (module."Data.Eq".eq dictEq) xs;
  fromFoldable = dictFoldable: fromFoldableImpl (module."Data.Foldable".foldr dictFoldable);
  foldr = module."Data.Foldable".foldr module."Data.Foldable".foldableArray;
  foldl = module."Data.Foldable".foldl module."Data.Foldable".foldableArray;
  foldMap = dictMonoid: module."Data.Foldable".foldMap module."Data.Foldable".foldableArray dictMonoid;
  foldM = dictMonad: f: b: unconsImpl (v: module."Control.Applicative".pure (dictMonad."Applicative0" module."Prim".undefined) b) (a: as: module."Control.Bind".bind (dictMonad."Bind1" module."Prim".undefined) (f b a) (b': foldM dictMonad f b' as));
  fold = dictMonoid: module."Data.Foldable".fold module."Data.Foldable".foldableArray dictMonoid;
  findMap = findMapImpl module."Data.Maybe".Nothing module."Data.Maybe".isJust;
  findLastIndex = findLastIndexImpl module."Data.Maybe".Just module."Data.Maybe".Nothing;
  insertBy = cmp: x: ys: 
    let
      i = module."Data.Maybe".maybe 0 (v: module."Data.Semiring".add module."Data.Semiring".semiringInt v 1) (findLastIndex (y: module."Data.Eq".eq module."Data.Ordering".eqOrdering (cmp x y) module."Data.Ordering".GT) ys);
    in
      module."Partial.Unsafe".unsafePartial (dictPartial: module."Data.Maybe".fromJust module."Prim".undefined (insertAt i x ys));
  insert = dictOrd: insertBy (module."Data.Ord".compare dictOrd);
  findIndex = findIndexImpl module."Data.Maybe".Just module."Data.Maybe".Nothing;
  intersectBy = eq: xs: ys: filter (x: module."Data.Maybe".isJust (findIndex (eq x) ys)) xs;
  intersect = dictEq: intersectBy (module."Data.Eq".eq dictEq);
  find = f: xs: module."Data.Functor".map module."Data.Maybe".functorMaybe (module."Partial.Unsafe".unsafePartial (dictPartial: unsafeIndex module."Prim".undefined xs)) (findIndex f xs);
  elemLastIndex = dictEq: x: findLastIndex (v: module."Data.Eq".eq dictEq v x);
  elemIndex = dictEq: x: findIndex (v: module."Data.Eq".eq dictEq v x);
  notElem = dictEq: a: arr: module."Data.Function".apply module."Data.Maybe".isNothing (elemIndex dictEq a arr);
  elem = dictEq: a: arr: module."Data.Function".apply module."Data.Maybe".isJust (elemIndex dictEq a arr);
  dropWhile = p: xs: (span p xs).rest;
  dropEnd = n: xs: take (module."Data.Ring".sub module."Data.Ring".ringInt (length xs) n) xs;
  drop = n: xs: 
    let
      __pattern0 = __fail: if module."Data.Ord".lessThan module."Data.Ord".ordInt n 1 then xs else __fail;
      __pattern1 = __fail: slice n (length xs) xs;
      __patternFail = builtins.throw "Pattern match failure in .spago/arrays/master/src/Data/Array.purs at 912:13 - 912:57";
    in
      __pattern0 (__pattern1 __patternFail);
  takeEnd = n: xs: drop (module."Data.Ring".sub module."Data.Ring".ringInt (length xs) n) xs;
  deleteAt = _deleteAt module."Data.Maybe".Just module."Data.Maybe".Nothing;
  deleteBy = v: v1: v2: 
    let
      __pattern0 = __fail: if builtins.length v2 == 0 then [] else __fail;
      __pattern1 = __fail: 
        let
          eq = v;
          x = v1;
          ys = v2;
        in
          module."Data.Maybe".maybe ys (i: module."Data.Function".apply module."Partial.Unsafe".unsafePartial (dictPartial: module."Data.Maybe".fromJust module."Prim".undefined (deleteAt i ys))) (findIndex (eq x) ys);
      __patternFail = builtins.throw "Pattern match failure in .spago/arrays/master/src/Data/Array.purs at 1128:1 - 1128:69";
    in
      __pattern0 (__pattern1 __patternFail);
  unionBy = eq: xs: ys: module."Data.Semigroup".append module."Data.Semigroup".semigroupArray xs (foldl (module."Data.Function".flip (deleteBy eq)) (nubByEq eq ys) xs);
  union = dictEq: unionBy (module."Data.Eq".eq dictEq);
  delete = dictEq: deleteBy (module."Data.Eq".eq dictEq);
  difference = dictEq: foldr (delete dictEq);
  cons = x: xs: module."Data.Semigroup".append module."Data.Semigroup".semigroupArray [x] xs;
  some = dictAlternative: dictLazy: v: module."Control.Apply".apply ((dictAlternative."Applicative0" module."Prim".undefined)."Apply0" module."Prim".undefined) (module."Data.Functor".map (((dictAlternative."Plus1" module."Prim".undefined)."Alt0" module."Prim".undefined)."Functor0" module."Prim".undefined) cons v) (module."Control.Lazy".defer dictLazy (v1: many dictAlternative dictLazy v));
  many = dictAlternative: dictLazy: v: module."Control.Alt".alt ((dictAlternative."Plus1" module."Prim".undefined)."Alt0" module."Prim".undefined) (some dictAlternative dictLazy v) (module."Control.Applicative".pure (dictAlternative."Applicative0" module."Prim".undefined) []);
  concatMap = module."Data.Function".flip (module."Control.Bind".bind module."Control.Bind".bindArray);
  mapMaybe = f: concatMap (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn (module."Data.Maybe".maybe [] singleton) f);
  filterA = dictApplicative: p: module."Control.Semigroupoid".composeFlipped module."Control.Semigroupoid".semigroupoidFn (module."Data.Traversable".traverse module."Data.Traversable".traversableArray dictApplicative (x: module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined) (module."Data.Tuple".Tuple x) (p x))) 
    ( module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined) 
      ( mapMaybe 
        ( v: 
          let
            __pattern0 = __fail: 
              if v.__tag == "Tuple"
                then 
                  let
                    x = v.__field0;
                    b = v.__field1;
                  in
                    
                    let
                      __pattern0 = __fail: if b then module."Data.Maybe".Just x else __fail;
                      __pattern1 = __fail: module."Data.Maybe".Nothing;
                      __patternFail = builtins.throw "Pattern match failure in .spago/arrays/master/src/Data/Array.purs at 705:38 - 705:67";
                    in
                      __pattern0 (__pattern1 __patternFail)
                else __fail;
            __patternFail = builtins.throw "Pattern match failure in .spago/arrays/master/src/Data/Array.purs at 705:22 - 705:67";
          in
            __pattern0 __patternFail
        )
      )
    );
  catMaybes = mapMaybe (module."Control.Category".identity module."Control.Category".categoryFn);
  alterAt = i: f: xs: 
    let
      go = x: 
        let
          v = f x;
        in
          
          let
            __pattern0 = __fail: if v.__tag == "Nothing" then deleteAt i xs else __fail;
            __pattern1 = __fail: 
              if v.__tag == "Just"
                then 
                  let
                    x' = v.__field0;
                  in
                    updateAt i x' xs
                else __fail;
            __patternFail = builtins.throw "Pattern match failure in .spago/arrays/master/src/Data/Array.purs at 591:10 - 593:32";
          in
            __pattern0 (__pattern1 __patternFail);
    in
      module."Data.Maybe".maybe module."Data.Maybe".Nothing go (index xs i);
in
  {inherit fromFoldable toUnfoldable singleton range replicate some many null length cons snoc insert insertBy head last tail init uncons unsnoc index elem notElem elemIndex elemLastIndex find findMap findIndex findLastIndex insertAt deleteAt updateAt updateAtIndices modifyAt modifyAtIndices alterAt intersperse reverse concat concatMap filter partition splitAt filterA mapMaybe catMaybes mapWithIndex foldl foldr foldMap fold intercalate scanl scanr sort sortBy sortWith slice take takeEnd takeWhile drop dropEnd dropWhile span group groupAll group' groupBy groupAllBy nub nubEq nubBy nubByEq union unionBy delete deleteBy difference intersect intersectBy zipWith zipWithA zip unzip any all foldM unsafeIndex;}