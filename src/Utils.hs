{-
-- EPITECH PROJECT, 2017
-- FUN_deBruijn_2017
-- File description:
-- Utils Module
-}

module Utils
    ( getWords
    , isDeBruijnSequence
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
