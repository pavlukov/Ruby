require "date"

def proccess(valid_date, measure, duration, number)
  day_block = lambda { number.times { puts valid_date += duration } }

  month_block = lambda { number.times { puts valid_date = valid_date >> duration } }

  year_block = lambda { number.times { puts valid_date = valid_date >> 12 * duration} }

  hash = {day: day_block, month: month_block, year: year_block}

  hash[measure].call
end

while true
  puts "Введите дату в формате DD/MM/YY:"
  begin
    valid_date = Date.parse(gets.chomp)
    puts valid_date.strftime("%d/%m/%y")
    break if ! valid_date.nil?
  rescue
    puts "Ошибка ввода."
  end
end

while true
  puts "Введите единицу измерения(day/month/year):"
  measure = gets.chomp.to_sym
  if measure == :day or measure == :month or measure == :year
    break
  else
    puts "Ошибка ввода."
  end
end

while true
  puts "Введите длительность:"
  begin
    duration = Integer(gets.chomp)
    break if ! duration.nil?
  rescue
    puts "Ошибка ввода."
  end
end

while true
  puts "Введите количество выводов:"
  begin
    number = Integer(gets.chomp)
    break if ! number.nil?
  rescue
    puts "Ошибка ввода."
  end
end

proccess(valid_date, measure, duration, number)
