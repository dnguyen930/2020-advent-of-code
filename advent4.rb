passports = []
File.read("input4").split("\n\n").each do |passport|
  values = passport.gsub("\n", " ").split(' ')
  current_passport = {}
  values.each do |item|
    key, value = item.split(':')
    current_passport[key] = value
  end
  passports << current_passport
end

solution1 = 0
solution2 = 0
passports.each do |pp|
  if !pp['byr'].nil? && !pp['iyr'].nil? && !pp['eyr'].nil? && !pp['hgt'].nil? &&
   !pp['hcl'].nil? && !pp['ecl'].nil? && !pp['pid'].nil?
    solution1 += 1

    byr = pp['byr']
    next if byr.length != 4 || byr.to_i < 1920 || byr.to_i > 2002

    iyr = pp['iyr']
    next if iyr.length != 4 || iyr.to_i < 2010 || iyr.to_i > 2020

    eyr = pp['eyr']
    next if eyr.length != 4 || eyr.to_i < 2020 || eyr.to_i > 2030

    hgt = pp['hgt']
    if hgt.include?('cm')
      height = hgt.delete('cm').to_i
      next if height < 150 || height > 193
    elsif hgt.include?('in')
      height = hgt.delete('in').to_i
      next if height < 59 || height > 76
    else
      next
    end

    hcl = pp['hcl']
    next if !hcl.match(/^#[abcdef0123456789]{6}$/)

    ecl = pp['ecl']
    next if !['amb', 'blu', 'brn', 'gry', 'grn', 'hzl', 'oth'].include?(ecl)

    pid = pp['pid']
    next if !pid.match(/^\d{9}$/)

    solution2 += 1
  end
end

puts "Part 1: #{solution1}"
puts "Part 2: #{solution2}"
