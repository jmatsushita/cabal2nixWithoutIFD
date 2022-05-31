
let
  module = 
    { "Data.Array" = import ../Data.Array;
      "Data.Ring" = import ../Data.Ring;
      "Prelude" = import ../Prelude;
    };
  tail = dictPartial: xs: module."Data.Array".slice 1 (module."Data.Array".length xs) xs;
  last = dictPartial: xs: module."Data.Array".unsafeIndex module."Prim".undefined xs (module."Data.Ring".sub module."Data.Ring".ringInt (module."Data.Array".length xs) 1);
  init = dictPartial: xs: module."Data.Array".slice 0 (module."Data.Ring".sub module."Data.Ring".ringInt (module."Data.Array".length xs) 1) xs;
  head = dictPartial: xs: module."Data.Array".unsafeIndex module."Prim".undefined xs 0;
in
  {inherit head tail last init;}