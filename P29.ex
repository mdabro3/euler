defmodule P29 do

  def solve() do
    length( Enum.uniq( for a <- 2..100, b <- 2..100, do: :math.pow(a,b) ) )
  end

end
