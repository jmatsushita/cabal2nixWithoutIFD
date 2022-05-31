
let
  module = 
    { "Control.Biapplicative" = import ../Control.Biapplicative;
      "Control.Biapply" = import ../Control.Biapply;
      "Control.Category" = import ../Control.Category;
      "Control.Semigroupoid" = import ../Control.Semigroupoid;
      "Data.Bifunctor" = import ../Data.Bifunctor;
      "Data.Eq" = import ../Data.Eq;
      "Data.Function" = import ../Data.Function;
      "Data.Functor" = import ../Data.Functor;
      "Data.Functor.Contravariant" = import ../Data.Functor.Contravariant;
      "Data.Newtype" = import ../Data.Newtype;
      "Data.Ord" = import ../Data.Ord;
      "Data.Profunctor" = import ../Data.Profunctor;
      "Data.Semigroup" = import ../Data.Semigroup;
      "Data.Show" = import ../Data.Show;
      "Prelude" = import ../Prelude;
    };
  Flip = x: x;
  showFlip = dictShow: 
    { show = v: 
        let
          __pattern0 = __fail: 
            let
              x = v;
            in
              module."Data.Semigroup".append module."Data.Semigroup".semigroupString "(Flip " (module."Data.Semigroup".append module."Data.Semigroup".semigroupString (module."Data.Show".show dictShow x) ")");
          __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Flip.purs at 22:1 - 23:44";
        in
          __pattern0 __patternFail;
    };
  semigroupoidFlip = dictSemigroupoid: 
    { compose = v: v1: 
        let
          __pattern0 = __fail: 
            let
              a = v;
              b = v1;
            in
              module."Data.Function".apply Flip (module."Control.Semigroupoid".compose dictSemigroupoid b a);
          __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Flip.purs at 40:1 - 41:49";
        in
          __pattern0 __patternFail;
    };
  ordFlip = dictOrd: dictOrd;
  newtypeFlip = {"Coercible0" = __unused: module."Prim".undefined;};
  functorFlip = dictBifunctor: 
    { map = f: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              a = v;
            in
              module."Data.Bifunctor".lmap dictBifunctor f1 a;
          __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Flip.purs at 25:1 - 26:35";
        in
          __pattern0 __patternFail;
    };
  eqFlip = dictEq: dictEq;
  contravariantFlip = dictProfunctor: 
    { cmap = f: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              a = v;
            in
              module."Data.Profunctor".lcmap dictProfunctor f1 a;
          __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Flip.purs at 37:1 - 38:37";
        in
          __pattern0 __patternFail;
    };
  categoryFlip = dictCategory: 
    { identity = module."Control.Category".identity dictCategory;
      "Semigroupoid0" = __unused: semigroupoidFlip (dictCategory."Semigroupoid0" module."Prim".undefined);
    };
  bifunctorFlip = dictBifunctor: 
    { bimap = f: g: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              g1 = g;
              a = v;
            in
              module."Data.Bifunctor".bimap dictBifunctor g1 f1 a;
          __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Flip.purs at 28:1 - 29:42";
        in
          __pattern0 __patternFail;
    };
  biapplyFlip = dictBiapply: 
    { biapply = v: v1: 
        let
          __pattern0 = __fail: 
            let
              fg = v;
              xy = v1;
            in
              module."Control.Biapply".biapply dictBiapply fg xy;
          __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Flip.purs at 31:1 - 32:51";
        in
          __pattern0 __patternFail;
      "Bifunctor0" = __unused: bifunctorFlip (dictBiapply."Bifunctor0" module."Prim".undefined);
    };
  biapplicativeFlip = dictBiapplicative: 
    { bipure = a: b: module."Control.Biapplicative".bipure dictBiapplicative b a;
      "Biapply0" = __unused: biapplyFlip (dictBiapplicative."Biapply0" module."Prim".undefined);
    };
in
  {inherit Flip newtypeFlip eqFlip ordFlip showFlip functorFlip bifunctorFlip biapplyFlip biapplicativeFlip contravariantFlip semigroupoidFlip categoryFlip;}