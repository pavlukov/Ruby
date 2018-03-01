# Complete the function below.
def sort_numbers(a)
  a.map! { |x| x = x.to_i }

  a.sort! do |x,y|
    if (x.to_s(2).length <=> y.to_s(2).length) == 0
      x <=> y
    else
      x.to_s(2).length <=> y.to_s(2).length
    end
  end
  a
end

# DO NOT MODIFY THE CODE BELOW THIS LINE!
_a_cnt = Integer(gets)
_a_i = 0
_a = Array.new(_a_cnt)

while (_a_i < _a_cnt)
  _a_item = gets.to_s.strip;
  _a[_a_i] = (_a_item)
  _a_i+=1
end


res = sort_numbers(_a);
for res_i in res do
  puts res_i
end
