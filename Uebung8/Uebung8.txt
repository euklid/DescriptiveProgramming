f :: [Int] -> [Int] -> [Int]
f []    [] = []
f []    ys = f [head ys] []
f (x:xs) ys = if null ys
              then [1]
              else g (x+1) 3:f (tail xs) [0]
              
g :: Int -> Int -> Int
g 4 y = 3
g x y = y +y

----------------------

    f [1,2] [3]
=       { applying f }
    if null 3 then [1] else g (1 + 1) 3 : f ( tail [2] ) [0]
=       { applying null }
    if False then [1] else g (1 + 1) 3 : f ( tail [2] ) [0]
=       { applying else }
    g (1+1) 3 : f (tail [2]) [0]
=       { applying g}
    (3 + 3) : f(tail [2]) [0]
=       { applying + }
    6 : f (tail [2]) [0]
=       { applying tail}
    6 : f [] [0]
=       { applying f}
    6 : f [head [0]] []
=       { applying head }
    6 : f [0] []
=       { appliying f }
    6 : (if null [] then [1] else g (0 +1) 3 : f (tail [] ) [0] )
=       { applying null }
    6 : (if True then [1] else g (0 +1) 3 : f (tail [] ) [0] )
=       { applying then }
    6 : [1]
=       { applying : }
    [6,1]
