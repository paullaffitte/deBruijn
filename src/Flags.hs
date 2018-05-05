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

import Prelude hiding(lines)
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

getLines :: IO [String]
getLines = do lines <- readLines []; return $ reverse lines
    where
        readLines :: [String] -> IO [String]
        readLines xs = do
            x <- getLine
            checkLine (x : xs)
        checkLine :: [String] -> IO [String]
        checkLine xs
            | head xs == "END"  = return $ tail xs
            | otherwise         = readLines xs

clean :: Int -> String -> IO ()
clean order alphabet = do
    lines <- getLines
    putStr $ foldr (\x y -> x ++ "\n" ++ y) "" (filterNotDeBruijn $ filter2 (\x y -> not $ areEquivalents x y) lines)
    where
        filterNotDeBruijn xs = [ x | x <- xs, isDeBruijnSequence order alphabet x ]
