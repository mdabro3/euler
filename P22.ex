defmodule P22 do

  def solve do
    solve(:lists.sort(parse("names.txt")), 1, 0)
  end

  def solve([], _, score) do
    score
  end

  def solve([h|rest], pos, score) do
    s = score_name(h)
    #IO.puts "#{h} at #{pos} scored #{s}"
    solve(rest, pos+1, score + (pos * s) )
  end

  def parse(filename) do
    content = File.read!(filename)
    names = String.split(content, ",")
    Enum.map(names, fn x -> String.strip(x, ?") end)
  end

  def score_name(name) do
    score_name(String.split(name, ""), 0)
  end

  def score_name([], score) do
    score
  end

  def score_name([h|rest], score) do
    score_name(rest, score + score_letter(h))
  end

  def score_letter(letter) do
    case letter do
      "" -> 0
      "A" -> 1
      "B" -> 2
      "C" -> 3
      "D" -> 4
      "E" -> 5
      "F" -> 6
      "G" -> 7
      "H" -> 8
      "I" -> 9
      "J" -> 10
      "K" -> 11
      "L" -> 12
      "M" -> 13
      "N" -> 14
      "O" -> 15
      "P" -> 16
      "Q" -> 17
      "R" -> 18
      "S" -> 19
      "T" -> 20
      "U" -> 21
      "V" -> 22
      "W" -> 23
      "X" -> 24
      "Y" -> 25
      "Z" -> 26
    end
  end

end
