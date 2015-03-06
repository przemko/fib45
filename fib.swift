func fib(n: Int) -> Int {
  if n <= 1 {
    return 1
  }
  return fib(n-1) + fib(n-2)
}

println(fib(45))
