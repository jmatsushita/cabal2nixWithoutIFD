
let
  module = 
    { "Control.Monad.ST" = import ../Control.Monad.ST;
      "Data.Array.ST" = import ../Data.Array.ST;
      "Data.Unit" = import ../Data.Unit;
    };
  foreign = import ./foreign.nix;
  peekImpl = foreign.peekImpl;
  pokeImpl = foreign.pokeImpl;
  poke = dictPartial: pokeImpl;
  peek = dictPartial: peekImpl;
in
  {inherit peek poke;}