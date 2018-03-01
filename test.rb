class A
	def method_missing (method, *args)
		super if method != :some_method
		puts "SPASIBO STAS"
	end

	def respond_to_missing? (method, *args)
		if method == :some_method
			puts "123"
			true
		end
	end

	def test
	end
end

a = A.new

a.send(:iluha)
