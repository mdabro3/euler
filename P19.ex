defmodule P19 do
  def solve do
    solve(1901, 0, 366, 0)
  end

  def solve(year, _, _, total) when year >= 2001 do
    total
  end

  def solve(year, month, days, total) when month >= 12 do
    solve(year+1, 0, days, total)
  end

  def solve(year, month, days, total) do
    #IO.puts "#{year} #{month} #{total}"
    days = days + get_days(month, year)
    cond do
      (rem days, 7) == 0 ->
        solve(year, month+1, days, total+1)
      true ->
        solve(year, month+1, days, total)
    end
  end

  def get_days(month, year) do
    month_length = {31,28,31,30,31,30,31,31,30,31,30,31}
    if (month == 1) and ((rem year, 4) == 0) do
      29
    else
      elem(month_length, month)
    end
  end 

end

