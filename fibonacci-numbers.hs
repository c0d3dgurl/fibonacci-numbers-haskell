-- 1.1 Recursive Fibonacci
-- fiboN Integer returns the nth Fibonacci number.
-- fiboN 0 = 0 and fiboN 1 = 1 is to return a number for that doesn't require calculation.
-- in other case calculate the nth Fibonacci number recursively
fiboN :: Integer -> Integer
fiboN n | n==0      = 0
        | n==1      = 1
        | otherwise = fiboN(n-1) + fiboN(n-2)

-- 1.2 Fibonacci Stream
-- tail fiboStream returns list of tail, and zip it with fibostream will create list [(0, 1), (1, 1)...]
-- Then map it with function (\(x, y) -> (x + y)) will change list to [1, 2, 3, 5...]
-- therefore result will be 0:1:1:2:3:5...
fiboStream :: [Integer]
fiboStream = 0 : 1 : map (\(x, y) -> (x + y)) (zip fiboStream (tail fiboStream))

-- 1.3 Performance
-- stream-base version is so much more performant becuase it does not do unnecessary calculation.
-- But fiboN has to do fiboN(n-1) + fiboN(n-2) everytime so it requires a lot of calculation if n is big. Amount of calculation is 2^1 + .... + 2^n.
