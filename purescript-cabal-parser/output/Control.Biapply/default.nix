
let
  module = 
    { "Control.Category" = import ../Control.Category;
      "Data.Bifunctor" = import ../Data.Bifunctor;
      "Data.Function" = import ../Data.Function;
      "Data.Tuple" = import ../Data.Tuple;
    };
  Biapply-Dict = x: x;
  biapplyTuple = 
    { biapply = v: v1: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Tuple" && v1.__tag == "Tuple"
              then 
                let
                  f = v.__field0;
                  g = v.__field1;
                  a = v1.__field0;
                  b = v1.__field1;
                in
                  module."Data.Tuple".Tuple (f a) (g b)
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/bifunctors/master/src/Control/Biapply.purs at 58:1 - 59:54";
        in
          __pattern0 __patternFail;
      "Bifunctor0" = __unused: module."Data.Bifunctor".bifunctorTuple;
    };
  biapply = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.biapply;
      __patternFail = builtins.throw "Pattern match failure in .spago/bifunctors/master/src/Control/Biapply.purs at 19:3 - 19:67";
    in
      __pattern0 __patternFail;
  biapplyFirst = dictBiapply: a: b: biapply dictBiapply (module."Control.Category".identity module."Control.Category".categoryFn (module."Data.Bifunctor".bimap (dictBiapply."Bifunctor0" module."Prim".undefined) (module."Data.Function".const (module."Control.Category".identity module."Control.Category".categoryFn)) (module."Data.Function".const (module."Control.Category".identity module."Control.Category".categoryFn))) a) b;
  biapplySecond = dictBiapply: a: b: biapply dictBiapply (module."Control.Category".identity module."Control.Category".categoryFn (module."Data.Bifunctor".bimap (dictBiapply."Bifunctor0" module."Prim".undefined) module."Data.Function".const module."Data.Function".const) a) b;
  bilift2 = dictBiapply: f: g: a: b: biapply dictBiapply (module."Control.Category".identity module."Control.Category".categoryFn (module."Data.Bifunctor".bimap (dictBiapply."Bifunctor0" module."Prim".undefined) f g) a) b;
  bilift3 = dictBiapply: f: g: a: b: c: biapply dictBiapply (biapply dictBiapply (module."Control.Category".identity module."Control.Category".categoryFn (module."Data.Bifunctor".bimap (dictBiapply."Bifunctor0" module."Prim".undefined) f g) a) b) c;
in
  {inherit biapply biapplyFirst biapplySecond bilift2 bilift3 biapplyTuple;}