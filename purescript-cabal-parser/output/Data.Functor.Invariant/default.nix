
let
  module = 
    { "Control.Semigroupoid" = import ../Control.Semigroupoid;
      "Data.Functor" = import ../Data.Functor;
      "Data.Monoid.Additive" = import ../Data.Monoid.Additive;
      "Data.Monoid.Alternate" = import ../Data.Monoid.Alternate;
      "Data.Monoid.Conj" = import ../Data.Monoid.Conj;
      "Data.Monoid.Disj" = import ../Data.Monoid.Disj;
      "Data.Monoid.Dual" = import ../Data.Monoid.Dual;
      "Data.Monoid.Endo" = import ../Data.Monoid.Endo;
      "Data.Monoid.Multiplicative" = import ../Data.Monoid.Multiplicative;
    };
  Invariant-Dict = x: x;
  invariantMultiplicative = 
    { imap = f: v: v1: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              x = v1;
            in
              f1 x;
          __patternFail = builtins.throw "Pattern match failure in .spago/invariant/master/src/Data/Functor/Invariant.purs at 47:1 - 48:53";
        in
          __pattern0 __patternFail;
    };
  invariantEndo = 
    { imap = ab: ba: v: 
        let
          __pattern0 = __fail: 
            let
              ab1 = ab;
              ba1 = ba;
              f = v;
            in
              module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn ab1 (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn f ba1);
          __patternFail = builtins.throw "Pattern match failure in .spago/invariant/master/src/Data/Functor/Invariant.purs at 44:1 - 45:47";
        in
          __pattern0 __patternFail;
    };
  invariantDual = 
    { imap = f: v: v1: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              x = v1;
            in
              f1 x;
          __patternFail = builtins.throw "Pattern match failure in .spago/invariant/master/src/Data/Functor/Invariant.purs at 41:1 - 42:33";
        in
          __pattern0 __patternFail;
    };
  invariantDisj = 
    { imap = f: v: v1: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              x = v1;
            in
              f1 x;
          __patternFail = builtins.throw "Pattern match failure in .spago/invariant/master/src/Data/Functor/Invariant.purs at 38:1 - 39:33";
        in
          __pattern0 __patternFail;
    };
  invariantConj = 
    { imap = f: v: v1: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              x = v1;
            in
              f1 x;
          __patternFail = builtins.throw "Pattern match failure in .spago/invariant/master/src/Data/Functor/Invariant.purs at 35:1 - 36:33";
        in
          __pattern0 __patternFail;
    };
  invariantAdditive = 
    { imap = f: v: v1: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              x = v1;
            in
              f1 x;
          __patternFail = builtins.throw "Pattern match failure in .spago/invariant/master/src/Data/Functor/Invariant.purs at 32:1 - 33:41";
        in
          __pattern0 __patternFail;
    };
  imapF = dictFunctor: f: v: module."Data.Functor".map dictFunctor f;
  invariantArray = {imap = imapF module."Data.Functor".functorArray;};
  invariantFn = {imap = imapF module."Data.Functor".functorFn;};
  imap = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.imap;
      __patternFail = builtins.throw "Pattern match failure in .spago/invariant/master/src/Data/Functor/Invariant.purs at 24:3 - 24:57";
    in
      __pattern0 __patternFail;
  invariantAlternate = dictInvariant: 
    { imap = f: g: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              g1 = g;
              x = v;
            in
              imap dictInvariant f1 g1 x;
          __patternFail = builtins.throw "Pattern match failure in .spago/invariant/master/src/Data/Functor/Invariant.purs at 50:1 - 51:50";
        in
          __pattern0 __patternFail;
    };
in
  {inherit imap imapF invariantFn invariantArray invariantAdditive invariantConj invariantDisj invariantDual invariantEndo invariantMultiplicative invariantAlternate;}