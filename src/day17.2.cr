record Point, x : Int32, y : Int32, z : Int32, w : Int32 do
  include Comparable(Point)

  def <=>(other : Point)
    {@x, @y, @z, @w} <=> {other.x, other.y, other.z, other.w}
  end

  def -(amount : Int)
    Point.new(@x - amount, @y - amount, @z - amount, @w - amount)
  end

  def +(amount : Int)
    Point.new(@x + amount, @y + amount, @z + amount, @w + amount)
  end

  def upto(other : Point)
    @x.upto(other.x) { |x|
      @y.upto(other.y) { |y|
        @z.upto(other.z) { |z|
          @w.upto(other.w) { |w|
            yield Point.new(x, y, z, w)
          }
        }
      }
    }
  end

  def each_neighbor
    (self - 1).upto(self + 1) { |p| yield p if p != self }
  end
end

env = Hash(Point, Bool).new { |h, k| h[k] = false }.tap { |env|
  File.read_lines("#{__DIR__}/../input/17.dat").each_with_index { |row, y|
    row.chars.each_with_index { |char, x|
      env[Point.new(x, y, 0, 0)] = char == '#'
    }
  }
}

def count_active_neighbors(point, env)
  count = 0
  point.each_neighbor { |neighbor| count += 1 if env[neighbor] }
  count
end

6.times {
  env = env.dup.tap { |next_env|
    min, max = env.each_key.minmax
    (min - 1).upto(max + 1) { |p|
      nalive = count_active_neighbors(p, env)
      next_env[p] = (env[p] && (nalive == 2 || nalive == 3)) ||
                    (!env[p] && nalive == 3)
    }
  }
}

puts env.each_value.count(true)
