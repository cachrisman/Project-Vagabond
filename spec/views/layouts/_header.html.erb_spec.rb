require 'rails_helper'
  RSpec.describe "layouts/_header", type: :view do

  before(:all) do
    @params = {
      :first_name => "Charlie",
      :last_name => "Chrisman",
      :email => "charlie@chrisman.com",
      :password => "bad",
      :city_id => 1
      }

    @user = User.create(@params)
  end
 
describe "rendering views/layouts/_header.html.erb" do
	it "does NOT show a link to cities if user is not logged in" do
		render :template => "layouts/_header"
    expect(rendered).not_to match (/Cities/)
	end

	it "shows a link to cities index if a user is logged in" do
		login(@user)
		render :template => "layouts/_header"
    expect(rendered).to match (/Cities/)
	end
end
	
	after(:all) do
		@user.destroy
	end
end