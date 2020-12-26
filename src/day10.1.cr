puts File.read_lines("#{__DIR__}/../input/10.dat")
  .map(&.to_i).push(0).sort!
  .tap { |ary| ary.push(ary.max + 3) }
  .each_cons(2, reuse: true)
  .map { |(a, b)| b - a }.tally
  .each_value.product
