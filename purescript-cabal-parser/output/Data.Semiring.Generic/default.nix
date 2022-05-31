
let
  module = 
    { "Data.Function" = import ../Data.Function;
      "Data.Generic.Rep" = import ../Data.Generic.Rep;
      "Data.Semiring" = import ../Data.Semiring;
      "Prelude" = import ../Prelude;
    };
  GenericSemiring-Dict = x: x;
  genericZero' = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.genericZero';
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Semiring/Generic.purs at 9:3 - 9:20";
    in
      __pattern0 __patternFail;
  genericZero = dictGeneric: dictGenericSemiring: module."Data.Generic.Rep".to dictGeneric (genericZero' dictGenericSemiring);
  genericSemiringNoArguments = 
    { genericAdd' = v: v1: module."Data.Generic.Rep".NoArguments;
      genericZero' = module."Data.Generic.Rep".NoArguments;
      genericMul' = v: v1: module."Data.Generic.Rep".NoArguments;
      genericOne' = module."Data.Generic.Rep".NoArguments;
    };
  genericSemiringArgument = dictSemiring: 
    { genericAdd' = v: v1: 
        let
          __pattern0 = __fail: 
            let
              x = v;
              y = v1;
            in
              module."Data.Semiring".add dictSemiring x y;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Semiring/Generic.purs at 19:1 - 23:29";
        in
          __pattern0 __patternFail;
      genericZero' = module."Data.Semiring".zero dictSemiring;
      genericMul' = v: v1: 
        let
          __pattern0 = __fail: 
            let
              x = v;
              y = v1;
            in
              module."Data.Semiring".mul dictSemiring x y;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Semiring/Generic.purs at 19:1 - 23:29";
        in
          __pattern0 __patternFail;
      genericOne' = module."Data.Semiring".one dictSemiring;
    };
  genericOne' = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.genericOne';
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Semiring/Generic.purs at 11:3 - 11:20";
    in
      __pattern0 __patternFail;
  genericOne = dictGeneric: dictGenericSemiring: module."Data.Generic.Rep".to dictGeneric (genericOne' dictGenericSemiring);
  genericMul' = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.genericMul';
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Semiring/Generic.purs at 10:3 - 10:30";
    in
      __pattern0 __patternFail;
  genericMul = dictGeneric: dictGenericSemiring: x: y: module."Data.Function".apply (module."Data.Generic.Rep".to dictGeneric) (genericMul' dictGenericSemiring (module."Data.Generic.Rep".from dictGeneric x) (module."Data.Generic.Rep".from dictGeneric y));
  genericAdd' = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.genericAdd';
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Semiring/Generic.purs at 8:3 - 8:30";
    in
      __pattern0 __patternFail;
  genericSemiringConstructor = dictGenericSemiring: 
    { genericAdd' = v: v1: 
        let
          __pattern0 = __fail: 
            let
              a1 = v;
              a2 = v1;
            in
              genericAdd' dictGenericSemiring a1 a2;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Semiring/Generic.purs at 31:1 - 35:40";
        in
          __pattern0 __patternFail;
      genericZero' = genericZero' dictGenericSemiring;
      genericMul' = v: v1: 
        let
          __pattern0 = __fail: 
            let
              a1 = v;
              a2 = v1;
            in
              genericMul' dictGenericSemiring a1 a2;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Semiring/Generic.purs at 31:1 - 35:40";
        in
          __pattern0 __patternFail;
      genericOne' = genericOne' dictGenericSemiring;
    };
  genericSemiringProduct = dictGenericSemiring: dictGenericSemiring1: 
    { genericAdd' = v: v1: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Product" && v1.__tag == "Product"
              then 
                let
                  a1 = v.__field0;
                  b1 = v.__field1;
                  a2 = v1.__field0;
                  b2 = v1.__field1;
                in
                  module."Data.Generic.Rep".Product (genericAdd' dictGenericSemiring a1 a2) (genericAdd' dictGenericSemiring1 b1 b2)
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Semiring/Generic.purs at 25:1 - 29:48";
        in
          __pattern0 __patternFail;
      genericZero' = module."Data.Generic.Rep".Product (genericZero' dictGenericSemiring) (genericZero' dictGenericSemiring1);
      genericMul' = v: v1: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Product" && v1.__tag == "Product"
              then 
                let
                  a1 = v.__field0;
                  b1 = v.__field1;
                  a2 = v1.__field0;
                  b2 = v1.__field1;
                in
                  module."Data.Generic.Rep".Product (genericMul' dictGenericSemiring a1 a2) (genericMul' dictGenericSemiring1 b1 b2)
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Semiring/Generic.purs at 25:1 - 29:48";
        in
          __pattern0 __patternFail;
      genericOne' = module."Data.Generic.Rep".Product (genericOne' dictGenericSemiring) (genericOne' dictGenericSemiring1);
    };
  genericAdd = dictGeneric: dictGenericSemiring: x: y: module."Data.Function".apply (module."Data.Generic.Rep".to dictGeneric) (genericAdd' dictGenericSemiring (module."Data.Generic.Rep".from dictGeneric x) (module."Data.Generic.Rep".from dictGeneric y));
in
  {inherit genericAdd' genericMul' genericOne' genericZero' genericZero genericOne genericAdd genericMul genericSemiringNoArguments genericSemiringArgument genericSemiringProduct genericSemiringConstructor;}