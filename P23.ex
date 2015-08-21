defmodule P23 do

  def solve do
    abundants = 1..28123 |> Enum.filter(&is_abundant?/1)
    fun_filter = &not_sum_of_abundants?(&1, abundants)
    solution = 1..28123 |> Enum.filter(fun_filter) |> Enum.reduce(0, &+/2)
  end

  def not_sum_of_abundants?(n, abundants) do
    not_sum_of_abundants?(n, abundants, abundants)
  end

  def not_sum_of_abundants?(n, [head|rest], abundants) do
    cond do
      head > n -> true
      (n-head) in abundants -> false
      true -> not_sum_of_abundants?(n, rest, abundants)
    end
  end

  def is_abundant?(n) do
    temp = d(n)
    if Enum.empty?(temp) do
      temp = 0
    else
      temp = Enum.reduce( d(n), &(&1 + &2) )
    end
    if temp > n do
      true
    else
      false
    end
  end

  def d(n) when n<=0 do
    []
  end

  def d(n) do
    d(n, 2, [1])
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
