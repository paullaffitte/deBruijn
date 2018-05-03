{-
-- EPITECH PROJECT, 2017
-- FUN_deBruijn_2017
-- File description:
-- DeBruijn module
-}

module DeBruijn
    ( deBruijn
    ) where

import Prelude hiding(sequence)

deBruijn :: Int -> String -> IO String
deBruijn order alphabet = return [ alphabet !! x | x <- sequence]
    where
        base        = length alphabet
        sequence    = duval base order

duval :: Int -> Int -> [Int]
duval base order = concat (filter (\xs -> mod order (length xs) == 0) (lyndonWords base order [[0]]))

lyndonWords :: Int -> Int -> [[Int]] -> [[Int]]
lyndonWords base order prevWords
    | last prevWords == []    = init prevWords
    | otherwise     = lyndonWords base order (prevWords ++ [incr (dropZ word)])
    where
        word        = take order (cycle (last prevWords))
        incr :: [Int] -> [Int]
        incr []     = []
        incr xs     = (init xs) ++ [last xs + 1]
        dropZ xs
            | length xs /= 0 && last xs == (base - 1) = dropZ (init xs)
            | otherwise = xs
