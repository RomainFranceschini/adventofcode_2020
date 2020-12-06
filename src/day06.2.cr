puts File
  .read("#{__DIR__}/../input/06.dat")
  .split("\n\n")
  .map { |group|
    n = 1 + group.count('\n')
    group.gsub('\n', "").chars.tally.reject { |_, v| v < n }
  }.sum &.size
