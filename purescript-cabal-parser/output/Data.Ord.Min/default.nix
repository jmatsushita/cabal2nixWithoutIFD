
let
  module = 
    { "Data.Bounded" = import ../Data.Bounded;
      "Data.Eq" = import ../Data.Eq;
      "Data.Monoid" = import ../Data.Monoid;
      "Data.Newtype" = import ../Data.Newtype;
      "Data.Ord" = import ../Data.Ord;
      "Data.Semigroup" = import ../Data.Semigroup;
      "Data.Show" = import ../Data.Show;
      "Prelude" = import ../Prelude;
    };
  Min = x: x;
  showMin = dictShow: 
    { show = v: 
        let
          __pattern0 = __fail: 
            let
              a = v;
            in
              module."Data.Semigroup".append module."Data.Semigroup".semigroupString "(Min " (module."Data.Semigroup".append module."Data.Semigroup".semigroupString (module."Data.Show".show dictShow a) ")");
          __patternFail = builtins.throw "Pattern match failure in .spago/orders/master/src/Data/Ord/Min.purs at 28:1 - 29:42";
        in
          __pattern0 __patternFail;
    };
  semigroupMin = dictOrd: 
    { append = v: v1: 
        let
          __pattern0 = __fail: 
            let
              x = v;
              y = v1;
            in
              module."Data.Ord".min dictOrd x y;
          __patternFail = builtins.throw "Pattern match failure in .spago/orders/master/src/Data/Ord/Min.purs at 22:1 - 23:41";
        in
          __pattern0 __patternFail;
    };
  newtypeMin = {"Coercible0" = __unused: module."Prim".undefined;};
  monoidMin = dictBounded: 
    { mempty = module."Data.Bounded".top dictBounded;
      "Semigroup0" = __unused: semigroupMin (dictBounded."Ord0" module."Prim".undefined);
    };
  eqMin = dictEq: dictEq;
  ordMin = dictOrd: 
    { compare = v: v1: 
        let
          __pattern0 = __fail: 
            let
              x = v;
              y = v1;
            in
              module."Data.Ord".compare dictOrd x y;
          __patternFail = builtins.throw "Pattern match failure in .spago/orders/master/src/Data/Ord/Min.purs at 19:1 - 20:40";
        in
          __pattern0 __patternFail;
      "Eq0" = __unused: eqMin (dictOrd."Eq0" module."Prim".undefined);
    };
in
  {inherit Min newtypeMin eqMin ordMin semigroupMin monoidMin showMin;}