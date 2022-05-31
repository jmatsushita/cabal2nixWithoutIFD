
let
  module = 
    { "Control.Applicative" = import ../Control.Applicative;
      "Control.Apply" = import ../Control.Apply;
      "Control.Bind" = import ../Control.Bind;
      "Control.Category" = import ../Control.Category;
      "Control.Comonad" = import ../Control.Comonad;
      "Control.Extend" = import ../Control.Extend;
      "Control.Monad" = import ../Control.Monad;
      "Control.Semigroupoid" = import ../Control.Semigroupoid;
      "Data.Bifunctor" = import ../Data.Bifunctor;
      "Data.Distributive" = import ../Data.Distributive;
      "Data.Function" = import ../Data.Function;
      "Data.Functor" = import ../Data.Functor;
      "Data.Functor.Contravariant" = import ../Data.Functor.Contravariant;
      "Data.Functor.Invariant" = import ../Data.Functor.Invariant;
      "Data.Newtype" = import ../Data.Newtype;
      "Data.Profunctor" = import ../Data.Profunctor;
      "Data.Profunctor.Closed" = import ../Data.Profunctor.Closed;
      "Data.Profunctor.Strong" = import ../Data.Profunctor.Strong;
      "Data.Tuple" = import ../Data.Tuple;
      "Prelude" = import ../Prelude;
    };
  Costar = x: x;
  semigroupoidCostar = dictExtend: 
    { compose = v: v1: 
        let
          __pattern0 = __fail: 
            let
              f = v;
              g = v1;
            in
              module."Control.Extend".composeCoKleisliFlipped dictExtend f g;
          __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Costar.purs at 25:1 - 26:51";
        in
          __pattern0 __patternFail;
    };
  profunctorCostar = dictFunctor: 
    { dimap = f: g: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              g1 = g;
              h = v;
            in
              module."Control.Semigroupoid".composeFlipped module."Control.Semigroupoid".semigroupoidFn (module."Data.Functor".map dictFunctor f1) (module."Control.Semigroupoid".composeFlipped module."Control.Semigroupoid".semigroupoidFn h g1);
          __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Costar.purs at 55:1 - 56:52";
        in
          __pattern0 __patternFail;
    };
  strongCostar = dictComonad: 
    { first = v: 
        let
          __pattern0 = __fail: 
            let
              f = v;
            in
              x: module."Data.Tuple".Tuple (f (module."Data.Functor".map ((dictComonad."Extend0" module."Prim".undefined)."Functor0" module."Prim".undefined) module."Data.Tuple".fst x)) (module."Data.Tuple".snd (module."Control.Comonad".extract dictComonad x));
          __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Costar.purs at 58:1 - 60:75";
        in
          __pattern0 __patternFail;
      second = v: 
        let
          __pattern0 = __fail: 
            let
              f = v;
            in
              x: module."Data.Tuple".Tuple (module."Data.Tuple".fst (module."Control.Comonad".extract dictComonad x)) (f (module."Data.Functor".map ((dictComonad."Extend0" module."Prim".undefined)."Functor0" module."Prim".undefined) module."Data.Tuple".snd x));
          __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Costar.purs at 58:1 - 60:75";
        in
          __pattern0 __patternFail;
      "Profunctor0" = __unused: profunctorCostar ((dictComonad."Extend0" module."Prim".undefined)."Functor0" module."Prim".undefined);
    };
  newtypeCostar = {"Coercible0" = __unused: module."Prim".undefined;};
  hoistCostar = f: v: 
    let
      __pattern0 = __fail: 
        let
          f1 = f;
          g = v;
        in
          module."Data.Profunctor".lcmap module."Data.Profunctor".profunctorFn f1 g;
      __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Costar.purs at 65:1 - 65:72";
    in
      __pattern0 __patternFail;
  functorCostar = 
    { map = f: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              g = v;
            in
              module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn f1 g;
          __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Costar.purs at 31:1 - 32:38";
        in
          __pattern0 __patternFail;
    };
  invariantCostar = {imap = module."Data.Functor.Invariant".imapF functorCostar;};
  distributiveCostar = 
    { distribute = dictFunctor: f: a: module."Data.Functor".map dictFunctor 
        ( v: 
          let
            __pattern0 = __fail: 
              let
                g = v;
              in
                g a;
            __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Costar.purs at 49:36 - 49:54";
          in
            __pattern0 __patternFail
        ) f;
      collect = dictFunctor: f: module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn (module."Data.Distributive".distribute distributiveCostar dictFunctor) (module."Data.Functor".map dictFunctor f);
      "Functor0" = __unused: functorCostar;
    };
  closedCostar = dictFunctor: 
    { closed = v: 
        let
          __pattern0 = __fail: 
            let
              f = v;
            in
              g: x: f (module."Data.Functor".map dictFunctor (v1: module."Data.Function".apply v1 x) g);
          __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Costar.purs at 62:1 - 63:55";
        in
          __pattern0 __patternFail;
      "Profunctor0" = __unused: profunctorCostar dictFunctor;
    };
  categoryCostar = dictComonad: 
    { identity = module."Control.Comonad".extract dictComonad;
      "Semigroupoid0" = __unused: semigroupoidCostar (dictComonad."Extend0" module."Prim".undefined);
    };
  bifunctorCostar = dictContravariant: 
    { bimap = f: g: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              g1 = g;
              h = v;
            in
              module."Control.Semigroupoid".composeFlipped module."Control.Semigroupoid".semigroupoidFn (module."Data.Functor.Contravariant".cmap dictContravariant f1) (module."Control.Semigroupoid".composeFlipped module."Control.Semigroupoid".semigroupoidFn h g1);
          __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Costar.purs at 52:1 - 53:53";
        in
          __pattern0 __patternFail;
    };
  applyCostar = 
    { apply = v: v1: 
        let
          __pattern0 = __fail: 
            let
              f = v;
              g = v1;
            in
              a: f a (g a);
          __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Costar.purs at 37:1 - 38:55";
        in
          __pattern0 __patternFail;
      "Functor0" = __unused: functorCostar;
    };
  bindCostar = 
    { bind = v: f: 
        let
          __pattern0 = __fail: 
            let
              m = v;
              f1 = f;
            in
              x: 
              let
                v1 = f1 (m x);
              in
                
                let
                  __pattern0 = __fail: 
                    let
                      g = v1;
                    in
                      g x;
                  __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Costar.purs at 44:36 - 44:67";
                in
                  __pattern0 __patternFail;
          __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Costar.purs at 43:1 - 44:67";
        in
          __pattern0 __patternFail;
      "Apply0" = __unused: applyCostar;
    };
  applicativeCostar = 
    { pure = a: v: a;
      "Apply0" = __unused: applyCostar;
    };
  monadCostar = 
    { "Applicative0" = __unused: applicativeCostar;
      "Bind1" = __unused: bindCostar;
    };
in
  {inherit Costar hoistCostar newtypeCostar semigroupoidCostar categoryCostar functorCostar invariantCostar applyCostar applicativeCostar bindCostar monadCostar distributiveCostar bifunctorCostar profunctorCostar strongCostar closedCostar;}