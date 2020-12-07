file = File.open("input1")
arrayA = file.readlines
arrayB = arrayA.dup
arrayC = arrayA.dup

solution1 = nil
solution2 = nil

arrayA.each do |input_a|
  arrayB.each do |input_b|
    a = input_a.to_i
    b = input_b.to_i
    if a + b == 2020
      solution1 = a * b
    end
    arrayC.each do |input_c|
      c = input_c.to_i
      if a + b + c == 2020
         solution2 = a * b * c
      end
    end
  end
end

puts "Part 1: #{solution1}"
puts "Part 2: #{solution2}"
