puts File
  .read("#{__DIR__}/../input/06.dat")
  .split("\n\n")
  .map { |group| group.gsub('\n', "").chars.uniq!.size }
  .sum
