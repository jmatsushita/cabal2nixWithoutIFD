
let
  module = 
    { "Control.Category" = import ../Control.Category;
      "Data.Function" = import ../Data.Function;
      "Data.Functor" = import ../Data.Functor;
      "Type.Proxy" = import ../Type.Proxy;
    };
  foreign = import ./foreign.nix;
  arrayApply = foreign.arrayApply;
  Apply-Dict = x: x;
  applyProxy = 
    { apply = v: v1: module."Type.Proxy".Proxy;
      "Functor0" = __unused: module."Data.Functor".functorProxy;
    };
  applyFn = 
    { apply = f: g: x: f x (g x);
      "Functor0" = __unused: module."Data.Functor".functorFn;
    };
  applyArray = 
    { apply = arrayApply;
      "Functor0" = __unused: module."Data.Functor".functorArray;
    };
  apply = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.apply;
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Control/Apply.purs at 46:3 - 46:48";
    in
      __pattern0 __patternFail;
  applyFirst = dictApply: a: b: apply dictApply (module."Data.Functor".map (dictApply."Functor0" module."Prim".undefined) module."Data.Function".const a) b;
  applySecond = dictApply: a: b: apply dictApply (module."Data.Functor".map (dictApply."Functor0" module."Prim".undefined) (module."Data.Function".const (module."Control.Category".identity module."Control.Category".categoryFn)) a) b;
  lift2 = dictApply: f: a: b: apply dictApply (module."Data.Functor".map (dictApply."Functor0" module."Prim".undefined) f a) b;
  lift3 = dictApply: f: a: b: c: apply dictApply (apply dictApply (module."Data.Functor".map (dictApply."Functor0" module."Prim".undefined) f a) b) c;
  lift4 = dictApply: f: a: b: c: d: apply dictApply (apply dictApply (apply dictApply (module."Data.Functor".map (dictApply."Functor0" module."Prim".undefined) f a) b) c) d;
  lift5 = dictApply: f: a: b: c: d: e: apply dictApply (apply dictApply (apply dictApply (apply dictApply (module."Data.Functor".map (dictApply."Functor0" module."Prim".undefined) f a) b) c) d) e;
in
  
  { inherit apply applyFirst applySecond lift2 lift3 lift4 lift5 applyFn applyArray applyProxy;
    inherit (module."Data.Functor") map void;
  }