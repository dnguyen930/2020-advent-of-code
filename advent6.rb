data = File.read("input6").split("\n\n")

solution1 = 0
solution2 = 0
data.each do |group|
  people = group.split("\n")
  people.map! {|p| p.split("")}

  unique_yes = people.flatten.uniq.count
  solution1 += unique_yes

  all_yes = people.inject(:&)
  solution2 += all_yes.length
end

puts "Part 1: #{solution1}"
puts "Part 2: #{solution2}"
