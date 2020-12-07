file = File.open("input2")
file_data = file.readlines

solution1 = 0
solution2 = 0
file_data.each do |line|
  count, letter, password = line.split(' ')
  min_count, max_count = count.split('-')

  # Solution 1
  min_count = min_count.to_i
  max_count = max_count.to_i

  letter_count = password.count(letter)
  if letter_count >= min_count && letter_count <= max_count
    solution1 += 1
  end

  # Solution 2
  first_index = min_count.to_i - 1
  second_index = max_count.to_i - 1

  first_letter = password[first_index]
  second_letter = password[second_index]
  letter = letter[0]

  if (first_letter != second_letter) && (first_letter == letter || second_letter == letter)
    solution2 += 1
  end
end

puts "Part 1: #{solution1}"
puts "Part 2: #{solution2}"
