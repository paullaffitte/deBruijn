{-
-- EPITECH PROJECT, 2017
-- FUN_deBruijn_2017
-- File description:
-- Main module
-}

module Main (main) where

import Parser
import Flags
import DeBruijn

main :: IO ()
main = do
    opts <- parseCommand
    case opts of
        Right opts'     -> case (flag opts') of
            Check       -> putStrLn check
            Unique      -> putStrLn unique
            Clean       -> putStrLn clean
            otherwise   -> do bruijn <- deBruijn (argOrder opts') (argAlphabet opts'); putStrLn bruijn
        Left errorMessage -> putStr errorMessage
