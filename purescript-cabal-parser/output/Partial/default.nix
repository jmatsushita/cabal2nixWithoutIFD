
let
  module = { };
  foreign = import ./foreign.nix;
  _crashWith = foreign._crashWith;
  crashWith = dictPartial: _crashWith;
  crash = dictPartial: crashWith module."Prim".undefined "Partial.crash: partial function";
in
  {inherit crash crashWith;}