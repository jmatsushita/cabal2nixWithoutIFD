
let
  module = 
    { "Control.Category" = import ../Control.Category;
      "Control.Semigroupoid" = import ../Control.Semigroupoid;
      "Data.Newtype" = import ../Data.Newtype;
      "Prelude" = import ../Prelude;
    };
  Profunctor-Dict = x: x;
  profunctorFn = {dimap = a2b: c2d: b2c: module."Control.Semigroupoid".composeFlipped module."Control.Semigroupoid".semigroupoidFn a2b (module."Control.Semigroupoid".composeFlipped module."Control.Semigroupoid".semigroupoidFn b2c c2d);};
  dimap = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.dimap;
      __patternFail = builtins.throw "Pattern match failure in .spago/profunctor/master/src/Data/Profunctor.purs at 23:3 - 23:66";
    in
      __pattern0 __patternFail;
  lcmap = dictProfunctor: a2b: dimap dictProfunctor a2b (module."Control.Category".identity module."Control.Category".categoryFn);
  rmap = dictProfunctor: b2c: dimap dictProfunctor (module."Control.Category".identity module."Control.Category".categoryFn) b2c;
  unwrapIso = dictProfunctor: dictNewtype: dimap dictProfunctor (module."Data.Newtype".wrap module."Prim".undefined) (module."Data.Newtype".unwrap module."Prim".undefined);
  wrapIso = dictProfunctor: dictNewtype: v: dimap dictProfunctor (module."Data.Newtype".unwrap module."Prim".undefined) (module."Data.Newtype".wrap module."Prim".undefined);
  arr = dictCategory: dictProfunctor: f: rmap dictProfunctor f (module."Control.Category".identity dictCategory);
in
  {inherit dimap lcmap rmap arr unwrapIso wrapIso profunctorFn;}