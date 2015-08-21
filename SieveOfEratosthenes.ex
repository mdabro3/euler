defmodule SieveOfEratosthenes do

  def build(n) do
    sieve = Enum.reduce(1..n, %{}, fn(x, acc) -> Map.put(acc, x, 1) end )
    sieve = Map.put(sieve, 1, 0)
    build_loop(sieve, n, 1)
  end

  def build_loop(sieve, n, i) do
    prime = find_next_prime(sieve, i)
    if prime == 0 do
      sieve
    else
      build_loop(remove_multiples(sieve, n, prime), n, prime)
    end
  end

  def remove_multiples(sieve, n, mult) do
    remove_multiples(sieve, n, mult, mult*2)
  end

  def remove_multiples(sieve, n, mult, count) do
    if count > n do
      sieve
    else
      remove_multiples(Map.put(sieve, count, 0), n, mult, count+mult)
    end
  end

  def find_next_prime(sieve, current) do
    case sieve[current + 1] do
      nil -> 0
      1 -> current + 1
      0 -> find_next_prime(sieve, current + 1)
    end
  end

end 
