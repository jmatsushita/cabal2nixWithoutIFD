
let
  module = { };
  Semigroupoid-Dict = x: x;
  semigroupoidFn = {compose = f: g: x: f (g x);};
  compose = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.compose;
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Control/Semigroupoid.purs at 14:3 - 14:51";
    in
      __pattern0 __patternFail;
  composeFlipped = dictSemigroupoid: f: g: compose dictSemigroupoid g f;
in
  {inherit compose composeFlipped semigroupoidFn;}