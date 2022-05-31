
let
  module = 
    { "Control.Category" = import ../Control.Category;
      "Control.Semigroupoid" = import ../Control.Semigroupoid;
      "Data.Functor" = import ../Data.Functor;
      "Data.Profunctor" = import ../Data.Profunctor;
      "Data.Tuple" = import ../Data.Tuple;
      "Prelude" = import ../Prelude;
    };
  Strong-Dict = x: x;
  strongFn = 
    { first = a2b: v: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Tuple"
              then 
                let
                  a2b1 = a2b;
                  a = v.__field0;
                  c = v.__field1;
                in
                  module."Data.Tuple".Tuple (a2b1 a) c
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/profunctor/master/src/Data/Profunctor/Strong.purs at 32:1 - 34:17";
        in
          __pattern0 __patternFail;
      second = module."Data.Functor".map module."Data.Tuple".functorTuple;
      "Profunctor0" = __unused: module."Data.Profunctor".profunctorFn;
    };
  second = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.second;
      __patternFail = builtins.throw "Pattern match failure in .spago/profunctor/master/src/Data/Profunctor/Strong.purs at 30:3 - 30:61";
    in
      __pattern0 __patternFail;
  first = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.first;
      __patternFail = builtins.throw "Pattern match failure in .spago/profunctor/master/src/Data/Profunctor/Strong.purs at 29:3 - 29:60";
    in
      __pattern0 __patternFail;
  splitStrong = dictCategory: dictStrong: l: r: module."Control.Semigroupoid".composeFlipped (dictCategory."Semigroupoid0" module."Prim".undefined) (first dictStrong l) (second dictStrong r);
  fanout = dictCategory: dictStrong: l: r: 
    let
      split = module."Data.Profunctor".dimap (dictStrong."Profunctor0" module."Prim".undefined) (module."Control.Category".identity module."Control.Category".categoryFn) (a: module."Data.Tuple".Tuple a a) (module."Control.Category".identity dictCategory);
    in
      module."Control.Semigroupoid".composeFlipped (dictCategory."Semigroupoid0" module."Prim".undefined) split (splitStrong dictCategory dictStrong l r);
in
  {inherit first second splitStrong fanout strongFn;}