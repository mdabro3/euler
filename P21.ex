defmodule P21 do

  def solve do
    1..10000 |> Enum.map(&solve/1) |> Enum.reduce(&(&1 + &2))
  end

  def solve(n) do
    temp = Enum.reduce(d(n), 0, &+/2)
    if n != temp and n == Enum.reduce(d(temp), 0, &+/2) do
      n
    else
      0
    end
  end

  def d(n) do
    d(n, 1, [])
  end

  def d(n, i, divisors) when i > (n/2) do
    divisors
  end

  def d(n, i, divisors) do
    if (rem n, i) == 0 do
      divisors = divisors ++ [i]
    end
    d(n, i+1, divisors)
  end

end
