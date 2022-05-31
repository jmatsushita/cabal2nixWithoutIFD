
let
  module = 
    { "Data.Const" = import ../Data.Const;
      "Data.Functor" = import ../Data.Functor;
      "Data.Void" = import ../Data.Void;
      "Prelude" = import ../Prelude;
    };
  Contravariant-Dict = x: x;
  contravariantConst = 
    { cmap = v: v1: 
        let
          __pattern0 = __fail: 
            let
              x = v1;
            in
              x;
          __patternFail = builtins.throw "Pattern match failure in .spago/contravariant/master/src/Data/Functor/Contravariant.purs at 34:1 - 35:29";
        in
          __pattern0 __patternFail;
    };
  cmap = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.cmap;
      __patternFail = builtins.throw "Pattern match failure in .spago/contravariant/master/src/Data/Functor/Contravariant.purs at 17:3 - 17:45";
    in
      __pattern0 __patternFail;
  cmapFlipped = dictContravariant: x: f: cmap dictContravariant f x;
  coerce = dictContravariant: dictFunctor: a: module."Data.Functor".map dictFunctor module."Data.Void".absurd (cmap dictContravariant module."Data.Void".absurd a);
  imapC = dictContravariant: v: f: cmap dictContravariant f;
in
  {inherit cmap cmapFlipped coerce imapC contravariantConst;}