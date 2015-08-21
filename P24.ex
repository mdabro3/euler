defmodule P24 do

  def solve do
    sequence = [0,1,2,3,4,5,6,7,8,9]
    solve(sequence, 1000000-1)
  end

  def solve(sequence, 0) do
    sequence
  end

  def solve([], _) do
    []
  end

  def solve(sequence, n) do
    count = Enum.count(sequence)
    if n >= factorial(count) do
      raise ArgumentError, message: "not as many permutations exist as requested"
    end
    fact = factorial(count - 1)
    d = div n, fact
    r = rem n, fact
    item = Enum.fetch!(sequence, d)
    sequence = sequence -- [item]
    [item] ++ solve(sequence, r)
  end

  def factorial(n) do
    factorial(n, n-1)
  end

  def factorial(0, _) do
    1
  end

  def factorial(n, i) when i<= 1 do
    n
  end

  def factorial(n, i) do
    factorial(n*i, i-1)
  end

end
