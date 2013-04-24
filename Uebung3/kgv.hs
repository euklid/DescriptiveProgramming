module Blueprint where
import Prelude

{-
 - Geben Sie eine Haskell-Spezifikation zur Ermittlung des kleinsten
 - gemeinsamen Vielfachen zweier natuerlicher Zahlen an.
 - (Erhalten Sie dabei die Typsignatur.)
 -}

kgv :: Int -> Int -> Int
kgv a b = a*b `div` (ggt a b)

ggt :: Int -> Int -> Int
ggt a 0 = a
ggt 0 a = a
ggt a b = if a>b then ggt (a-b) b else ggt a (b-a)
