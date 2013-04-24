module Blueprint where
import Prelude

{-
 - Schreiben Sie (selbst) zwei syntaktisch deutlich verschiedene Varianten einer
 - Funktion 'sgn', die fuer eine gegebene Zahl deren Signum (also: 1, 0 oder -1)
 - liefert. Experimentieren Sie zum Beispiel mit explizitem if-then-else, mit
 - Konstanten in Parameterpositionen wie bei fac und ack, mit Guards, ...).
 -}

sgn1 :: Int -> Int
sgn1 num | num == 0 = 0
         | num > 0 = 1
         | otherwise = -1

sgn2 :: Int -> Int
sgn2 num = if num==0 then 0
                     else (if num<0 then -1 else 1)
