module Main (main) where

fib :: Int -> Int

fib n =  if (n<=1) then 1 else fib (n-1) + fib (n-2)

main = print(fib(45))
