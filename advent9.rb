data = File.read("input9").split("\n").map!(&:to_i)

def preamble_test(array, number)
  array.each do |num1|
    array.each do |num2|
      if num1 + num2 == number
        return true
      end
    end
  end
  return false
end

index = 25
while preamble_test(data[index-25..index-1], data[index])
  index += 1
end

solution1 =  data[index]
puts "Part 1: #{solution1}"

(0..(data.length-1)).to_a.each do |start_index|
  end_index = start_index += 1
  while end_index < data.length
    batch = data[start_index..end_index]
    sum = batch.inject(:+)
    if sum == solution1
      batch.sort!
      puts "Part 2: #{batch[0] + batch[-1]}"
      return
    end
    end_index += 1
  end
end
