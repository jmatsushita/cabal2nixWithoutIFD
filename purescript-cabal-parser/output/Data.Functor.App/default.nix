
let
  module = 
    { "Control.Alt" = import ../Control.Alt;
      "Control.Alternative" = import ../Control.Alternative;
      "Control.Applicative" = import ../Control.Applicative;
      "Control.Apply" = import ../Control.Apply;
      "Control.Bind" = import ../Control.Bind;
      "Control.Comonad" = import ../Control.Comonad;
      "Control.Extend" = import ../Control.Extend;
      "Control.Lazy" = import ../Control.Lazy;
      "Control.Monad" = import ../Control.Monad;
      "Control.MonadPlus" = import ../Control.MonadPlus;
      "Control.MonadZero" = import ../Control.MonadZero;
      "Control.Plus" = import ../Control.Plus;
      "Data.Eq" = import ../Data.Eq;
      "Data.Functor" = import ../Data.Functor;
      "Data.Monoid" = import ../Data.Monoid;
      "Data.Newtype" = import ../Data.Newtype;
      "Data.Ord" = import ../Data.Ord;
      "Data.Semigroup" = import ../Data.Semigroup;
      "Data.Show" = import ../Data.Show;
      "Prelude" = import ../Prelude;
      "Unsafe.Coerce" = import ../Unsafe.Coerce;
    };
  App = x: x;
  showApp = dictShow: 
    { show = v: 
        let
          __pattern0 = __fail: 
            let
              fa = v;
            in
              module."Data.Semigroup".append module."Data.Semigroup".semigroupString "(App " (module."Data.Semigroup".append module."Data.Semigroup".semigroupString (module."Data.Show".show dictShow fa) ")");
          __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/App.purs at 36:1 - 37:44";
        in
          __pattern0 __patternFail;
    };
  semigroupApp = dictApply: dictSemigroup: 
    { append = v: v1: 
        let
          __pattern0 = __fail: 
            let
              fa1 = v;
              fa2 = v1;
            in
              module."Control.Apply".lift2 dictApply (module."Data.Semigroup".append dictSemigroup) fa1 fa2;
          __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/App.purs at 39:1 - 40:58";
        in
          __pattern0 __patternFail;
    };
  plusApp = dictPlus: dictPlus;
  newtypeApp = {"Coercible0" = __unused: module."Prim".undefined;};
  monoidApp = dictApplicative: dictMonoid: 
    { mempty = module."Control.Applicative".pure dictApplicative (module."Data.Monoid".mempty dictMonoid);
      "Semigroup0" = __unused: semigroupApp (dictApplicative."Apply0" module."Prim".undefined) (dictMonoid."Semigroup0" module."Prim".undefined);
    };
  monadPlusApp = dictMonadPlus: dictMonadPlus;
  monadApp = dictMonad: dictMonad;
  lazyApp = dictLazy: dictLazy;
  hoistLowerApp = module."Unsafe.Coerce".unsafeCoerce;
  hoistLiftApp = module."Unsafe.Coerce".unsafeCoerce;
  hoistApp = f: v: 
    let
      __pattern0 = __fail: 
        let
          f1 = f;
          fa = v;
        in
          f1 fa;
      __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/App.purs at 21:1 - 21:51";
    in
      __pattern0 __patternFail;
  functorApp = dictFunctor: dictFunctor;
  extendApp = dictExtend: dictExtend;
  eqApp = dictEq1: dictEq: 
    { eq = x: y: 
        let
          __pattern0 = __fail: 
            let
              l = x;
              r = y;
            in
              module."Data.Eq".eq1 dictEq1 dictEq l r;
          __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/App.purs at 31:1 - 31:55";
        in
          __pattern0 __patternFail;
    };
  ordApp = dictOrd1: dictOrd: 
    { compare = x: y: 
        let
          __pattern0 = __fail: 
            let
              l = x;
              r = y;
            in
              module."Data.Ord".compare1 dictOrd1 dictOrd l r;
          __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/App.purs at 33:1 - 33:59";
        in
          __pattern0 __patternFail;
      "Eq0" = __unused: eqApp (dictOrd1."Eq10" module."Prim".undefined) (dictOrd."Eq0" module."Prim".undefined);
    };
  eq1App = dictEq1: {eq1 = dictEq: module."Data.Eq".eq (eqApp dictEq1 dictEq);};
  ord1App = dictOrd1: 
    { compare1 = dictOrd: module."Data.Ord".compare (ordApp dictOrd1 dictOrd);
      "Eq10" = __unused: eq1App (dictOrd1."Eq10" module."Prim".undefined);
    };
  comonadApp = dictComonad: dictComonad;
  bindApp = dictBind: dictBind;
  applyApp = dictApply: dictApply;
  applicativeApp = dictApplicative: dictApplicative;
  alternativeApp = dictAlternative: dictAlternative;
  monadZeroApp = dictMonadZero: 
    { "Monad0" = __unused: monadApp (dictMonadZero."Monad0" module."Prim".undefined);
      "Alternative1" = __unused: alternativeApp (dictMonadZero."Alternative1" module."Prim".undefined);
      "MonadZeroIsDeprecated2" = __unused: module."Prim".undefined;
    };
  altApp = dictAlt: dictAlt;
in
  {inherit App hoistApp hoistLiftApp hoistLowerApp newtypeApp eqApp eq1App ordApp ord1App showApp semigroupApp monoidApp monadZeroApp functorApp applyApp applicativeApp bindApp monadApp altApp plusApp alternativeApp monadPlusApp lazyApp extendApp comonadApp;}