data = File.read("input14").split("\n")
mask = nil

cache = {}
data.each do |line|
  command, number = line.split(' = ')
  if command == 'mask'
    mask = number.split('').reverse
  else
    address = command[4..-2]
    binary = number.to_i.to_s(2).reverse
    bin_length = binary.length

    number = ""
    mask.each_with_index do |digit, index|
      case digit
      when 'X' then number += (index >= bin_length) ? '0' : binary[index]
      when '1' then number += '1'
      when '0' then number += '0'
      end
    end
    cache[address] = number.reverse.to_i(2)
  end
end
puts "Solution1 #{cache.values.inject(:+)}"

cache = {}
data.each do |line|
  command, number = line.split(' = ')
  if command == 'mask'
    mask = number.split('').reverse
  else
    address = command[4..-2]
    binary_addr = address.to_i.to_s(2).reverse
    bin_addr_length = binary_addr.length

    addresses = [""]
    mask.each_with_index do |digit, index|
      case digit
      when 'X' then addresses = addresses.map{|addr| addr + '1'} + addresses.map{|addr| addr + '0'}
      when '1' then addresses = addresses.map{|addr| addr + digit}
      when '0' then addresses = addresses.map{|addr| addr + ((index >= bin_addr_length) ? '0' : binary_addr[index])}
      end
    end
    number = number.to_i
    addresses.each do |a|
      cache[a.reverse.to_i(2)] = number
    end
  end
end
puts "Solution 2: #{cache.values.inject(:+)}"
