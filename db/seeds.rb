require 'ffaker'

(1..10).each do

	new_city = City.create({name: FFaker::Address.city, continent: ["Africa", "Asia", "North America", "South America", "Europe", "Australia", "Antartica"].sample})

	(1..5).each do
		user_params = {}
		user_params[:email] = FFaker::Internet.email
		user_params[:first_name] = FFaker::Name.first_name
		user_params[:last_name] = FFaker::Name.last_name
		user_params[:password] = "fakedata"
		user_params[:password_confirmation] = user_params[:password]
		user_params[:city_id] = new_city.id
		new_user = User.create(user_params)

		(1..5).each do
			new_log_post = LogPost.new
			new_log_post.title = FFaker::HipsterIpsum.words(rand(8)+2).join(" ")
			new_log_post.body = FFaker::HipsterIpsum.paragraphs(1 + rand(2)).join("\n")
			new_log_post.city_id = new_city.id
			new_log_post.save
			new_user.log_posts << new_log_post
		end
	end
end
