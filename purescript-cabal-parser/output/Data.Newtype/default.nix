
let
  module = 
    { "Data.Monoid.Additive" = import ../Data.Monoid.Additive;
      "Data.Monoid.Conj" = import ../Data.Monoid.Conj;
      "Data.Monoid.Disj" = import ../Data.Monoid.Disj;
      "Data.Monoid.Dual" = import ../Data.Monoid.Dual;
      "Data.Monoid.Endo" = import ../Data.Monoid.Endo;
      "Data.Monoid.Multiplicative" = import ../Data.Monoid.Multiplicative;
      "Data.Semigroup.First" = import ../Data.Semigroup.First;
      "Data.Semigroup.Last" = import ../Data.Semigroup.Last;
      "Safe.Coerce" = import ../Safe.Coerce;
    };
  Newtype-Dict = x: x;
  wrap = dictNewtype: module."Safe.Coerce".coerce module."Prim".undefined;
  unwrap = dictNewtype: module."Safe.Coerce".coerce module."Prim".undefined;
  underF2 = dictCoercible: dictCoercible1: dictNewtype: dictNewtype1: v: module."Safe.Coerce".coerce module."Prim".undefined;
  underF = dictCoercible: dictCoercible1: dictNewtype: dictNewtype1: v: module."Safe.Coerce".coerce module."Prim".undefined;
  under2 = dictNewtype: dictNewtype1: v: module."Safe.Coerce".coerce module."Prim".undefined;
  under = dictNewtype: dictNewtype1: v: module."Safe.Coerce".coerce module."Prim".undefined;
  un = dictNewtype: v: unwrap module."Prim".undefined;
  traverse = dictCoercible: dictNewtype: v: module."Safe.Coerce".coerce module."Prim".undefined;
  overF2 = dictCoercible: dictCoercible1: dictNewtype: dictNewtype1: v: module."Safe.Coerce".coerce module."Prim".undefined;
  overF = dictCoercible: dictCoercible1: dictNewtype: dictNewtype1: v: module."Safe.Coerce".coerce module."Prim".undefined;
  over2 = dictNewtype: dictNewtype1: v: module."Safe.Coerce".coerce module."Prim".undefined;
  over = dictNewtype: dictNewtype1: v: module."Safe.Coerce".coerce module."Prim".undefined;
  newtypeMultiplicative = {"Coercible0" = __unused: module."Prim".undefined;};
  newtypeLast = {"Coercible0" = __unused: module."Prim".undefined;};
  newtypeFirst = {"Coercible0" = __unused: module."Prim".undefined;};
  newtypeEndo = {"Coercible0" = __unused: module."Prim".undefined;};
  newtypeDual = {"Coercible0" = __unused: module."Prim".undefined;};
  newtypeDisj = {"Coercible0" = __unused: module."Prim".undefined;};
  newtypeConj = {"Coercible0" = __unused: module."Prim".undefined;};
  newtypeAdditive = {"Coercible0" = __unused: module."Prim".undefined;};
  collect = dictCoercible: dictNewtype: v: module."Safe.Coerce".coerce module."Prim".undefined;
  alaF = dictCoercible: dictCoercible1: dictNewtype: dictNewtype1: v: module."Safe.Coerce".coerce module."Prim".undefined;
  ala = dictCoercible: dictNewtype: dictNewtype1: v: f: module."Safe.Coerce".coerce module."Prim".undefined (f (wrap module."Prim".undefined));
in
  {inherit wrap unwrap un ala alaF over overF under underF over2 overF2 under2 underF2 traverse collect newtypeAdditive newtypeMultiplicative newtypeConj newtypeDisj newtypeDual newtypeEndo newtypeFirst newtypeLast;}