
let
  module = 
    { "Data.EuclideanRing" = import ../Data.EuclideanRing;
      "Data.Ring" = import ../Data.Ring;
      "Data.Semiring" = import ../Data.Semiring;
    };
  DivisionRing-Dict = x: x;
  recip = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.recip;
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/DivisionRing.purs at 30:3 - 30:18";
    in
      __pattern0 __patternFail;
  rightDiv = dictDivisionRing: a: b: module."Data.Semiring".mul ((dictDivisionRing."Ring0" module."Prim".undefined)."Semiring0" module."Prim".undefined) a (recip dictDivisionRing b);
  leftDiv = dictDivisionRing: a: b: module."Data.Semiring".mul ((dictDivisionRing."Ring0" module."Prim".undefined)."Semiring0" module."Prim".undefined) (recip dictDivisionRing b) a;
  divisionringNumber = 
    { recip = x: module."Data.EuclideanRing".div module."Data.EuclideanRing".euclideanRingNumber 1.0 x;
      "Ring0" = __unused: module."Data.Ring".ringNumber;
    };
in
  
  { inherit recip leftDiv rightDiv divisionringNumber;
    inherit (module."Data.Ring") negate sub;
    inherit (module."Data.Semiring") add mul one zero;
  }