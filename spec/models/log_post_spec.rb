require 'rails_helper'

RSpec.describe LogPost, type: :model do 
	before(:all) do
		
		@city = City.create({
			name: "San Francisco",
			continent: "North America"
			})

		@user = User.create({
			first_name: "Saint",
			last_name: "Francisco",
			email: "test@email.com",
			password: "password1",
			city: @city
			})

		@log_post = LogPost.create({
			title: "My log post title",
			body: "Test log post body",
			city: @city,
			user: @user
			})
	end

	it "has a title" do
		expect(@log_post.title).not_to equal(nil)
	end

	it "has body content" do
		expect(@log_post.body).not_to equal(nil)
	end

	it "has a city and user" do
		expect(@log_post.user).not_to equal(nil)
		expect(@log_post.city).not_to equal(nil)
	end

	after(:all) do
		#tear down
		@city.destroy
		@user.destroy
		@log_post.destroy
	end
end