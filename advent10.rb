data = File.read("input10").split("\n").map(&:to_i).sort
data = [0] + data + [data.last + 3]

diff_1 = []
diff_3 = []
adapters = data.dup
adapter = adapters.shift
next_adapter = adapters[0]
while !next_adapter.nil?
  diff = next_adapter - adapter
  if diff == 1
    diff_1 << adapter
  end
  if diff == 3
    diff_3 << adapter
  end
  adapter = adapters.shift
  next_adapter = adapters[0]
end
puts "Solution 1 : #{diff_1.length * diff_3.length}"

routes = {}
data.each_with_index do |adapter, index|
  modifier = 1
  routes[adapter] ||= []
  while !data[index + modifier].nil? && (data[index + modifier] - adapter) <= 3
    routes[adapter] << data[index + modifier]
    modifier += 1
  end
end

# #  OLD: too slow
# count = {}
# def count_branches(tree, adapter, count)
#   count[0] += 1 if tree[adapter].length == 0
#   tree[adapter].each do |next_adapter|
#     count_branches(tree, next_adapter, count)
#   end
# end
#
# count = Hash.new(0)
# count_branches(routes, 0, count)
# puts "Solution 2: #{count[0]}"

def count_adapter_options(tree, adapter, cache)
  return cache[adapter] if cache[adapter]
  return 1 if tree[adapter].length == 0

  sum = 0
  tree[adapter].each do |next_adapter|
    next_count = 0
    if (cache[next_adapter])
      next_count = cache[next_adapter]
    else
      next_count = count_adapter_options(tree, next_adapter, cache)
      cache[next_adapter] = next_count
    end
    sum += next_count
  end
  return sum
end
solution2 = count_adapter_options(routes, 0, {})
puts "Solution 2: #{solution2}"
