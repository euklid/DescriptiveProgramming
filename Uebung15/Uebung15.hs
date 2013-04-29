module Blueprint where
import Prelude

{- Gegeben sei folgender Datentyp: -}

data Tree a = Leaf a | Node (Tree a) a (Tree a)

{- Geben Sie eine geeignete Typklasseninstanzdefinition fuer die wie folgt:
 -
 -   class Show a where
 -     show :: a -> String
 -
 - deklarierte Typklasse Show an.
 -}

instance Show a => Show (Tree a) where
    show (Leaf a) = show a;
    show (Node a b c) = "[" ++ show b ++"[" ++ show a  ++ "]["  show c ++ "]]"


test = show (Leaf 1) /= show (Leaf 2)
