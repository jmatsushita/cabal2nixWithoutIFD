
let
  module = 
    { "Data.Semiring" = import ../Data.Semiring;
      "Data.Symbol" = import ../Data.Symbol;
      "Data.Unit" = import ../Data.Unit;
      "Prim.Row" = import ../Prim.Row;
      "Prim.RowList" = import ../Prim.RowList;
      "Record.Unsafe" = import ../Record.Unsafe;
      "Type.Proxy" = import ../Type.Proxy;
    };
  foreign = import ./foreign.nix;
  intSub = foreign.intSub;
  numSub = foreign.numSub;
  RingRecord-Dict = x: x;
  Ring-Dict = x: x;
  subRecord = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.subRecord;
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Ring.purs at 63:3 - 63:92";
    in
      __pattern0 __patternFail;
  sub = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.sub;
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Ring.purs at 24:3 - 24:21";
    in
      __pattern0 __patternFail;
  ringUnit = 
    { sub = v: v1: module."Data.Unit".unit;
      "Semiring0" = __unused: module."Data.Semiring".semiringUnit;
    };
  ringRecordNil = 
    { subRecord = v: v1: v2: { };
      "SemiringRecord0" = __unused: module."Data.Semiring".semiringRecordNil;
    };
  ringRecordCons = dictIsSymbol: dictCons: dictRingRecord: dictRing: 
    { subRecord = v: ra: rb: 
        let
          tail = subRecord dictRingRecord module."Type.Proxy".Proxy ra rb;
          key = module."Data.Symbol".reflectSymbol dictIsSymbol module."Type.Proxy".Proxy;
          insert = module."Record.Unsafe".unsafeSet key;
          get = module."Record.Unsafe".unsafeGet key;
        in
          insert (sub dictRing (get ra) (get rb)) tail;
      "SemiringRecord0" = __unused: module."Data.Semiring".semiringRecordCons dictIsSymbol module."Prim".undefined (dictRingRecord."SemiringRecord0" module."Prim".undefined) (dictRing."Semiring0" module."Prim".undefined);
    };
  ringRecord = dictRowToList: dictRingRecord: 
    { sub = subRecord dictRingRecord module."Type.Proxy".Proxy;
      "Semiring0" = __unused: module."Data.Semiring".semiringRecord module."Prim".undefined (dictRingRecord."SemiringRecord0" module."Prim".undefined);
    };
  ringProxy3 = 
    { sub = v: v1: module."Type.Proxy".Proxy3;
      "Semiring0" = __unused: module."Data.Semiring".semiringProxy3;
    };
  ringProxy2 = 
    { sub = v: v1: module."Type.Proxy".Proxy2;
      "Semiring0" = __unused: module."Data.Semiring".semiringProxy2;
    };
  ringProxy = 
    { sub = v: v1: module."Type.Proxy".Proxy;
      "Semiring0" = __unused: module."Data.Semiring".semiringProxy;
    };
  ringNumber = 
    { sub = numSub;
      "Semiring0" = __unused: module."Data.Semiring".semiringNumber;
    };
  ringInt = 
    { sub = intSub;
      "Semiring0" = __unused: module."Data.Semiring".semiringInt;
    };
  ringFn = dictRing: 
    { sub = f: g: x: sub dictRing (f x) (g x);
      "Semiring0" = __unused: module."Data.Semiring".semiringFn (dictRing."Semiring0" module."Prim".undefined);
    };
  negate = dictRing: a: sub dictRing (module."Data.Semiring".zero (dictRing."Semiring0" module."Prim".undefined)) a;
in
  
  { inherit sub negate subRecord ringInt ringNumber ringUnit ringFn ringProxy ringProxy2 ringProxy3 ringRecord ringRecordNil ringRecordCons;
    inherit (module."Data.Semiring") add mul one zero;
  }