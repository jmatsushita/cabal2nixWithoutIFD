
let
  module = 
    { "Control.Category" = import ../Control.Category;
      "Control.Semigroupoid" = import ../Control.Semigroupoid;
      "Data.Bounded" = import ../Data.Bounded;
      "Data.Eq" = import ../Data.Eq;
      "Data.Monoid" = import ../Data.Monoid;
      "Data.Ord" = import ../Data.Ord;
      "Data.Semigroup" = import ../Data.Semigroup;
      "Data.Show" = import ../Data.Show;
      "Prelude" = import ../Prelude;
    };
  Endo = x: x;
  showEndo = dictShow: 
    { show = v: 
        let
          __pattern0 = __fail: 
            let
              x = v;
            in
              module."Data.Semigroup".append module."Data.Semigroup".semigroupString "(Endo " (module."Data.Semigroup".append module."Data.Semigroup".semigroupString (module."Data.Show".show dictShow x) ")");
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Monoid/Endo.purs at 23:1 - 24:44";
        in
          __pattern0 __patternFail;
    };
  semigroupEndo = dictSemigroupoid: 
    { append = v: v1: 
        let
          __pattern0 = __fail: 
            let
              a = v;
              b = v1;
            in
              module."Control.Semigroupoid".compose dictSemigroupoid a b;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Monoid/Endo.purs at 26:1 - 27:44";
        in
          __pattern0 __patternFail;
    };
  ordEndo = dictOrd: dictOrd;
  monoidEndo = dictCategory: 
    { mempty = module."Control.Category".identity dictCategory;
      "Semigroup0" = __unused: semigroupEndo (dictCategory."Semigroupoid0" module."Prim".undefined);
    };
  eqEndo = dictEq: dictEq;
  boundedEndo = dictBounded: dictBounded;
in
  {inherit Endo eqEndo ordEndo boundedEndo showEndo semigroupEndo monoidEndo;}