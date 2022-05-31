
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
  Max = x: x;
  showMax = dictShow: 
    { show = v: 
        let
          __pattern0 = __fail: 
            let
              a = v;
            in
              module."Data.Semigroup".append module."Data.Semigroup".semigroupString "(Max " (module."Data.Semigroup".append module."Data.Semigroup".semigroupString (module."Data.Show".show dictShow a) ")");
          __patternFail = builtins.throw "Pattern match failure in .spago/orders/master/src/Data/Ord/Max.purs at 28:1 - 29:42";
        in
          __pattern0 __patternFail;
    };
  semigroupMax = dictOrd: 
    { append = v: v1: 
        let
          __pattern0 = __fail: 
            let
              x = v;
              y = v1;
            in
              module."Data.Ord".max dictOrd x y;
          __patternFail = builtins.throw "Pattern match failure in .spago/orders/master/src/Data/Ord/Max.purs at 22:1 - 23:41";
        in
          __pattern0 __patternFail;
    };
  newtypeMax = {"Coercible0" = __unused: module."Prim".undefined;};
  monoidMax = dictBounded: 
    { mempty = module."Data.Bounded".bottom dictBounded;
      "Semigroup0" = __unused: semigroupMax (dictBounded."Ord0" module."Prim".undefined);
    };
  eqMax = dictEq: dictEq;
  ordMax = dictOrd: 
    { compare = v: v1: 
        let
          __pattern0 = __fail: 
            let
              x = v;
              y = v1;
            in
              module."Data.Ord".compare dictOrd x y;
          __patternFail = builtins.throw "Pattern match failure in .spago/orders/master/src/Data/Ord/Max.purs at 19:1 - 20:40";
        in
          __pattern0 __patternFail;
      "Eq0" = __unused: eqMax (dictOrd."Eq0" module."Prim".undefined);
    };
in
  {inherit Max newtypeMax eqMax ordMax semigroupMax monoidMax showMax;}