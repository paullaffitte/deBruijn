{-
-- EPITECH PROJECT, 2017
-- FUN_deBruijn_2017
-- File description:
-- Main module
-}

module Main (main) where

import Parser
import DeBruijn

main :: IO ()
main = do
    opts <- parseCommand
    case opts of
        Right opts'         -> do bruijn <- deBruijn (argOrder opts') (argAlphabet opts'); putStrLn bruijn
        Left errorMessage   -> putStr errorMessage
