module GF.Command.Commands (
  allCommands,
  lookCommand,
  exec,
  isOpt,
  options,
  flags,
  CommandInfo,
  CommandOutput
  ) where

import PGF
import PGF.CId
import PGF.ShowLinearize
import PGF.Macros
import PGF.Data ----
import PGF.Morphology
import PGF.Quiz
import GF.Compile.Export
import GF.Infra.UseIO
import GF.Data.ErrM ----
import PGF.ExprSyntax (readExp)
import GF.Command.Abstract
import GF.Text.Lexing

import GF.Data.Operations

import Data.Maybe
import qualified Data.Map as Map

type CommandOutput = ([Exp],String) ---- errors, etc

data CommandInfo = CommandInfo {
  exec     :: [Option] -> [Exp] -> IO CommandOutput,
  synopsis :: String,
  syntax   :: String,
  explanation :: String,
  longname :: String,
  options  :: [(String,String)],
  flags    :: [(String,String)],
  examples :: [String]
  }

emptyCommandInfo :: CommandInfo
emptyCommandInfo = CommandInfo {
  exec = \_ ts -> return (ts,[]), ----
  synopsis = "synopsis",
  syntax = "syntax",
  explanation = "explanation",
  longname = "longname",
  options = [],
  flags = [],
  examples = []
  }

lookCommand :: String -> Map.Map String CommandInfo -> Maybe CommandInfo
lookCommand = Map.lookup

commandHelpAll :: PGF -> [Option] -> String
commandHelpAll pgf opts = unlines
  [commandHelp (isOpt "full" opts) (co,info)
    | (co,info) <- Map.assocs (allCommands pgf)]

commandHelp :: Bool -> (String,CommandInfo) -> String
commandHelp full (co,info) = unlines $ [
  co ++ ", " ++ longname info,
  synopsis info] ++ if full then [
  "syntax:" ++++ "  " ++ syntax info,
  explanation info,
  "options:" ++++ unlines [" -" ++ o ++ "\t" ++ e | (o,e) <- options info],
  "flags:" ++++ unlines [" -" ++ o ++ "\t" ++ e | (o,e) <- flags info],
  "examples:" ++++ unlines ["  " ++ s | s <- examples info]
  ] else []

