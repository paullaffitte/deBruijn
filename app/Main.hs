module Main where

import Control.Monad
import System.Console.GetOpt
import System.Environment(getArgs, getProgName)

data Options = Options
    { argOrder :: Int
    , argAlphabet :: String
    , optCheck :: Bool
    , optUnique :: Bool
    , optClean :: Bool
    } deriving Show

options :: [OptDescr (Options -> Either String Options)]
options =
    [ Option ['c'] ["check"] (NoArg (\opts -> Right opts { optCheck = True })) "checks if a sequence is a de Bruijn sequence,"
    , Option ['u'] ["unique"] (NoArg (\opts -> Right opts { optUnique = True })) "number of suits"
    , Option [] ["clean"] (NoArg (\opts -> Right opts { optClean = True })) "verbose output"
    ]

defaultOptions:: Options
defaultOptions = Options
    { argOrder      = 3
    , argAlphabet   = "01"
    , optCheck      = False
    , optUnique     = False
    , optClean      = False
    }

parseArgs :: IO (Either String Options)
parseArgs = do
    argv <- getArgs
    progName <- getProgName
    let header = "USAGE: " ++ progName ++ " n [a] [--check|--unique|--clean]"
    let usage = usageInfo header options
    case getOpt RequireOrder options argv of
        (opts, [], []) -> case foldM (flip id) defaultOptions opts of
            Right opts'         -> return (Right opts')
            Left errorMessage   -> return (Left (errorMessage ++ "\n" ++ usage))
        (_, _, _) -> return (Left (usage :: String))

main :: IO ()
main = do
    opts <- parseArgs
    case opts of
        Right opts'         -> print $ show opts' 
        Left errorMessage   -> putStr errorMessage
