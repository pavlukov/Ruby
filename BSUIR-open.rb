num = Integer(gets.chomp)

i = 0
sum1 = 0
new_num1 = ""
while sum1 < num
  if i % 2 == 1
    new_num1 += "1"
  else
    new_num1 += "2"
  end
  i += 1
  sum1 = 0
  new_num1.split("").map { |x| sum1 += Integer(x) }
end

j = 0
sum2 = 0
new_num2= ""
while sum2 < num
  if j % 2 == 1
    new_num2 += "2"
  else
    new_num2 += "1"
  end
  j += 1
  sum2 = 0
  new_num2.split("").map { |x| sum2 += Integer(x) }
end

new_num1 = Integer(new_num1)
new_num2 = Integer(new_num2)

if sum1 == num
  if new_num1 > new_num2 or sum2 != num
    puts new_num1
  end
end

if sum2 == num
  if new_num2 > new_num1 or sum1 != num
    puts new_num2
  end
end
