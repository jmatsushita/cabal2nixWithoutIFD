
let
  module = 
    { "Data.Generic.Rep" = import ../Data.Generic.Rep;
      "Data.Semigroup" = import ../Data.Semigroup;
      "Data.Show" = import ../Data.Show;
      "Data.Symbol" = import ../Data.Symbol;
      "Prelude" = import ../Prelude;
      "Type.Proxy" = import ../Type.Proxy;
    };
  foreign = import ./foreign.nix;
  intercalate = foreign.intercalate;
  GenericShowArgs-Dict = x: x;
  GenericShow-Dict = x: x;
  genericShowArgsNoArguments = {genericShowArgs = v: [];};
  genericShowArgsArgument = dictShow: 
    { genericShowArgs = v: 
        let
          __pattern0 = __fail: 
            let
              a = v;
            in
              [(module."Data.Show".show dictShow a)];
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Show/Generic.purs at 46:1 - 47:42";
        in
          __pattern0 __patternFail;
    };
  genericShowArgs = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.genericShowArgs;
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Show/Generic.purs at 18:3 - 18:39";
    in
      __pattern0 __patternFail;
  genericShowArgsProduct = dictGenericShowArgs: dictGenericShowArgs1: 
    { genericShowArgs = v: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Product"
              then 
                let
                  a = v.__field0;
                  b = v.__field1;
                in
                  module."Data.Semigroup".append module."Data.Semigroup".semigroupArray (genericShowArgs dictGenericShowArgs a) (genericShowArgs dictGenericShowArgs1 b)
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Show/Generic.purs at 30:1 - 33:73";
        in
          __pattern0 __patternFail;
    };
  genericShowConstructor = dictGenericShowArgs: dictIsSymbol: 
    { genericShow' = v: 
        let
          __pattern0 = __fail: 
            let
              a = v;
            in
              
              let
                ctor = module."Data.Symbol".reflectSymbol dictIsSymbol module."Type.Proxy".Proxy;
              in
                
                let
                  v1 = genericShowArgs dictGenericShowArgs a;
                in
                  
                  let
                    __pattern0 = __fail: if builtins.length v1 == 0 then ctor else __fail;
                    __pattern1 = __fail: 
                      let
                        args = v1;
                      in
                        module."Data.Semigroup".append module."Data.Semigroup".semigroupString "(" (module."Data.Semigroup".append module."Data.Semigroup".semigroupString (intercalate " " (module."Data.Semigroup".append module."Data.Semigroup".semigroupArray [ctor] args)) ")");
                    __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Show/Generic.purs at 39:7 - 41:63";
                  in
                    __pattern0 (__pattern1 __patternFail);
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Show/Generic.purs at 35:1 - 44:49";
        in
          __pattern0 __patternFail;
    };
  genericShow' = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.genericShow';
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Show/Generic.purs at 15:3 - 15:30";
    in
      __pattern0 __patternFail;
  genericShowNoConstructors = {genericShow' = a: genericShow' genericShowNoConstructors a;};
  genericShowSum = dictGenericShow: dictGenericShow1: 
    { genericShow' = v: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Inl"
              then 
                let
                  a = v.__field0;
                in
                  genericShow' dictGenericShow a
              else __fail;
          __pattern1 = __fail: 
            if v.__tag == "Inr"
              then 
                let
                  b = v.__field0;
                in
                  genericShow' dictGenericShow1 b
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Show/Generic.purs at 26:1 - 28:40";
        in
          __pattern0 (__pattern1 __patternFail);
    };
  genericShow = dictGeneric: dictGenericShow: x: genericShow' dictGenericShow (module."Data.Generic.Rep".from dictGeneric x);
in
  {inherit genericShow' genericShow genericShowArgs genericShowNoConstructors genericShowArgsNoArguments genericShowSum genericShowArgsProduct genericShowConstructor genericShowArgsArgument;}