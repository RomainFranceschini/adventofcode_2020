numbers = File.read_lines("#{__DIR__}/../input/09.dat").map(&.to_i64)

def find_invalid_number(numbers)
  numbers.each_cons(26) do |slice|
    n = slice.pop
    return n unless slice.each_combination(2, reuse: true).any? { |pair| pair.sum == n }
  end
  raise "ohno"
end

def find_weakness(invalid, numbers)
  numbers.size.times do |i|
    sum = 0i64
    sequence = numbers.each.skip(i).take_while { |n|
      sum += n
      sum <= invalid
    }.to_a

    if sequence.sum == invalid
      return sequence.minmax.sum
    end
  end
end

puts find_weakness(find_invalid_number(numbers).tap { |n| puts n }, numbers)
