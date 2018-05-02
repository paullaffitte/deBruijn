{-
-- EPITECH PROJECT, 2017
-- FUN_deBruijn_2017
-- File description:
-- DeBruijn module
-}

module DeBruijn
    ( deBruijn
    ) where

updateElem :: Int -> a -> [a] -> [a]
updateElem i x xs = take i xs ++ x : drop (i + 1) xs

deBruijn :: Int -> String -> IO String
deBruijn order alphabet = do
    print "bruijn"
    return [ alphabet !! x | x <- bruijn]
    where
        base    = length alphabet
        bruijn  = snd (db 1 1 [] (replicate (order * base) 0))
        db :: Int -> Int -> [Int] -> [Int] -> ([Int], [Int])
        db t p bruijn' a
            | t <= order        = ([], []) -- TODO
            | mod order p == 0  = (bruijn' ++ take t a, a)
            | otherwise         = (bruijn', a)
                where
                    aBrujin = db (t + 1) p bruijn' (updateElem t (a !! (t - p)) a)

