require 'rails_helper'

RSpec.describe "cities/show.html.erb", type: :view do
    before(:all) do
    @city = City.create({
      :name => "San Francisco",
      :continent => "North America"
    })
    @user = User.create({
      :first_name => "Charlie",
      :last_name => "Chrisman",
      :email => "charlie@chrisman.com",
      :password => "bad",
      :city => @city
    })
    @logpost = LogPost.create({
      :title => "test post title",
      :body => "test post body",
      :user => @user,
      :city => @city
    })
  end

  it "displays the name of city" do
    render
    expect(rendered).to match(/San Francisco/)
  end

  it "displays log post title" do
    render
    expect(rendered).to match(/Title/)
  end

  after(:all) do
    #teardown
    @city.destroy
    @user.destroy
    @logpost.destroy
  end
end
