def get_number(array, number)
  last_num = nil
  number_hash = {}
  (0..(number-1)).to_a.each do |turn|
    num = array[turn]
    new_num = nil
    if num.nil?
      new_num = 0
      if number_hash[last_num].length == 1
        new_num = 0
      else
        new_num = number_hash[last_num][-1] - number_hash[last_num][-2]
      end
    else
      new_num = num
    end
    number_hash[new_num] ||= []
    number_hash[new_num] << turn
    last_num = new_num
  end
  return last_num
end

puts "Solution 1: #{get_number([2,1,10,11,0,6], 2020)}"
puts "Solution 2: #{get_number([2,1,10,11,0,6], 30000000)}"
