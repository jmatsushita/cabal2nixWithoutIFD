
let
  module = 
    { "Prim.Coerce" = import ../Prim.Coerce;
      "Unsafe.Coerce" = import ../Unsafe.Coerce;
    };
  coerce = dictCoercible: module."Unsafe.Coerce".unsafeCoerce;
in
  
  { inherit coerce;
    inherit (module."Prim.Coerce");
  }