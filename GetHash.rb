class Array

  def to_histogram
    array = self
    hash= Hash.new(0)
    array.each do |element|
      hash[element] += 1
    end
    hash
  end

end

p array = ['orange', 'banana', 'banana', 'banana', 'lemon', 'lemon'].to_histogram
