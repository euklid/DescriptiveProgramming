module Blueprint where
import Prelude --hiding (IO(..), getChar, getLine, readLn, 
                --       putChar, putStr, putStrLn, print)
--import Test.IOSpec
--import IOTestHelper
--type IO = IOSpec Teletype

{- Schreiben Sie ein Programm, das solange (auch negative) ganze Zahlen einliest,
 - bis sich die zwei zuletzt eingegebenen Zahlen zu Null summieren. Nach vollstaendig 
 - beendeter Eingabe soll das Programm die Anzahl derjenigen eingegebenen Zahlen 
 - ausgeben, welche groesser Null und durch drei teilbar sind. (Dabei sollen auch die 
 - beiden letzten Eingaben mit beruecksichtigt werden.)
 - 
 - Beachten Sie, dass Ihr Programm immer mindestens zwei Zahlen einlesen muss bevor es 
 - terminieren kann.
 -   
 - Ein Beispiel: fuer die Eingaben 4, 3, -3 ist die korrekte Ausgabe 1. Denn das 
 - Programm bricht ab, da 3 + (-3) = 0; und die Ausgabe ist 1, da allein 3 als positive 
 - durch drei teilbare Zahl eingegeben wurde.
 - 
 - Als IO-Primitiven stehen Ihnen die oben aufgelisteten (sowie return) zur Verfuegung.
 - Zum Ausprobieren Ihrer Loesung ausserhalb Autotools entfernen Sie einfach die obigen 
 - Zeilen komplett.
 -}

evaluate :: [Int] -> Int
evaluate [] = 0
evaluate (x:xs) = if (x>0 && (x `mod` 3 == 0)) then 1 + evaluate xs else evaluate xs
 
dialog :: [Int] -> IO()
dialog [] = do putStr "your number:"
               s <- getLine
               dialog ((read s):[])
dialog (x:xs) = do putStr "your next number:"
                   s <- getLine
                   let k = read s
                   if k + x == 0 then print $ evaluate (k:(x:xs))
                                 else dialog (k:(x:xs)) 

main :: IO ()
main = do dialog []

