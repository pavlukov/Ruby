array = gets.chomp.split.map(&:to_i)
#number_str = gets.chomp

n = array[0].to_i
k = array[1]

number_str = ""
digits = ["1", "2", "3", "4", "5", "6",
          "7", "8", "9", "?"]

while number_str.length < n
  number_str += digits[rand(digits.length)]
end

puts number_str

if !number_str.include? "?"
  if number_str.to_i % k != 0
    puts "-1"
    exit
  else
    puts number_str.to_i
    exit
  end
elsif number_str[0] == "?"
  number = 10**(n-1)
  number -= number % k
  number += k
else
  number = ""
  i = 0
  while number_str[i] != "?"
    number += number_str[i]
    i += 1
  end
  while number.length < n
    number += "0"
  end
  number = number.to_i
  number -= number % k
  number += k
end

arr = number_str.split("")
q_index = arr.each_index.select { |i| number_str[i] == "?" }
new_num_str = number_str
while number.to_s.length == n
  q_index.map { |i| new_num_str[i] = number.to_s[i] }
  break if new_num_str.to_i == number
  number += k.to_i
  puts number
end

if new_num_str.to_i == number
  puts new_num_str
else
  puts "-1"
end
