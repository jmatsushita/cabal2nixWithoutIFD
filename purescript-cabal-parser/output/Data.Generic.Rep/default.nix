
let
  module = 
    { "Data.Semigroup" = import ../Data.Semigroup;
      "Data.Show" = import ../Data.Show;
      "Data.Symbol" = import ../Data.Symbol;
      "Type.Proxy" = import ../Type.Proxy;
    };
  Inl = value0: 
    { __tag = "Inl";
      __field0 = value0;
    };
  Inr = value0: 
    { __tag = "Inr";
      __field0 = value0;
    };
  Product = value0: value1: 
    { __tag = "Product";
      __field0 = value0;
      __field1 = value1;
    };
  NoArguments = {__tag = "NoArguments";};
  Generic-Dict = x: x;
  Constructor = x: x;
  Argument = x: x;
  to = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.to;
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Generic/Rep.purs at 57:3 - 57:17";
    in
      __pattern0 __patternFail;
  showSum = dictShow: dictShow1: 
    { show = v: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Inl"
              then 
                let
                  a = v.__field0;
                in
                  module."Data.Semigroup".append module."Data.Semigroup".semigroupString "(Inl " (module."Data.Semigroup".append module."Data.Semigroup".semigroupString (module."Data.Show".show dictShow a) ")")
              else __fail;
          __pattern1 = __fail: 
            if v.__tag == "Inr"
              then 
                let
                  b = v.__field0;
                in
                  module."Data.Semigroup".append module."Data.Semigroup".semigroupString "(Inr " (module."Data.Semigroup".append module."Data.Semigroup".semigroupString (module."Data.Show".show dictShow1 b) ")")
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Generic/Rep.purs at 31:1 - 33:42";
        in
          __pattern0 (__pattern1 __patternFail);
    };
  showProduct = dictShow: dictShow1: 
    { show = v: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Product"
              then 
                let
                  a = v.__field0;
                  b = v.__field1;
                in
                  module."Data.Semigroup".append module."Data.Semigroup".semigroupString "(Product " (module."Data.Semigroup".append module."Data.Semigroup".semigroupString (module."Data.Show".show dictShow a) (module."Data.Semigroup".append module."Data.Semigroup".semigroupString " " (module."Data.Semigroup".append module."Data.Semigroup".semigroupString (module."Data.Show".show dictShow1 b) ")")))
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Generic/Rep.purs at 38:1 - 39:69";
        in
          __pattern0 __patternFail;
    };
  showNoArguments = {show = v: "NoArguments";};
  showConstructor = dictIsSymbol: dictShow: 
    { show = v: 
        let
          __pattern0 = __fail: 
            let
              a = v;
            in
              module."Data.Semigroup".append module."Data.Semigroup".semigroupString "(Constructor @" (module."Data.Semigroup".append module."Data.Semigroup".semigroupString (module."Data.Show".show module."Data.Show".showString (module."Data.Symbol".reflectSymbol dictIsSymbol module."Type.Proxy".Proxy)) (module."Data.Semigroup".append module."Data.Semigroup".semigroupString " " (module."Data.Semigroup".append module."Data.Semigroup".semigroupString (module."Data.Show".show dictShow a) ")")));
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Generic/Rep.purs at 45:1 - 46:112";
        in
          __pattern0 __patternFail;
    };
  showArgument = dictShow: 
    { show = v: 
        let
          __pattern0 = __fail: 
            let
              a = v;
            in
              module."Data.Semigroup".append module."Data.Semigroup".semigroupString "(Argument " (module."Data.Semigroup".append module."Data.Semigroup".semigroupString (module."Data.Show".show dictShow a) ")");
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Generic/Rep.purs at 51:1 - 52:52";
        in
          __pattern0 __patternFail;
    };
  repOf = dictGeneric: v: module."Type.Proxy".Proxy;
  from = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.from;
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Generic/Rep.purs at 58:3 - 58:19";
    in
      __pattern0 __patternFail;
in
  {inherit to from repOf NoArguments Inl Inr Product Constructor Argument showNoArguments showSum showProduct showConstructor showArgument;}