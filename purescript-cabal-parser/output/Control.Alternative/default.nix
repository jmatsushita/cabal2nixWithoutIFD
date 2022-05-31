
let
  module = 
    { "Control.Alt" = import ../Control.Alt;
      "Control.Applicative" = import ../Control.Applicative;
      "Control.Apply" = import ../Control.Apply;
      "Control.Plus" = import ../Control.Plus;
      "Data.Functor" = import ../Data.Functor;
      "Data.Unit" = import ../Data.Unit;
    };
  Alternative-Dict = x: x;
  guard = dictAlternative: v: 
    let
      __pattern0 = __fail: if v then module."Control.Applicative".pure (dictAlternative."Applicative0" module."Prim".undefined) module."Data.Unit".unit else __fail;
      __pattern1 = __fail: if !v then module."Control.Plus".empty (dictAlternative."Plus1" module."Prim".undefined) else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/control/master/src/Control/Alternative.purs at 48:1 - 48:54";
    in
      __pattern0 (__pattern1 __patternFail);
  alternativeArray = 
    { "Applicative0" = __unused: module."Control.Applicative".applicativeArray;
      "Plus1" = __unused: module."Control.Plus".plusArray;
    };
in
  
  { inherit guard alternativeArray;
    inherit (module."Control.Alt") alt;
    inherit (module."Control.Applicative") liftA1 pure unless when;
    inherit (module."Control.Apply") apply;
    inherit (module."Control.Plus") empty;
    inherit (module."Data.Functor") map void;
  }