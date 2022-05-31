
let
  module = 
    { "Control.Alt" = import ../Control.Alt;
      "Control.Applicative" = import ../Control.Applicative;
      "Control.Apply" = import ../Control.Apply;
      "Control.Bind" = import ../Control.Bind;
      "Data.Array" = import ../Data.Array;
      "Data.Either" = import ../Data.Either;
      "Data.Eq" = import ../Data.Eq;
      "Data.Function" = import ../Data.Function;
      "Data.Functor" = import ../Data.Functor;
      "Data.Generic.Rep" = import ../Data.Generic.Rep;
      "Data.Maybe" = import ../Data.Maybe;
      "Data.Semigroup" = import ../Data.Semigroup;
      "Data.Semiring" = import ../Data.Semiring;
      "Data.Show" = import ../Data.Show;
      "Data.Show.Generic" = import ../Data.Show.Generic;
      "Data.Symbol" = import ../Data.Symbol;
      "Data.Tuple" = import ../Data.Tuple;
      "Data.Tuple.Nested" = import ../Data.Tuple.Nested;
      "NixBuiltins" = import ../NixBuiltins;
      "Parsec" = import ../Parsec;
      "Prelude" = import ../Prelude;
      "Unsafe.Coerce" = import ../Unsafe.Coerce;
    };
  foreign = import ./foreign.nix;
  cabalFilePath = foreign.cabalFilePath;
  haskellPackagePath = foreign.haskellPackagePath;
  mkFunctionWithArgs = foreign.mkFunctionWithArgs;
  SimpleRawProp = value0: value1: 
    { __tag = "SimpleRawProp";
      __field0 = value0;
      __field1 = value1;
    };
  RecursiveRawProp = value0: value1: value2: 
    { __tag = "RecursiveRawProp";
      __field0 = value0;
      __field1 = value1;
      __field2 = value2;
    };
  RawCabalFile = value0: 
    { __tag = "RawCabalFile";
      __field0 = value0;
    };
  LicenseBSD3 = {__tag = "LicenseBSD3";};
  rawCabalFileStr = module."NixBuiltins".readFile cabalFilePath;
  parseRecursiveRawPropKey = module."Parsec".alphaNums;
  parseRawPropVal = module."Control.Bind".bind module."Parsec".bindParser (module."Data.Functor".map module."Parsec".functorParser module."NixBuiltins".concatChars (module."Data.Array".some module."Parsec".alternativeParser module."Parsec".lazyParser (module."Parsec".notChar "\n"))) (val: module."Control.Bind".discard module."Control.Bind".discardUnit module."Parsec".bindParser (module."Parsec".char "\n") (__unused: module."Control.Applicative".pure module."Parsec".applicativeParser val));
  parseRawPropKey = module."Data.Functor".map module."Parsec".functorParser module."NixBuiltins".concatChars (module."Data.Array".some module."Parsec".alternativeParser module."Parsec".lazyParser (module."Parsec".notChar ":"));
  parseSimpleRawProp = module."Control.Bind".bind module."Parsec".bindParser parseRawPropKey (key: module."Control.Bind".discard module."Control.Bind".discardUnit module."Parsec".bindParser (module."Parsec".char ":") (__unused: module."Control.Bind".discard module."Control.Bind".discardUnit module."Parsec".bindParser (module."Data.Function".apply (module."Data.Functor".void module."Parsec".functorParser) (module."Data.Array".some module."Parsec".alternativeParser module."Parsec".lazyParser module."Parsec".space)) (__unused: module."Control.Bind".bind module."Parsec".bindParser parseRawPropVal (val: module."Data.Function".apply (module."Control.Applicative".pure module."Parsec".applicativeParser) (SimpleRawProp key val)))));
  parseRecursiveRawProp = indentAmount: module."Control.Bind".bind module."Parsec".bindParser parseRecursiveRawPropKey (key: module."Control.Bind".discard module."Control.Bind".discardUnit module."Parsec".bindParser (module."Data.Function".apply (module."Data.Functor".void module."Parsec".functorParser) (module."Data.Array".some module."Parsec".alternativeParser module."Parsec".lazyParser module."Parsec".space)) (__unused: module."Control.Bind".bind module."Parsec".bindParser parseRawPropVal (val: module."Control.Bind".bind module."Parsec".bindParser (parseRawProps (module."Data.Semiring".add module."Data.Semiring".semiringInt indentAmount 2)) (recursiveProps: module."Data.Function".apply (module."Control.Applicative".pure module."Parsec".applicativeParser) (RecursiveRawProp key val recursiveProps)))));
  parseRawProps = indentAmount: module."Data.Array".some module."Parsec".alternativeParser module."Parsec".lazyParser (parseRawProp indentAmount);
  parseRawProp = indentAmount: module."Control.Bind".discard module."Control.Bind".discardUnit module."Parsec".bindParser (module."Data.Function".apply (module."Data.Functor".void module."Parsec".functorParser) (module."Data.Array".many module."Parsec".alternativeParser module."Parsec".lazyParser (module."Parsec".char "\n"))) (__unused: module."Control.Bind".discard module."Control.Bind".discardUnit module."Parsec".bindParser (module."Data.Function".apply (module."Data.Functor".void module."Parsec".functorParser) (module."Parsec".count indentAmount module."Parsec".space)) (__unused: module."Control.Alt".alt module."Parsec".altParser (parseRecursiveRawProp indentAmount) parseSimpleRawProp));
  parseRawCabalFile = module."Control.Bind".bind module."Parsec".bindParser (module."Data.Functor".map module."Parsec".functorParser RawCabalFile (parseRawProps 0)) (res: module."Control.Bind".discard module."Control.Bind".discardUnit module."Parsec".bindParser module."Parsec".eof (__unused: module."Control.Applicative".pure module."Parsec".applicativeParser res));
  parsedRawCabalFile = rawCabalFileString: module."Parsec".runParser rawCabalFileString parseRawCabalFile;
  licenseToAttrPath = v: 
    let
      __pattern0 = __fail: if v.__tag == "LicenseBSD3" then ["lib"
        "licenses"
        "bsd3"] else __fail;
      __patternFail = builtins.throw "Pattern match failure in src/Main.purs at 205:3 - 206:47";
    in
      __pattern0 __patternFail;
  licenseParser = module."Parsec".oneOf [(module."Data.Functor".voidLeft module."Parsec".functorParser (module."Parsec".string "BSD-3-Clause") LicenseBSD3)];
  getSimpleProp = key: rawProps: 
    let
      pred = v: 
        let
          __pattern0 = __fail: 
            if v.__tag == "SimpleRawProp"
              then 
                let
                  key' = v.__field0;
                  val = v.__field1;
                in
                  if module."Data.Eq".eq module."Data.Eq".eqString key' key then module."Data.Maybe".Just val else __fail
              else __fail;
          __pattern1 = __fail: module."Data.Maybe".Nothing;
          __patternFail = builtins.throw "Pattern match failure in src/Main.purs at 149:7 - 151:21";
        in
          __pattern0 (__pattern1 __patternFail);
    in
      
      let
        v = module."Data.Array".findMap pred rawProps;
      in
        
        let
          __pattern0 = __fail: if v.__tag == "Nothing" then module."Data.Either".Left [(module."Data.Semigroup".append module."Data.Semigroup".semigroupString "could not find key " key)] else __fail;
          __pattern1 = __fail: 
            if v.__tag == "Just"
              then 
                let
                  val = v.__field0;
                in
                  module."Data.Either".Right val
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in src/Main.purs at 143:3 - 145:26";
        in
          __pattern0 (__pattern1 __patternFail);
  getSimplePropParse = parser: key: rawProps: module."Control.Bind".bind module."Data.Either".bindEither (getSimpleProp key rawProps) 
    ( rawVal: 
      let
        v = module."Parsec".runParser rawVal parser;
      in
        
        let
          __pattern0 = __fail: 
            if v.__tag == "Left" && v.__field0.__tag == "Tuple"
              then 
                let
                  err = v.__field0.__field1;
                in
                  module."Data.Either".Left err
              else __fail;
          __pattern1 = __fail: 
            if v.__tag == "Right" && v.__field0.__tag == "Tuple"
              then 
                let
                  parsedVal = v.__field0.__field1;
                in
                  module."Data.Either".Right parsedVal
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in src/Main.purs at 157:3 - 159:46";
        in
          __pattern0 (__pattern1 __patternFail)
    );
  getRecursiveProp = key: rawProps: 
    let
      pred = v: 
        let
          __pattern0 = __fail: 
            if v.__tag == "RecursiveRawProp"
              then 
                let
                  key' = v.__field0;
                  val = v.__field1;
                  inner = v.__field2;
                in
                  if module."Data.Eq".eq module."Data.Eq".eqString key' key then module."Data.Maybe".Just (module."Data.Tuple".Tuple val inner) else __fail
              else __fail;
          __pattern1 = __fail: module."Data.Maybe".Nothing;
          __patternFail = builtins.throw "Pattern match failure in src/Main.purs at 170:7 - 172:21";
        in
          __pattern0 (__pattern1 __patternFail);
    in
      
      let
        v = module."Data.Array".findMap pred rawProps;
      in
        
        let
          __pattern0 = __fail: if v.__tag == "Nothing" then module."Data.Either".Left [(module."Data.Semigroup".append module."Data.Semigroup".semigroupString "could not find key " key)] else __fail;
          __pattern1 = __fail: 
            if v.__tag == "Just"
              then 
                let
                  r = v.__field0;
                in
                  module."Data.Either".Right r
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in src/Main.purs at 164:3 - 166:22";
        in
          __pattern0 (__pattern1 __patternFail);
  genericRawProp = 
    { to = x: 
        let
          __pattern0 = __fail: 
            if x.__tag == "Inl" && x.__field0.__tag == "Product"
              then 
                let
                  arg = x.__field0.__field0;
                  arg1 = x.__field0.__field1;
                in
                  SimpleRawProp arg arg1
              else __fail;
          __pattern1 = __fail: 
            if x.__tag == "Inr" && x.__field0.__tag == "Product" && x.__field0.__field1.__tag == "Product"
              then 
                let
                  arg = x.__field0.__field0;
                  arg1 = x.__field0.__field1.__field0;
                  arg2 = x.__field0.__field1.__field1;
                in
                  RecursiveRawProp arg arg1 arg2
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in src/Main.purs at 60:1 - 60:52";
        in
          __pattern0 (__pattern1 __patternFail);
      from = x: 
        let
          __pattern0 = __fail: 
            if x.__tag == "SimpleRawProp"
              then 
                let
                  arg = x.__field0;
                  arg1 = x.__field1;
                in
                  module."Data.Generic.Rep".Inl (module."Data.Generic.Rep".Product arg arg1)
              else __fail;
          __pattern1 = __fail: 
            if x.__tag == "RecursiveRawProp"
              then 
                let
                  arg = x.__field0;
                  arg1 = x.__field1;
                  arg2 = x.__field2;
                in
                  module."Data.Generic.Rep".Inr (module."Data.Generic.Rep".Product arg (module."Data.Generic.Rep".Product arg1 arg2))
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in src/Main.purs at 60:1 - 60:52";
        in
          __pattern0 (__pattern1 __patternFail);
    };
  showRawProp = {show = rawProp: module."Data.Show.Generic".genericShow genericRawProp (module."Data.Show.Generic".genericShowSum (module."Data.Show.Generic".genericShowConstructor (module."Data.Show.Generic".genericShowArgsProduct (module."Data.Show.Generic".genericShowArgsArgument module."Data.Show".showString) (module."Data.Show.Generic".genericShowArgsArgument module."Data.Show".showString)) {reflectSymbol = __unused: "SimpleRawProp";}) (module."Data.Show.Generic".genericShowConstructor (module."Data.Show.Generic".genericShowArgsProduct (module."Data.Show.Generic".genericShowArgsArgument module."Data.Show".showString) (module."Data.Show.Generic".genericShowArgsProduct (module."Data.Show.Generic".genericShowArgsArgument module."Data.Show".showString) (module."Data.Show.Generic".genericShowArgsArgument (module."Data.Show".showArray showRawProp)))) {reflectSymbol = __unused: "RecursiveRawProp";})) rawProp;};
  genericRawCabalFile = 
    { to = x: 
        let
          __pattern0 = __fail: 
            let
              arg = x;
            in
              RawCabalFile arg;
          __patternFail = builtins.throw "Pattern match failure in src/Main.purs at 68:1 - 68:62";
        in
          __pattern0 __patternFail;
      from = x: 
        let
          __pattern0 = __fail: 
            if x.__tag == "RawCabalFile"
              then 
                let
                  arg = x.__field0;
                in
                  arg
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in src/Main.purs at 68:1 - 68:62";
        in
          __pattern0 __patternFail;
    };
  showRawCabalFile = {show = module."Data.Show.Generic".genericShow genericRawCabalFile (module."Data.Show.Generic".genericShowConstructor (module."Data.Show.Generic".genericShowArgsArgument (module."Data.Show".showArray showRawProp)) {reflectSymbol = __unused: "RawCabalFile";});};
  genericLicense = 
    { to = x: 
        let
          __pattern0 = __fail: LicenseBSD3;
          __patternFail = builtins.throw "Pattern match failure in src/Main.purs at 31:1 - 31:52";
        in
          __pattern0 __patternFail;
      from = x: 
        let
          __pattern0 = __fail: if x.__tag == "LicenseBSD3" then module."Data.Generic.Rep".NoArguments else __fail;
          __patternFail = builtins.throw "Pattern match failure in src/Main.purs at 31:1 - 31:52";
        in
          __pattern0 __patternFail;
    };
  showLicense = {show = module."Data.Show.Generic".genericShow genericLicense (module."Data.Show.Generic".genericShowConstructor module."Data.Show.Generic".genericShowArgsNoArguments {reflectSymbol = __unused: "LicenseBSD3";});};
  cabalFileToPkgDef = v: src: 
    let
      __pattern0 = __fail: 
        let
          name = v.name;
          version = v.version;
          license = v.license;
          executable = v.executable;
          src1 = src;
        in
          mkFunctionWithArgs (module."Data.Array".cons "mkDerivation" (module."Data.Array".cons "lib" executable.buildDepends)) 
          ( args: module."NixBuiltins".getAttr "mkDerivation" args 
            { pname = name;
              version = version;
              src = src1;
              isLibrary = false;
              isExecutable = true;
              executableHaskellDepends = module."Data.Functor".map module."Data.Functor".functorArray (buildDepend: module."NixBuiltins".getAttr buildDepend args) executable.buildDepends;
              license = module."NixBuiltins".getAttrFromPath (licenseToAttrPath license) args;
            }
          );
      __patternFail = builtins.throw "Pattern match failure in src/Main.purs at 246:1 - 246:59";
    in
      __pattern0 __patternFail;
  buildDependParser = module."Control.Bind".bind module."Parsec".bindParser module."Parsec".alphaNums (libName: module."Control.Bind".discard module."Control.Bind".discardUnit module."Parsec".bindParser (module."Data.Function".apply (module."Data.Functor".void module."Parsec".functorParser) (module."Data.Array".many module."Parsec".alternativeParser module."Parsec".lazyParser (module."Parsec".notChars [","
    "\n"]))) (__unused: module."Control.Applicative".pure module."Parsec".applicativeParser libName));
  buildDependsParser = module."Parsec".sepBy1 buildDependParser (module."Control.Apply".applySecond module."Parsec".applyParser (module."Parsec".char ",") (module."Parsec".optional module."Parsec".space));
  cabalFileFromRaw = v: 
    let
      __pattern0 = __fail: 
        if v.__tag == "RawCabalFile"
          then 
            let
              rawProps = v.__field0;
            in
              module."Control.Bind".bind module."Data.Either".bindEither (getSimpleProp "name" rawProps) 
              ( name: module."Control.Bind".bind module."Data.Either".bindEither (getSimpleProp "version" rawProps) 
                ( version: module."Control.Bind".bind module."Data.Either".bindEither (getSimplePropParse licenseParser "license" rawProps) 
                  ( license: module."Control.Bind".bind module."Data.Either".bindEither (getRecursiveProp "executable" rawProps) 
                    ( v1: 
                      let
                        __pattern0 = __fail: 
                          if v1.__tag == "Tuple"
                            then 
                              let
                                executableName = v1.__field0;
                                executableProps = v1.__field1;
                              in
                                module."Control.Bind".bind module."Data.Either".bindEither (getSimplePropParse buildDependsParser "build-depends" executableProps) 
                                ( buildDepends: module."Control.Applicative".pure module."Data.Either".applicativeEither 
                                  { name = name;
                                    version = version;
                                    license = license;
                                    executable = 
                                      { name = executableName;
                                        buildDepends = buildDepends;
                                      };
                                  }
                                )
                            else __fail;
                        __patternFail = builtins.throw "Pattern match failure in src/Main.purs at 179:3 - 179:78";
                      in
                        __pattern0 __patternFail
                    )
                  )
                )
              )
          else __fail;
      __patternFail = builtins.throw "Pattern match failure in src/Main.purs at 174:1 - 174:68";
    in
      __pattern0 __patternFail;
  cabalParser = rawCabalFileString: 
    let
      v = parsedRawCabalFile rawCabalFileString;
    in
      
      let
        __pattern0 = __fail: 
          if v.__tag == "Left" && v.__field0.__tag == "Tuple"
            then 
              let
                err = v.__field0.__field1;
              in
                module."Data.Either".Left err
            else __fail;
        __pattern1 = __fail: 
          if v.__tag == "Right" && v.__field0.__tag == "Tuple"
            then 
              let
                rawCabalFile = v.__field0.__field1;
              in
                cabalFileFromRaw rawCabalFile
            else __fail;
        __patternFail = builtins.throw "Pattern match failure in src/Main.purs at 199:3 - 201:63";
      in
        __pattern0 (__pattern1 __patternFail);
  rawCabalFileToPkgDef = rawCabalFileString: packageSrc: 
    let
      v = cabalParser rawCabalFileString;
    in
      
      let
        __pattern0 = __fail: 
          if v.__tag == "Left"
            then 
              let
                err = v.__field0;
              in
                module."Data.Function".apply module."NixBuiltins".abort (module."Data.Semigroup".append module."Data.Semigroup".semigroupString "Could not parse cabal file: " (module."Data.Show".show (module."Data.Show".showArray module."Data.Show".showString) err))
            else __fail;
        __pattern1 = __fail: 
          if v.__tag == "Right"
            then 
              let
                cabalFile = v.__field0;
              in
                cabalFileToPkgDef cabalFile packageSrc
            else __fail;
        __patternFail = builtins.throw "Pattern match failure in src/Main.purs at 280:3 - 284:45";
      in
        __pattern0 (__pattern1 __patternFail);
  callCabal2nixWithoutIFD = haskellCallPackage: pkgName: src: overrides: 
    let
      v = module."NixBuiltins".appendPath src (module."Data.Semigroup".append module."Data.Semigroup".semigroupString "/" (module."Data.Semigroup".append module."Data.Semigroup".semigroupString pkgName ".cabal"));
    in
      
      let
        __pattern0 = __fail: 
          let
            cabalFilePath1 = v;
          in
            
            let
              v1 = module."NixBuiltins".readFile cabalFilePath1;
            in
              
              let
                __pattern0 = __fail: 
                  let
                    rawCabalFileString = v1;
                  in
                    
                    let
                      v2 = rawCabalFileToPkgDef rawCabalFileString src;
                    in
                      
                      let
                        __pattern0 = __fail: 
                          let
                            haskellPkgFunc = v2;
                          in
                            haskellCallPackage haskellPkgFunc overrides;
                        __patternFail = builtins.throw "Pattern match failure in src/Main.purs at 389:7 - 389:89";
                      in
                        __pattern0 __patternFail;
                __patternFail = builtins.throw "Pattern match failure in src/Main.purs at 388:7 - 388:62";
              in
                __pattern0 __patternFail;
        __patternFail = builtins.throw "Pattern match failure in src/Main.purs at 387:7 - 387:76";
      in
        __pattern0 __patternFail;
  exampleNixpkgsHaskellOverlay = _final: prev: module."NixBuiltins".toAttrSet 
    { haskell = module."NixBuiltins".attrUpdate' (module."NixBuiltins".getAttrFlip prev "haskell") 
        { packageOverrides = hfinal: hprev: module."NixBuiltins".attrUpdate' (module."NixBuiltins".getAttrFlip (module."NixBuiltins".getAttrFlip prev "haskell") "packageOverrides" hfinal hprev) 
            { exampleHaskellPackage = module."NixBuiltins".getAttrFlip hfinal "callCabal2nixWithoutIFD" "example-cabal-library" haskellPackagePath { };
              callCabal2nixWithoutIFD = callCabal2nixWithoutIFD (module."NixBuiltins".getAttrFlip hfinal "callPackage");
            };
        };
    };
  exampleNixpkgsHaskellOverlayTyped = _final: prev: 
    { haskell = 
        let
          v = prev.haskell;
        in
          v // 
          { packageOverrides = hfinal: hprev: 
              let
                v1 = prev.haskell.packageOverrides hfinal hprev;
              in
                v1 // 
                { exampleHaskellPackageTyped = hfinal.callCabal2nixWithoutIFDTyped "example-cabal-library" haskellPackagePath (module."NixBuiltins".toAttrSet { });
                  callCabal2nixWithoutIFDTyped = callCabal2nixWithoutIFD hfinal.callPackage;
                };
          };
    };
  examplePackage = nixpkgs: module."NixBuiltins".getAttrFlip (module."NixBuiltins".getAttrFlip nixpkgs "haskellPackages") "callPackage" (rawCabalFileToPkgDef rawCabalFileStr haskellPackagePath) { };
  exampleNixpkgsOverlay = final: _prev: {exampleHaskellPackage = examplePackage final;};
in
  {inherit LicenseBSD3 SimpleRawProp RecursiveRawProp RawCabalFile parseRawPropKey parseRawPropVal parseSimpleRawProp parseRecursiveRawPropKey parseRecursiveRawProp parseRawProp parseRawProps parseRawCabalFile cabalFilePath rawCabalFileStr licenseParser buildDependParser buildDependsParser parsedRawCabalFile getSimpleProp getSimplePropParse getRecursiveProp cabalFileFromRaw cabalParser licenseToAttrPath haskellPackagePath mkFunctionWithArgs cabalFileToPkgDef rawCabalFileToPkgDef examplePackage exampleNixpkgsOverlay exampleNixpkgsHaskellOverlay callCabal2nixWithoutIFD exampleNixpkgsHaskellOverlayTyped genericLicense showLicense genericRawProp showRawProp genericRawCabalFile showRawCabalFile;}