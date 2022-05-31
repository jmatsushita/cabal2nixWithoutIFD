
let
  module = 
    { "Data.Boolean" = import ../Data.Boolean;
      "Data.Eq" = import ../Data.Eq;
      "Data.EuclideanRing" = import ../Data.EuclideanRing;
      "Data.Ord" = import ../Data.Ord;
      "Data.Ordering" = import ../Data.Ordering;
      "Data.Semigroup" = import ../Data.Semigroup;
      "Data.Symbol" = import ../Data.Symbol;
      "Data.Unit" = import ../Data.Unit;
      "Prim.Row" = import ../Prim.Row;
      "Prim.RowList" = import ../Prim.RowList;
      "Record.Unsafe" = import ../Record.Unsafe;
      "Type.Proxy" = import ../Type.Proxy;
    };
  MonoidRecord-Dict = x: x;
  Monoid-Dict = x: x;
  monoidUnit = 
    { mempty = module."Data.Unit".unit;
      "Semigroup0" = __unused: module."Data.Semigroup".semigroupUnit;
    };
  monoidString = 
    { mempty = "";
      "Semigroup0" = __unused: module."Data.Semigroup".semigroupString;
    };
  monoidRecordNil = 
    { memptyRecord = v: { };
      "SemigroupRecord0" = __unused: module."Data.Semigroup".semigroupRecordNil;
    };
  monoidOrdering = 
    { mempty = module."Data.Ordering".EQ;
      "Semigroup0" = __unused: module."Data.Ordering".semigroupOrdering;
    };
  monoidArray = 
    { mempty = [];
      "Semigroup0" = __unused: module."Data.Semigroup".semigroupArray;
    };
  memptyRecord = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.memptyRecord;
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Monoid.purs at 102:3 - 102:67";
    in
      __pattern0 __patternFail;
  monoidRecord = dictRowToList: dictMonoidRecord: 
    { mempty = memptyRecord dictMonoidRecord module."Type.Proxy".Proxy;
      "Semigroup0" = __unused: module."Data.Semigroup".semigroupRecord module."Prim".undefined (dictMonoidRecord."SemigroupRecord0" module."Prim".undefined);
    };
  mempty = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.mempty;
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Monoid.purs at 45:3 - 45:14";
    in
      __pattern0 __patternFail;
  monoidFn = dictMonoid: 
    { mempty = v: mempty dictMonoid;
      "Semigroup0" = __unused: module."Data.Semigroup".semigroupFn (dictMonoid."Semigroup0" module."Prim".undefined);
    };
  monoidRecordCons = dictIsSymbol: dictMonoid: dictCons: dictMonoidRecord: 
    { memptyRecord = v: 
        let
          tail = memptyRecord dictMonoidRecord module."Type.Proxy".Proxy;
          key = module."Data.Symbol".reflectSymbol dictIsSymbol module."Type.Proxy".Proxy;
          insert = module."Record.Unsafe".unsafeSet key;
        in
          insert (mempty dictMonoid) tail;
      "SemigroupRecord0" = __unused: module."Data.Semigroup".semigroupRecordCons dictIsSymbol module."Prim".undefined (dictMonoidRecord."SemigroupRecord0" module."Prim".undefined) (dictMonoid."Semigroup0" module."Prim".undefined);
    };
  power = dictMonoid: x: 
    let
      go = p: 
        let
          __pattern0 = __fail: 
            let
              p1 = p;
            in
              
              if module."Data.Ord".lessThanOrEq module."Data.Ord".ordInt p1 0
                then mempty dictMonoid
                else 
                  if module."Data.Eq".eq module."Data.Eq".eqInt p1 1
                    then x
                    else 
                      if module."Data.Eq".eq module."Data.Eq".eqInt (module."Data.EuclideanRing".mod module."Data.EuclideanRing".euclideanRingInt p1 2) 0
                        then 
                          let
                            x' = go (module."Data.EuclideanRing".div module."Data.EuclideanRing".euclideanRingInt p1 2);
                          in
                            module."Data.Semigroup".append (dictMonoid."Semigroup0" module."Prim".undefined) x' x'
                        else 
                          if module."Data.Boolean".otherwise
                            then 
                              let
                                x' = go (module."Data.EuclideanRing".div module."Data.EuclideanRing".euclideanRingInt p1 2);
                              in
                                module."Data.Semigroup".append (dictMonoid."Semigroup0" module."Prim".undefined) x' (module."Data.Semigroup".append (dictMonoid."Semigroup0" module."Prim".undefined) x' x)
                            else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Monoid.purs at 86:3 - 86:17";
        in
          __pattern0 __patternFail;
    in
      go;
  guard = dictMonoid: v: v1: 
    let
      __pattern0 = __fail: 
        if v
          then 
            let
              a = v1;
            in
              a
          else __fail;
      __pattern1 = __fail: if !v then mempty dictMonoid else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Monoid.purs at 94:1 - 94:49";
    in
      __pattern0 (__pattern1 __patternFail);
in
  
  { inherit mempty power guard memptyRecord monoidUnit monoidOrdering monoidFn monoidString monoidArray monoidRecord monoidRecordNil monoidRecordCons;
    inherit (module."Data.Semigroup");
  }