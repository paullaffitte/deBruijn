module Main (main) where

import Control.Monad
import System.Console.GetOpt
import System.Environment(getArgs)

data Options = Options
    { argOrder :: Int
    , argAlphabet :: String
    , flag :: Flag
    } deriving Show

data Flag = Check | Unique | Clean | ShowUsage
    deriving (Eq, Show, Bounded, Enum)

usage :: String
usage = usageInfo "USAGE: ./deBruijn n [a] [--check|--unique|--clean]" options

options :: [OptDescr (Options -> Either String Options)]
options =
    [ Option ['c'] ["check"] (NoArg (\opts -> Right opts { flag = Check })) "checks if a sequence is a de Bruijn sequence,"
    , Option ['u'] ["unique"] (NoArg (\opts -> Right opts { flag = Unique })) "number of suits"
    , Option [] ["clean"] (NoArg (\opts -> Right opts { flag = Clean })) "verbose output"
    , Option ['h'] ["help"] (NoArg Right) "verbose output"
    ]

defaultOptions:: Options
defaultOptions = Options
    { argOrder      = 3
    , argAlphabet   = "01"
    , flag          = ShowUsage
    }

parseArgs :: IO (Either String Options)
parseArgs = do
    argv <- getArgs
    case getOpt RequireOrder options argv of
        (opts, [], []) -> case foldM (flip id) defaultOptions opts of
            Right opts'         -> return (Right opts')
            Left errorMessage   -> return (Left (errorMessage ++ "\n" ++ usage))
        (_, _, _) -> return (Left usage)

main :: IO ()
main = do
    opts <- parseArgs
    case opts of
        Right opts'         -> print $ show opts' 
        Left errorMessage   -> putStr errorMessage
