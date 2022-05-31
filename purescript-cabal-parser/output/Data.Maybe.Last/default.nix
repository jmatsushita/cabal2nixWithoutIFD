
let
  module = 
    { "Control.Alt" = import ../Control.Alt;
      "Control.Alternative" = import ../Control.Alternative;
      "Control.Applicative" = import ../Control.Applicative;
      "Control.Apply" = import ../Control.Apply;
      "Control.Bind" = import ../Control.Bind;
      "Control.Extend" = import ../Control.Extend;
      "Control.Monad" = import ../Control.Monad;
      "Control.MonadZero" = import ../Control.MonadZero;
      "Control.Plus" = import ../Control.Plus;
      "Data.Bounded" = import ../Data.Bounded;
      "Data.Eq" = import ../Data.Eq;
      "Data.Functor" = import ../Data.Functor;
      "Data.Functor.Invariant" = import ../Data.Functor.Invariant;
      "Data.Maybe" = import ../Data.Maybe;
      "Data.Monoid" = import ../Data.Monoid;
      "Data.Newtype" = import ../Data.Newtype;
      "Data.Ord" = import ../Data.Ord;
      "Data.Semigroup" = import ../Data.Semigroup;
      "Data.Show" = import ../Data.Show;
      "Prelude" = import ../Prelude;
    };
  Last = x: x;
  showLast = dictShow: 
    { show = v: 
        let
          __pattern0 = __fail: 
            let
              a = v;
            in
              module."Data.Semigroup".append module."Data.Semigroup".semigroupString "(Last " (module."Data.Semigroup".append module."Data.Semigroup".semigroupString (module."Data.Show".show (module."Data.Maybe".showMaybe dictShow) a) ")");
          __patternFail = builtins.throw "Pattern match failure in .spago/maybe/master/src/Data/Maybe/Last.purs at 49:1 - 50:44";
        in
          __pattern0 __patternFail;
    };
  semigroupLast = 
    { append = v: v1: 
        let
          __pattern0 = __fail: 
            if v1.__tag == "Just"
              then 
                let
                  last = v1;
                in
                  last
              else __fail;
          __pattern1 = __fail: 
            if v1.__tag == "Nothing"
              then 
                let
                  last = v;
                in
                  last
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/maybe/master/src/Data/Maybe/Last.purs at 52:1 - 54:36";
        in
          __pattern0 (__pattern1 __patternFail);
    };
  ordLast = dictOrd: module."Data.Maybe".ordMaybe dictOrd;
  ord1Last = module."Data.Maybe".ord1Maybe;
  newtypeLast = {"Coercible0" = __unused: module."Prim".undefined;};
  monoidLast = 
    { mempty = module."Data.Maybe".Nothing;
      "Semigroup0" = __unused: semigroupLast;
    };
  monadLast = module."Data.Maybe".monadMaybe;
  invariantLast = module."Data.Maybe".invariantMaybe;
  functorLast = module."Data.Maybe".functorMaybe;
  extendLast = module."Data.Maybe".extendMaybe;
  eqLast = dictEq: module."Data.Maybe".eqMaybe dictEq;
  eq1Last = module."Data.Maybe".eq1Maybe;
  boundedLast = dictBounded: module."Data.Maybe".boundedMaybe dictBounded;
  bindLast = module."Data.Maybe".bindMaybe;
  applyLast = module."Data.Maybe".applyMaybe;
  applicativeLast = module."Data.Maybe".applicativeMaybe;
  altLast = 
    { alt = module."Data.Semigroup".append semigroupLast;
      "Functor0" = __unused: functorLast;
    };
  plusLast = 
    { empty = module."Data.Monoid".mempty monoidLast;
      "Alt0" = __unused: altLast;
    };
  alternativeLast = 
    { "Applicative0" = __unused: applicativeLast;
      "Plus1" = __unused: plusLast;
    };
  monadZeroLast = 
    { "Monad0" = __unused: monadLast;
      "Alternative1" = __unused: alternativeLast;
      "MonadZeroIsDeprecated2" = __unused: module."Prim".undefined;
    };
in
  {inherit Last newtypeLast eqLast eq1Last ordLast ord1Last boundedLast functorLast invariantLast applyLast applicativeLast bindLast monadLast extendLast showLast semigroupLast monoidLast altLast plusLast alternativeLast monadZeroLast;}