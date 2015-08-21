defmodule P25 do

  def solve do
    solve(1000)
  end

  def log(num, base) do
    :math.log(num) / :math.log(base)
  end

  def log10(num) do
    log(num, 10)
  end

  def phi do
    (1 + :math.sqrt(5))/2
  end

  def solve(num) do
    log(10, phi() ) * (log10(:math.sqrt(5)) + (num - 1))
  end

  def f(n) do
    :erlang.round( ( :math.pow(phi(), n) - :math.pow(1 - phi(), n) ) / :math.sqrt(5) )
  end

end
