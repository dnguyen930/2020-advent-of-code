file = File.open("input5")
file_data = file.readlines

def find_seat(pattern, low, high)
  middle = (high + 1) / 2
  while (pattern.length > 1)
    letter = pattern.slice!(0)
    if ['F', 'L'].include?(letter)
      high = middle - 1
    else
      low = middle
    end
    middle = ((low.to_f + high) / 2).round
  end
  return ['F', 'L'].include?(pattern) ? low : high
end

seat_ids = file_data.map do |line|
  row_pattern = line[0..6]
  row = find_seat(row_pattern, 0, 127)

  col_pattern = line[7..9]
  col = find_seat(col_pattern, 0, 7)

  seat_id = row * 8 + col
  seat_id
end

seat_ids.sort!
highest_seat_id = seat_ids[-1]
first_seat_id = seat_ids[0]
last_seat_id = seat_ids[-1]
missing_seat_id = ((first_seat_id..last_seat_id).to_a - seat_ids).first

puts "Part 1: #{highest_seat_id}"
puts "Part 2: #{missing_seat_id}"

seat_ids = File.read('input5').split("\n").map { |line| line.tr('FLBR', '0011').to_i(2)}.sort
puts seat_ids.last
puts ((seat_ids[0]..seat_ids[-1]).to_a - seat_ids).first
