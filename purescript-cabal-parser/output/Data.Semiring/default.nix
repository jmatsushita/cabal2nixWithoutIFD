
let
  module = 
    { "Data.Symbol" = import ../Data.Symbol;
      "Data.Unit" = import ../Data.Unit;
      "Prim.Row" = import ../Prim.Row;
      "Prim.RowList" = import ../Prim.RowList;
      "Record.Unsafe" = import ../Record.Unsafe;
      "Type.Proxy" = import ../Type.Proxy;
    };
  foreign = import ./foreign.nix;
  intAdd = foreign.intAdd;
  intMul = foreign.intMul;
  numAdd = foreign.numAdd;
  numMul = foreign.numMul;
  SemiringRecord-Dict = x: x;
  Semiring-Dict = x: x;
  zeroRecord = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.zeroRecord;
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Semiring.purs at 103:3 - 103:86";
    in
      __pattern0 __patternFail;
  zero = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.zero;
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Semiring.purs at 36:3 - 36:12";
    in
      __pattern0 __patternFail;
  semiringUnit = 
    { add = v: v1: module."Data.Unit".unit;
      zero = module."Data.Unit".unit;
      mul = v: v1: module."Data.Unit".unit;
      one = module."Data.Unit".unit;
    };
  semiringRecordNil = 
    { addRecord = v: v1: v2: { };
      mulRecord = v: v1: v2: { };
      oneRecord = v: v1: { };
      zeroRecord = v: v1: { };
    };
  semiringProxy3 = 
    { add = v: v1: module."Type.Proxy".Proxy3;
      mul = v: v1: module."Type.Proxy".Proxy3;
      one = module."Type.Proxy".Proxy3;
      zero = module."Type.Proxy".Proxy3;
    };
  semiringProxy2 = 
    { add = v: v1: module."Type.Proxy".Proxy2;
      mul = v: v1: module."Type.Proxy".Proxy2;
      one = module."Type.Proxy".Proxy2;
      zero = module."Type.Proxy".Proxy2;
    };
  semiringProxy = 
    { add = v: v1: module."Type.Proxy".Proxy;
      mul = v: v1: module."Type.Proxy".Proxy;
      one = module."Type.Proxy".Proxy;
      zero = module."Type.Proxy".Proxy;
    };
  semiringNumber = 
    { add = numAdd;
      zero = 0.0;
      mul = numMul;
      one = 1.0;
    };
  semiringInt = 
    { add = intAdd;
      zero = 0;
      mul = intMul;
      one = 1;
    };
  oneRecord = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.oneRecord;
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Semiring.purs at 102:3 - 102:85";
    in
      __pattern0 __patternFail;
  one = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.one;
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Semiring.purs at 38:3 - 38:12";
    in
      __pattern0 __patternFail;
  mulRecord = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.mulRecord;
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Semiring.purs at 101:3 - 101:92";
    in
      __pattern0 __patternFail;
  mul = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.mul;
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Semiring.purs at 37:3 - 37:22";
    in
      __pattern0 __patternFail;
  addRecord = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.addRecord;
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Semiring.purs at 100:3 - 100:92";
    in
      __pattern0 __patternFail;
  semiringRecord = dictRowToList: dictSemiringRecord: 
    { add = addRecord dictSemiringRecord module."Type.Proxy".Proxy;
      mul = mulRecord dictSemiringRecord module."Type.Proxy".Proxy;
      one = oneRecord dictSemiringRecord module."Type.Proxy".Proxy module."Type.Proxy".Proxy;
      zero = zeroRecord dictSemiringRecord module."Type.Proxy".Proxy module."Type.Proxy".Proxy;
    };
  add = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.add;
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Semiring.purs at 35:3 - 35:22";
    in
      __pattern0 __patternFail;
  semiringFn = dictSemiring: 
    { add = f: g: x: add dictSemiring (f x) (g x);
      zero = v: zero dictSemiring;
      mul = f: g: x: mul dictSemiring (f x) (g x);
      one = v: one dictSemiring;
    };
  semiringRecordCons = dictIsSymbol: dictCons: dictSemiringRecord: dictSemiring: 
    { addRecord = v: ra: rb: 
        let
          tail = addRecord dictSemiringRecord module."Type.Proxy".Proxy ra rb;
          key = module."Data.Symbol".reflectSymbol dictIsSymbol module."Type.Proxy".Proxy;
          insert = module."Record.Unsafe".unsafeSet key;
          get = module."Record.Unsafe".unsafeGet key;
        in
          insert (add dictSemiring (get ra) (get rb)) tail;
      mulRecord = v: ra: rb: 
        let
          tail = mulRecord dictSemiringRecord module."Type.Proxy".Proxy ra rb;
          key = module."Data.Symbol".reflectSymbol dictIsSymbol module."Type.Proxy".Proxy;
          insert = module."Record.Unsafe".unsafeSet key;
          get = module."Record.Unsafe".unsafeGet key;
        in
          insert (mul dictSemiring (get ra) (get rb)) tail;
      oneRecord = v: v1: 
        let
          tail = oneRecord dictSemiringRecord module."Type.Proxy".Proxy module."Type.Proxy".Proxy;
          key = module."Data.Symbol".reflectSymbol dictIsSymbol module."Type.Proxy".Proxy;
          insert = module."Record.Unsafe".unsafeSet key;
        in
          insert (one dictSemiring) tail;
      zeroRecord = v: v1: 
        let
          tail = zeroRecord dictSemiringRecord module."Type.Proxy".Proxy module."Type.Proxy".Proxy;
          key = module."Data.Symbol".reflectSymbol dictIsSymbol module."Type.Proxy".Proxy;
          insert = module."Record.Unsafe".unsafeSet key;
        in
          insert (zero dictSemiring) tail;
    };
in
  {inherit add zero mul one addRecord mulRecord oneRecord zeroRecord semiringInt semiringNumber semiringFn semiringUnit semiringProxy semiringProxy2 semiringProxy3 semiringRecord semiringRecordNil semiringRecordCons;}