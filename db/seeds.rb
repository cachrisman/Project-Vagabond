require 'ffaker'

# Destroy existing data
User.destroy_all
LogPost.destroy_all
City.destroy_all

def rand_in_range(from, to)
  rand * (to - from) + from
end

def rand_time(from, to=Time.now)
  Time.at(rand_in_range(from.to_f, to.to_f))
end

cities = [
  {name:"San Francisco", continent: "North America", place_id: "ChIJIQBpAG2ahYAR_6128GcTUEo"},
  {name:"New York", continent: "North America", place_id: "ChIJOwg_06VPwokRYv534QaPC8g"},
  {name:"Toronto", continent: "North America", place_id: "ChIJpTvG15DL1IkRd8S0KlBVNTI"},
  {name:"Mexico City", continent: "North America", place_id: "ChIJB3UJ2yYAzoURQeheJnYQBlQ"},
  {name:"London", continent: "Europe", place_id: "ChIJdd4hrwug2EcRmSrV3Vo6llI"},
  {name:"Paris", continent: "Europe", place_id: "ChIJD7fiBh9u5kcRYJSMaMOCCwQ"},
  {name:"Gibraltar", continent: "Europe", place_id: "ChIJNb4UJ3a_DA0R63QwjEmqPW8"},
  {name:"Moscow", continent: "Europe", place_id: "ChIJybDUc_xKtUYRTM9XV8zWRD0"},
  {name:"Tokyo", continent: "Asia", place_id: "ChIJXSModoWLGGARILWiCfeu2M0"},
  {name:"Beijing", continent: "Asia", place_id: "ChIJuSwU55ZS8DURiqkPryBWYrk"},
  {name:"Hong Kong", continent: "Asia", place_id: "ChIJByjqov3-AzQR2pT0dDW0bUg"},
  {name:"Dubai", continent: "Asia", place_id: "ChIJRcbZaklDXz4RYlEphFBu5r0"},
  {name:"Johannesburg", continent: "Africa", place_id: "ChIJUWpA8GgMlR4RQUDTsdnJiiM"},
  {name:"Cairo", continent: "Africa", place_id: "ChIJ674hC6Y_WBQRujtC6Jay33k"},
  {name:"Rio De Janeiro", continent: "South America", place_id: "ChIJW6AIkVXemwARTtIvZ2xC3FA"},
  {name:"Santiago", continent: "South America", place_id: "ChIJuzrymgbQYpYRl0jtCfRZnYc"}]

cities.each do |city|

  city = City.create({name: city[:name], continent: city[:continent], place_id: city[:place_id]})

	(1..5).each do
		user_params = {}
		user_params[:email] = FFaker::Internet.email
		user_params[:first_name] = FFaker::Name.first_name
		user_params[:last_name] = FFaker::Name.last_name
		user_params[:password] = "fakedata"
		user_params[:password_confirmation] = user_params[:password]
		user_params[:city_id] = city.id
		new_user = User.create(user_params)

		(1..5).each do
			new_log_post = LogPost.new
			new_log_post.title = FFaker::HipsterIpsum.words(rand(8)+2).join(" ")
			new_log_post.body = FFaker::HipsterIpsum.paragraphs(1 + rand(2)).join("\n")
			new_log_post.city_id = city.id
			new_log_post.save
      new_log_post.updated_at = rand_time(2.days.ago) #rand_time(rand_in_range(1, 100).days.ago)
      new_log_post.save
			new_user.log_posts << new_log_post
		end
	end
end

# create dev user
User.create({
  :email => "dev@test.com",
  :first_name => "Test",
  :last_name => "Test",
  :password => "fakedata",
  :password_confirmation => :password,
  :city_id => 1
})
