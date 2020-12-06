required_fields = {
  "byr" => (1920..2002), "iyr" => (2010..2020), "eyr" => (2020..2030), "hgt" => /^(\d{2,3})(cm|in)$/,
  "hcl" => /^#[a-f0-9]{6}$/, "ecl" => /^(amb|blu|brn|gry|grn|hzl|oth)$/, "pid" => /^\d{9}$/
}

puts File
  .read("#{__DIR__}/../input/04.dat")
  .split("\n\n")
  .map { |scan| scan.split.map(&.split(':')).reject! { |(field, _)| (field == "cid") } }
  .count { |entries|
    entries.size == 7 && entries.all? { |(field, value)|
      validation = required_fields[field]?
      case validation
      when Range
        validation.includes?(value.to_i)
      when Regex
        match = value.match(validation)
        if field == "hgt" && match
          range = match[2] == "in" ? (59..76) : (150..193)
          range.includes?(match[1].to_i)
        else
          match != nil
        end
      else false
      end
    }
  }
