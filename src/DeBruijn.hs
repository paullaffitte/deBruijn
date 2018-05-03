{-
-- EPITECH PROJECT, 2017
-- FUN_deBruijn_2017
-- File description:
-- DeBruijn module
-}

module DeBruijn
    ( deBruijn
    , lyndonWord
    ) where

import Prelude hiding(sequence)

deBruijn :: Int -> String -> String
deBruijn order alphabet = [ alphabet !! x | x <- sequence]
    where
        base        = length alphabet
        sequence    = duval base order

duval :: Int -> Int -> [Int]
duval base order = concat (filter (\xs -> mod order (length xs) == 0) (lyndonWords base order [[0]]))

lyndonWords :: Int -> Int -> [[Int]] -> [[Int]]
lyndonWords base order prevWords
    | word == []    = prevWords
    | otherwise     = lyndonWords base order (prevWords ++ [word])
        where word  = lyndonWord base order (last prevWords)

lyndonWord :: Int -> Int -> [Int] -> [Int]
lyndonWord base order prevWord = incr (dropZ word)
    where
        word    = take order (cycle prevWord)
        dropZ xs
            | length xs /= 0 && last xs == (base - 1) = dropZ (init xs)
            | otherwise = xs
        incr :: [Int] -> [Int]
        incr [] = []
        incr xs = (init xs) ++ [last xs + 1]
