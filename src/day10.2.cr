numbers = File.read_lines("#{__DIR__}/../input/10.dat")
  .map(&.to_i).push(0).sort!.to_set

puts Hash(Int32, Int64).new(default_value: 0).tap { |h|
  h[0] = 1
  numbers.each { |u| (u + 1..u + 3).each { |v|
    h[v] += h[u] if v.in?(numbers)
  } }
}[numbers.max]
