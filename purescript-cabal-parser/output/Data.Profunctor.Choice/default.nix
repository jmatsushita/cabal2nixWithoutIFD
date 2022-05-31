
let
  module = 
    { "Control.Category" = import ../Control.Category;
      "Control.Semigroupoid" = import ../Control.Semigroupoid;
      "Data.Either" = import ../Data.Either;
      "Data.Function" = import ../Data.Function;
      "Data.Functor" = import ../Data.Functor;
      "Data.Profunctor" = import ../Data.Profunctor;
      "Prelude" = import ../Prelude;
    };
  Choice-Dict = x: x;
  right = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.right;
      __patternFail = builtins.throw "Pattern match failure in .spago/profunctor/master/src/Data/Profunctor/Choice.purs at 30:3 - 30:62";
    in
      __pattern0 __patternFail;
  left = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.left;
      __patternFail = builtins.throw "Pattern match failure in .spago/profunctor/master/src/Data/Profunctor/Choice.purs at 29:3 - 29:61";
    in
      __pattern0 __patternFail;
  splitChoice = dictCategory: dictChoice: l: r: module."Control.Semigroupoid".composeFlipped (dictCategory."Semigroupoid0" module."Prim".undefined) (left dictChoice l) (right dictChoice r);
  fanin = dictCategory: dictChoice: l: r: 
    let
      join = module."Data.Profunctor".dimap (dictChoice."Profunctor0" module."Prim".undefined) (module."Data.Either".either (module."Control.Category".identity module."Control.Category".categoryFn) (module."Control.Category".identity module."Control.Category".categoryFn)) (module."Control.Category".identity module."Control.Category".categoryFn) (module."Control.Category".identity dictCategory);
    in
      module."Control.Semigroupoid".composeFlipped (dictCategory."Semigroupoid0" module."Prim".undefined) (splitChoice dictCategory dictChoice l r) join;
  choiceFn = 
    { left = v: v1: 
        let
          __pattern0 = __fail: 
            if v1.__tag == "Left"
              then 
                let
                  a2b = v;
                  a = v1.__field0;
                in
                  module."Data.Function".apply module."Data.Either".Left (a2b a)
              else __fail;
          __pattern1 = __fail: 
            if v1.__tag == "Right"
              then 
                let
                  c = v1.__field0;
                in
                  module."Data.Either".Right c
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/profunctor/master/src/Data/Profunctor/Choice.purs at 32:1 - 35:16";
        in
          __pattern0 (__pattern1 __patternFail);
      right = module."Data.Functor".map module."Data.Either".functorEither;
      "Profunctor0" = __unused: module."Data.Profunctor".profunctorFn;
    };
in
  {inherit left right splitChoice fanin choiceFn;}