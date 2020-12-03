i = 0
puts File
  .read("#{__DIR__}/../input/03.dat")
  .split('\n')
  .reduce(0) { |acc, row|
    cell = row[i]
    i = (i + 3) % row.size
    acc + (cell == '#' ? 1 : 0)
  }
