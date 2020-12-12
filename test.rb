OX = [ -1, 0, 1, 1, 1, 0, -1, -1 ].freeze
OY = [ -1, -1, -1, 0, 1, 1, 1, 0 ].freeze

data = IO.read('input11').lines.map(&:chomp)
w = (0...data.first.length)
h = (0...data.length)

#
# part 1
#

def nocc1(seats, x, y, w, h)
  0.upto(7).count do |i|
    x2, y2 = x + OX[i], y + OY[i]
    w.cover?(x2) && h.cover?(y2) && seats[y2][x2] == '#'
  end
end

seats = data.map(&:dup)
loop do
  copy = seats.map(&:dup)
  h.each do |y|
    w.each do |x|
      case seats[y][x]
      when 'L' then copy[y][x] = '#' if nocc1(seats, x, y, w, h) == 0
      when '#' then copy[y][x] = 'L' if nocc1(seats, x, y, w, h) >= 4
      end
    end
  end
  break if seats == copy
  seats = copy
end
p seats.join.count('#')

#
# part 2
#

def nocc2(seats, x, y, w, h)
  0.upto(7).count do |i|
    x2, y2, occ = x, y, false
    loop do
      x2, y2 = x2 + OX[i], y2 + OY[i]
      break if !(w.cover?(x2) && h.cover?(y2))
      case seats[y2][x2]
      when 'L' then break
      when '#' then occ = true ; break
      end
    end
    occ
  end
end

seats = data.map(&:dup)
loop do
  copy = seats.map(&:dup)
  h.each do |y|
    w.each do |x|
      case seats[y][x]
      when 'L' then copy[y][x] = '#' if nocc2(seats, x, y, w, h) == 0
      when '#' then copy[y][x] = 'L' if nocc2(seats, x, y, w, h) >= 5
      end
    end
  end
  break if seats == copy
  seats = copy
end
p seats.join.count('#')
