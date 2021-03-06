module Blueprint where
import Prelude
import Data.Maybe
import Test.QuickCheck

{- Betrachten Sie folgenden Datentyp: -}

data Bit = O | I  deriving (Eq, Show)

{- und schreiben Sie Funktionen, um Werte des Typs [Either Bool Bool]
 - im Sinne einer Serialisierung in eine Sequenz von Bits umzuwandeln
 - und zurueck.
 -
 - Das heisst, schreiben Sie eine *injektive* Funktion:
 -}

encode :: [Either Bool Bool] -> [Bit]
encode [] = []
encode (x:xs) = (decide x !! 0) : (decide x !! 1) : encode xs where
  decide x | x == Left True = [I,I]
           | x == Left False = [I,O]
           | x == Right True = [O,I]
           | x == Right False = [O,O]

{- welche aus jeder Liste des Typs [Either Bool Bool] eine Liste des
 - Typs [Bit] macht, sowie eine Funktion:
 -}

decode :: [Bit] -> Maybe [Either Bool Bool]
decode [] = Just []
decode (x) = if (length (x) `mod` 2 == 0) then Just (makelist x) else Nothing where 
    makelist [] = []
    makelist (x:y:xs) = redecide x y : makelist xs where
        redecide x y    | [x,y] == [I,I] = Left True
                        | [x,y] == [I,O] = Left False
                        | [x,y] == [O,I] = Right True
                        | [x,y] == [O,O] = Right False

{- welche aus jeder Liste des Typs [Bit], die mittels encode erzeugt
 - werden kann, einen Wert 'Just l' macht, wobei l gerade die Ursprungs-
 - liste vor Anwendung von encode ist. Die Funktion decode soll genau
 - dann den Wert 'Nothing' liefern, wenn fuer die gegebene [Bit]-Liste
 - keine entsprechende Ursprungsliste des Typs [Either Bool Bool]
 - existiert.
 -
 - Mit anderen Worten, die den folgenden beiden Tests entsprechenden
 - allgemeinen Aussagen sollen gelten:
 -  
 - (aufzurufen als "quickCheck test1" bzw. "quickCheck test2")
 -}

test1 = \v -> decode (encode v) == Just v

test2 = \c -> let mv = decode c 
              in (mv /= Nothing)
                 ==> encode (fromJust mv) == c

{- Folgende Typklasseninstanz wird nur benoetigt, um QuickCheck auf
 - die Spruenge zu helfen:
 -}

instance Arbitrary Bit where
  arbitrary = elements [O,I]
