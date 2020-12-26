seats = File.read_lines("#{__DIR__}/../input/11.dat")
  .map &.chars

def count_occupied_seats(x, y, seats)
  rows = seats.size
  cols = seats.first.size

  { {-1, 0}, {1, 0}, {1, 1}, {1, -1}, {-1, -1}, {-1, 1}, {0, 1}, {0, -1} }
    .count { |(dx, dy)|
      occupied = false
      nx, ny = x, y
      while 0 <= (nx + dx) < cols && 0 <= (ny + dy) < rows
        seat = seats[ny + dy][nx + dx]
        if seat != '.'
          occupied = seat == '#'
          break
        end
        nx += dx
        ny += dy
      end

      occupied
    }
end

loop do
  new_seats = seats.clone

  0.upto(seats.size - 1) do |y|
    0.upto(seats.first.size - 1) do |x|
      seat = seats[y][x]
      next if seat == '.'

      noccupied = count_occupied_seats(x, y, seats)

      if seat == 'L' && noccupied == 0
        new_seats[y][x] = '#'
      elsif seat == '#' && noccupied >= 5
        new_seats[y][x] = 'L'
      end
    end
  end

  break if seats == new_seats

  seats = new_seats
end

puts seats.sum &.count('#')
