{-
-- EPITECH PROJECT, 2017
-- FUN_deBruijn_2017
-- File description:
-- Flags Module
-}

module Flags
    ( check
    , unique
    , clean
    ) where

import Utils

check :: Int -> String -> IO ()
check order alphabet = do
    userInput <- getLine
    putStrLn $ if checkSequence userInput then "OK" else "KO"
        where checkSequence = isDeBruijnSequence order alphabet

unique :: Int -> String -> IO ()
unique order alphabet = putStrLn "unique"

clean :: Int -> String -> IO ()
clean order alphabet = putStrLn "clean"