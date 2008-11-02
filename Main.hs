module Main where

import Prelude hiding (lex)
import Lexer
import Parser

reduceTree :: Exp -> Int
reduceTree (Term a) = a
reduceTree (Expr a b c) =
    let a' = reduceTree a
        c' = reduceTree c in
    case b of
        Operator '+' -> a' + c'
        Operator '-' -> a' - c'
        Operator '*' -> a' * c'
        Operator '/' -> a' `div` c'

main = getContents >>= print . reduceTree . parse . lex
