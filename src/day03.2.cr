terrain = File
  .read("#{__DIR__}/../input/03.dat")
  .split('\n')

ch = Channel(Int32).new

def ride(step_x, step_y, terrain, ch)
  x = y = count = 0
  while y < terrain.size
    count += 1 if terrain[y][x] == '#'
    x = (x + step_x) % terrain[y].size
    y += step_y
  end
  ch.send count
end

{1, 3, 5, 7}.each { |step| spawn ride(step, 1, terrain, ch) }
spawn ride(1, 2, terrain, ch)

prod = 1i64
5.times { prod *= ch.receive }
puts prod
