n = Integer(gets.chomp)
array = gets.chomp.split(" ").map(&:to_i)

sum = 0
i = 1
while i <= 32
  k = 0
  j = 0
  while j <= n
    if ((array[j] & (1 << (i - 1)) > 0))
      k += 1
    end
    sum += (1 << (i - 1)) * (3 * k * (n - k) * (n - k) + k**3)
    j += 1
  end
  i += 1
end
puts ""
puts sum
