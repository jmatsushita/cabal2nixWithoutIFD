
let
  module = 
    { "Data.Function" = import ../Data.Function;
      "Data.Functor" = import ../Data.Functor;
      "Data.Maybe" = import ../Data.Maybe;
      "Data.Ord" = import ../Data.Ord;
      "Data.Ring" = import ../Data.Ring;
      "Data.Traversable" = import ../Data.Traversable;
      "Data.Tuple" = import ../Data.Tuple;
      "Data.Unfoldable1" = import ../Data.Unfoldable1;
      "Data.Unit" = import ../Data.Unit;
      "Partial.Unsafe" = import ../Partial.Unsafe;
      "Prelude" = import ../Prelude;
    };
  foreign = import ./foreign.nix;
  unfoldrArrayImpl = foreign.unfoldrArrayImpl;
  Unfoldable-Dict = x: x;
  unfoldr = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.unfoldr;
      __patternFail = builtins.throw "Pattern match failure in .spago/unfoldable/master/src/Data/Unfoldable.purs at 39:3 - 39:62";
    in
      __pattern0 __patternFail;
  unfoldableMaybe = 
    { unfoldr = f: b: module."Data.Functor".map module."Data.Maybe".functorMaybe module."Data.Tuple".fst (f b);
      "Unfoldable10" = __unused: module."Data.Unfoldable1".unfoldable1Maybe;
    };
  unfoldableArray = 
    { unfoldr = unfoldrArrayImpl module."Data.Maybe".isNothing (module."Partial.Unsafe".unsafePartial (dictPartial: module."Data.Maybe".fromJust module."Prim".undefined)) module."Data.Tuple".fst module."Data.Tuple".snd;
      "Unfoldable10" = __unused: module."Data.Unfoldable1".unfoldable1Array;
    };
  replicate = dictUnfoldable: n: v: 
    let
      step = i: 
        let
          __pattern0 = __fail: if module."Data.Ord".lessThanOrEq module."Data.Ord".ordInt i 0 then module."Data.Maybe".Nothing else __fail;
          __pattern1 = __fail: module."Data.Maybe".Just (module."Data.Tuple".Tuple v (module."Data.Ring".sub module."Data.Ring".ringInt i 1));
          __patternFail = builtins.throw "Pattern match failure in .spago/unfoldable/master/src/Data/Unfoldable.purs at 68:7 - 69:34";
        in
          __pattern0 (__pattern1 __patternFail);
    in
      unfoldr dictUnfoldable step n;
  replicateA = dictApplicative: dictUnfoldable: dictTraversable: n: m: module."Data.Traversable".sequence dictTraversable dictApplicative (replicate dictUnfoldable n m);
  none = dictUnfoldable: unfoldr dictUnfoldable (module."Data.Function".const module."Data.Maybe".Nothing) module."Data.Unit".unit;
  fromMaybe = dictUnfoldable: unfoldr dictUnfoldable (b: module."Data.Functor".map module."Data.Maybe".functorMaybe (module."Data.Function".flip module."Data.Tuple".Tuple module."Data.Maybe".Nothing) b);
in
  
  { inherit unfoldr replicate replicateA none fromMaybe unfoldableArray unfoldableMaybe;
    inherit (module."Data.Unfoldable1") range replicate1 replicate1A singleton unfoldr1;
  }