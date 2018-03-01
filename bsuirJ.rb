n = gets.chomp.to_i

array = Array.new(n)
array = array.map { |x| x = Array.new(n) }
i = 0
num = 1
while i < n
  j = 0
  while j < n
    array[i][j] = num
    num += 1
    j += 1
  end
  i += 1
end

new_array = Array.new(n)
new_array = new_array.map { |x| x = Array.new() }
k = 0
i = 1
while k < n
  j = 1
  while j < n
    new_array[k].push(array[i][j])
    j += 2
    if j >= n && j % 2 == 1
      j = 0
    end
  end
  k += 1
  i += 2
  if i >= n && i % 2 == 1
    i = 0
  end
end

if n == 2 or n == 3
  puts "-1"
else
  i = 0
  while i < n
    j = 0
    while j < n
      print "#{new_array[i][j]} "
      j += 1
    end
    puts ""
    i += 1
  end
end
