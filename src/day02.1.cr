puts File
  .read_lines("#{__DIR__}/../input/02.dat")
  .map(&.match(/(?<x>\d+)-(?<y>\d+) (?<letter>\w): (?<password>\w+)/).not_nil!)
  .count { |match|
    range = (match["x"].to_i..match["y"].to_i)
    range.includes? match["password"].count(match["letter"][0])
  }
