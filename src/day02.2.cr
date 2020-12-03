puts File
  .read("#{__DIR__}/../input/02.dat")
  .split('\n')
  .map(&.match(/(?<x>\d+)-(?<y>\d+) (?<letter>\w): (?<password>\w+)/).not_nil!)
  .count { |match|
    indices = {match["x"].to_i - 1, match["y"].to_i - 1}
    indices.one? { |index| match["letter"][0] == match["password"][index] }
  }
