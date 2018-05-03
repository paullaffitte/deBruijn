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
        Left errorMessage -> putStr errorMessage
        Right opts'     -> case (flag opts') of
            Check       -> check    order alphabet
            Unique      -> unique   order alphabet
            Clean       -> clean    order alphabet
            otherwise   -> do putStrLn (deBruijn order alphabet)
            where
                order = (argOrder opts')
                alphabet = (argAlphabet opts')
