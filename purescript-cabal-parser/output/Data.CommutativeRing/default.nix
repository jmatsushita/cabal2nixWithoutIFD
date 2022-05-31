
let
  module = 
    { "Data.Ring" = import ../Data.Ring;
      "Data.Semiring" = import ../Data.Semiring;
      "Data.Symbol" = import ../Data.Symbol;
      "Data.Unit" = import ../Data.Unit;
      "Prim.Row" = import ../Prim.Row;
      "Prim.RowList" = import ../Prim.RowList;
      "Type.Proxy" = import ../Type.Proxy;
    };
  CommutativeRingRecord-Dict = x: x;
  CommutativeRing-Dict = x: x;
  commutativeRingUnit = {"Ring0" = __unused: module."Data.Ring".ringUnit;};
  commutativeRingRecordNil = {"RingRecord0" = __unused: module."Data.Ring".ringRecordNil;};
  commutativeRingRecordCons = dictIsSymbol: dictCons: dictCommutativeRingRecord: dictCommutativeRing: {"RingRecord0" = __unused: module."Data.Ring".ringRecordCons dictIsSymbol module."Prim".undefined (dictCommutativeRingRecord."RingRecord0" module."Prim".undefined) (dictCommutativeRing."Ring0" module."Prim".undefined);};
  commutativeRingRecord = dictRowToList: dictCommutativeRingRecord: {"Ring0" = __unused: module."Data.Ring".ringRecord module."Prim".undefined (dictCommutativeRingRecord."RingRecord0" module."Prim".undefined);};
  commutativeRingProxy3 = {"Ring0" = __unused: module."Data.Ring".ringProxy3;};
  commutativeRingProxy2 = {"Ring0" = __unused: module."Data.Ring".ringProxy2;};
  commutativeRingProxy = {"Ring0" = __unused: module."Data.Ring".ringProxy;};
  commutativeRingNumber = {"Ring0" = __unused: module."Data.Ring".ringNumber;};
  commutativeRingInt = {"Ring0" = __unused: module."Data.Ring".ringInt;};
  commutativeRingFn = dictCommutativeRing: {"Ring0" = __unused: module."Data.Ring".ringFn (dictCommutativeRing."Ring0" module."Prim".undefined);};
in
  
  { inherit commutativeRingInt commutativeRingNumber commutativeRingUnit commutativeRingFn commutativeRingRecord commutativeRingProxy commutativeRingProxy2 commutativeRingProxy3 commutativeRingRecordNil commutativeRingRecordCons;
    inherit (module."Data.Ring");
    inherit (module."Data.Semiring") add mul one zero;
  }