data = File.read("input13").split("\n")
time = data.first.to_i

wait_times = []
bus_lines = data.last.split(',').reject! {|item| item == 'x'}.map(&:to_i)
bus_lines.each_with_index do |number, index|
  wait_times[index] = number - (time % number)
end
wait, bus_index = wait_times.each_with_index.min
puts "Solution 1: #{wait * bus_lines[bus_index]}"

lines = []
bus_lines = data.last.split(',')
bus_lines.each_with_index do |line, index|
  lines << [line.to_i, index] if line != 'x'
end
lines.sort_by! { |line| line.first }

time = 100000000000000
max_bus_line = lines.last.first.to_i
while time % max_bus_line != 0
  time += 1
end

all_offset = false
while !all_offset
  time += max_bus_line
  all_offset = lines.all? do |number, offset|
    (time + offset) % number == 0
  end
end
puts "Solution 2: #{time}"
