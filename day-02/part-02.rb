require 'csv'

# Calculate the horizontal position and depth you would have after following the planned course. What do you get if
# you multiply your final horizontal position by your final depth?

horizontal = 0
depth = 0
aim = 0

lines = CSV.read('input.csv')
lines.each do |line|
  command, value = line[0].split(' ')
  value = value.to_i

  horizontal += value if command == 'forward'

  aim += value if command == 'down'
  aim -= value if command == 'up'

  depth += value * aim if command == 'forward'
end

print "#{horizontal * depth}\n"
