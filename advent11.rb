data = File.read("input11").split("\n")
data = data.map{ |line| line.split('') }

x_length = data.first.length
y_length = data.length

diffs = [[0,-1],[0,1],[-1,-1],[-1,0],[-1,1],[1,-1],[1,0],[1,1]]
seating_chart = data
loop do
  changes = 0
  new_seating_chart = seating_chart.map{|row| row.dup}

  (0..x_length-1).to_a.each do |x|
    (0..y_length-1).to_a.each do |y|
      current_seat = new_seating_chart[y][x]
      next if current_seat  == '.'
      surrounding = []
      diffs.each do |x_diff, y_diff|
        begin
          new_x = x+x_diff
          new_y = y+y_diff
          next if new_x < 0 || new_y < 0
          surrounding << seating_chart[new_y][new_x]
        rescue
          # do nothing
        end
      end
      if surrounding.count('#') == 0 && current_seat != '#'
        new_seating_chart[y][x] = '#'
        changes += 1
      elsif surrounding.count('#') >= 4 && current_seat != 'L'
        new_seating_chart[y][x] = 'L'
        changes += 1
      end
    end
  end
  seating_chart = new_seating_chart
  break if changes == 0
end
puts "Solution 1: #{seating_chart.join('').count('#')}"

diagonal_direction = [[-1, -1], [-1, 1], [1, -1], [1, 1]]
seating_chart = data
loop do
  changes = 0
  new_seating_chart = seating_chart.map{|row| row.dup}

  def find_visible(row, position)
    visible = []
    if position-1 >= 0
      before_row = row[0..(position-1)].reverse  || []
      before_row.each do |char|
        next if char == '.'
        visible << char
        break
      end
    end
    after_row = row[(position+1)..-1]  || []
    after_row.each do |char|
      next if char == '.'
      visible << char
      break
    end
    return visible
  end

  (0..x_length-1).to_a.each do |x|
    (0..y_length-1).to_a.each do |y|
      current_seat = new_seating_chart[y][x]
      next if current_seat  == '.'

      # Horizontal and vertical
      same_row = seating_chart[y]
      same_col = seating_chart.transpose[x]
      visible = find_visible(same_row, x) + find_visible(same_col, y)

      # Diagonal
      diag_found = Hash.new(false)
      (1..y_length).to_a.each do |diff|
        not_found = 0
        diagonal_direction.each_with_index do |modifier, index|
          if !diag_found[index]
            begin
              new_x = x + (diff * modifier.first)
              new_y = y + (diff * modifier.last)
              raise if new_y < 0 || new_x < 0
              seat = seating_chart[new_y][new_x]
              raise if seat.nil?
              if seat != '.'
                visible << seat
                diag_found[index] = true
              end
            rescue
              not_found += 1
            end
          end
        end

        break if diag_found.values.count(true) == 4 # all diagonal found
        break if not_found == 4 # all four directions out of bound
      end

      if visible.count('#') == 0 && current_seat != '#'
        new_seating_chart[y][x] = '#'
        changes += 1
      elsif visible.count('#') >= 5 && current_seat != 'L'
        new_seating_chart[y][x] = 'L'
        changes += 1
      end

    end
  end
  seating_chart = new_seating_chart
  break if changes == 0
end
puts "Solution 2: #{seating_chart.join('').count('#')}"
