require 'Set'

data = File.read("input8").split("\n")

def run(dataset)
  current_index = 0
  accumulator = 0
  already_ran_index = Set.new
  dataset_length = dataset.length

  while !already_ran_index.include?(current_index) && current_index < dataset_length
    already_ran_index.add(current_index)
    command = dataset[current_index]
    action, number = command.split(' ')
    sign = number[0]
    number = number[1..-1].to_i

    if action == 'nop'
      current_index += 1
    elsif action == 'acc'
      accumulator = sign == '-' ? accumulator - number : accumulator + number
      current_index += 1
    else
      current_index = sign == '-' ? current_index - number : current_index + number
    end
  end

  return accumulator, already_ran_index.include?(current_index)
end

acc, loop = run(data)
puts "Solution 1: #{acc}"

index_with_jmp = []
data.each_with_index do |command, index|
  index_with_jmp << index if command.start_with?('jmp')
end

index_with_jmp.each do |jmp_index|
  data_dupe = data.dup
  data_dupe[jmp_index] = data_dupe[jmp_index].gsub('jmp', 'nop')

  acc, loop = run(data_dupe)
  if loop == false
    puts "Solution 2: #{acc}"
    return
  end
end
