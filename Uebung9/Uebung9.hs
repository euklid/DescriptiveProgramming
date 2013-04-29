module Blueprint where
import Prelude

{- Informieren Sie sich auf http://www.haskell.org/hoogle/ ueber die
 - Datentypkonstruktoren Maybe und Either.
 - 
 - Geben Sie dann konkrete, verschiedene Werte mit folgenden Typen an:
 -}

wert1 :: Either ([Int],Bool) Bool
wert1 = Left ([3], False)

wert2 :: Either ([Int],Bool) Bool
wert2 = Right False

wert3 :: Either ([Int],Bool) Bool
wert3 = Left ([5], True)

wert4 :: (Maybe Bool, Either (Maybe Bool, Int) (Int, Maybe Int))
wert4 = (Nothing, Left (Just True, 7))

wert5 :: Maybe (Either (Int,Maybe Int) (Maybe Bool, Int))
wert5 = Nothing

wert6 :: Maybe (Either (Int,Maybe Int) (Maybe Bool, Int))
wert6 = Just ( Left (3, Just 4))
