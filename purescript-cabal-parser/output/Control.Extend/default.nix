
let
  module = 
    { "Control.Category" = import ../Control.Category;
      "Data.Functor" = import ../Data.Functor;
      "Data.Semigroup" = import ../Data.Semigroup;
    };
  foreign = import ./foreign.nix;
  arrayExtend = foreign.arrayExtend;
  Extend-Dict = x: x;
  extendFn = dictSemigroup: 
    { extend = f: g: w: f (w': g (module."Data.Semigroup".append dictSemigroup w w'));
      "Functor0" = __unused: module."Data.Functor".functorFn;
    };
  extendArray = 
    { extend = arrayExtend;
      "Functor0" = __unused: module."Data.Functor".functorArray;
    };
  extend = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.extend;
      __patternFail = builtins.throw "Pattern match failure in .spago/control/master/src/Control/Extend.purs at 25:3 - 25:49";
    in
      __pattern0 __patternFail;
  extendFlipped = dictExtend: w: f: extend dictExtend f w;
  duplicate = dictExtend: extend dictExtend (module."Control.Category".identity module."Control.Category".categoryFn);
  composeCoKleisliFlipped = dictExtend: f: g: w: f (extend dictExtend g w);
  composeCoKleisli = dictExtend: f: g: w: g (extend dictExtend f w);
in
  
  { inherit extend extendFlipped composeCoKleisli composeCoKleisliFlipped duplicate extendFn extendArray;
    inherit (module."Data.Functor") map void;
  }