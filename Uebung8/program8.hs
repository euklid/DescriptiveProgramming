f :: [Int] -> [Int] -> [Int]
f []    [] = []
f []    ys = f [head ys] []
f (x:xs) ys = if null ys
              then [1]
              else g (x+1) 3:f (tail xs) [0]
              
g :: Int -> Int -> Int
g 4 y = 3
g x y = y +y
