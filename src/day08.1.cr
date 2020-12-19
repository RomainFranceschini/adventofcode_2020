instructions = File.read_lines("#{__DIR__}/../input/08.dat").map { |line|
  parts = line.split
  {parts[0], parts[1].to_i}
}
acc = 0
ip = 0
visited = Set(Int32).new

while ip < instructions.size
  visited << ip
  op, arg = instructions[ip]

  case op
  when "jmp"
    ip += arg
  when "acc"
    acc += arg
    ip += 1
  else
    ip += 1
  end

  break if visited.includes?(ip)
end

puts acc
