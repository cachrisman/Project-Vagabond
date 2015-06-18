require 'rails_helper'

RSpec.describe "users/show", type: :view do

  before(:all) do
    City.create({name: "San Francisco"})
    @user = assign(:user, User.create!(
      :first_name => "Charlie",
      :last_name => "Chrisman",
      :email => "charlie@chrisman.com",
      :password => "bad",
      :city_id => 1
    ))
  end

  it "displays the name of the user's current city" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end

  after(:all) do
    @user.destroy
  end
end
