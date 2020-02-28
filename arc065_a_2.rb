str = gets
str.chomp!
a = str.gsub(/eraser/, "").gsub(/erase/, "").gsub(/dreamer/, "").gsub(/dream/, "")
if a == ""
  puts "YES"
else
  puts "NO"
end
