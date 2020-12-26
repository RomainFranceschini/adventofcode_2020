heading = 0
x, y = 0, 0

File.read_lines("#{__DIR__}/../input/12.dat")
  .map { |instruction| {instruction[0], instruction[1..].to_i} }
  .each { |(op, arg)|
    if op == 'F'
      op = case heading
           when   0 then 'E'
           when  90 then 'N'
           when 180 then 'W'
           when 270 then 'S'
           end
    end

    case op
    when 'L' then heading = (heading + arg) % 360
    when 'R' then heading = (heading - arg) % 360
    when 'N' then y += arg
    when 'S' then y -= arg
    when 'E' then x += arg
    when 'W' then x -= arg
    end
  }

puts x.abs + y.abs
