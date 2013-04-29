module Blueprint where
import Prelude

elems :: [Int] -> [Int]
elems = foldr (\x ys -> if nelem x ys then ys else x:ys) []

nelem :: Int -> [Int] -> Bool
nelem x = foldr (\y b -> if x == y then True else b) False
