File
  .read("#{__DIR__}/../input/01.dat")
  .split
  .map(&.to_i)
  .each_combination(ARGV.first?.try(&.to_i) || 2, reuse: true) do |p|
    if p.sum == 2020
      puts p.product
      break
    end
  end
