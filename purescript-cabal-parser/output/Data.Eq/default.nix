
let
  module = 
    { "Data.HeytingAlgebra" = import ../Data.HeytingAlgebra;
      "Data.Symbol" = import ../Data.Symbol;
      "Data.Unit" = import ../Data.Unit;
      "Data.Void" = import ../Data.Void;
      "Prim.Row" = import ../Prim.Row;
      "Prim.RowList" = import ../Prim.RowList;
      "Record.Unsafe" = import ../Record.Unsafe;
      "Type.Proxy" = import ../Type.Proxy;
    };
  foreign = import ./foreign.nix;
  eqBooleanImpl = foreign.eqBooleanImpl;
  eqIntImpl = foreign.eqIntImpl;
  eqNumberImpl = foreign.eqNumberImpl;
  eqCharImpl = foreign.eqCharImpl;
  eqStringImpl = foreign.eqStringImpl;
  eqArrayImpl = foreign.eqArrayImpl;
  EqRecord-Dict = x: x;
  Eq-Dict = x: x;
  Eq1-Dict = x: x;
  eqVoid = {eq = v: v1: true;};
  eqUnit = {eq = v: v1: true;};
  eqString = {eq = eqStringImpl;};
  eqRowNil = {eqRecord = v: v1: v2: true;};
  eqRecord = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.eqRecord;
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Eq.purs at 98:3 - 98:85";
    in
      __pattern0 __patternFail;
  eqRec = dictRowToList: dictEqRecord: {eq = eqRecord dictEqRecord module."Type.Proxy".Proxy;};
  eqProxy3 = {eq = v: v1: true;};
  eqProxy2 = {eq = v: v1: true;};
  eqProxy = {eq = v: v1: true;};
  eqNumber = {eq = eqNumberImpl;};
  eqInt = {eq = eqIntImpl;};
  eqChar = {eq = eqCharImpl;};
  eqBoolean = {eq = eqBooleanImpl;};
  eq1 = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.eq1;
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Eq.purs at 86:3 - 86:49";
    in
      __pattern0 __patternFail;
  eq = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.eq;
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Eq.purs at 29:3 - 29:26";
    in
      __pattern0 __patternFail;
  eqArray = dictEq: {eq = eqArrayImpl (eq dictEq);};
  eq1Array = {eq1 = dictEq: eq (eqArray dictEq);};
  eqRowCons = dictEqRecord: dictCons: dictIsSymbol: dictEq: 
    { eqRecord = v: ra: rb: 
        let
          tail = eqRecord dictEqRecord module."Type.Proxy".Proxy ra rb;
          key = module."Data.Symbol".reflectSymbol dictIsSymbol module."Type.Proxy".Proxy;
          get = module."Record.Unsafe".unsafeGet key;
        in
          module."Data.HeytingAlgebra".conj module."Data.HeytingAlgebra".heytingAlgebraBoolean (eq dictEq (get ra) (get rb)) tail;
    };
  notEq = dictEq: x: y: eq eqBoolean (eq dictEq x y) false;
  notEq1 = dictEq1: dictEq: x: y: eq eqBoolean (eq1 dictEq1 dictEq x y) false;
in
  {inherit eq notEq eq1 notEq1 eqRecord eqBoolean eqInt eqNumber eqChar eqString eqUnit eqVoid eqArray eqRec eqProxy eqProxy2 eqProxy3 eq1Array eqRowNil eqRowCons;}