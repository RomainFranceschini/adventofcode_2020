instructions = File.read_lines("#{__DIR__}/../input/08.dat").map { |line|
  parts = line.split
  {parts[0], parts[1].to_i}
}

def run(instructions)
  visited = Set(Int32).new
  acc = 0
  ip = 0

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

  {acc, ip >= instructions.size}
end

instructions.each_with_index { |instruction, index|
  op, arg = instruction
  next if op == "acc"

  acc, valid = run(instructions.dup.tap { |program|
    program[index] = {op == "jmp" ? "nop" : "jmp", arg}
  })

  if valid
    puts acc
    break
  end
}
