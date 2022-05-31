
let
  module = 
    { "Data.Generic.Rep" = import ../Data.Generic.Rep;
      "Data.Ord" = import ../Data.Ord;
      "Data.Ordering" = import ../Data.Ordering;
      "Prelude" = import ../Prelude;
    };
  GenericOrd-Dict = x: x;
  genericOrdNoConstructors = {genericCompare' = v: v1: module."Data.Ordering".EQ;};
  genericOrdNoArguments = {genericCompare' = v: v1: module."Data.Ordering".EQ;};
  genericOrdArgument = dictOrd: 
    { genericCompare' = v: v1: 
        let
          __pattern0 = __fail: 
            let
              a1 = v;
              a2 = v1;
            in
              module."Data.Ord".compare dictOrd a1 a2;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Ord/Generic.purs at 34:1 - 35:62";
        in
          __pattern0 __patternFail;
    };
  genericCompare' = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.genericCompare';
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Ord/Generic.purs at 11:3 - 11:40";
    in
      __pattern0 __patternFail;
  genericOrdConstructor = dictGenericOrd: 
    { genericCompare' = v: v1: 
        let
          __pattern0 = __fail: 
            let
              a1 = v;
              a2 = v1;
            in
              genericCompare' dictGenericOrd a1 a2;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Ord/Generic.purs at 31:1 - 32:76";
        in
          __pattern0 __patternFail;
    };
  genericOrdProduct = dictGenericOrd: dictGenericOrd1: 
    { genericCompare' = v: v1: 
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
                  
                  let
                    v2 = genericCompare' dictGenericOrd a1 a2;
                  in
                    
                    let
                      __pattern0 = __fail: if v2.__tag == "EQ" then genericCompare' dictGenericOrd1 b1 b2 else __fail;
                      __pattern1 = __fail: 
                        let
                          other = v2;
                        in
                          other;
                      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Ord/Generic.purs at 27:5 - 29:21";
                    in
                      __pattern0 (__pattern1 __patternFail)
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Ord/Generic.purs at 25:1 - 29:21";
        in
          __pattern0 __patternFail;
    };
  genericOrdSum = dictGenericOrd: dictGenericOrd1: 
    { genericCompare' = v: v1: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Inl" && v1.__tag == "Inl"
              then 
                let
                  a1 = v.__field0;
                  a2 = v1.__field0;
                in
                  genericCompare' dictGenericOrd a1 a2
              else __fail;
          __pattern1 = __fail: 
            if v.__tag == "Inr" && v1.__tag == "Inr"
              then 
                let
                  b1 = v.__field0;
                  b2 = v1.__field0;
                in
                  genericCompare' dictGenericOrd1 b1 b2
              else __fail;
          __pattern2 = __fail: if v.__tag == "Inl" && v1.__tag == "Inr" then module."Data.Ordering".LT else __fail;
          __pattern3 = __fail: if v.__tag == "Inr" && v1.__tag == "Inl" then module."Data.Ordering".GT else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Ord/Generic.purs at 19:1 - 23:39";
        in
          __pattern0 (__pattern1 (__pattern2 (__pattern3 __patternFail)));
    };
  genericCompare = dictGeneric: dictGenericOrd: x: y: genericCompare' dictGenericOrd (module."Data.Generic.Rep".from dictGeneric x) (module."Data.Generic.Rep".from dictGeneric y);
in
  {inherit genericCompare' genericCompare genericOrdNoConstructors genericOrdNoArguments genericOrdSum genericOrdProduct genericOrdConstructor genericOrdArgument;}