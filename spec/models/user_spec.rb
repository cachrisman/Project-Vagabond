require 'rails_helper'

RSpec.describe User, type: :model do
    #setup
    before(:all) do
      City.create({name: "San Francisco"})
      @params = {
        :first_name => "Charlie",
        :last_name => "Chrisman",
        :email => "charlie@chrisman.com",
        :password => "bad",
        :city_id => 1
        }

      @user = User.create(@params)
      login(@user)
      p current_user
    end

    it "has a well formatted email with an @ symbol" do
    #verify
    expect(@user.email).to match "@"

    #teardown
  end

end
