hcalc: Lexer.hs Parser.hs Main.hs
	ghc -O2 --make Main.hs -o hcalc

Lexer.hs: Lexer.x
	alex -g Lexer.x

Parser.hs: Parser.y Lexer.hs
	happy -a -c -g -s Parser.y

clean:
	-rm -f Lexer.hs Parser.hs *.o *.hi hcalc

.PHONY: clean
