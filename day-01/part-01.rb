require 'csv'

# Count the number of times a depth measurement increases from the previous measurement. (There is no measurement
# before the first measurement.)

result = 0
previous = 0

lines = CSV.read('input.csv')
lines.each do |line|
  depth = line[0].to_i
  result += 1 if previous.positive? && depth > previous
  previous = depth
end

print result
