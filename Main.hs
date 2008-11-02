module Main where

import Lexer
import Parser

reduceTree :: Exp -> Int
reduceTree e =
    case e of
        Term a     -> a
        Expr a b c -> (reduceTree a) + (reduceTree c)
        otherwise  -> 0

main = do
    s <- getContents
    let parsed = (parse . lexer) s
    let x = reduceTree parsed
    print x
