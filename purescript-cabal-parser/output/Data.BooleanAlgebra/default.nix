
let
  module = 
    { "Data.HeytingAlgebra" = import ../Data.HeytingAlgebra;
      "Data.Symbol" = import ../Data.Symbol;
      "Data.Unit" = import ../Data.Unit;
      "Prim.Row" = import ../Prim.Row;
      "Prim.RowList" = import ../Prim.RowList;
      "Type.Proxy" = import ../Type.Proxy;
    };
  BooleanAlgebraRecord-Dict = x: x;
  BooleanAlgebra-Dict = x: x;
  booleanAlgebraUnit = {"HeytingAlgebra0" = __unused: module."Data.HeytingAlgebra".heytingAlgebraUnit;};
  booleanAlgebraRecordNil = {"HeytingAlgebraRecord0" = __unused: module."Data.HeytingAlgebra".heytingAlgebraRecordNil;};
  booleanAlgebraRecordCons = dictIsSymbol: dictCons: dictBooleanAlgebraRecord: dictBooleanAlgebra: {"HeytingAlgebraRecord0" = __unused: module."Data.HeytingAlgebra".heytingAlgebraRecordCons dictIsSymbol module."Prim".undefined (dictBooleanAlgebraRecord."HeytingAlgebraRecord0" module."Prim".undefined) (dictBooleanAlgebra."HeytingAlgebra0" module."Prim".undefined);};
  booleanAlgebraRecord = dictRowToList: dictBooleanAlgebraRecord: {"HeytingAlgebra0" = __unused: module."Data.HeytingAlgebra".heytingAlgebraRecord module."Prim".undefined (dictBooleanAlgebraRecord."HeytingAlgebraRecord0" module."Prim".undefined);};
  booleanAlgebraProxy3 = {"HeytingAlgebra0" = __unused: module."Data.HeytingAlgebra".heytingAlgebraProxy3;};
  booleanAlgebraProxy2 = {"HeytingAlgebra0" = __unused: module."Data.HeytingAlgebra".heytingAlgebraProxy2;};
  booleanAlgebraProxy = {"HeytingAlgebra0" = __unused: module."Data.HeytingAlgebra".heytingAlgebraProxy;};
  booleanAlgebraFn = dictBooleanAlgebra: {"HeytingAlgebra0" = __unused: module."Data.HeytingAlgebra".heytingAlgebraFunction (dictBooleanAlgebra."HeytingAlgebra0" module."Prim".undefined);};
  booleanAlgebraBoolean = {"HeytingAlgebra0" = __unused: module."Data.HeytingAlgebra".heytingAlgebraBoolean;};
in
  
  { inherit booleanAlgebraBoolean booleanAlgebraUnit booleanAlgebraFn booleanAlgebraRecord booleanAlgebraProxy booleanAlgebraProxy2 booleanAlgebraProxy3 booleanAlgebraRecordNil booleanAlgebraRecordCons;
    inherit (module."Data.HeytingAlgebra") conj disj ff implies not tt;
  }