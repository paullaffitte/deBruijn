{-
-- EPITECH PROJECT, 2017
-- FUN_deBruijn_2017
-- File description:
-- DeBruijn module
-}

module DeBruijn
    ( deBruijn
    ) where

type Context = ([Int], [Int])

updateElem :: Int -> a -> [a] -> [a]
updateElem i x xs = take i xs ++ x : drop (i + 1) xs

mergeContext :: ([a], [a]) -> ([a], [a]) -> ([a], [a]) 
mergeContext a b = (fst a ++ fst b, snd b)

deBruijn :: Int -> String -> IO String
deBruijn order alphabet = do
    print context
    return [ alphabet !! x | x <- bruijn]
    where
        base    = length alphabet
        bruijn  = snd context
        context = db order base 1 1 ([], replicate (order * base) 0)

db :: Int -> Int -> Int -> Int -> Context -> Context
db order base t p context
    | t <= order        = mergeContext dbRet genRet
    | mod order p == 0  = (bruijn ++ take t a, a)
    | otherwise         = (bruijn, a)
        where
            letter  = a !! (t - p)
            bruijn  = fst context
            a       = snd context
            a'      = updateElem t letter a
            dbRet   = db order base (t + 1) p (bruijn, a')
            genRet  = generate order base t (letter + 1) (mergeContext (bruijn, a') dbRet)

generate :: Int -> Int -> Int -> Int -> Context -> Context
generate order base t letter context
    | letter < base = mergeContext dbRet genRet
    | otherwise     = ([], [])
    where
        bruijn      = fst context
        a           = snd context
        a'          = updateElem t letter a
        dbRet       = db order base (t + 1) t (bruijn, a')
        genRet      = generate order base t (letter + 1) (mergeContext (bruijn, a') dbRet)
