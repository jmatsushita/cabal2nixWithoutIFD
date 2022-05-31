
let
  module = 
    { "Data.Function" = import ../Data.Function;
      "Data.Generic.Rep" = import ../Data.Generic.Rep;
      "Data.Ring" = import ../Data.Ring;
      "Prelude" = import ../Prelude;
    };
  GenericRing-Dict = x: x;
  genericSub' = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.genericSub';
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Ring/Generic.purs at 8:3 - 8:29";
    in
      __pattern0 __patternFail;
  genericSub = dictGeneric: dictGenericRing: x: y: module."Data.Function".apply (module."Data.Generic.Rep".to dictGeneric) (genericSub' dictGenericRing (module."Data.Generic.Rep".from dictGeneric x) (module."Data.Generic.Rep".from dictGeneric y));
  genericRingProduct = dictGenericRing: dictGenericRing1: 
    { genericSub' = v: v1: 
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
                  module."Data.Generic.Rep".Product (genericSub' dictGenericRing a1 a2) (genericSub' dictGenericRing1 b1 b2)
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Ring/Generic.purs at 16:1 - 17:96";
        in
          __pattern0 __patternFail;
    };
  genericRingNoArguments = {genericSub' = v: v1: module."Data.Generic.Rep".NoArguments;};
  genericRingConstructor = dictGenericRing: 
    { genericSub' = v: v1: 
        let
          __pattern0 = __fail: 
            let
              a1 = v;
              a2 = v1;
            in
              genericSub' dictGenericRing a1 a2;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Ring/Generic.purs at 19:1 - 20:82";
        in
          __pattern0 __patternFail;
    };
  genericRingArgument = dictRing: 
    { genericSub' = v: v1: 
        let
          __pattern0 = __fail: 
            let
              x = v;
              y = v1;
            in
              module."Data.Ring".sub dictRing x y;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Ring/Generic.purs at 13:1 - 14:61";
        in
          __pattern0 __patternFail;
    };
in
  {inherit genericSub' genericSub genericRingNoArguments genericRingArgument genericRingProduct genericRingConstructor;}