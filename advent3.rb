file = File.open("input3")
file_data = file.readlines
$y_length = file_data.length

$slopes = []
file_data.each do |line|
  new_line = line.gsub("\n", "") * $y_length
  $slopes << new_line
end
$x_length = $slopes[0].length

def get_tree_hit_count (diffs)
  solution = []
  diffs.each do |x_diff, y_diff|
    count = 0
    x = 0
    y = 0
    while (x < $x_length && y < $y_length)
      thing = $slopes[y][x]
      if thing == "#"
        count += 1
      end
      x += x_diff
      y += y_diff
    end
    solution << count
  end
  return solution.inject(:*)
end

diffs = [[3, 1]]
puts "Part 1: #{get_tree_hit_count(diffs)}"

diffs = [[1, 1],[3, 1],[5, 1],[7, 1],[1, 2]]
puts "Part 2: #{get_tree_hit_count(diffs)}"
