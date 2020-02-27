def distance(before, now)
  (now - before).abs
end

def elapsed(before, now)
  now - before
end

n_str = gets
n = n_str.chomp.to_i

possible = true
before_x = 0
before_y = 0
before_t = 0

for i in 1..n
  txy_str = gets
  t, x, y = txy_str.chomp.split(" ").map(&:to_i)

  dx = distance(before_x, x)
  dy = distance(before_y, y)
  dt = elapsed(before_t, t)

  if (dx + dy) > dt
    possible = false
  end

  if (x + y).odd? != t.odd?
    possible = false
  end
  before_x = x
  before_y = y
  before_t = t
end

if possible
  puts "Yes"
else
  puts "No"
end
