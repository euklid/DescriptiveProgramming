module Blueprint where
import Prelude

{- 
 - Eine Block-Quersumme fasst jeweils mehrere Ziffern vor Summation
 - zusammen, bei der letzten Stelle beginnend. Zum Beispiel ist die
 - 3-Block-Quersumme von 1234567 die Zahl 1 + 234 + 567 = 802.
 - Eine alternierende Quersumme wechselt Addition und Subtraktion
 - ab, und zwar so, dass insgesamt keine negative Zahl entsteht.
 - Zum Beispiel ist die alternierende 3-Block-Quersumme von 1234567
 - die Zahl 1 - 234 + 567 = 334, waehrend sich die alternierende
 - 2-Block-Quersumme von 54321 als -5 + 43 - 21 = 17 ergibt.
 - 
 - Schreiben Sie eine Funktion, die so generalisierte Quersummen
 - von natuerlichen Zahlen berechnet. Die Funktion wird gesteuert
 - ueber Argumente fuer die Blocklaenge und (als Boolescher Wert)
 - fuer die Angabe, ob oder ob nicht alternierend gerechnet wird.
 - Also zum Beispiel:
 - 
 -   gen_quer 3 False 1234567 = 802
 -   gen_quer 3 True  1234567 = 334
 -   gen_quer 2 True  54321   = 17
 -}

gen_quer :: Integer -> Bool -> Integer -> Integer
gen_quer a False b = if b<10^a then b else s + gen_quer a False t where (s,t)=(b `mod` 10^a, b `div` 10^a)
gen_quer a True b = undefined
