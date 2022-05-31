
let
  module = 
    { "Control.Applicative" = import ../Control.Applicative;
      "Control.Bind" = import ../Control.Bind;
      "Control.Monad.ST" = import ../Control.Monad.ST;
      "Control.Monad.ST.Internal" = import ../Control.Monad.ST.Internal;
      "Control.Monad.ST.Ref" = import ../Control.Monad.ST.Ref;
      "Control.Semigroupoid" = import ../Control.Semigroupoid;
      "Data.Array.ST" = import ../Data.Array.ST;
      "Data.Function" = import ../Data.Function;
      "Data.Functor" = import ../Data.Functor;
      "Data.HeytingAlgebra" = import ../Data.HeytingAlgebra;
      "Data.Maybe" = import ../Data.Maybe;
      "Data.Semiring" = import ../Data.Semiring;
      "Prelude" = import ../Prelude;
    };
  Iterator = value0: value1: 
    { __tag = "Iterator";
      __field0 = value0;
      __field1 = value1;
    };
  peek = v: 
    let
      __pattern0 = __fail: 
        if v.__tag == "Iterator"
          then 
            let
              f = v.__field0;
              currentIndex = v.__field1;
            in
              module."Control.Bind".bind module."Control.Monad.ST.Internal".bindST (module."Control.Monad.ST.Internal".read currentIndex) (i: module."Control.Applicative".pure module."Control.Monad.ST.Internal".applicativeST (f i))
          else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/arrays/master/src/Data/Array/ST/Iterator.purs at 55:1 - 55:51";
    in
      __pattern0 __patternFail;
  next = v: 
    let
      __pattern0 = __fail: 
        if v.__tag == "Iterator"
          then 
            let
              f = v.__field0;
              currentIndex = v.__field1;
            in
              module."Control.Bind".bind module."Control.Monad.ST.Internal".bindST (module."Control.Monad.ST.Internal".read currentIndex) (i: module."Control.Bind".bind module."Control.Monad.ST.Internal".bindST (module."Control.Monad.ST.Internal".modify (v1: module."Data.Semiring".add module."Data.Semiring".semiringInt v1 1) currentIndex) (__unused: module."Control.Applicative".pure module."Control.Monad.ST.Internal".applicativeST (f i)))
          else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/arrays/master/src/Data/Array/ST/Iterator.purs at 48:1 - 48:51";
    in
      __pattern0 __patternFail;
  pushWhile = p: iter: array: module."Control.Bind".bind module."Control.Monad.ST.Internal".bindST (module."Control.Monad.ST.Internal".new false) 
    ( break: module."Control.Monad.ST.Internal".while (module."Data.Functor".map module."Control.Monad.ST.Internal".functorST (module."Data.HeytingAlgebra".not module."Data.HeytingAlgebra".heytingAlgebraBoolean) (module."Control.Monad.ST.Internal".read break)) 
      ( module."Control.Bind".bind module."Control.Monad.ST.Internal".bindST (peek iter) 
        ( mx: 
          let
            __pattern0 = __fail: 
              if mx.__tag == "Just"
                then 
                  let
                    x = mx.__field0;
                  in
                    if p x then module."Control.Bind".bind module."Control.Monad.ST.Internal".bindST (module."Data.Array.ST".push x array) (__unused: module."Data.Function".apply (module."Data.Functor".void module."Control.Monad.ST.Internal".functorST) (next iter)) else __fail
                else __fail;
            __pattern1 = __fail: module."Data.Function".apply (module."Data.Functor".void module."Control.Monad.ST.Internal".functorST) (module."Control.Monad.ST.Internal".write true break);
            __patternFail = builtins.throw "Pattern match failure in .spago/arrays/master/src/Data/Array/ST/Iterator.purs at 71:5 - 76:38";
          in
            __pattern0 (__pattern1 __patternFail)
        )
      )
    );
  pushAll = pushWhile (module."Data.Function".const true);
  iterator = f: module."Data.Functor".map module."Control.Monad.ST.Internal".functorST (Iterator f) (module."Control.Monad.ST.Internal".new 0);
  iterate = iter: f: module."Control.Bind".bind module."Control.Monad.ST.Internal".bindST (module."Control.Monad.ST.Internal".new false) 
    ( break: module."Control.Monad.ST.Internal".while (module."Data.Functor".map module."Control.Monad.ST.Internal".functorST (module."Data.HeytingAlgebra".not module."Data.HeytingAlgebra".heytingAlgebraBoolean) (module."Control.Monad.ST.Internal".read break)) 
      ( module."Control.Bind".bind module."Control.Monad.ST.Internal".bindST (next iter) 
        ( mx: 
          let
            __pattern0 = __fail: 
              if mx.__tag == "Just"
                then 
                  let
                    x = mx.__field0;
                  in
                    f x
                else __fail;
            __pattern1 = __fail: if mx.__tag == "Nothing" then module."Data.Function".apply (module."Data.Functor".void module."Control.Monad.ST.Internal".functorST) (module."Control.Monad.ST.Internal".write true break) else __fail;
            __patternFail = builtins.throw "Pattern match failure in .spago/arrays/master/src/Data/Array/ST/Iterator.purs at 42:5 - 44:47";
          in
            __pattern0 (__pattern1 __patternFail)
        )
      )
    );
  exhausted = module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn (module."Data.Functor".map module."Control.Monad.ST.Internal".functorST module."Data.Maybe".isNothing) peek;
in
  {inherit iterator iterate next peek exhausted pushWhile pushAll;}