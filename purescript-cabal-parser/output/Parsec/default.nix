
let
  module = 
    { "Control.Alt" = import ../Control.Alt;
      "Control.Alternative" = import ../Control.Alternative;
      "Control.Applicative" = import ../Control.Applicative;
      "Control.Apply" = import ../Control.Apply;
      "Control.Bind" = import ../Control.Bind;
      "Control.Lazy" = import ../Control.Lazy;
      "Control.Monad" = import ../Control.Monad;
      "Control.MonadPlus" = import ../Control.MonadPlus;
      "Control.Plus" = import ../Control.Plus;
      "Control.Semigroupoid" = import ../Control.Semigroupoid;
      "Data.Array" = import ../Data.Array;
      "Data.Either" = import ../Data.Either;
      "Data.Eq" = import ../Data.Eq;
      "Data.Function" = import ../Data.Function;
      "Data.Functor" = import ../Data.Functor;
      "Data.Maybe" = import ../Data.Maybe;
      "Data.Monoid" = import ../Data.Monoid;
      "Data.Ord" = import ../Data.Ord;
      "Data.Ordering" = import ../Data.Ordering;
      "Data.Semigroup" = import ../Data.Semigroup;
      "Data.Semiring" = import ../Data.Semiring;
      "Data.Show" = import ../Data.Show;
      "Data.Traversable" = import ../Data.Traversable;
      "Data.Tuple" = import ../Data.Tuple;
      "Data.Tuple.Nested" = import ../Data.Tuple.Nested;
      "Data.Unit" = import ../Data.Unit;
      "NixBuiltins" = import ../NixBuiltins;
      "Prelude" = import ../Prelude;
    };
  Err = value0: value1: 
    { __tag = "Err";
      __field0 = value0;
      __field1 = value1;
    };
  Parser = x: x;
  unParser = v: 
    let
      __pattern0 = __fail: 
        let
          p = v;
        in
          p;
      __patternFail = builtins.throw "Pattern match failure in ./../purescript-parser-combinator/src/Parsec.purs at 48:1 - 56:7";
    in
      __pattern0 __patternFail;
  semigroupErr = dictSemigroup: 
    { append = v: v1: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Err" && v1.__tag == "Err"
              then 
                let
                  il = v.__field0;
                  el = v.__field1;
                  ir = v1.__field0;
                  er = v1.__field1;
                in
                  
                  let
                    v2 = module."Data.Ord".compare module."Data.Ord".ordInt il ir;
                  in
                    
                    let
                      __pattern0 = __fail: if v2.__tag == "LT" then Err ir er else __fail;
                      __pattern1 = __fail: if v2.__tag == "EQ" then Err ir (module."Data.Semigroup".append dictSemigroup el er) else __fail;
                      __pattern2 = __fail: if v2.__tag == "GT" then Err il el else __fail;
                      __patternFail = builtins.throw "Pattern match failure in ./../purescript-parser-combinator/src/Parsec.purs at 26:36 - 29:20";
                    in
                      __pattern0 (__pattern1 (__pattern2 __patternFail))
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in ./../purescript-parser-combinator/src/Parsec.purs at 25:1 - 29:20";
        in
          __pattern0 __patternFail;
    };
  throwAt = k: str: i: err: ok: ng: 
    let
      throw' = e: v: v1: e': v2: ng': ng' (module."Data.Semigroup".append (semigroupErr module."Data.Semigroup".semigroupArray) e' (Err i [e]));
    in
      unParser (k throw') str i err ok ng;
  monoidErr = dictMonoid: 
    { mempty = Err 0 (module."Data.Monoid".mempty dictMonoid);
      "Semigroup0" = __unused: semigroupErr (dictMonoid."Semigroup0" module."Prim".undefined);
    };
  runParser = s: v: 
    let
      __pattern0 = __fail: 
        let
          s1 = s;
          p = v;
        in
          p s1 0 (module."Data.Monoid".mempty (monoidErr module."Data.Monoid".monoidArray)) (a: i: v1: module."Data.Either".Right (module."Data.Tuple".Tuple i a)) 
          ( v1: 
            let
              __pattern0 = __fail: 
                if v1.__tag == "Err"
                  then 
                    let
                      i = v1.__field0;
                      e = v1.__field1;
                    in
                      module."Data.Either".Left (module."Data.Tuple".Tuple i e)
                  else __fail;
              __patternFail = builtins.throw "Pattern match failure in ./../purescript-parser-combinator/src/Parsec.purs at 70:6 - 70:33";
            in
              __pattern0 __patternFail
          );
      __patternFail = builtins.throw "Pattern match failure in ./../purescript-parser-combinator/src/Parsec.purs at 59:1 - 63:42";
    in
      __pattern0 __patternFail;
  lazyParser = {defer = f: t: i: e: ok: ng: unParser (f module."Data.Unit".unit) t i e ok ng;};
  isAlphaNum = v: 
    let
      __pattern0 = __fail: if v == "A" then true else __fail;
      __pattern1 = __fail: if v == "B" then true else __fail;
      __pattern2 = __fail: if v == "C" then true else __fail;
      __pattern3 = __fail: if v == "D" then true else __fail;
      __pattern4 = __fail: if v == "E" then true else __fail;
      __pattern5 = __fail: if v == "F" then true else __fail;
      __pattern6 = __fail: if v == "G" then true else __fail;
      __pattern7 = __fail: if v == "H" then true else __fail;
      __pattern8 = __fail: if v == "I" then true else __fail;
      __pattern9 = __fail: if v == "J" then true else __fail;
      __pattern10 = __fail: if v == "K" then true else __fail;
      __pattern11 = __fail: if v == "L" then true else __fail;
      __pattern12 = __fail: if v == "M" then true else __fail;
      __pattern13 = __fail: if v == "N" then true else __fail;
      __pattern14 = __fail: if v == "O" then true else __fail;
      __pattern15 = __fail: if v == "P" then true else __fail;
      __pattern16 = __fail: if v == "Q" then true else __fail;
      __pattern17 = __fail: if v == "R" then true else __fail;
      __pattern18 = __fail: if v == "S" then true else __fail;
      __pattern19 = __fail: if v == "T" then true else __fail;
      __pattern20 = __fail: if v == "U" then true else __fail;
      __pattern21 = __fail: if v == "V" then true else __fail;
      __pattern22 = __fail: if v == "W" then true else __fail;
      __pattern23 = __fail: if v == "X" then true else __fail;
      __pattern24 = __fail: if v == "Y" then true else __fail;
      __pattern25 = __fail: if v == "Z" then true else __fail;
      __pattern26 = __fail: if v == "a" then true else __fail;
      __pattern27 = __fail: if v == "b" then true else __fail;
      __pattern28 = __fail: if v == "c" then true else __fail;
      __pattern29 = __fail: if v == "d" then true else __fail;
      __pattern30 = __fail: if v == "e" then true else __fail;
      __pattern31 = __fail: if v == "f" then true else __fail;
      __pattern32 = __fail: if v == "g" then true else __fail;
      __pattern33 = __fail: if v == "h" then true else __fail;
      __pattern34 = __fail: if v == "i" then true else __fail;
      __pattern35 = __fail: if v == "j" then true else __fail;
      __pattern36 = __fail: if v == "k" then true else __fail;
      __pattern37 = __fail: if v == "l" then true else __fail;
      __pattern38 = __fail: if v == "m" then true else __fail;
      __pattern39 = __fail: if v == "n" then true else __fail;
      __pattern40 = __fail: if v == "o" then true else __fail;
      __pattern41 = __fail: if v == "p" then true else __fail;
      __pattern42 = __fail: if v == "q" then true else __fail;
      __pattern43 = __fail: if v == "r" then true else __fail;
      __pattern44 = __fail: if v == "s" then true else __fail;
      __pattern45 = __fail: if v == "t" then true else __fail;
      __pattern46 = __fail: if v == "u" then true else __fail;
      __pattern47 = __fail: if v == "v" then true else __fail;
      __pattern48 = __fail: if v == "w" then true else __fail;
      __pattern49 = __fail: if v == "x" then true else __fail;
      __pattern50 = __fail: if v == "y" then true else __fail;
      __pattern51 = __fail: if v == "z" then true else __fail;
      __pattern52 = __fail: if v == "0" then true else __fail;
      __pattern53 = __fail: if v == "1" then true else __fail;
      __pattern54 = __fail: if v == "2" then true else __fail;
      __pattern55 = __fail: if v == "3" then true else __fail;
      __pattern56 = __fail: if v == "4" then true else __fail;
      __pattern57 = __fail: if v == "5" then true else __fail;
      __pattern58 = __fail: if v == "6" then true else __fail;
      __pattern59 = __fail: if v == "7" then true else __fail;
      __pattern60 = __fail: if v == "8" then true else __fail;
      __pattern61 = __fail: if v == "9" then true else __fail;
      __pattern62 = __fail: false;
      __patternFail = builtins.throw "Pattern match failure in ./../purescript-parser-combinator/src/Parsec.purs at 197:3 - 260:15";
    in
      __pattern0 (__pattern1 (__pattern2 (__pattern3 (__pattern4 (__pattern5 (__pattern6 (__pattern7 (__pattern8 (__pattern9 (__pattern10 (__pattern11 (__pattern12 (__pattern13 (__pattern14 (__pattern15 (__pattern16 (__pattern17 (__pattern18 (__pattern19 (__pattern20 (__pattern21 (__pattern22 (__pattern23 (__pattern24 (__pattern25 (__pattern26 (__pattern27 (__pattern28 (__pattern29 (__pattern30 (__pattern31 (__pattern32 (__pattern33 (__pattern34 (__pattern35 (__pattern36 (__pattern37 (__pattern38 (__pattern39 (__pattern40 (__pattern41 (__pattern42 (__pattern43 (__pattern44 (__pattern45 (__pattern46 (__pattern47 (__pattern48 (__pattern49 (__pattern50 (__pattern51 (__pattern52 (__pattern53 (__pattern54 (__pattern55 (__pattern56 (__pattern57 (__pattern58 (__pattern59 (__pattern60 (__pattern61 (__pattern62 __patternFail))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))));
  functorParser = 
    { map = f: v: 
        let
          __pattern0 = __fail: 
            let
              f1 = f;
              p = v;
            in
              s: i: e: ok: err: p s i e (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn ok f1) err;
          __patternFail = builtins.throw "Pattern match failure in ./../purescript-parser-combinator/src/Parsec.purs at 72:1 - 74:27";
        in
          __pattern0 __patternFail;
    };
  eof = str: i: err: ok: ng: 
    let
      __pattern0 = __fail: if module."Data.Ord".greaterThanOrEq module."Data.Ord".ordInt i (module."NixBuiltins".stringLength str) then ok module."Data.Unit".unit i err else __fail;
      __pattern1 = __fail: ng (module."Data.Semigroup".append (semigroupErr module."Data.Semigroup".semigroupArray) err (Err i ["not at eof"]));
      __patternFail = builtins.throw "Pattern match failure in ./../purescript-parser-combinator/src/Parsec.purs at 125:3 - 128:37";
    in
      __pattern0 (__pattern1 __patternFail);
  chars = n: str: i: err: ok: ng: 
    let
      endOffset = module."Data.Semiring".add module."Data.Semiring".semiringInt i n;
    in
      
      let
        __pattern0 = __fail: if module."Data.Ord".greaterThanOrEq module."Data.Ord".ordInt (module."NixBuiltins".stringLength str) endOffset then ok (module."NixBuiltins".substring i n str) endOffset err else __fail;
        __pattern1 = __fail: 
          let
            errMsg = module."Data.Semigroup".append module."Data.Semigroup".semigroupString "not enough characters left in Parser to parse " (module."Data.Semigroup".append module."Data.Semigroup".semigroupString (module."Data.Show".show module."Data.Show".showInt n) " chars");
          in
            ng (module."Data.Semigroup".append (semigroupErr module."Data.Semigroup".semigroupArray) err (Err i [errMsg]));
        __patternFail = builtins.throw "Pattern match failure in ./../purescript-parser-combinator/src/Parsec.purs at 116:3 - 121:31";
      in
        __pattern0 (__pattern1 __patternFail);
  applyParser = 
    { apply = v: v1: 
        let
          __pattern0 = __fail: 
            let
              pf = v;
              pa = v1;
            in
              t: i: e: ok: ng: pf t i e (f: i': e': pa t i' e' (module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn ok f) ng) ng;
          __patternFail = builtins.throw "Pattern match failure in ./../purescript-parser-combinator/src/Parsec.purs at 76:1 - 79:55";
        in
          __pattern0 __patternFail;
      "Functor0" = __unused: functorParser;
    };
  bindParser = 
    { bind = v: f: 
        let
          __pattern0 = __fail: 
            let
              k = v;
              f1 = f;
            in
              t: i: e: ok: ng: k t i e (a: i': e': unParser (f1 a) t i' e' ok ng) ng;
          __patternFail = builtins.throw "Pattern match failure in ./../purescript-parser-combinator/src/Parsec.purs at 84:1 - 87:58";
        in
          __pattern0 __patternFail;
      "Apply0" = __unused: applyParser;
    };
  applicativeParser = 
    { pure = a: v: i: e: ok: v1: ok a i e;
      "Apply0" = __unused: applyParser;
    };
  count = i: p: module."Data.Function".apply (module."Data.Traversable".sequence module."Data.Traversable".traversableArray applicativeParser) (module."Data.Array".replicate i p);
  monadParser = 
    { "Applicative0" = __unused: applicativeParser;
      "Bind1" = __unused: bindParser;
    };
  satisfyNote = f: errMsg: throwAt 
    ( throw: module."Control.Bind".bind bindParser (module."Data.Functor".map functorParser module."NixBuiltins".unsafeStrToChar (chars 1)) 
      ( parsedChar: 
        let
          __pattern0 = __fail: if f parsedChar then module."Control.Applicative".pure applicativeParser parsedChar else __fail;
          __pattern1 = __fail: throw (errMsg parsedChar);
          __patternFail = builtins.throw "Pattern match failure in ./../purescript-parser-combinator/src/Parsec.purs at 191:5 - 193:37";
        in
          __pattern0 (__pattern1 __patternFail)
      )
    );
  char = c: module."Data.Function".apply (module."Data.Functor".void functorParser) (satisfyNote (v: module."Data.Eq".eq module."Data.Eq".eqChar v c) (parsedChar: module."Data.Semigroup".append module."Data.Semigroup".semigroupString "expected character '" (module."Data.Semigroup".append module."Data.Semigroup".semigroupString (module."NixBuiltins".charToStr c) (module."Data.Semigroup".append module."Data.Semigroup".semigroupString "', but got '" (module."Data.Semigroup".append module."Data.Semigroup".semigroupString (module."NixBuiltins".charToStr parsedChar) "'")))));
  notChar = c: satisfyNote (v: module."Data.Eq".notEq module."Data.Eq".eqChar v c) (parsedChar: module."Data.Semigroup".append module."Data.Semigroup".semigroupString "expected any character but '" (module."Data.Semigroup".append module."Data.Semigroup".semigroupString (module."NixBuiltins".charToStr c) (module."Data.Semigroup".append module."Data.Semigroup".semigroupString "', but got '" (module."NixBuiltins".charToStr parsedChar))));
  notChars = cs: satisfyNote (c: module."Data.Array".notElem module."Data.Eq".eqChar c cs) (parsedChar: module."Data.Semigroup".append module."Data.Semigroup".semigroupString "expected any character but '" (module."Data.Semigroup".append module."Data.Semigroup".semigroupString (module."Data.Show".show (module."Data.Show".showArray module."Data.Show".showChar) cs) (module."Data.Semigroup".append module."Data.Semigroup".semigroupString "', but got '" (module."NixBuiltins".charToStr parsedChar))));
  string = s: throwAt 
    ( throw: module."Control.Bind".bind bindParser (chars (module."NixBuiltins".stringLength s)) 
      ( parsedChars: 
        let
          __pattern0 = __fail: if module."Data.Eq".eq module."Data.Eq".eqString s parsedChars then module."Control.Applicative".pure applicativeParser s else __fail;
          __pattern1 = __fail: module."Data.Function".apply throw (module."Data.Semigroup".append module."Data.Semigroup".semigroupString "expected string '" (module."Data.Semigroup".append module."Data.Semigroup".semigroupString s (module."Data.Semigroup".append module."Data.Semigroup".semigroupString "', but got string '" (module."Data.Semigroup".append module."Data.Semigroup".semigroupString parsedChars "'"))));
          __patternFail = builtins.throw "Pattern match failure in ./../purescript-parser-combinator/src/Parsec.purs at 286:5 - 288:91";
        in
          __pattern0 (__pattern1 __patternFail)
      )
    );
  altParser = 
    { alt = v: v1: 
        let
          __pattern0 = __fail: 
            let
              pl = v;
              pr = v1;
            in
              t: i: e: ok: ng: pl t i e ok (e': pr t i e' ok ng);
          __patternFail = builtins.throw "Pattern match failure in ./../purescript-parser-combinator/src/Parsec.purs at 91:1 - 93:39";
        in
          __pattern0 __patternFail;
      "Functor0" = __unused: functorParser;
    };
  optional = v: module."Control.Alt".alt altParser (module."Data.Functor".map functorParser module."Data.Maybe".Just v) (module."Control.Applicative".pure applicativeParser module."Data.Maybe".Nothing);
  plusParser = 
    { empty = v: v1: e: v2: ng: ng e;
      "Alt0" = __unused: altParser;
    };
  alternativeParser = 
    { "Applicative0" = __unused: applicativeParser;
      "Plus1" = __unused: plusParser;
    };
  monadPlusParser = 
    { "Monad0" = __unused: monadParser;
      "Alternative1" = __unused: alternativeParser;
    };
  sepBy1 = p: sep: module."Control.Bind".bind bindParser p (fst: module."Control.Bind".bind bindParser (module."Data.Array".many alternativeParser lazyParser (module."Control.Apply".applySecond applyParser sep p)) (rest: module."Control.Applicative".pure applicativeParser (module."Data.Array".cons fst rest)));
  oneOf = parsers: module."Data.Array".foldr (module."Control.Alt".alt altParser) (module."Control.Plus".empty plusParser) parsers;
  space = module."Control.Alt".alt altParser (char " ") (char "\t");
  spaces = module."Data.Function".apply (module."Data.Functor".void functorParser) (module."Data.Array".some alternativeParser lazyParser space);
  alphaNum = satisfyNote isAlphaNum (c: module."Data.Semigroup".append module."Data.Semigroup".semigroupString "Trying to parse A-Z or a-z or 0-9, but got character '" (module."Data.Semigroup".append module."Data.Semigroup".semigroupString (module."NixBuiltins".charToStr c) "'"));
  alphaNums = module."Data.Functor".map functorParser module."NixBuiltins".concatChars (module."Data.Array".some alternativeParser lazyParser alphaNum);
in
  {inherit Err Parser unParser runParser chars eof throwAt char notChar notChars satisfyNote isAlphaNum alphaNum alphaNums space spaces count string oneOf sepBy1 optional semigroupErr monoidErr functorParser applyParser applicativeParser bindParser monadParser altParser plusParser alternativeParser monadPlusParser lazyParser;}