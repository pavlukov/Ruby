module M
  class C
    module M2
      def test
        puts "678"
      end
    end

    def test
      include M2
      puts "123"
    end
  end

  def test
    puts "345"
  end



end

include M

class B < C

end

antoha = C.new

leha = B.new
leha.test
