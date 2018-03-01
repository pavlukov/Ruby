class HashInvertor

  def self.safe_invert(hash)
    new_hash = Hash.new
    hash.each_key do |key|
      if new_hash.include?(hash[key])
        if new_hash[hash[key]].class == Array
          new_hash[hash[key]].push(key)
        else
          value = new_hash[hash[key]]
          new_hash[hash[key]] = [value, key]
        end
      else
        new_hash[hash[key]] = key
      end
    end
    new_hash
  end

end

fruits_country = {"orange" => "Marocco", "banana" => "Ecuador", "lemon" => "Marocco"}
p HashInvertor.safe_invert(fruits_country)
