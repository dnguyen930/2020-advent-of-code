data = File.read("input12").split("\n")

ship = {
  direction: 'E',
  x: 0,
  y: 0
}
data.each do |line|
  direction = line[0]
  number = line[1..-1].to_i

  case direction
  when 'N' then ship[:y] += number
  when 'S' then ship[:y] -= number
  when 'W' then ship[:x] -= number
  when 'E' then ship[:x] += number
  when 'L'
    if number === 90
      case ship[:direction]
      when 'N' then ship[:direction] = 'W'
      when 'S' then ship[:direction] = 'E'
      when 'W' then ship[:direction] = 'S'
      when 'E' then ship[:direction] = 'N'
      end
    elsif number == 180
      case ship[:direction]
      when 'N' then ship[:direction] = 'S'
      when 'S' then ship[:direction] = 'N'
      when 'W' then ship[:direction] = 'E'
      when 'E' then ship[:direction] = 'W'
      end
    elsif number == 270
      case ship[:direction]
      when 'N' then ship[:direction] = 'E'
      when 'S' then ship[:direction] = 'W'
      when 'W' then ship[:direction] = 'N'
      when 'E' then ship[:direction] = 'S'
      end
    end
  when 'R'
    if number === 90
      case ship[:direction]
      when 'N' then ship[:direction] = 'E'
      when 'S' then ship[:direction] = 'W'
      when 'W' then ship[:direction] = 'N'
      when 'E' then ship[:direction] = 'S'
      end
    elsif number == 180
      case ship[:direction]
      when 'N' then ship[:direction] = 'S'
      when 'S' then ship[:direction] = 'N'
      when 'W' then ship[:direction] = 'E'
      when 'E' then ship[:direction] = 'W'
      end
    elsif number == 270
      case ship[:direction]
      when 'N' then ship[:direction] = 'W'
      when 'S' then ship[:direction] = 'E'
      when 'W' then ship[:direction] = 'S'
      when 'E' then ship[:direction] = 'N'
      end
    end
  when 'F'
    case ship[:direction]
    when 'N' then ship[:y] += number
    when 'S' then ship[:y] -= number
    when 'W' then ship[:x] -= number
    when 'E' then ship[:x] += number
    end
  end
end
puts "Solution 1: #{(ship[:x]).abs + (ship[:y]).abs}"

ship = {
  direction: 'E',
  x: 0,
  y: 0
}
waypoint = {
  x: 10,
  y: 1
}
data.each do |line|
  direction = line[0]
  number = line[1..-1].to_i

  case direction
  when 'N' then waypoint[:y] += number
  when 'S' then waypoint[:y] -= number
  when 'W' then waypoint[:x] -= number
  when 'E' then waypoint[:x] += number
  when 'L'
    old_x = waypoint[:x]
    old_y = waypoint[:y]
    if number == 90
      waypoint[:x] = -old_y
      waypoint[:y] = old_x
    elsif number == 180
      waypoint[:x] = -old_x
      waypoint[:y] = -old_y
    elsif number == 270
      waypoint[:x] = old_y
      waypoint[:y] = -old_x
    end
  when 'R'
    old_x = waypoint[:x]
    old_y = waypoint[:y]
    if number == 90
      waypoint[:x] = old_y
      waypoint[:y] = -old_x
    elsif number == 180
      waypoint[:x] = -old_x
      waypoint[:y] = -old_y
    elsif number == 270
      waypoint[:x] = -old_y
      waypoint[:y] = old_x
    end
  when 'F'
    ship[:y] += waypoint[:y] * number
    ship[:x] += waypoint[:x] * number
  end
end
puts "Solution 2: #{(ship[:x]).abs + (ship[:y]).abs}"
