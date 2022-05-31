
let
  module = 
    { "Data.Boolean" = import ../Data.Boolean;
      "Data.Eq" = import ../Data.Eq;
      "Data.Maybe" = import ../Data.Maybe;
      "Data.Ord" = import ../Data.Ord;
      "Data.Ring" = import ../Data.Ring;
      "Data.Semigroup.Traversable" = import ../Data.Semigroup.Traversable;
      "Data.Semiring" = import ../Data.Semiring;
      "Data.Tuple" = import ../Data.Tuple;
      "Partial.Unsafe" = import ../Partial.Unsafe;
      "Prelude" = import ../Prelude;
    };
  foreign = import ./foreign.nix;
  unfoldr1ArrayImpl = foreign.unfoldr1ArrayImpl;
  Unfoldable1-Dict = x: x;
  unfoldr1 = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.unfoldr1;
      __patternFail = builtins.throw "Pattern match failure in .spago/unfoldable/master/src/Data/Unfoldable1.purs at 39:3 - 39:63";
    in
      __pattern0 __patternFail;
  unfoldable1Maybe = {unfoldr1 = f: b: module."Data.Maybe".Just (module."Data.Tuple".fst (f b));};
  unfoldable1Array = {unfoldr1 = unfoldr1ArrayImpl module."Data.Maybe".isNothing (module."Partial.Unsafe".unsafePartial (dictPartial: module."Data.Maybe".fromJust module."Prim".undefined)) module."Data.Tuple".fst module."Data.Tuple".snd;};
  replicate1 = dictUnfoldable1: n: v: 
    let
      step = i: 
        let
          __pattern0 = __fail: 
            let
              i1 = i;
            in
              if module."Data.Ord".lessThanOrEq module."Data.Ord".ordInt i1 0 then module."Data.Tuple".Tuple v module."Data.Maybe".Nothing else if module."Data.Boolean".otherwise then module."Data.Tuple".Tuple v (module."Data.Maybe".Just (module."Data.Ring".sub module."Data.Ring".ringInt i1 1)) else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/unfoldable/master/src/Data/Unfoldable1.purs at 67:5 - 67:39";
        in
          __pattern0 __patternFail;
    in
      unfoldr1 dictUnfoldable1 step (module."Data.Ring".sub module."Data.Ring".ringInt n 1);
  replicate1A = dictApply: dictUnfoldable1: dictTraversable1: n: m: module."Data.Semigroup.Traversable".sequence1 dictTraversable1 dictApply (replicate1 dictUnfoldable1 n m);
  singleton = dictUnfoldable1: replicate1 dictUnfoldable1 1;
  range = dictUnfoldable1: start: end: 
    let
      go = delta: i: 
        let
          i' = module."Data.Semiring".add module."Data.Semiring".semiringInt i delta;
        in
          module."Data.Tuple".Tuple i 
          ( 
            let
              __pattern0 = __fail: if module."Data.Eq".eq module."Data.Eq".eqInt i end then module."Data.Maybe".Nothing else __fail;
              __pattern1 = __fail: module."Data.Maybe".Just i';
              __patternFail = builtins.throw "Pattern match failure in .spago/unfoldable/master/src/Data/Unfoldable1.purs at 113:19 - 113:56";
            in
              __pattern0 (__pattern1 __patternFail)
          );
    in
      
      let
        delta = 
          let
            __pattern0 = __fail: if module."Data.Ord".greaterThanOrEq module."Data.Ord".ordInt end start then 1 else __fail;
            __pattern1 = __fail: module."Data.Ring".negate module."Data.Ring".ringInt 1;
            __patternFail = builtins.throw "Pattern match failure in .spago/unfoldable/master/src/Data/Unfoldable1.purs at 109:15 - 109:45";
          in
            __pattern0 (__pattern1 __patternFail);
      in
        unfoldr1 dictUnfoldable1 (go delta) start;
in
  {inherit unfoldr1 replicate1 replicate1A singleton range unfoldable1Array unfoldable1Maybe;}