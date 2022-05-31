
let
  module = 
    { "Data.Bounded" = import ../Data.Bounded;
      "Data.Eq" = import ../Data.Eq;
      "Data.Newtype" = import ../Data.Newtype;
      "Data.Ord" = import ../Data.Ord;
      "Data.Ordering" = import ../Data.Ordering;
      "Data.Semigroup" = import ../Data.Semigroup;
      "Data.Show" = import ../Data.Show;
      "Prelude" = import ../Prelude;
    };
  Down = x: x;
  showDown = dictShow: 
    { show = v: 
        let
          __pattern0 = __fail: 
            let
              a = v;
            in
              module."Data.Semigroup".append module."Data.Semigroup".semigroupString "(Down " (module."Data.Semigroup".append module."Data.Semigroup".semigroupString (module."Data.Show".show dictShow a) ")");
          __patternFail = builtins.throw "Pattern match failure in .spago/orders/master/src/Data/Ord/Down.purs at 25:1 - 26:44";
        in
          __pattern0 __patternFail;
    };
  newtypeDown = {"Coercible0" = __unused: module."Prim".undefined;};
  eqDown = dictEq: dictEq;
  ordDown = dictOrd: 
    { compare = v: v1: 
        let
          __pattern0 = __fail: 
            let
              x = v;
              y = v1;
            in
              module."Data.Ordering".invert (module."Data.Ord".compare dictOrd x y);
          __patternFail = builtins.throw "Pattern match failure in .spago/orders/master/src/Data/Ord/Down.purs at 18:1 - 19:51";
        in
          __pattern0 __patternFail;
      "Eq0" = __unused: eqDown (dictOrd."Eq0" module."Prim".undefined);
    };
  boundedDown = dictBounded: 
    { top = module."Data.Bounded".bottom dictBounded;
      bottom = module."Data.Bounded".top dictBounded;
      "Ord0" = __unused: ordDown (dictBounded."Ord0" module."Prim".undefined);
    };
in
  {inherit Down newtypeDown eqDown ordDown boundedDown showDown;}