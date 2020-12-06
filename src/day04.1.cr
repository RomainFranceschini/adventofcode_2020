required_fields = Set{"byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"}
puts File
  .read("#{__DIR__}/../input/04.dat")
  .split("\n\n")
  .map { |scan| scan.split.map!(&.split(':').first).tap(&.delete("cid")) }
  .count { |fields| fields.size == 7 && fields.all? { |field| required_fields.includes?(field) } }
