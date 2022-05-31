
let
  module = 
    { "Control.Alt" = import ../Control.Alt;
      "Control.Applicative" = import ../Control.Applicative;
      "Control.Apply" = import ../Control.Apply;
      "Control.Bind" = import ../Control.Bind;
      "Control.Extend" = import ../Control.Extend;
      "Control.Monad" = import ../Control.Monad;
      "Control.Semigroupoid" = import ../Control.Semigroupoid;
      "Data.Bounded" = import ../Data.Bounded;
      "Data.Eq" = import ../Data.Eq;
      "Data.Function" = import ../Data.Function;
      "Data.Functor" = import ../Data.Functor;
      "Data.Functor.Invariant" = import ../Data.Functor.Invariant;
      "Data.Generic.Rep" = import ../Data.Generic.Rep;
      "Data.Maybe" = import ../Data.Maybe;
      "Data.Ord" = import ../Data.Ord;
      "Data.Ordering" = import ../Data.Ordering;
      "Data.Semigroup" = import ../Data.Semigroup;
      "Data.Show" = import ../Data.Show;
      "Data.Unit" = import ../Data.Unit;
      "Prelude" = import ../Prelude;
    };
  Left = value0: 
    { __tag = "Left";
      __field0 = value0;
    };
  Right = value0: 
    { __tag = "Right";
      __field0 = value0;
    };
  showEither = dictShow: dictShow1: 
    { show = v: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Left"
              then 
                let
                  x = v.__field0;
                in
                  module."Data.Semigroup".append module."Data.Semigroup".semigroupString "(Left " (module."Data.Semigroup".append module."Data.Semigroup".semigroupString (module."Data.Show".show dictShow x) ")")
              else __fail;
          __pattern1 = __fail: 
            if v.__tag == "Right"
              then 
                let
                  y = v.__field0;
                in
                  module."Data.Semigroup".append module."Data.Semigroup".semigroupString "(Right " (module."Data.Semigroup".append module."Data.Semigroup".semigroupString (module."Data.Show".show dictShow1 y) ")")
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either.purs at 173:1 - 175:46";
        in
          __pattern0 (__pattern1 __patternFail);
    };
  note' = f: module."Data.Maybe".maybe' (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn Left f) Right;
  note = a: module."Data.Maybe".maybe (Left a) Right;
  genericEither = 
    { to = x: 
        let
          __pattern0 = __fail: 
            if x.__tag == "Inl"
              then 
                let
                  arg = x.__field0;
                in
                  Left arg
              else __fail;
          __pattern1 = __fail: 
            if x.__tag == "Inr"
              then 
                let
                  arg = x.__field0;
                in
                  Right arg
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either.purs at 33:1 - 33:56";
        in
          __pattern0 (__pattern1 __patternFail);
      from = x: 
        let
          __pattern0 = __fail: 
            if x.__tag == "Left"
              then 
                let
                  arg = x.__field0;
                in
                  module."Data.Generic.Rep".Inl arg
              else __fail;
          __pattern1 = __fail: 
            if x.__tag == "Right"
              then 
                let
                  arg = x.__field0;
                in
                  module."Data.Generic.Rep".Inr arg
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either.purs at 33:1 - 33:56";
        in
          __pattern0 (__pattern1 __patternFail);
    };
  functorEither = 
    { map = f: m: 
        let
          __pattern0 = __fail: 
            if m.__tag == "Left"
              then 
                let
                  v = m.__field0;
                in
                  Left v
              else __fail;
          __pattern1 = __fail: 
            if m.__tag == "Right"
              then 
                let
                  v = m.__field0;
                in
                  Right (f v)
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either.purs at 31:1 - 31:52";
        in
          __pattern0 (__pattern1 __patternFail);
    };
  invariantEither = {imap = module."Data.Functor.Invariant".imapF functorEither;};
  fromRight' = v: v1: 
    let
      __pattern0 = __fail: 
        if v1.__tag == "Right"
          then 
            let
              b = v1.__field0;
            in
              b
          else __fail;
      __pattern1 = __fail: 
        let
          default = v;
        in
          default module."Data.Unit".unit;
      __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either.purs at 252:1 - 252:57";
    in
      __pattern0 (__pattern1 __patternFail);
  fromRight = v: v1: 
    let
      __pattern0 = __fail: 
        if v1.__tag == "Right"
          then 
            let
              b = v1.__field0;
            in
              b
          else __fail;
      __pattern1 = __fail: 
        let
          default = v;
        in
          default;
      __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either.purs at 243:1 - 243:46";
    in
      __pattern0 (__pattern1 __patternFail);
  fromLeft' = v: v1: 
    let
      __pattern0 = __fail: 
        if v1.__tag == "Left"
          then 
            let
              a = v1.__field0;
            in
              a
          else __fail;
      __pattern1 = __fail: 
        let
          default = v;
        in
          default module."Data.Unit".unit;
      __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either.purs at 236:1 - 236:56";
    in
      __pattern0 (__pattern1 __patternFail);
  fromLeft = v: v1: 
    let
      __pattern0 = __fail: 
        if v1.__tag == "Left"
          then 
            let
              a = v1.__field0;
            in
              a
          else __fail;
      __pattern1 = __fail: 
        let
          default = v;
        in
          default;
      __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either.purs at 227:1 - 227:45";
    in
      __pattern0 (__pattern1 __patternFail);
  extendEither = 
    { extend = v: v1: 
        let
          __pattern0 = __fail: 
            if v1.__tag == "Left"
              then 
                let
                  y = v1.__field0;
                in
                  Left y
              else __fail;
          __pattern1 = __fail: 
            let
              f = v;
              x = v1;
            in
              Right (f x);
          __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either.purs at 166:1 - 168:35";
        in
          __pattern0 (__pattern1 __patternFail);
      "Functor0" = __unused: functorEither;
    };
  eqEither = dictEq: dictEq1: 
    { eq = x: y: 
        let
          __pattern0 = __fail: 
            if x.__tag == "Left" && y.__tag == "Left"
              then 
                let
                  l = x.__field0;
                  r = y.__field0;
                in
                  module."Data.Eq".eq dictEq l r
              else __fail;
          __pattern1 = __fail: 
            if x.__tag == "Right" && y.__tag == "Right"
              then 
                let
                  l = x.__field0;
                  r = y.__field0;
                in
                  module."Data.Eq".eq dictEq1 l r
              else __fail;
          __pattern2 = __fail: false;
          __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either.purs at 180:1 - 180:60";
        in
          __pattern0 (__pattern1 (__pattern2 __patternFail));
    };
  ordEither = dictOrd: dictOrd1: 
    { compare = x: y: 
        let
          __pattern0 = __fail: 
            if x.__tag == "Left" && y.__tag == "Left"
              then 
                let
                  l = x.__field0;
                  r = y.__field0;
                in
                  module."Data.Ord".compare dictOrd l r
              else __fail;
          __pattern1 = __fail: if x.__tag == "Left" then module."Data.Ordering".LT else __fail;
          __pattern2 = __fail: if y.__tag == "Left" then module."Data.Ordering".GT else __fail;
          __pattern3 = __fail: 
            if x.__tag == "Right" && y.__tag == "Right"
              then 
                let
                  l = x.__field0;
                  r = y.__field0;
                in
                  module."Data.Ord".compare dictOrd1 l r
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either.purs at 189:1 - 189:64";
        in
          __pattern0 (__pattern1 (__pattern2 (__pattern3 __patternFail)));
      "Eq0" = __unused: eqEither (dictOrd."Eq0" module."Prim".undefined) (dictOrd1."Eq0" module."Prim".undefined);
    };
  eq1Either = dictEq: {eq1 = dictEq1: module."Data.Eq".eq (eqEither dictEq dictEq1);};
  ord1Either = dictOrd: 
    { compare1 = dictOrd1: module."Data.Ord".compare (ordEither dictOrd dictOrd1);
      "Eq10" = __unused: eq1Either (dictOrd."Eq0" module."Prim".undefined);
    };
  either = v: v1: v2: 
    let
      __pattern0 = __fail: 
        if v2.__tag == "Left"
          then 
            let
              f = v;
              a = v2.__field0;
            in
              f a
          else __fail;
      __pattern1 = __fail: 
        if v2.__tag == "Right"
          then 
            let
              g = v1;
              b = v2.__field0;
            in
              g b
          else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either.purs at 208:1 - 208:64";
    in
      __pattern0 (__pattern1 __patternFail);
  hush = either (module."Data.Function".const module."Data.Maybe".Nothing) module."Data.Maybe".Just;
  isLeft = either (module."Data.Function".const true) (module."Data.Function".const false);
  isRight = either (module."Data.Function".const false) (module."Data.Function".const true);
  choose = dictAlt: a: b: module."Control.Alt".alt dictAlt (module."Data.Functor".map (dictAlt."Functor0" module."Prim".undefined) Left a) (module."Data.Functor".map (dictAlt."Functor0" module."Prim".undefined) Right b);
  boundedEither = dictBounded: dictBounded1: 
    { top = Right (module."Data.Bounded".top dictBounded1);
      bottom = Left (module."Data.Bounded".bottom dictBounded);
      "Ord0" = __unused: ordEither (dictBounded."Ord0" module."Prim".undefined) (dictBounded1."Ord0" module."Prim".undefined);
    };
  applyEither = 
    { apply = v: v1: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Left"
              then 
                let
                  e = v.__field0;
                in
                  Left e
              else __fail;
          __pattern1 = __fail: 
            if v.__tag == "Right"
              then 
                let
                  f = v.__field0;
                  r = v1;
                in
                  module."Data.Functor".map functorEither f r
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either.purs at 70:1 - 72:30";
        in
          __pattern0 (__pattern1 __patternFail);
      "Functor0" = __unused: functorEither;
    };
  bindEither = 
    { bind = either (e: v: Left e) (a: f: f a);
      "Apply0" = __unused: applyEither;
    };
  semigroupEither = dictSemigroup: {append = x: y: module."Control.Apply".apply applyEither (module."Data.Functor".map functorEither (module."Data.Semigroup".append dictSemigroup) x) y;};
  applicativeEither = 
    { pure = Right;
      "Apply0" = __unused: applyEither;
    };
  monadEither = 
    { "Applicative0" = __unused: applicativeEither;
      "Bind1" = __unused: bindEither;
    };
  altEither = 
    { alt = v: v1: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Left"
              then 
                let
                  r = v1;
                in
                  r
              else __fail;
          __pattern1 = __fail: 
            let
              l = v;
            in
              l;
          __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either.purs at 105:1 - 107:21";
        in
          __pattern0 (__pattern1 __patternFail);
      "Functor0" = __unused: functorEither;
    };
in
  {inherit Left Right either choose isLeft isRight fromLeft fromLeft' fromRight fromRight' note note' hush functorEither genericEither invariantEither applyEither applicativeEither altEither bindEither monadEither extendEither showEither eqEither eq1Either ordEither ord1Either boundedEither semigroupEither;}