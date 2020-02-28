def next_is_erase?(str, idx)
  word = str[idx..idx + 4]
  word == "erase"
end

def next_is_dream?(str, idx)
  word = str[idx..idx + 4]
  word == "dream"
end

def next_is_er?(str, idx)
  word = str[idx..idx + 1]
  word == "er"
end

def next_is_r?(str, idx)
  word = str[idx]
  word == "r"
end

str = gets
str.chomp!

case str[0..4]
when "dream"
  state = :dream
when "erase"
  state = :erase
else
  puts "error"
end

idx = 5
success = true

while (idx < str.length)
  case state
  when :dream
    if next_is_erase?(str, idx)
      idx += 5
      state = :erase
    elsif next_is_dream?(str, idx)
      idx += 5
      state = :dream
    elsif next_is_er?(str, idx)
      idx += 2
      state = :dreamer
    else
      success = false
      break
    end
  when :dreamer
    if next_is_erase?(str, idx)
      idx += 5
      state = :erase
    elsif next_is_dream?(str, idx)
      idx += 5
      state = :dream
    else
      success = false
      break
    end
  when :erase
    if next_is_erase?(str, idx)
      idx += 5
      state = :erase
    elsif next_is_dream?(str, idx)
      idx += 5
      state = :dream
    elsif next_is_r?(str, idx)
      idx += 1
      state = :eraser
    else
      success = false
      break
    end
  when :eraser
    if next_is_erase?(str, idx)
      idx += 5
      state = :erase
    elsif next_is_dream?(str, idx)
      idx += 5
      state = :dream
    else
      success = false
      break
    end
  end
end

if success
  puts "YES"
else
  puts "NO"
end
