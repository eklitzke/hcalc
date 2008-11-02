module Main where

import Prelude hiding (lex)
import Lexer
import Parser

reduceExp :: Exp -> Int
reduceExp e =
    case e of
        Plus   a b -> (reduceExp a) + (reduceExp b)
        Minus  a b -> (reduceExp a) - (reduceExp b)
        Times  a b -> (reduceExp a) * (reduceExp b)
        Div    a b -> (reduceExp a) `div` (reduceExp b)
        Paren  a   -> reduceExp a
        Negate a   -> negate $ reduceExp a
        Intg   a   -> a

main = getContents >>= print . reduceExp . parse . lex
