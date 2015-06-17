module CitiesHelper

	def continents
		@continents = City.all.select('continent').where.not(continent: nil).group('continent')
	end
	
	def cities_in_continent(continent)
		@continental_cities = City.all.where(continent: continent)
	end

	def city_exists?(city)
		@city = City.find_by_name(city)
		return false if @city == nil
		return true
	end

end
