def can_contain?(containee, bag, rules)
  rules[bag].any? { |subbag| containee == subbag || can_contain?(containee, subbag, rules) }
end

rules = File.read_lines("#{__DIR__}/../input/07.dat")
  .map { |line|
    bag, content = line.split(" bags contain ")
    subbags = if content.includes?("no other bags")
                [] of String
              else
                content.split(',').map(&.match(/(\d+) ([a-z ]+) (\w.?)/).not_nil![2])
              end
    {bag, subbags}
  }.to_h

puts rules.each_key.count { |bag| can_contain?("shiny gold", bag, rules) }
