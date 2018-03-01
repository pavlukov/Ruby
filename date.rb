require 'date'

def process(date, units, duration)
	day_block = lambda do
		puts "Enter"
		i = 0
		while i < duration do
			date += 1
			puts date
			i += 1
		end
	end

	month_block = lambda do
		i = 0
		while i < duration do
			date = date >> 1
			puts date
			i += 1
		end
	end

	year_block = lambda do
		i = 0
		while i < duration do
			date = date >> 12
			puts date
			i += 1
		end
	end

	newHash = {
		"day" => day_block,
		"month" => month_block,
		"year" => year_block,
	}

	newHash[units].call
end

print 'Введите дату в формате DD.MM.YY: '
my_date = Date.parse(gets.chomp)
print 'Выберите единицу измерения : day || month || year: '
unit = gets.chomp
print 'Выберите длительность: '
long = gets.chomp.to_i
process(my_date, unit, long)
