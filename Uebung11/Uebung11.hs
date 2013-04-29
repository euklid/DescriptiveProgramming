module Blueprint where
import Prelude
import Test.HUnit ((@?=),(~:),runTestTT,Test(TestList))
       -- ggfs. mit "cabal install hunit" installieren

{-
 - Definieren Sie zum algebraischen Datentyp:
 -}

data Tree = Leaf Int | Node Tree Int Tree  deriving Show

{-
 - drei allgemeine Funktionen:
 -}

midfix, prefix, postfix :: Tree -> [Int]
midfix (Leaf a) = [a]
midfix (Node a b c) = midfix a ++ [b] ++ midfix c
prefix (Leaf a) = [a]
prefix (Node a b c) = b: (prefix a ++ prefix c)
postfix (Leaf a) = [a]
postfix (Node a b c) = (postfix a ++ postfix c ) ++ [b]

{-
 - mit verschiedenen Traversierungsreihenfolgen, wie hier beispielhaft gezeigt:
 -}

test = -- runTestTT $ TestList
   [ "midfix"  ~: midfix  (Node (Node (Leaf 1) 2 (Leaf 3)) 4 (Leaf 5)) 
                    @?= [1, 2, 3, 4, 5]
   , "prefix"  ~: prefix  (Node (Node (Leaf 1) 2 (Leaf 3)) 4 (Leaf 5)) 
                    @?= [4, 2, 1, 3, 5]
   , "postfix" ~: postfix (Node (Node (Leaf 1) 2 (Leaf 3)) 4 (Leaf 5)) 
                    @?= [1, 3, 2, 5, 4]
   ]
