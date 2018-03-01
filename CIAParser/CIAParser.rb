require "rexml/document"
include REXML

doc = Document.new File.new("cia-1996.xml")

class World
  attr_reader :countries, :continents

  def initialize(doc)
    @countries = []
    @continents = []

    doc.elements.each("cia/country") do |element|
      country = Country.new(element)
      countries.push(country)
    end

    doc.elements.each("cia/continent") do |element|
      continent = Continent.new(element, countries)
      continents.push(continent)
    end
  end
end

class Continent
  attr_reader :id, :name, :countries

  def initialize(element, all_countries)
    @id = element.attributes["id"]
    @name = element.attributes["name"]
    @countries = []

    all_countries.each do |country|
      if country.continent == @name
        @countries.push(country)
      end
    end
  end

  def show
    puts "Name: #{self.name}"
    puts "Countries:"
    self.countries.each { |country| puts "\t #{country.name}" }
  end

end

class Country
  attr_reader
    :id, :continent, :name, :datacode, :total_area, :population, :population_growth,
    :infant_mortality, :inflation, :gdp_total, :indep_date, :government,
    :capital, :ethnicgroups, :religions, :borders, :coasts

  def initialize(element)
    @id = element.attributes["id"]
    @continent = element.attributes["continent"]
    @name = element.attributes["name"]
    @datacode = element.attributes["datacode"]
    @total_area = element.attributes["total_area"]
    @population = element.attributes["population"]
    @population_growth = element.attributes["population_growth"]
    @infant_mortality = element.attributes["infant_mortality"]
    @inflation = element.attributes["inflation"]
    @gdp_total = element.attributes["gdp_total"]
    @indep_date = element.attributes["indep_date"]
    @government = element.attributes["government"]
    @capital = element.attributes["capital"]
    @ethnicgroups = Hash.new
    @religions = Hash.new
    @borders = Hash.new
    @coasts = Array.new
    element.elements.each("ethnicgroups") { |element| @ethnicgroups.store(element.attributes["name"], element.text) }
    element.elements.each("religions") { |element| @religions.store(element.attributes["name"], element.text) }
    element.elements.each("borders") { |element| @borders.store(element.attributes["country"], element.text) }
    element.elements.each("coasts") { |element| @coasts.push(element.text) }
  end

  def show
    puts "ID: #{self.id}"
    puts "Continent: #{self.continent}"
    puts "Name: #{self.name}"
    puts "Datacode: #{self.datacode}"
    puts "Total area: #{self.total_area} sq. km."
    puts "Population: #{self.population}"
    puts "Population growth: #{self.population_growth}"
    puts "Infant mortality: #{self.infant_mortality}"
    puts "Inflation: #{self.inflation}%"
    puts "Total gdp: #{self.gdp_total}$"
    puts "independence date: #{self.indep_date}"
    puts "Government: #{self.government}"
    puts "Capital: #{self.capital}"
    print "Ethnic groups: "
    self.ethnicgroups.each { |key, value| print "#{key} - #{value}% " }
    puts ""
    print "Religions: "
    self.religions.each { |key, value| print "#{key} - #{value}% " }
    puts ""
    print "Borders: "
    self.borders.each { |key, value| print "#{key} - #{value} km. " }
    puts ""
    print "Coasts: "
    self.coasts.each { |value| print "#{value} " }
    puts "\n\n"
  end
end

world = World.new(doc)

puts "The country with the largest population: \n\n"
(world.countries.max_by { |element| element.population.to_i }).show

countries_inflation_sort = world.countries.sort { |x, y| y.inflation.to_i <=> x.inflation.to_i }
puts "Countries with the biggest inflation level:"
countries_inflation_sort[0...5].each { |country| puts "#{country.name} - #{country.inflation}%" }

puts "\nContinents: "
world.continents.sort! { |x, y| x.name <=> y.name }
world.continents.each { |continent| continent.show }
