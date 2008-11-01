{
module Main (main) where
}

%wrapper "basic"

$digit = 0-9

tokens :-
	
	$white+        ;
	"#".*          ;
	"("            { \s -> LParen }
	")"            { \s -> RParen }
	$digit+        { \s -> Int (read s) }
	[\+\-\*\/]     { \s -> Operator (head s) }

{
data Token =
	LParen |
	RParen |
	Int Int |
	Op Char
	deriving (Eq, Show)

main = do s <- getContents
          print (alexScanTokens s)
}
