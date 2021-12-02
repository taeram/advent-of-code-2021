require 'csv'

# Your goal now is to count the number of times the sum of measurements in this sliding window increases from the
# previous sum. So, compare A with B, then compare B with C, then C with D, and so on. Stop when there aren't enough
# measurements left to create a new three-measurement sum.

# Build the list of depths.
depths = []
lines = CSV.read('input.csv')
lines.each do |line|
  depths.push(line[0].to_i)
end

# Build the individual windows.
windows = []
(0..depths.length).each do |i|
  break if i + 2 >= depths.length

  windows[i] = 0
  (0..2).each do |j|
    windows[i] += depths[i + j]
  end
end

# Count the number of windows that increased from the previous window.
result = 0
previous = 0
windows.each do |window|
  result += 1 if previous.positive? && window > previous
  previous = window
end

print result
