module Blueprint where
import Prelude
{- 
 - Implementieren Sie eine Funktion, die direktes Aufeinanderfolgen des gleichen Wertes
 - in einer Liste zu jeweils einem einzigen Eintrag zusammenfasst, also zum Beispiel
 - compress [1,3,3,3,2,4,4,2,4] = [1,3,2,4,2,4].
 -}

compress :: [Int] -> [Int]
compress [] = []
compress [a] = [a]
compress (x:y:xs) = if x==y then compress (x:xs) else (x:(compress(y:xs)))
