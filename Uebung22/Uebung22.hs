module Blueprint where
import Prelude {-hiding (IO(..), getChar, getLine, readLn, 
                       putChar, putStr, putStrLn, print)
import Test.IOSpec
import IOTestHelper
type IO = IOSpec Teletype-}

{- Schreiben Sie ein Programm, das sich *exakt* wie folgendes C-Programm verhaelt, 
 - also genau die gleichen Ein-/Ausgabesequenzen abdeckt:
 - 
 - #include <stdio.h>
 - 
 - void main() {
 -   int x, y;
 -   scanf("%d", &x);
 -   y = 0;
 -   while (x > 0) {
 -     if (x % 2 == 0)
 -       x = x/3;
 -     else {
 -       scanf("%d", &x);
 -       y = y+1;
 -     }
 -     printf("%d\n", x);
 -   }
 -   printf("%d\n", y);
 - }
 - 
 - Sie koennen annehmen, dass keine negativen Zahlen eingegeben werden.
 - 
 - Bezueglich IO-Primitiven und Ausprobieren Ihrer Loesung ausserhalb Autotools 
 - gelten auch hier die Hinweise aus Aufgabe 20.
 -}

loop :: Int -> Int -> IO()
loop 0 y = do print y
loop x y = if (x `mod` 2 == 0) then do print (x `div` 3)
                                       loop (x `div` 3) y
                               else do s<-getLine
                                       let k=read s
                                       print (k :: Int)
                                       loop k (y+1)

main :: IO ()
main = do x <- getLine
          let fi = read x
          loop fi 0
