
let
  module = 
    { "Data.Function" = import ../Data.Function;
      "Data.Generic.Rep" = import ../Data.Generic.Rep;
      "Data.HeytingAlgebra" = import ../Data.HeytingAlgebra;
      "Prelude" = import ../Prelude;
    };
  GenericHeytingAlgebra-Dict = x: x;
  genericTT' = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.genericTT';
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/HeytingAlgebra/Generic.purs at 10:3 - 10:18";
    in
      __pattern0 __patternFail;
  genericTT = dictGeneric: dictGenericHeytingAlgebra: module."Data.Generic.Rep".to dictGeneric (genericTT' dictGenericHeytingAlgebra);
  genericNot' = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.genericNot';
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/HeytingAlgebra/Generic.purs at 14:3 - 14:24";
    in
      __pattern0 __patternFail;
  genericNot = dictGeneric: dictGenericHeytingAlgebra: x: module."Data.Function".apply (module."Data.Generic.Rep".to dictGeneric) (genericNot' dictGenericHeytingAlgebra (module."Data.Generic.Rep".from dictGeneric x));
  genericImplies' = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.genericImplies';
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/HeytingAlgebra/Generic.purs at 11:3 - 11:33";
    in
      __pattern0 __patternFail;
  genericImplies = dictGeneric: dictGenericHeytingAlgebra: x: y: module."Data.Function".apply (module."Data.Generic.Rep".to dictGeneric) (genericImplies' dictGenericHeytingAlgebra (module."Data.Generic.Rep".from dictGeneric x) (module."Data.Generic.Rep".from dictGeneric y));
  genericHeytingAlgebraNoArguments = 
    { genericFF' = module."Data.Generic.Rep".NoArguments;
      genericTT' = module."Data.Generic.Rep".NoArguments;
      genericImplies' = v: v1: module."Data.Generic.Rep".NoArguments;
      genericConj' = v: v1: module."Data.Generic.Rep".NoArguments;
      genericDisj' = v: v1: module."Data.Generic.Rep".NoArguments;
      genericNot' = v: module."Data.Generic.Rep".NoArguments;
    };
  genericHeytingAlgebraArgument = dictHeytingAlgebra: 
    { genericFF' = module."Data.HeytingAlgebra".ff dictHeytingAlgebra;
      genericTT' = module."Data.HeytingAlgebra".tt dictHeytingAlgebra;
      genericImplies' = v: v1: 
        let
          __pattern0 = __fail: 
            let
              x = v;
              y = v1;
            in
              module."Data.HeytingAlgebra".implies dictHeytingAlgebra x y;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/HeytingAlgebra/Generic.purs at 24:1 - 30:46";
        in
          __pattern0 __patternFail;
      genericConj' = v: v1: 
        let
          __pattern0 = __fail: 
            let
              x = v;
              y = v1;
            in
              module."Data.HeytingAlgebra".conj dictHeytingAlgebra x y;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/HeytingAlgebra/Generic.purs at 24:1 - 30:46";
        in
          __pattern0 __patternFail;
      genericDisj' = v: v1: 
        let
          __pattern0 = __fail: 
            let
              x = v;
              y = v1;
            in
              module."Data.HeytingAlgebra".disj dictHeytingAlgebra x y;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/HeytingAlgebra/Generic.purs at 24:1 - 30:46";
        in
          __pattern0 __patternFail;
      genericNot' = v: 
        let
          __pattern0 = __fail: 
            let
              x = v;
            in
              module."Data.HeytingAlgebra".not dictHeytingAlgebra x;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/HeytingAlgebra/Generic.purs at 24:1 - 30:46";
        in
          __pattern0 __patternFail;
    };
  genericFF' = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.genericFF';
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/HeytingAlgebra/Generic.purs at 9:3 - 9:18";
    in
      __pattern0 __patternFail;
  genericFF = dictGeneric: dictGenericHeytingAlgebra: module."Data.Generic.Rep".to dictGeneric (genericFF' dictGenericHeytingAlgebra);
  genericDisj' = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.genericDisj';
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/HeytingAlgebra/Generic.purs at 13:3 - 13:30";
    in
      __pattern0 __patternFail;
  genericDisj = dictGeneric: dictGenericHeytingAlgebra: x: y: module."Data.Function".apply (module."Data.Generic.Rep".to dictGeneric) (genericDisj' dictGenericHeytingAlgebra (module."Data.Generic.Rep".from dictGeneric x) (module."Data.Generic.Rep".from dictGeneric y));
  genericConj' = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.genericConj';
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/HeytingAlgebra/Generic.purs at 12:3 - 12:30";
    in
      __pattern0 __patternFail;
  genericHeytingAlgebraConstructor = dictGenericHeytingAlgebra: 
    { genericFF' = genericFF' dictGenericHeytingAlgebra;
      genericTT' = genericTT' dictGenericHeytingAlgebra;
      genericImplies' = v: v1: 
        let
          __pattern0 = __fail: 
            let
              a1 = v;
              a2 = v1;
            in
              genericImplies' dictGenericHeytingAlgebra a1 a2;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/HeytingAlgebra/Generic.purs at 40:1 - 46:60";
        in
          __pattern0 __patternFail;
      genericConj' = v: v1: 
        let
          __pattern0 = __fail: 
            let
              a1 = v;
              a2 = v1;
            in
              genericConj' dictGenericHeytingAlgebra a1 a2;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/HeytingAlgebra/Generic.purs at 40:1 - 46:60";
        in
          __pattern0 __patternFail;
      genericDisj' = v: v1: 
        let
          __pattern0 = __fail: 
            let
              a1 = v;
              a2 = v1;
            in
              genericDisj' dictGenericHeytingAlgebra a1 a2;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/HeytingAlgebra/Generic.purs at 40:1 - 46:60";
        in
          __pattern0 __patternFail;
      genericNot' = v: 
        let
          __pattern0 = __fail: 
            let
              a = v;
            in
              genericNot' dictGenericHeytingAlgebra a;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/HeytingAlgebra/Generic.purs at 40:1 - 46:60";
        in
          __pattern0 __patternFail;
    };
  genericHeytingAlgebraProduct = dictGenericHeytingAlgebra: dictGenericHeytingAlgebra1: 
    { genericFF' = module."Data.Generic.Rep".Product (genericFF' dictGenericHeytingAlgebra) (genericFF' dictGenericHeytingAlgebra1);
      genericTT' = module."Data.Generic.Rep".Product (genericTT' dictGenericHeytingAlgebra) (genericTT' dictGenericHeytingAlgebra1);
      genericImplies' = v: v1: 
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
                  module."Data.Generic.Rep".Product (genericImplies' dictGenericHeytingAlgebra a1 a2) (genericImplies' dictGenericHeytingAlgebra1 b1 b2)
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/HeytingAlgebra/Generic.purs at 32:1 - 38:70";
        in
          __pattern0 __patternFail;
      genericConj' = v: v1: 
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
                  module."Data.Generic.Rep".Product (genericConj' dictGenericHeytingAlgebra a1 a2) (genericConj' dictGenericHeytingAlgebra1 b1 b2)
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/HeytingAlgebra/Generic.purs at 32:1 - 38:70";
        in
          __pattern0 __patternFail;
      genericDisj' = v: v1: 
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
                  module."Data.Generic.Rep".Product (genericDisj' dictGenericHeytingAlgebra a1 a2) (genericDisj' dictGenericHeytingAlgebra1 b1 b2)
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/HeytingAlgebra/Generic.purs at 32:1 - 38:70";
        in
          __pattern0 __patternFail;
      genericNot' = v: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Product"
              then 
                let
                  a = v.__field0;
                  b = v.__field1;
                in
                  module."Data.Generic.Rep".Product (genericNot' dictGenericHeytingAlgebra a) (genericNot' dictGenericHeytingAlgebra1 b)
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/HeytingAlgebra/Generic.purs at 32:1 - 38:70";
        in
          __pattern0 __patternFail;
    };
  genericConj = dictGeneric: dictGenericHeytingAlgebra: x: y: module."Data.Function".apply (module."Data.Generic.Rep".to dictGeneric) (genericConj' dictGenericHeytingAlgebra (module."Data.Generic.Rep".from dictGeneric x) (module."Data.Generic.Rep".from dictGeneric y));
in
  {inherit genericConj' genericDisj' genericFF' genericImplies' genericNot' genericTT' genericFF genericTT genericImplies genericConj genericDisj genericNot genericHeytingAlgebraNoArguments genericHeytingAlgebraArgument genericHeytingAlgebraProduct genericHeytingAlgebraConstructor;}