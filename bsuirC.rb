input = gets.chomp.split.map(&:to_i)
a = input[0].to_f
b = input[1]

denominator = 2**b
answer_num = a / denominator

puts "correct answer: #{a}/#{denominator}"

valid_num = denominator.to_f - a
valid_num_arr = []
if valid_num >= 3
  valid_num_arr.push(valid_num)
end
while valid_num > 3
  i = 1
  while true
    if 2**i >= valid_num
      valid_num = (2**i - valid_num).to_f
      if valid_num >= 3
        if valid_num % 2 == 1
          valid_num_arr.push(valid_num)
        else
          valid_num_arr.push(valid_num - 1)
        end
      end
      break
    end
    i += 1
  end
end
p valid_num_arr
code_str = ""
new_num_numerator = 1.0
new_num_denominator = 1
go_last_branch = false
while new_num_numerator / new_num_denominator != answer_num and new_num_denominator <= denominator
  puts "#{new_num_numerator}/#{new_num_denominator}"

  if valid_num_arr.include?(new_num_denominator - new_num_numerator) and !go_last_branch
    new_num_numerator = new_num_denominator - new_num_numerator
    code_str += "1"
    go_last_branch = true
  else
    new_num_denominator *= 2
    code_str += "0"
    go_last_branch = false
  end
end

puts "#{new_num_numerator}/#{new_num_denominator}"
puts code_str
