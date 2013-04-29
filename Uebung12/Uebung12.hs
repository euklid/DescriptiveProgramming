module Blueprint where 
import Prelude  

data Tree = Leaf Int | Node [Tree] Int  

tasktree = Node [ Node [Leaf 6] 1, Leaf 8, Node [Leaf 1, Leaf 4] 2] 5 -- Tree from Task (a)  

inTree :: Int -> Tree -> Bool
inTree num (Leaf a) = a==num
inTree num (Node list a) = if(a==num) then True else foldr (||) False (map (inTree num) list)
