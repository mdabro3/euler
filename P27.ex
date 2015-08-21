defmodule P27 do

  import SieveOfEratosthenes

  def consecutive_primes(a, b, sieve) do
    consecutive_primes(a, b, sieve, 0)
  end

  def consecutive_primes(a, b, sieve, n) do
    check = (n*n) + (a*n) + b
    if sieve[check]==1 do
      consecutive_primes(a, b, sieve, n+1)
    else
      n
    end
  end

  def solve(n) do
    sieve = SieveOfEratosthenes.build(n*10)
    sieve = Map.put(sieve, 1, 1)
    positive_list = Enum.reduce(1..n, [], fn(x, acc) -> if sieve[x]==1 do acc ++ [x] else acc end end)
    negative_list = Enum.map(positive_list, fn(x) -> x * -1 end)
    full_list = positive_list ++ negative_list
    field = for x <- full_list, y <- full_list, do: {x,y}
    lengths = Enum.map(field, fn(x) -> consecutive_primes(elem(x,0), elem(x,1), sieve) end)
    max = Enum.max(lengths)
    max_index = Enum.find_index(lengths, fn(x) -> x==max end)
    {a,b} = Enum.at(field, max_index)
    a * b
  end

  def solve() do
    solve(1000)
  end

end
