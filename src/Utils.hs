{-
-- EPITECH PROJECT, 2017
-- FUN_deBruijn_2017
-- File description:
-- Utils Module
-}

module Utils
    ( getWords
    , isDeBruijnSequence
    , areUniques
    ) where

import Prelude hiding(sequence)
import DeBruijn
import Data.List hiding(words)

getWords :: Int -> [a] -> [[a]]
getWords size xs = extractWords xs'
    where
        xs' = xs ++ take (size - 1) xs
        extractWords xs''
            | length xs'' == size   = [take size xs'']
            | otherwise             = take size xs'' : extractWords (drop 1 xs'')


isDeBruijnSequence :: Int -> String -> String -> Bool
isDeBruijnSequence order alphabet sequence = reference == words
    where
        reference   = sort (getWords order . deBruijn order $ alphabet)
        words       = sort (getWords order sequence)

areUniques :: (Ord a) => [a] -> Bool
areUniques xs = uniqueCheck sorted (drop 1 sorted)
    where
        sorted = sort xs
        uniqueCheck (x:xs) (x':xs') = if x /= x' then uniqueCheck xs xs' else False
        uniqueCheck [] _   = True
        uniqueCheck _ []   = True
