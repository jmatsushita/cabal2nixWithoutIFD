
let
  module = 
    { "Control.Category" = import ../Control.Category;
      "Control.Semigroupoid" = import ../Control.Semigroupoid;
      "Data.Function" = import ../Data.Function;
      "Data.Functor" = import ../Data.Functor;
      "Data.Identity" = import ../Data.Identity;
      "Data.Newtype" = import ../Data.Newtype;
      "Data.Tuple" = import ../Data.Tuple;
      "Data.Unit" = import ../Data.Unit;
      "Prelude" = import ../Prelude;
      "Type.Equality" = import ../Type.Equality;
    };
  Distributive-Dict = x: x;
  distributiveIdentity = 
    { distribute = dictFunctor: module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn module."Data.Identity".Identity (module."Data.Functor".map dictFunctor (module."Data.Newtype".unwrap module."Prim".undefined));
      collect = dictFunctor: f: module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn module."Data.Identity".Identity (module."Data.Functor".map dictFunctor (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn (module."Data.Newtype".unwrap module."Prim".undefined) f));
      "Functor0" = __unused: module."Data.Identity".functorIdentity;
    };
  distribute = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.distribute;
      __patternFail = builtins.throw "Pattern match failure in .spago/distributive/master/src/Data/Distributive.purs at 25:3 - 25:60";
    in
      __pattern0 __patternFail;
  distributiveFunction = 
    { distribute = dictFunctor: a: e: module."Data.Functor".map dictFunctor (v: module."Data.Function".apply v e) a;
      collect = dictFunctor: f: module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn (distribute distributiveFunction dictFunctor) (module."Data.Functor".map dictFunctor f);
      "Functor0" = __unused: module."Data.Functor".functorFn;
    };
  cotraverse = dictDistributive: dictFunctor: f: module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn (module."Data.Functor".map (dictDistributive."Functor0" module."Prim".undefined) f) (distribute dictDistributive dictFunctor);
  collectDefault = dictDistributive: dictFunctor: f: module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn (distribute dictDistributive dictFunctor) (module."Data.Functor".map dictFunctor f);
  distributiveTuple = dictTypeEquals: 
    { collect = dictFunctor: collectDefault (distributiveTuple dictTypeEquals) dictFunctor;
      distribute = dictFunctor: module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn (module."Data.Tuple".Tuple (module."Type.Equality".from dictTypeEquals module."Data.Unit".unit)) (module."Data.Functor".map dictFunctor module."Data.Tuple".snd);
      "Functor0" = __unused: module."Data.Tuple".functorTuple;
    };
  collect = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.collect;
      __patternFail = builtins.throw "Pattern match failure in .spago/distributive/master/src/Data/Distributive.purs at 26:3 - 26:69";
    in
      __pattern0 __patternFail;
  distributeDefault = dictDistributive: dictFunctor: collect dictDistributive dictFunctor (module."Control.Category".identity module."Control.Category".categoryFn);
in
  {inherit collect distribute distributeDefault collectDefault cotraverse distributiveIdentity distributiveFunction distributiveTuple;}