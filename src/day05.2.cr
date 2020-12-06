seats = File
  .read_lines("#{__DIR__}/../input/05.dat")
  .map { |n|
    match = n.match(/^([FB]{7})([LR]{3})$/).not_nil!
    row = match[1].gsub('F', "0").gsub('B', "1").to_i(2)
    col = match[2].gsub('R', '1').gsub('L', '0').to_i(2)
    row * 8 + col
  }

min, max = seats.minmax
puts (min..max).sum - seats.sum
