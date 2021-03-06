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

 
dialog :: [Int] -> Int -> IO()
dialog [] 0 = do putStr "How many numbers you want to sum up?: "
                 s <- getLine
                 dialog [] (read s)
dialog xs n = do putStr ("your next number (" ++ (show n) ++ " remain): " )
                 s <- getLine
                 let k = read s
                 if n==1 
                    then do putStr ("The sum of your " ++ (show (1+ length xs)) ++ " numbers is: ")
                            print ( foldr (+) 0 (k:xs) )
                    else dialog (k:xs) (n-1)

main :: IO ()
main = do dialog [] 0

