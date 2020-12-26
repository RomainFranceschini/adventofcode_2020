seats = File.read_lines("#{__DIR__}/../input/11.dat")
  .map &.chars

rows = seats.size
cols = seats.first.size

def count_occupied_seats(x, y, seats)
  count = 0
  (Math.max(0, x - 1)).upto(x + 1) { |nx|
    (Math.max(0, y - 1)).upto(y + 1) { |ny|
      next if nx == x && ny == y
      count += 1 if seats.dig?(ny, nx) == '#'
    }
  }
  count
end

loop do
  new_seats = seats.clone

  0.upto(rows - 1) do |y|
    0.upto(cols - 1) do |x|
      seat = seats[y][x]
      next if seat == '.'

      noccupied = count_occupied_seats(x, y, seats)

      if seat == 'L' && noccupied == 0
        new_seats[y][x] = '#'
      elsif seat == '#' && noccupied >= 4
        new_seats[y][x] = 'L'
      end
    end
  end

  break if seats == new_seats

  seats = new_seats
end

puts seats.sum &.count('#')
