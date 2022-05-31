
let
  module = 
    { "Control.Applicative" = import ../Control.Applicative;
      "Control.Apply" = import ../Control.Apply;
      "Control.Bind" = import ../Control.Bind;
      "Data.Functor" = import ../Data.Functor;
      "Data.Unit" = import ../Data.Unit;
      "Type.Proxy" = import ../Type.Proxy;
    };
  Monad-Dict = x: x;
  whenM = dictMonad: mb: m: module."Control.Bind".bind (dictMonad."Bind1" module."Prim".undefined) mb (b: module."Control.Applicative".when (dictMonad."Applicative0" module."Prim".undefined) b m);
  unlessM = dictMonad: mb: m: module."Control.Bind".bind (dictMonad."Bind1" module."Prim".undefined) mb (b: module."Control.Applicative".unless (dictMonad."Applicative0" module."Prim".undefined) b m);
  monadProxy = 
    { "Applicative0" = __unused: module."Control.Applicative".applicativeProxy;
      "Bind1" = __unused: module."Control.Bind".bindProxy;
    };
  monadFn = 
    { "Applicative0" = __unused: module."Control.Applicative".applicativeFn;
      "Bind1" = __unused: module."Control.Bind".bindFn;
    };
  monadArray = 
    { "Applicative0" = __unused: module."Control.Applicative".applicativeArray;
      "Bind1" = __unused: module."Control.Bind".bindArray;
    };
  liftM1 = dictMonad: f: a: module."Control.Bind".bind (dictMonad."Bind1" module."Prim".undefined) a (a': module."Control.Applicative".pure (dictMonad."Applicative0" module."Prim".undefined) (f a'));
  ap = dictMonad: f: a: module."Control.Bind".bind (dictMonad."Bind1" module."Prim".undefined) f (f': module."Control.Bind".bind (dictMonad."Bind1" module."Prim".undefined) a (a': module."Control.Applicative".pure (dictMonad."Applicative0" module."Prim".undefined) (f' a')));
in
  
  { inherit liftM1 whenM unlessM ap monadFn monadArray monadProxy;
    inherit (module."Control.Applicative") liftA1 pure unless when;
    inherit (module."Control.Apply") apply;
    inherit (module."Control.Bind") bind ifM join;
    inherit (module."Data.Functor") map void;
  }