-- this list must no more be kept sorted by the command name
allCommands :: PGF -> Map.Map String CommandInfo
allCommands pgf = Map.fromList [
  ("af", emptyCommandInfo {
     longname = "append_file",
     synopsis = "append string or tree to a file",
     exec = \opts arg -> do
         let file = valIdOpts "file" "_gftmp" opts
         appendFile file (toString arg)
         return void,
     flags = [("file","name of the file")]
    }),
  ("cc", emptyCommandInfo {
     longname = "compute_concrete",
     synopsis = "computes concrete syntax term using the source grammar",
     explanation = "Compute a term by concrete syntax definitions. Uses the topmost\n"++
                   "resource module (the last in listing by command po) to resolve\n"++
                   "constant names.\n"++
                   "N.B. You need the flag -retain when importing the grammar, if you want\n"++
                   "the oper definitions to be retained after compilation; otherwise this\n"++
                   "command does not expand oper constants.\n"++
                   "N.B.' The resulting Term is not a term in the sense of abstract syntax,\n"++
                   "and hence not a valid input to a Tree-demanding command."
     }),
  ("e",  emptyCommandInfo {
     longname = "empty",
     synopsis = "empty the environment"
     }),
  ("gr", emptyCommandInfo {
     longname = "generate_random",
     synopsis = "generate random trees in the current abstract syntax",
     syntax = "gr [-cat=CAT] [-number=INT]",
     examples = [
       "gr                     -- one tree in the startcat of the current grammar",
       "gr -cat=NP -number=16  -- 16 trees in the category NP"
       ],
     explanation = unlines [
       "Generates a list of random trees, by default one tree."
----       "If a tree argument is given, the command completes the Tree with values to",
----       "the metavariables in the tree."
       ],
     flags = [
       ("cat","generation category"),
       ("number","number of trees generated")
       ],
     exec = \opts _ -> do
       ts <- generateRandom pgf (optCat opts)
       return $ fromTrees $ take (optNum opts) ts
     }),
  ("gt", emptyCommandInfo {
     longname = "generate_trees",
     synopsis = "generates a list of trees, by default exhaustive",
     explanation = "Generates all trees up to a given depth. If the depth is large,\n"++
                   "a small -alts is recommended. If a Tree argument is given, the\n"++
                   "command completes the Tree with values to the metavariables in\n"++
                   "the tree.",
     flags = [
       ("cat","the generation category"),
       ("depth","the maximum generation depth"),
       ("number","the number of trees generated")
       ],
     exec = \opts _ -> do
       let dp = return $ valIntOpts "depth" 4 opts
       let ts = generateAllDepth pgf (optCat opts) dp
       return $ fromTrees $ take (optNumInf opts) ts
     }),
  ("h", emptyCommandInfo {
     longname = "help",
     synopsis = "get description of a command, or a the full list of commands",
     explanation = "Displays the paragraph concerning the command from this help file.\n"++
                   "Without argument, shows the first lines of all paragraphs.",
     options = [
       ("full","give full information of the commands")
       ],
     exec = \opts ts -> return ([], case ts of
       [t] -> let co = showExp t in 
              case lookCommand co (allCommands pgf) of   ---- new map ??!!
                Just info -> commandHelp True (co,info)
                _ -> "command not found"
       _ -> commandHelpAll pgf opts)
     }),
  ("i", emptyCommandInfo {
     longname = "import",
     synopsis = "import a grammar from source code or compiled .pgf file",
     explanation = unlines [
       "Reads a grammar from File and compiles it into a GF runtime grammar.",
       "If a grammar with the same concrete name is already in the state",
       "it is overwritten - but only if compilation succeeds.",
       "The grammar parser depends on the file name suffix:",
       "  .gf    normal GF source",
       "  .gfo   compiled GF source",
       "  .pgf   precompiled grammar in Portable Grammar Format"
       ],
     options = [ -- ["prob", "retain", "gfo", "src", "no-cpu", "cpu", "quiet", "verbose"]
       ("retain","retain operations (used for cc command)")
       ]
     }),
  ("l", emptyCommandInfo {
     longname = "linearize",
     synopsis = "convert an abstract syntax expression to string",
     explanation = unlines [
       "Shows the linearization of a Tree by the actual grammar",
       "(which is overridden by the -lang flag)."
       ],
     exec = \opts -> return . fromStrings . map (optLin opts),
     options = [
       ("all","show all forms and variants"),
       ("record","show source-code-like record"),
       ("table","show all forms labelled by parameters"),
       ("term", "show PGF term"),
       ("treebank","show the tree and tag linearizations with language names")
       ],
     flags = [("lang","the language of linearization")]
     }),

  ("ma", emptyCommandInfo {
     longname = "morpho_analyse",
     synopsis = "print the morphological analyses of all words in the string",
     explanation = unlines [
       "Prints all the analyses of space-separated words in the input string,",
       "using the morphological analyser of the actual grammar (see command pf)"
       ],
     exec  = \opts ->  
               return . fromString . unlines . 
               map prMorphoAnalysis . concatMap (morphos opts) . 
               concatMap words . toStrings
     }),

  ("mq", emptyCommandInfo {
     longname = "morpho_quiz",
     synopsis = "start a morphology quiz",
     exec = \opts _ -> do
         let lang = optLang opts
         let cat  = optCat opts
         morphologyQuiz pgf lang cat
         return void,
     flags = [
       ("lang","language of the quiz"),
       ("cat","category of the quiz"),
       ("number","maximum number of questions")
       ] 
     }),

  ("p", emptyCommandInfo {
     longname = "parse",
     synopsis = "parse a string to abstract syntax expression",
     explanation = unlines [
       "Shows all trees returned for the string argument by the actual grammar",
       "(overridden by the -lang flag), in the default category (overridden",
       "by the -cat flag)."
       ],
     exec = \opts -> return . fromTrees . concatMap (par opts) . toStrings,
     flags = [
       ("cat","target category of parsing"),
       ("lang","parsing language")
       ]
     }),
  ("pf", emptyCommandInfo {
     longname = "print_fullform",
     synopsis = "print the full-form lexicon of the actual grammar",
     explanation = unlines [
       "Prints all the strings in the actual grammar with their possible analyses"
       ],
     exec  = \opts _ -> 
               return $ fromString $ concatMap 
                  (prFullFormLexicon . buildMorpho pgf . mkCId) $ optLangs opts
     }),
  ("pg", emptyCommandInfo { -----
     longname = "print_grammar",
     synopsis = "print the actual grammar with the given printer",
     explanation = "Prints the actual grammar (overridden by the -lang=X flag).\n"++
                   "The -printer=X flag sets the format in which the grammar is\n"++
                   "written.\n"++
                   "N.B. since grammars are compiled when imported, this command\n"++
                   "generally does not show the grammar in the same format as the\n"++
                   "source.",
     exec  = \opts _ -> return $ fromString $ prGrammar opts,
     flags = let fs = ["cat","lang","printer"] in zip fs fs 
     }),
  ("ph", emptyCommandInfo {
     longname = "print_history",
     synopsis = "print readline history",
     explanation = "Prints the commands issued during the GF session.\n"++
                   "The result is readable by the eh command.\n"++
                   "example:\n"++
                   "  ph | wf foo.hist  -- save the history into a file"
     }),
  ("ps", emptyCommandInfo {
     longname = "put_string",
     synopsis = "return a string, possibly processed with a function",
     explanation = unlines [
       "Returns a string obtained by its argument string by applying",
       "string processing functions in the order given in the command line",
       "option list. Thus 'ps -f -g s' returns g (f s). Typical string processors",
       "are lexers and unlexers."
       ], 
     exec = \opts -> return . fromString . stringOps opts . toString,
     options = [
       ("lextext","text-like lexer"),
       ("lexcode","code-like lexer"),
       ("lexmixed","mixture of text and code (code between $...$)"), 
       ("unlextext","text-like unlexer"),
       ("unlexcode","code-like unlexer"),
       ("unlexmixed","mixture of text and code (code between $...$)"), 
       ("unwords","unlexer that puts a single space between tokens (default)"),
       ("words","lexer that assumes tokens separated by spaces (default)")
       ]
     }),
  ("q",  emptyCommandInfo {
     longname = "quit",
     synopsis = "exit GF interpreter"
     }),
  ("rf",  emptyCommandInfo {
     longname = "read_file",
     synopsis = "read string or tree input from a file",
     explanation = unlines [
       "Reads input from file. The filename must be in double quotes.",
       "The input is interpreted as a string by default, and can hence be",
       "piped e.g. to the parse command. The option -term interprets the",
       "input as a term, which can be given e.g. to the linearize command.",
       "The option -lines will result in a list of strings or trees, one by line." 
       ],
     options = [
       ("lines","return the list of lines, instead of the singleton of all contents"),
       ("term","convert strings into terms")
       ],
     exec = \opts arg -> do 
       let file = valIdOpts "file" "_gftmp" opts
       s <- readFile file
       return $ case opts of
         _ | isOpt "lines" opts && isOpt "term" opts -> 
               fromTrees [t | l <- lines s, Just t <- [readExp l]] 
         _ | isOpt "term" opts -> 
               fromTrees [t | Just t <- [readExp s]] 
         _ | isOpt "lines" opts -> fromStrings $ lines s 
         _ -> fromString s,
     flags = [("file","the input file name")] 
     }),
  ("tq", emptyCommandInfo {
     longname = "translation_quiz",
     synopsis = "start a translation quiz",
     exec = \opts _ -> do
         let from = valIdOpts "from" (optLang opts) opts
         let to   = valIdOpts "to"   (optLang opts) opts
         let cat  = optCat opts
         translationQuiz pgf from to cat
         return void,
     flags = [
       ("from","translate from this language"),
       ("to","translate to this language"),
       ("cat","translate in this category"),
       ("number","the maximum number of questions")
       ] 
     }),
  ("wf", emptyCommandInfo {
     longname = "write_file",
     synopsis = "send string or tree to a file",
     exec = \opts arg -> do
         let file = valIdOpts "file" "_gftmp" opts
         writeFile file (toString arg)
         return void,
     flags = [("file","the output filename")] 
     })
  ]
 where
   lin opts t = unlines [linearize pgf lang t    | lang <- optLangs opts]
   par opts s = concat  [parse pgf lang (optCat opts) s | lang <- optLangs opts]
 
   void = ([],[])

   optLin opts t = case opts of 
     _ | isOpt "treebank" opts -> unlines $ (abstractName pgf ++ ": " ++ showExp t) :
          [lang ++ ": " ++ linea lang t | lang <- optLangs opts]
     _ -> unlines [linea lang t | lang <- optLangs opts] 
    where
     linea lang = case opts of
       _ | isOpt "all"    opts -> allLinearize pgf (mkCId lang)
       _ | isOpt "table"  opts -> tableLinearize pgf (mkCId lang)
       _ | isOpt "term"   opts -> termLinearize pgf (mkCId lang)
       _ | isOpt "record" opts -> recordLinearize pgf (mkCId lang)
       _  -> linearize pgf lang


   optLangs opts = case valIdOpts "lang" "" opts of
     "" -> languages pgf
     lang -> [lang]
   optLang opts = head $ optLangs opts ++ ["#NOLANG"] 
   optCat opts = valIdOpts "cat" (lookStartCat pgf) opts
   optNum opts = valIntOpts "number" 1 opts
   optNumInf opts = valIntOpts "number" 1000000000 opts ---- 10^9

   fromTrees ts = (ts,unlines (map showExp ts))
   fromStrings ss = (map EStr ss, unlines ss)
   fromString  s  = ([EStr s], s)
   toStrings ts = [s | EStr s <- ts] 
   toString ts = unwords [s | EStr s <- ts] 

   prGrammar opts = case valIdOpts "printer" "" opts of
     "cats" -> unwords $ categories pgf
     v -> prPGF (read v) pgf (prCId (absname pgf))

   morphos opts s = 
     [lookupMorpho (buildMorpho pgf (mkCId la)) s | la <- optLangs opts]

   -- ps -f -g s returns g (f s)
   stringOps opts s = foldr app s (reverse (map prOpt opts)) where
     app f = maybe id id (stringOp f) 
