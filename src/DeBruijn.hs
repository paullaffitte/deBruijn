{-
-- EPITECH PROJECT, 2017
-- FUN_deBruijn_2017
-- File description:
-- DeBruijn module
-}

module DeBruijn
    ( deBruijn
    ) where

deBruijn :: Int -> String -> [String]
deBruijn 1 alphabet = [ [a] | a <- alphabet]
deBruijn order alphabet = [ a:b | a <- alphabet, b <- low]
    where low = deBruijn (order - 1) alphabet
