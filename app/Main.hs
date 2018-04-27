{-
-- EPITECH PROJECT, 2017
-- FUN_deBruijn_2017
-- File description:
-- Main module
-}

module Main (main) where

import Parser

main :: IO ()
main = do
    opts <- parseCommand
    case opts of
        Right opts'         -> print $ show opts' 
        Left errorMessage   -> putStr errorMessage
