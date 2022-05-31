
let
  module = {"Unsafe.Coerce" = import ../Unsafe.Coerce;};
  foreign = import ./foreign.nix;
  abort = foreign.abort;
  attrByPath = foreign.attrByPath;
  attrUpdate = foreign.attrUpdate;
  attrUpdate' = foreign.attrUpdate';
  concatStringsSep = foreign.concatStringsSep;
  getAttr = foreign.getAttr;
  getAttrFromPath = foreign.getAttrFromPath;
  readFile = foreign.readFile;
  stringLength = foreign.stringLength;
  substring = foreign.substring;
  trace = foreign.trace;
  unsafeAdd = foreign.unsafeAdd;
  unsafeStrToChar = module."Unsafe.Coerce".unsafeCoerce;
  toAttrSet = module."Unsafe.Coerce".unsafeCoerce;
  getAttrFlip = attrSet: key: getAttr key attrSet;
  concatStrs = concatStringsSep "";
  concatChars = module."Unsafe.Coerce".unsafeCoerce concatStrs;
  charToStr = module."Unsafe.Coerce".unsafeCoerce;
  charArrayToStrArray = module."Unsafe.Coerce".unsafeCoerce;
  appendPath = unsafeAdd;
in
  {inherit abort attrByPath attrUpdate attrUpdate' concatStringsSep getAttr getAttrFromPath readFile stringLength substring trace unsafeAdd appendPath charToStr charArrayToStrArray concatChars concatStrs getAttrFlip toAttrSet unsafeStrToChar;}