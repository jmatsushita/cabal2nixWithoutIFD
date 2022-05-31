
let
  module = 
    { "Control.Alt" = import ../Control.Alt;
      "Control.Alternative" = import ../Control.Alternative;
      "Control.Applicative" = import ../Control.Applicative;
      "Control.Apply" = import ../Control.Apply;
      "Control.Bind" = import ../Control.Bind;
      "Control.Category" = import ../Control.Category;
      "Control.Monad" = import ../Control.Monad;
      "Control.MonadPlus" = import ../Control.MonadPlus;
      "Control.MonadZero" = import ../Control.MonadZero;
      "Control.Plus" = import ../Control.Plus;
      "Control.Semigroupoid" = import ../Control.Semigroupoid;
      "Data.Distributive" = import ../Data.Distributive;
      "Data.Either" = import ../Data.Either;
      "Data.Function" = import ../Data.Function;
      "Data.Functor" = import ../Data.Functor;
      "Data.Functor.Invariant" = import ../Data.Functor.Invariant;
      "Data.Newtype" = import ../Data.Newtype;
      "Data.Profunctor" = import ../Data.Profunctor;
      "Data.Profunctor.Choice" = import ../Data.Profunctor.Choice;
      "Data.Profunctor.Closed" = import ../Data.Profunctor.Closed;
      "Data.Profunctor.Strong" = import ../Data.Profunctor.Strong;
      "Data.Tuple" = import ../Data.Tuple;
      "Prelude" = import ../Prelude;
    };
  Star = x: x;
  semigroupoidStar = dictBind: 
    { compose = v: v1: 
        let
          __pattern0 = __fail: 
            let
              f = v;
              g = v1;
            in
              x: module."Control.Bind".bind dictBind (g x) f;
          __patternFail = builtins.throw "Pattern match failure in .spago/profunctor/master/src/Data/Profunctor/Star.purs at 29:1 - 30:51";
        in
          __pattern0 __patternFail;
    };
  profunctorStar = dictFunctor: 
    { dimap = f: g: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              g1 = g;
              ft = v;
            in
              module."Control.Semigroupoid".composeFlipped module."Control.Semigroupoid".semigroupoidFn f1 (module."Control.Semigroupoid".composeFlipped module."Control.Semigroupoid".semigroupoidFn ft (module."Data.Functor".map dictFunctor g1));
          __patternFail = builtins.throw "Pattern match failure in .spago/profunctor/master/src/Data/Profunctor/Star.purs at 68:1 - 69:50";
        in
          __pattern0 __patternFail;
    };
  strongStar = dictFunctor: 
    { first = v: 
        let
          __pattern0 = __fail: 
            let
              f = v;
            in
              v1: 
              let
                __pattern0 = __fail: 
                  if v1.__tag == "Tuple"
                    then 
                      let
                        s = v1.__field0;
                        x = v1.__field1;
                      in
                        module."Data.Functor".map dictFunctor (v2: module."Data.Tuple".Tuple v2 x) (f s)
                    else __fail;
                __patternFail = builtins.throw "Pattern match failure in .spago/profunctor/master/src/Data/Profunctor/Star.purs at 72:26 - 72:65";
              in
                __pattern0 __patternFail;
          __patternFail = builtins.throw "Pattern match failure in .spago/profunctor/master/src/Data/Profunctor/Star.purs at 71:1 - 73:61";
        in
          __pattern0 __patternFail;
      second = v: 
        let
          __pattern0 = __fail: 
            let
              f = v;
            in
              v1: 
              let
                __pattern0 = __fail: 
                  if v1.__tag == "Tuple"
                    then 
                      let
                        x = v1.__field0;
                        s = v1.__field1;
                      in
                        module."Data.Functor".map dictFunctor (module."Data.Tuple".Tuple x) (f s)
                    else __fail;
                __patternFail = builtins.throw "Pattern match failure in .spago/profunctor/master/src/Data/Profunctor/Star.purs at 73:26 - 73:61";
              in
                __pattern0 __patternFail;
          __patternFail = builtins.throw "Pattern match failure in .spago/profunctor/master/src/Data/Profunctor/Star.purs at 71:1 - 73:61";
        in
          __pattern0 __patternFail;
      "Profunctor0" = __unused: profunctorStar dictFunctor;
    };
  newtypeStar = {"Coercible0" = __unused: module."Prim".undefined;};
  invariantStar = dictInvariant: 
    { imap = f: g: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              g1 = g;
              h = v;
            in
              module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn (module."Data.Functor.Invariant".imap dictInvariant f1 g1) h;
          __patternFail = builtins.throw "Pattern match failure in .spago/profunctor/master/src/Data/Profunctor/Star.purs at 38:1 - 39:44";
        in
          __pattern0 __patternFail;
    };
  hoistStar = f: v: 
    let
      __pattern0 = __fail: 
        let
          f1 = f;
          g = v;
        in
          module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn f1 g;
      __patternFail = builtins.throw "Pattern match failure in .spago/profunctor/master/src/Data/Profunctor/Star.purs at 82:1 - 82:66";
    in
      __pattern0 __patternFail;
  functorStar = dictFunctor: 
    { map = f: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              g = v;
            in
              module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn (module."Data.Functor".map dictFunctor f1) g;
          __patternFail = builtins.throw "Pattern match failure in .spago/profunctor/master/src/Data/Profunctor/Star.purs at 35:1 - 36:38";
        in
          __pattern0 __patternFail;
    };
  distributiveStar = dictDistributive: 
    { distribute = dictFunctor: f: a: module."Data.Distributive".collect dictDistributive dictFunctor 
        ( v: 
          let
            __pattern0 = __fail: 
              let
                g = v;
              in
                g a;
            __patternFail = builtins.throw "Pattern match failure in .spago/profunctor/master/src/Data/Profunctor/Star.purs at 65:38 - 65:54";
          in
            __pattern0 __patternFail
        ) f;
      collect = dictFunctor: f: module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn (module."Data.Distributive".distribute (distributiveStar dictDistributive) dictFunctor) (module."Data.Functor".map dictFunctor f);
      "Functor0" = __unused: functorStar (dictDistributive."Functor0" module."Prim".undefined);
    };
  closedStar = dictDistributive: 
    { closed = v: 
        let
          __pattern0 = __fail: 
            let
              f = v;
            in
              g: module."Data.Distributive".distribute dictDistributive module."Data.Functor".functorFn (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn f g);
          __patternFail = builtins.throw "Pattern match failure in .spago/profunctor/master/src/Data/Profunctor/Star.purs at 79:1 - 80:52";
        in
          __pattern0 __patternFail;
      "Profunctor0" = __unused: profunctorStar (dictDistributive."Functor0" module."Prim".undefined);
    };
  choiceStar = dictApplicative: 
    { left = v: 
        let
          __pattern0 = __fail: 
            let
              f = v;
            in
              module."Data.Function".apply Star (module."Data.Either".either (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn (module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined) module."Data.Either".Left) f) (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn (module."Control.Applicative".pure dictApplicative) module."Data.Either".Right));
          __patternFail = builtins.throw "Pattern match failure in .spago/profunctor/master/src/Data/Profunctor/Star.purs at 75:1 - 77:67";
        in
          __pattern0 __patternFail;
      right = v: 
        let
          __pattern0 = __fail: 
            let
              f = v;
            in
              module."Data.Function".apply Star (module."Data.Either".either (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn (module."Control.Applicative".pure dictApplicative) module."Data.Either".Left) (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn (module."Data.Functor".map ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined) module."Data.Either".Right) f));
          __patternFail = builtins.throw "Pattern match failure in .spago/profunctor/master/src/Data/Profunctor/Star.purs at 75:1 - 77:67";
        in
          __pattern0 __patternFail;
      "Profunctor0" = __unused: profunctorStar ((dictApplicative."Apply0" module."Prim".undefined)."Functor0" module."Prim".undefined);
    };
  categoryStar = dictMonad: 
    { identity = module."Control.Applicative".pure (dictMonad."Applicative0" module."Prim".undefined);
      "Semigroupoid0" = __unused: semigroupoidStar (dictMonad."Bind1" module."Prim".undefined);
    };
  applyStar = dictApply: 
    { apply = v: v1: 
        let
          __pattern0 = __fail: 
            let
              f = v;
              g = v1;
            in
              a: module."Control.Apply".apply dictApply (f a) (g a);
          __patternFail = builtins.throw "Pattern match failure in .spago/profunctor/master/src/Data/Profunctor/Star.purs at 41:1 - 42:51";
        in
          __pattern0 __patternFail;
      "Functor0" = __unused: functorStar (dictApply."Functor0" module."Prim".undefined);
    };
  bindStar = dictBind: 
    { bind = v: f: 
        let
          __pattern0 = __fail: 
            let
              m = v;
              f1 = f;
            in
              x: module."Control.Bind".bind dictBind (m x) 
              ( a: 
                let
                  v1 = f1 a;
                in
                  
                  let
                    __pattern0 = __fail: 
                      let
                        g = v1;
                      in
                        g x;
                    __patternFail = builtins.throw "Pattern match failure in .spago/profunctor/master/src/Data/Profunctor/Star.purs at 48:46 - 48:71";
                  in
                    __pattern0 __patternFail
              );
          __patternFail = builtins.throw "Pattern match failure in .spago/profunctor/master/src/Data/Profunctor/Star.purs at 47:1 - 48:71";
        in
          __pattern0 __patternFail;
      "Apply0" = __unused: applyStar (dictBind."Apply0" module."Prim".undefined);
    };
  applicativeStar = dictApplicative: 
    { pure = a: v: module."Control.Applicative".pure dictApplicative a;
      "Apply0" = __unused: applyStar (dictApplicative."Apply0" module."Prim".undefined);
    };
  monadStar = dictMonad: 
    { "Applicative0" = __unused: applicativeStar (dictMonad."Applicative0" module."Prim".undefined);
      "Bind1" = __unused: bindStar (dictMonad."Bind1" module."Prim".undefined);
    };
  altStar = dictAlt: 
    { alt = v: v1: 
        let
          __pattern0 = __fail: 
            let
              f = v;
              g = v1;
            in
              a: module."Control.Alt".alt dictAlt (f a) (g a);
          __patternFail = builtins.throw "Pattern match failure in .spago/profunctor/master/src/Data/Profunctor/Star.purs at 52:1 - 53:49";
        in
          __pattern0 __patternFail;
      "Functor0" = __unused: functorStar (dictAlt."Functor0" module."Prim".undefined);
    };
  plusStar = dictPlus: 
    { empty = v: module."Control.Plus".empty dictPlus;
      "Alt0" = __unused: altStar (dictPlus."Alt0" module."Prim".undefined);
    };
  alternativeStar = dictAlternative: 
    { "Applicative0" = __unused: applicativeStar (dictAlternative."Applicative0" module."Prim".undefined);
      "Plus1" = __unused: plusStar (dictAlternative."Plus1" module."Prim".undefined);
    };
  monadPlusStar = dictMonadPlus: 
    { "Monad0" = __unused: monadStar (dictMonadPlus."Monad0" module."Prim".undefined);
      "Alternative1" = __unused: alternativeStar (dictMonadPlus."Alternative1" module."Prim".undefined);
    };
  monadZeroStar = dictMonadZero: 
    { "Monad0" = __unused: monadStar (dictMonadZero."Monad0" module."Prim".undefined);
      "Alternative1" = __unused: alternativeStar (dictMonadZero."Alternative1" module."Prim".undefined);
      "MonadZeroIsDeprecated2" = __unused: module."Prim".undefined;
    };
in
  {inherit Star hoistStar newtypeStar semigroupoidStar categoryStar functorStar invariantStar applyStar applicativeStar bindStar monadStar altStar plusStar alternativeStar monadZeroStar monadPlusStar distributiveStar profunctorStar strongStar choiceStar closedStar;}