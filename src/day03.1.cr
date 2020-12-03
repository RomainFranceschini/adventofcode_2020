i = 0
puts File
  .read_lines("#{__DIR__}/../input/03.dat")
  .reduce(0) { |acc, row|
    cell = row[i]
    i = (i + 3) % row.size
    acc + (cell == '#' ? 1 : 0)
  }
