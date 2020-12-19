def count(bag, rules) : Int32
  rules[bag].sum { |(subbag, count)| count + (count * count(subbag, rules)) }
end

rules = File.read_lines("#{__DIR__}/../input/07.dat")
  .map { |line|
    bag, content = line.split(" bags contain ")
    subbags = if content.includes?("no other bags")
                {} of String => Int32
              else
                content.split(',').map(&.match(/(\d+) ([a-z ]+) (\w.?)/).not_nil!).map { |match|
                  {match[2], match[1].to_i}
                }.to_h
              end
    {bag, subbags}
  }.to_h

puts count("shiny gold", rules)
