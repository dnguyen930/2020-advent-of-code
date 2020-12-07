data = File.read("input7").split("\n")

color_parent = {}
color_child = {}
data.each do |rule|
  bag, contains = rule.split(' bags contain')
  inside_rules = contains.split(',')
  inside_rules.each do |inside_rule|
    number, color1, color2, _ = inside_rule.split(' ')
    color = "#{color1} #{color2}"

    color_parent[color] ||= []
    color_parent[color] << bag
    color_child[bag] ||= []
    color_child[bag] += [color] * number.to_i
  end
end

def find_total_bags(object, color, bags)
  colors = object[color]
  if !colors.nil?
    colors.each do |color|
      bags << color
      find_total_bags(object, color, bags)
    end
  end
end

total_bags = []
find_total_bags(color_parent, 'shiny gold', total_bags)
puts "Solution 1: #{total_bags.uniq.length}"

total_bags = []
find_total_bags(color_child, 'shiny gold', total_bags)
puts "Solution 2: #{total_bags.length}"
