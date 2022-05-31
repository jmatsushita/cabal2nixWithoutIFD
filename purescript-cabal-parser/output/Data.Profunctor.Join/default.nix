
let
  module = 
    { "Control.Category" = import ../Control.Category;
      "Control.Semigroupoid" = import ../Control.Semigroupoid;
      "Data.Eq" = import ../Data.Eq;
      "Data.Functor.Invariant" = import ../Data.Functor.Invariant;
      "Data.Monoid" = import ../Data.Monoid;
      "Data.Newtype" = import ../Data.Newtype;
      "Data.Ord" = import ../Data.Ord;
      "Data.Profunctor" = import ../Data.Profunctor;
      "Data.Semigroup" = import ../Data.Semigroup;
      "Data.Show" = import ../Data.Show;
      "Prelude" = import ../Prelude;
    };
  Join = x: x;
  showJoin = dictShow: 
    { show = v: 
        let
          __pattern0 = __fail: 
            let
              x = v;
            in
              module."Data.Semigroup".append module."Data.Semigroup".semigroupString "(Join " (module."Data.Semigroup".append module."Data.Semigroup".semigroupString (module."Data.Show".show dictShow x) ")");
          __patternFail = builtins.throw "Pattern match failure in .spago/profunctor/master/src/Data/Profunctor/Join.purs at 18:1 - 19:44";
        in
          __pattern0 __patternFail;
    };
  semigroupJoin = dictSemigroupoid: 
    { append = v: v1: 
        let
          __pattern0 = __fail: 
            let
              a = v;
              b = v1;
            in
              module."Control.Semigroupoid".compose dictSemigroupoid a b;
          __patternFail = builtins.throw "Pattern match failure in .spago/profunctor/master/src/Data/Profunctor/Join.purs at 21:1 - 22:44";
        in
          __pattern0 __patternFail;
    };
  ordJoin = dictOrd: dictOrd;
  newtypeJoin = {"Coercible0" = __unused: module."Prim".undefined;};
  monoidJoin = dictCategory: 
    { mempty = module."Control.Category".identity dictCategory;
      "Semigroup0" = __unused: semigroupJoin (dictCategory."Semigroupoid0" module."Prim".undefined);
    };
  invariantJoin = dictProfunctor: 
    { imap = f: g: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              g1 = g;
              a = v;
            in
              module."Data.Profunctor".dimap dictProfunctor g1 f1 a;
          __patternFail = builtins.throw "Pattern match failure in .spago/profunctor/master/src/Data/Profunctor/Join.purs at 27:1 - 28:41";
        in
          __pattern0 __patternFail;
    };
  eqJoin = dictEq: dictEq;
in
  {inherit Join newtypeJoin eqJoin ordJoin showJoin semigroupJoin monoidJoin invariantJoin;}