{
module Parser where

import Lexer
}

%name parse
%tokentype { Token }
%error { parseError }

%token
	oper       { Operator $$ }
	int        { Int $$ }

%%

Exp  : int oper int    { Expr (Term $1) (Operator $2) (Term $3) }
	 | Exp oper int    { Expr $1 (Operator $2) (Term $3) }
	 | int oper Exp    { Expr (Term $1) (Operator $2) $3 }
	 | Exp oper Exp    { Expr $1 (Operator $2) $3 }

Term : int             { Term $1 }

{

parseError :: [Token] -> a
parseError _ = error "Parse error"

data Exp =
      Expr Exp Token Exp
    | Term Int
    deriving (Show)
}
