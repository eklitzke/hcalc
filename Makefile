hcalc: Lexer.hs Parser.hs Main.hs
	ghc --make Main.hs -o hcalc

Lexer.hs: Lexer.x
	alex -g Lexer.x

Parser.hs: Parser.y Lexer.hs
	happy Parser.y

clean:
	-rm -f Lexer.hs Parser.hs *.o *.hi hcalc

.PHONY: clean
