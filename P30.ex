defmodule P30 do

  def solve() do
    max = 6 * round(:math.pow(9,5))
    2..max |> Enum.map(&is_fifth_power/1) |> Enum.reduce(&(&1+&2))
  end

  def is_fifth_power(x) do
    parts = get_parts(x)
    fifth_power = parts |> Enum.map(&(:math.pow(&1,5))) |> Enum.reduce(&(&1+&2))
    case x == fifth_power do
      true -> x
      false -> 0
    end
  end

  def get_parts(x) do
    get_parts(x, [], Float.floor(:math.log10(x)))
  end

  def get_parts(x, parts, iter) do
    cond do
      iter <= 0 ->
        parts ++ [x]
      true ->
        get_parts(rem(x, round(:math.pow(10, iter))), parts ++ [div(x, round(:math.pow(10, iter)))], iter - 1)
    end
  end

end
