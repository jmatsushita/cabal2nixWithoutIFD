
let
  module = 
    { "Data.BooleanAlgebra" = import ../Data.BooleanAlgebra;
      "Data.CommutativeRing" = import ../Data.CommutativeRing;
      "Data.Eq" = import ../Data.Eq;
      "Data.HeytingAlgebra" = import ../Data.HeytingAlgebra;
      "Data.Ring" = import ../Data.Ring;
      "Data.Semiring" = import ../Data.Semiring;
    };
  foreign = import ./foreign.nix;
  intDegree = foreign.intDegree;
  intDiv = foreign.intDiv;
  intMod = foreign.intMod;
  numDiv = foreign.numDiv;
  EuclideanRing-Dict = x: x;
  mod = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.mod;
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/EuclideanRing.purs at 66:3 - 66:21";
    in
      __pattern0 __patternFail;
  gcd = dictEq: dictEuclideanRing: a: b: 
    let
      __pattern0 = __fail: if module."Data.Eq".eq dictEq b (module."Data.Semiring".zero (((dictEuclideanRing."CommutativeRing0" module."Prim".undefined)."Ring0" module."Prim".undefined)."Semiring0" module."Prim".undefined)) then a else __fail;
      __pattern1 = __fail: gcd dictEq dictEuclideanRing b (mod dictEuclideanRing a b);
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/EuclideanRing.purs at 89:3 - 91:27";
    in
      __pattern0 (__pattern1 __patternFail);
  euclideanRingNumber = 
    { degree = v: 1;
      div = numDiv;
      mod = v: v1: 0.0;
      "CommutativeRing0" = __unused: module."Data.CommutativeRing".commutativeRingNumber;
    };
  euclideanRingInt = 
    { degree = intDegree;
      div = intDiv;
      mod = intMod;
      "CommutativeRing0" = __unused: module."Data.CommutativeRing".commutativeRingInt;
    };
  div = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.div;
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/EuclideanRing.purs at 65:3 - 65:21";
    in
      __pattern0 __patternFail;
  lcm = dictEq: dictEuclideanRing: a: b: 
    let
      __pattern0 = __fail: if module."Data.HeytingAlgebra".disj module."Data.HeytingAlgebra".heytingAlgebraBoolean (module."Data.Eq".eq dictEq a (module."Data.Semiring".zero (((dictEuclideanRing."CommutativeRing0" module."Prim".undefined)."Ring0" module."Prim".undefined)."Semiring0" module."Prim".undefined))) (module."Data.Eq".eq dictEq b (module."Data.Semiring".zero (((dictEuclideanRing."CommutativeRing0" module."Prim".undefined)."Ring0" module."Prim".undefined)."Semiring0" module."Prim".undefined))) then module."Data.Semiring".zero (((dictEuclideanRing."CommutativeRing0" module."Prim".undefined)."Ring0" module."Prim".undefined)."Semiring0" module."Prim".undefined) else __fail;
      __pattern1 = __fail: div dictEuclideanRing (module."Data.Semiring".mul (((dictEuclideanRing."CommutativeRing0" module."Prim".undefined)."Ring0" module."Prim".undefined)."Semiring0" module."Prim".undefined) a b) (gcd dictEq dictEuclideanRing a b);
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/EuclideanRing.purs at 96:3 - 98:25";
    in
      __pattern0 (__pattern1 __patternFail);
  degree = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.degree;
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/EuclideanRing.purs at 64:3 - 64:21";
    in
      __pattern0 __patternFail;
in
  
  { inherit degree div mod gcd lcm euclideanRingInt euclideanRingNumber;
    inherit (module."Data.CommutativeRing");
    inherit (module."Data.Ring") sub;
    inherit (module."Data.Semiring") add mul one zero;
  }