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

  def check_city_input(controller)
    city = City.find_by_place_id(params[:place_id])
    if city == nil
      city = City.create({ name: params[controller][:city], place_id: params[:place_id], continent: params[:continent] })
    end
    city
  end

  def remove_spaces_city(city_name)
  	@vanity = city_name.gsub(/ /, '-').downcase
  	return @vanity
  end

  def remove_dashes_city(params)
  	@city_name = params.gsub(/-/, ' ').titleize
  	return @city_name
  end

end
