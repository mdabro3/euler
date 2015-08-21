defmodule P31 do

  def solve() do
    coins = [1,2,5,10,20,50,100,200]
    combos = %{0 => 1}
    combos = 1..200 |> Enum.reduce(combos, &(Map.put(&2, &1, 0))) 
    combos = coins |> Enum.reduce(combos, &(fill_combos(&1, &2, 200)))
    combos[200]
  end

  def fill_combos(coin, combos, target) do
    fill_combos(coin, combos, target, coin)
  end

  def fill_combos(coin, combos, target, current) do
    #IO.puts "#{coin} #{target} #{current} #{combos[current]}"
    if current <= target do
      fill_combos(coin, Map.put(combos, current, combos[current] + combos[current-coin]), target, current+1)
    else
      combos
    end
  end

end
