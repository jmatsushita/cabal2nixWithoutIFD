
let
  module = 
    { "Data.Eq" = import ../Data.Eq;
      "Data.Ordering" = import ../Data.Ordering;
      "Data.Ring" = import ../Data.Ring;
      "Data.Semiring" = import ../Data.Semiring;
      "Data.Symbol" = import ../Data.Symbol;
      "Data.Unit" = import ../Data.Unit;
      "Data.Void" = import ../Data.Void;
      "Prim.Row" = import ../Prim.Row;
      "Prim.RowList" = import ../Prim.RowList;
      "Record.Unsafe" = import ../Record.Unsafe;
      "Type.Proxy" = import ../Type.Proxy;
    };
  foreign = import ./foreign.nix;
  ordBooleanImpl = foreign.ordBooleanImpl;
  ordIntImpl = foreign.ordIntImpl;
  ordNumberImpl = foreign.ordNumberImpl;
  ordStringImpl = foreign.ordStringImpl;
  ordCharImpl = foreign.ordCharImpl;
  ordArrayImpl = foreign.ordArrayImpl;
  OrdRecord-Dict = x: x;
  Ord-Dict = x: x;
  Ord1-Dict = x: x;
  ordVoid = 
    { compare = v: v1: module."Data.Ordering".EQ;
      "Eq0" = __unused: module."Data.Eq".eqVoid;
    };
  ordUnit = 
    { compare = v: v1: module."Data.Ordering".EQ;
      "Eq0" = __unused: module."Data.Eq".eqUnit;
    };
  ordString = 
    { compare = ordStringImpl module."Data.Ordering".LT module."Data.Ordering".EQ module."Data.Ordering".GT;
      "Eq0" = __unused: module."Data.Eq".eqString;
    };
  ordRecordNil = 
    { compareRecord = v: v1: v2: module."Data.Ordering".EQ;
      "EqRecord0" = __unused: module."Data.Eq".eqRowNil;
    };
  ordProxy3 = 
    { compare = v: v1: module."Data.Ordering".EQ;
      "Eq0" = __unused: module."Data.Eq".eqProxy3;
    };
  ordProxy2 = 
    { compare = v: v1: module."Data.Ordering".EQ;
      "Eq0" = __unused: module."Data.Eq".eqProxy2;
    };
  ordProxy = 
    { compare = v: v1: module."Data.Ordering".EQ;
      "Eq0" = __unused: module."Data.Eq".eqProxy;
    };
  ordOrdering = 
    { compare = v: v1: 
        let
          __pattern0 = __fail: if v.__tag == "LT" && v1.__tag == "LT" then module."Data.Ordering".EQ else __fail;
          __pattern1 = __fail: if v.__tag == "EQ" && v1.__tag == "EQ" then module."Data.Ordering".EQ else __fail;
          __pattern2 = __fail: if v.__tag == "GT" && v1.__tag == "GT" then module."Data.Ordering".EQ else __fail;
          __pattern3 = __fail: if v.__tag == "LT" then module."Data.Ordering".LT else __fail;
          __pattern4 = __fail: if v.__tag == "EQ" && v1.__tag == "LT" then module."Data.Ordering".GT else __fail;
          __pattern5 = __fail: if v.__tag == "EQ" && v1.__tag == "GT" then module."Data.Ordering".LT else __fail;
          __pattern6 = __fail: if v.__tag == "GT" then module."Data.Ordering".GT else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Ord.purs at 121:1 - 128:21";
        in
          __pattern0 (__pattern1 (__pattern2 (__pattern3 (__pattern4 (__pattern5 (__pattern6 __patternFail))))));
      "Eq0" = __unused: module."Data.Ordering".eqOrdering;
    };
  ordNumber = 
    { compare = ordNumberImpl module."Data.Ordering".LT module."Data.Ordering".EQ module."Data.Ordering".GT;
      "Eq0" = __unused: module."Data.Eq".eqNumber;
    };
  ordInt = 
    { compare = ordIntImpl module."Data.Ordering".LT module."Data.Ordering".EQ module."Data.Ordering".GT;
      "Eq0" = __unused: module."Data.Eq".eqInt;
    };
  ordChar = 
    { compare = ordCharImpl module."Data.Ordering".LT module."Data.Ordering".EQ module."Data.Ordering".GT;
      "Eq0" = __unused: module."Data.Eq".eqChar;
    };
  ordBoolean = 
    { compare = ordBooleanImpl module."Data.Ordering".LT module."Data.Ordering".EQ module."Data.Ordering".GT;
      "Eq0" = __unused: module."Data.Eq".eqBoolean;
    };
  compareRecord = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.compareRecord;
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Ord.purs at 228:3 - 228:91";
    in
      __pattern0 __patternFail;
  ordRecord = dictRowToList: dictOrdRecord: 
    { compare = compareRecord dictOrdRecord module."Type.Proxy".Proxy;
      "Eq0" = __unused: module."Data.Eq".eqRec module."Prim".undefined (dictOrdRecord."EqRecord0" module."Prim".undefined);
    };
  compare1 = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.compare1;
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Ord.purs at 221:3 - 221:56";
    in
      __pattern0 __patternFail;
  compare = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.compare;
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Ord.purs at 38:3 - 38:32";
    in
      __pattern0 __patternFail;
  comparing = dictOrd: f: x: y: compare dictOrd (f x) (f y);
  greaterThan = dictOrd: a1: a2: 
    let
      v = compare dictOrd a1 a2;
    in
      
      let
        __pattern0 = __fail: if v.__tag == "GT" then true else __fail;
        __pattern1 = __fail: false;
        __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Ord.purs at 138:21 - 140:13";
      in
        __pattern0 (__pattern1 __patternFail);
  greaterThanOrEq = dictOrd: a1: a2: 
    let
      v = compare dictOrd a1 a2;
    in
      
      let
        __pattern0 = __fail: if v.__tag == "LT" then false else __fail;
        __pattern1 = __fail: true;
        __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Ord.purs at 150:25 - 152:12";
      in
        __pattern0 (__pattern1 __patternFail);
  signum = dictOrd: dictRing: x: 
    let
      __pattern0 = __fail: if greaterThanOrEq dictOrd x (module."Data.Semiring".zero (dictRing."Semiring0" module."Prim".undefined)) then module."Data.Semiring".one (dictRing."Semiring0" module."Prim".undefined) else __fail;
      __pattern1 = __fail: module."Data.Ring".negate dictRing (module."Data.Semiring".one (dictRing."Semiring0" module."Prim".undefined));
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Ord.purs at 217:12 - 217:49";
    in
      __pattern0 (__pattern1 __patternFail);
  lessThan = dictOrd: a1: a2: 
    let
      v = compare dictOrd a1 a2;
    in
      
      let
        __pattern0 = __fail: if v.__tag == "LT" then true else __fail;
        __pattern1 = __fail: false;
        __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Ord.purs at 132:18 - 134:13";
      in
        __pattern0 (__pattern1 __patternFail);
  lessThanOrEq = dictOrd: a1: a2: 
    let
      v = compare dictOrd a1 a2;
    in
      
      let
        __pattern0 = __fail: if v.__tag == "GT" then false else __fail;
        __pattern1 = __fail: true;
        __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Ord.purs at 144:22 - 146:12";
      in
        __pattern0 (__pattern1 __patternFail);
  max = dictOrd: x: y: 
    let
      v = compare dictOrd x y;
    in
      
      let
        __pattern0 = __fail: if v.__tag == "LT" then y else __fail;
        __pattern1 = __fail: if v.__tag == "EQ" then x else __fail;
        __pattern2 = __fail: if v.__tag == "GT" then x else __fail;
        __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Ord.purs at 176:3 - 179:12";
      in
        __pattern0 (__pattern1 (__pattern2 __patternFail));
  min = dictOrd: x: y: 
    let
      v = compare dictOrd x y;
    in
      
      let
        __pattern0 = __fail: if v.__tag == "LT" then x else __fail;
        __pattern1 = __fail: if v.__tag == "EQ" then x else __fail;
        __pattern2 = __fail: if v.__tag == "GT" then y else __fail;
        __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Ord.purs at 167:3 - 170:12";
      in
        __pattern0 (__pattern1 (__pattern2 __patternFail));
  ordArray = dictOrd: 
    { compare = 
        let
          toDelta = x: y: 
            let
              v = compare dictOrd x y;
            in
              
              let
                __pattern0 = __fail: if v.__tag == "EQ" then 0 else __fail;
                __pattern1 = __fail: if v.__tag == "LT" then 1 else __fail;
                __pattern2 = __fail: if v.__tag == "GT" then module."Data.Ring".negate module."Data.Ring".ringInt 1 else __fail;
                __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Ord.purs at 74:7 - 77:17";
              in
                __pattern0 (__pattern1 (__pattern2 __patternFail));
        in
          xs: ys: compare ordInt 0 (ordArrayImpl toDelta xs ys);
      "Eq0" = __unused: module."Data.Eq".eqArray (dictOrd."Eq0" module."Prim".undefined);
    };
  ord1Array = 
    { compare1 = dictOrd: compare (ordArray dictOrd);
      "Eq10" = __unused: module."Data.Eq".eq1Array;
    };
  ordRecordCons = dictOrdRecord: dictCons: dictIsSymbol: dictOrd: 
    { compareRecord = v: ra: rb: 
        let
          unsafeGet' = module."Record.Unsafe".unsafeGet;
          key = module."Data.Symbol".reflectSymbol dictIsSymbol module."Type.Proxy".Proxy;
          left = compare dictOrd (unsafeGet' key ra) (unsafeGet' key rb);
        in
          
          let
            __pattern0 = __fail: if module."Data.Eq".notEq module."Data.Ordering".eqOrdering left module."Data.Ordering".EQ then left else __fail;
            __pattern1 = __fail: compareRecord dictOrdRecord module."Type.Proxy".Proxy ra rb;
            __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Ord.purs at 241:7 - 243:62";
          in
            __pattern0 (__pattern1 __patternFail);
      "EqRecord0" = __unused: module."Data.Eq".eqRowCons (dictOrdRecord."EqRecord0" module."Prim".undefined) module."Prim".undefined dictIsSymbol (dictOrd."Eq0" module."Prim".undefined);
    };
  clamp = dictOrd: low: hi: x: min dictOrd hi (max dictOrd low x);
  between = dictOrd: low: hi: x: 
    let
      __pattern0 = __fail: 
        let
          low1 = low;
          hi1 = hi;
          x1 = x;
        in
          if lessThan dictOrd x1 low1 then false else if greaterThan dictOrd x1 hi1 then false else if true then true else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Ord.purs at 203:1 - 203:53";
    in
      __pattern0 __patternFail;
  abs = dictOrd: dictRing: x: 
    let
      __pattern0 = __fail: if greaterThanOrEq dictOrd x (module."Data.Semiring".zero (dictRing."Semiring0" module."Prim".undefined)) then x else __fail;
      __pattern1 = __fail: module."Data.Ring".negate dictRing x;
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Ord.purs at 212:9 - 212:42";
    in
      __pattern0 (__pattern1 __patternFail);
in
  
  { inherit compare compare1 lessThan lessThanOrEq greaterThan greaterThanOrEq comparing min max clamp between abs signum compareRecord ordBoolean ordInt ordNumber ordString ordChar ordUnit ordVoid ordProxy ordProxy2 ordProxy3 ordArray ordOrdering ord1Array ordRecordNil ordRecordCons ordRecord;
    inherit (module."Data.Ordering") EQ GT LT;
  }