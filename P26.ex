defmodule P26 do

  def reciprocal_length(0) do
    0
  end

  def reciprocal_length(n) do
    reciprocal_length(n, %{}, 1) 
  end

  def reciprocal_length(n, m, r) when n > r do
    reciprocal_length(n, m, r*10)
  end

  def reciprocal_length(n, m, r) do
    remainder = rem(r, n)
    cond do
      remainder == 0 ->
        Map.size(m)
      m[remainder] == 1 ->
        Map.size(m)
      true ->
        reciprocal_length(n, Map.put(m, remainder, 1), remainder)
    end
  end

  def solve() do
    solve(1000)
  end

  def solve(n) do
    lengths = 0..n |> Enum.map(&reciprocal_length/1)
    max = lengths |> Enum.max()
    Enum.find_index(lengths, fn(x) -> x == max end)
  end

end
