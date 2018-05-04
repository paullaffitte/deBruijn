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

printOKKO :: Bool -> IO ()
printOKKO condition = putStrLn $ if condition then "OK" else "KO"

check :: Int -> String -> IO ()
check order alphabet = do
    userInput <- getLine
    printOKKO $ checkSequence userInput
        where checkSequence = isDeBruijnSequence order alphabet

unique :: Int -> String -> IO ()
unique order alphabet = do
    lseq <- getLine
    rseq <- getLine
    printOKKO (checkSequence lseq && checkSequence rseq && (not $ areEquivalents lseq rseq))
        where checkSequence = isDeBruijnSequence order alphabet

clean :: Int -> String -> IO ()
clean order alphabet = putStrLn "clean"