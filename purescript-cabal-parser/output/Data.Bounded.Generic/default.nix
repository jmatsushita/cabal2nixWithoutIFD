
let
  module = 
    { "Data.Bounded" = import ../Data.Bounded;
      "Data.Generic.Rep" = import ../Data.Generic.Rep;
    };
  GenericTop-Dict = x: x;
  GenericBottom-Dict = x: x;
  genericTopNoArguments = {genericTop' = module."Data.Generic.Rep".NoArguments;};
  genericTopArgument = dictBounded: {genericTop' = module."Data.Bounded".top dictBounded;};
  genericTop' = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.genericTop';
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Bounded/Generic.purs at 33:3 - 33:19";
    in
      __pattern0 __patternFail;
  genericTopConstructor = dictGenericTop: {genericTop' = genericTop' dictGenericTop;};
  genericTopProduct = dictGenericTop: dictGenericTop1: {genericTop' = module."Data.Generic.Rep".Product (genericTop' dictGenericTop) (genericTop' dictGenericTop1);};
  genericTopSum = dictGenericTop: {genericTop' = module."Data.Generic.Rep".Inr (genericTop' dictGenericTop);};
  genericTop = dictGeneric: dictGenericTop: module."Data.Generic.Rep".to dictGeneric (genericTop' dictGenericTop);
  genericBottomNoArguments = {genericBottom' = module."Data.Generic.Rep".NoArguments;};
  genericBottomArgument = dictBounded: {genericBottom' = module."Data.Bounded".bottom dictBounded;};
  genericBottom' = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.genericBottom';
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Bounded/Generic.purs at 15:3 - 15:22";
    in
      __pattern0 __patternFail;
  genericBottomConstructor = dictGenericBottom: {genericBottom' = genericBottom' dictGenericBottom;};
  genericBottomProduct = dictGenericBottom: dictGenericBottom1: {genericBottom' = module."Data.Generic.Rep".Product (genericBottom' dictGenericBottom) (genericBottom' dictGenericBottom1);};
  genericBottomSum = dictGenericBottom: {genericBottom' = module."Data.Generic.Rep".Inl (genericBottom' dictGenericBottom);};
  genericBottom = dictGeneric: dictGenericBottom: module."Data.Generic.Rep".to dictGeneric (genericBottom' dictGenericBottom);
in
  {inherit genericBottom' genericBottom genericTop' genericTop genericBottomNoArguments genericBottomArgument genericBottomSum genericBottomProduct genericBottomConstructor genericTopNoArguments genericTopArgument genericTopSum genericTopProduct genericTopConstructor;}