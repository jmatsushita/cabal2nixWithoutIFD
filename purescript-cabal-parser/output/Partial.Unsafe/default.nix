
let
  module = {"Partial" = import ../Partial;};
  foreign = import ./foreign.nix;
  _unsafePartial = foreign._unsafePartial;
  unsafePartial = _unsafePartial;
  unsafeCrashWith = msg: unsafePartial (dictPartial: module."Partial".crashWith module."Prim".undefined msg);
in
  {inherit unsafePartial unsafeCrashWith;}