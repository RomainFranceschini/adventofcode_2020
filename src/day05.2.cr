seats = File
  .read_lines("#{__DIR__}/../input/05.dat")
  .map(&.tr("FBRL", "0110").to_i(2))

min, max = seats.minmax
puts (min..max).sum - seats.sum
