function fib(n)
  if n <= 1
    return 1
  end
  fib(n-1)+fib(n-2)
end

println(fib(45))

