
let
  module = 
    { "Control.Apply" = import ../Control.Apply;
      "Control.Category" = import ../Control.Category;
      "Control.Semigroupoid" = import ../Control.Semigroupoid;
      "Data.Eq" = import ../Data.Eq;
      "Data.Foldable" = import ../Data.Foldable;
      "Data.Function" = import ../Data.Function;
      "Data.Functor" = import ../Data.Functor;
      "Data.Identity" = import ../Data.Identity;
      "Data.Monoid.Dual" = import ../Data.Monoid.Dual;
      "Data.Monoid.Multiplicative" = import ../Data.Monoid.Multiplicative;
      "Data.Newtype" = import ../Data.Newtype;
      "Data.Ord.Max" = import ../Data.Ord.Max;
      "Data.Ord.Min" = import ../Data.Ord.Min;
      "Data.Ordering" = import ../Data.Ordering;
      "Data.Semigroup" = import ../Data.Semigroup;
      "Data.Tuple" = import ../Data.Tuple;
      "Data.Unit" = import ../Data.Unit;
      "Prelude" = import ../Prelude;
      "Prim.TypeError" = import ../Prim.TypeError;
    };
  JoinWith = x: x;
  Foldable1-Dict = x: x;
  FoldRight1 = value0: value1: 
    { __tag = "FoldRight1";
      __field0 = value0;
      __field1 = value1;
    };
  Act = x: x;
  semigroupJoinWith = dictSemigroup: 
    { append = v: v1: 
        let
          __pattern0 = __fail: 
            let
              a = v;
              b = v1;
            in
              module."Data.Function".apply JoinWith (j: module."Data.Semigroup".append dictSemigroup (a j) (module."Data.Semigroup".append dictSemigroup j (b j)));
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Semigroup/Foldable.purs at 156:1 - 157:70";
        in
          __pattern0 __patternFail;
    };
  semigroupAct = dictApply: 
    { append = v: v1: 
        let
          __pattern0 = __fail: 
            let
              a = v;
              b = v1;
            in
              module."Control.Apply".applySecond dictApply a b;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Semigroup/Foldable.purs at 118:1 - 119:40";
        in
          __pattern0 __patternFail;
    };
  runFoldRight1 = v: 
    let
      __pattern0 = __fail: 
        if v.__tag == "FoldRight1"
          then 
            let
              f = v.__field0;
              a = v.__field1;
            in
              f a
          else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Semigroup/Foldable.purs at 183:1 - 183:62";
    in
      __pattern0 __patternFail;
  mkFoldRight1 = FoldRight1 module."Data.Function".const;
  joinee = v: 
    let
      __pattern0 = __fail: 
        let
          x = v;
        in
          x;
      __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Semigroup/Foldable.purs at 153:1 - 153:41";
    in
      __pattern0 __patternFail;
  getAct = v: 
    let
      __pattern0 = __fail: 
        let
          f = v;
        in
          f;
      __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Semigroup/Foldable.purs at 115:1 - 115:37";
    in
      __pattern0 __patternFail;
  foldr1 = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.foldr1;
      __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Semigroup/Foldable.purs at 52:3 - 52:48";
    in
      __pattern0 __patternFail;
  foldl1 = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.foldl1;
      __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Semigroup/Foldable.purs at 53:3 - 53:48";
    in
      __pattern0 __patternFail;
  maximumBy = dictFoldable1: cmp: foldl1 dictFoldable1 
    ( x: y: 
      let
        __pattern0 = __fail: if module."Data.Eq".eq module."Data.Ordering".eqOrdering (cmp x y) module."Data.Ordering".GT then x else __fail;
        __pattern1 = __fail: y;
        __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Semigroup/Foldable.purs at 142:32 - 142:62";
      in
        __pattern0 (__pattern1 __patternFail)
    );
  minimumBy = dictFoldable1: cmp: foldl1 dictFoldable1 
    ( x: y: 
      let
        __pattern0 = __fail: if module."Data.Eq".eq module."Data.Ordering".eqOrdering (cmp x y) module."Data.Ordering".LT then x else __fail;
        __pattern1 = __fail: y;
        __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Semigroup/Foldable.purs at 148:32 - 148:62";
      in
        __pattern0 (__pattern1 __patternFail)
    );
  foldableTuple = 
    { foldMap1 = dictSemigroup: f: v: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Tuple"
              then 
                let
                  f1 = f;
                  x = v.__field1;
                in
                  f1 x
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Semigroup/Foldable.purs at 98:1 - 101:27";
        in
          __pattern0 __patternFail;
      foldr1 = v: v1: 
        let
          __pattern0 = __fail: 
            if v1.__tag == "Tuple"
              then 
                let
                  x = v1.__field1;
                in
                  x
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Semigroup/Foldable.purs at 98:1 - 101:27";
        in
          __pattern0 __patternFail;
      foldl1 = v: v1: 
        let
          __pattern0 = __fail: 
            if v1.__tag == "Tuple"
              then 
                let
                  x = v1.__field1;
                in
                  x
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Semigroup/Foldable.purs at 98:1 - 101:27";
        in
          __pattern0 __patternFail;
      "Foldable0" = __unused: module."Data.Foldable".foldableTuple;
    };
  foldableMultiplicative = 
    { foldr1 = v: v1: 
        let
          __pattern0 = __fail: 
            let
              x = v1;
            in
              x;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Semigroup/Foldable.purs at 93:1 - 96:38";
        in
          __pattern0 __patternFail;
      foldl1 = v: v1: 
        let
          __pattern0 = __fail: 
            let
              x = v1;
            in
              x;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Semigroup/Foldable.purs at 93:1 - 96:38";
        in
          __pattern0 __patternFail;
      foldMap1 = dictSemigroup: f: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              x = v;
            in
              f1 x;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Semigroup/Foldable.purs at 93:1 - 96:38";
        in
          __pattern0 __patternFail;
      "Foldable0" = __unused: module."Data.Foldable".foldableMultiplicative;
    };
  foldableIdentity = 
    { foldMap1 = dictSemigroup: f: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              x = v;
            in
              f1 x;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Semigroup/Foldable.purs at 103:1 - 106:28";
        in
          __pattern0 __patternFail;
      foldl1 = v: v1: 
        let
          __pattern0 = __fail: 
            let
              x = v1;
            in
              x;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Semigroup/Foldable.purs at 103:1 - 106:28";
        in
          __pattern0 __patternFail;
      foldr1 = v: v1: 
        let
          __pattern0 = __fail: 
            let
              x = v1;
            in
              x;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Semigroup/Foldable.purs at 103:1 - 106:28";
        in
          __pattern0 __patternFail;
      "Foldable0" = __unused: module."Data.Foldable".foldableIdentity;
    };
  foldableDual = 
    { foldr1 = v: v1: 
        let
          __pattern0 = __fail: 
            let
              x = v1;
            in
              x;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Semigroup/Foldable.purs at 88:1 - 91:28";
        in
          __pattern0 __patternFail;
      foldl1 = v: v1: 
        let
          __pattern0 = __fail: 
            let
              x = v1;
            in
              x;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Semigroup/Foldable.purs at 88:1 - 91:28";
        in
          __pattern0 __patternFail;
      foldMap1 = dictSemigroup: f: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              x = v;
            in
              f1 x;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Semigroup/Foldable.purs at 88:1 - 91:28";
        in
          __pattern0 __patternFail;
      "Foldable0" = __unused: module."Data.Foldable".foldableDual;
    };
  foldRight1Semigroup = 
    { append = v: v1: 
        let
          __pattern0 = __fail: 
            if v.__tag == "FoldRight1" && v1.__tag == "FoldRight1"
              then 
                let
                  lf = v.__field0;
                  lr = v.__field1;
                  rf = v1.__field0;
                  rr = v1.__field1;
                in
                  FoldRight1 (a: f: lf (f lr (rf a f)) f) rr
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Semigroup/Foldable.purs at 177:1 - 178:94";
        in
          __pattern0 __patternFail;
    };
  foldMap1DefaultR = dictFoldable1: dictFunctor: dictSemigroup: f: module."Control.Semigroupoid".composeFlipped module."Control.Semigroupoid".semigroupoidFn (module."Data.Functor".map dictFunctor f) (foldr1 dictFoldable1 (module."Data.Semigroup".append dictSemigroup));
  foldMap1DefaultL = dictFoldable1: dictFunctor: dictSemigroup: f: module."Control.Semigroupoid".composeFlipped module."Control.Semigroupoid".semigroupoidFn (module."Data.Functor".map dictFunctor f) (foldl1 dictFoldable1 (module."Data.Semigroup".append dictSemigroup));
  foldMap1Default = dictWarn: dictFoldable1: dictFunctor: dictSemigroup: foldMap1DefaultL dictFoldable1 dictFunctor dictSemigroup;
  foldMap1 = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.foldMap1;
      __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Semigroup/Foldable.purs at 54:3 - 54:62";
    in
      __pattern0 __patternFail;
  foldl1Default = dictFoldable1: module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn (module."Data.Function".flip (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn runFoldRight1 (module."Data.Newtype".alaF module."Prim".undefined module."Prim".undefined module."Prim".undefined module."Prim".undefined module."Data.Monoid.Dual".Dual (foldMap1 dictFoldable1 (module."Data.Monoid.Dual".semigroupDual foldRight1Semigroup)) mkFoldRight1))) module."Data.Function".flip;
  foldr1Default = dictFoldable1: module."Data.Function".flip (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn runFoldRight1 (foldMap1 dictFoldable1 foldRight1Semigroup mkFoldRight1));
  intercalateMap = dictFoldable1: dictSemigroup: j: f: foldable: joinee (foldMap1 dictFoldable1 (semigroupJoinWith dictSemigroup) (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn JoinWith (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn module."Data.Function".const f)) foldable) j;
  intercalate = dictFoldable1: dictSemigroup: module."Data.Function".flip (intercalateMap dictFoldable1 dictSemigroup) (module."Control.Category".identity module."Control.Category".categoryFn);
  maximum = dictOrd: dictFoldable1: module."Data.Newtype".ala module."Prim".undefined module."Prim".undefined module."Prim".undefined module."Data.Ord.Max".Max (foldMap1 dictFoldable1 (module."Data.Ord.Max".semigroupMax dictOrd));
  minimum = dictOrd: dictFoldable1: module."Data.Newtype".ala module."Prim".undefined module."Prim".undefined module."Prim".undefined module."Data.Ord.Min".Min (foldMap1 dictFoldable1 (module."Data.Ord.Min".semigroupMin dictOrd));
  traverse1_ = dictFoldable1: dictApply: f: t: module."Data.Functor".voidRight (dictApply."Functor0" module."Prim".undefined) module."Data.Unit".unit (getAct (foldMap1 dictFoldable1 (semigroupAct dictApply) (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn Act f) t));
  for1_ = dictFoldable1: dictApply: module."Data.Function".flip (traverse1_ dictFoldable1 dictApply);
  sequence1_ = dictFoldable1: dictApply: traverse1_ dictFoldable1 dictApply (module."Control.Category".identity module."Control.Category".categoryFn);
  fold1 = dictFoldable1: dictSemigroup: foldMap1 dictFoldable1 dictSemigroup (module."Control.Category".identity module."Control.Category".categoryFn);
in
  {inherit foldMap1 fold1 foldr1 foldl1 traverse1_ for1_ sequence1_ foldr1Default foldl1Default foldMap1DefaultR foldMap1DefaultL foldMap1Default intercalate intercalateMap maximum maximumBy minimum minimumBy foldableDual foldableMultiplicative foldableTuple foldableIdentity;}