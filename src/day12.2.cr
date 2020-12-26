x, y = 0, 0
wx, wy = 10, 1

File.read_lines("#{__DIR__}/../input/12.dat")
  .map { |instruction| {instruction[0], instruction[1..].to_i} }
  .each { |(op, arg)|
    case op
    when 'L', 'R'
      arg = -arg if op == 'R'
      rad = arg * Math::PI / 180
      dx, dy = wx, wy
      wx = (Math.cos(rad) * dx - Math.sin(rad) * dy).round.to_i
      wy = (Math.sin(rad) * dx + Math.cos(rad) * dy).round.to_i
    when 'F'
      x += wx * arg
      y += wy * arg
    when 'N' then wy += arg
    when 'S' then wy -= arg
    when 'E' then wx += arg
    when 'W' then wx -= arg
    end
  }

puts x.abs + y.abs
