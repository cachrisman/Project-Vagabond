require 'rails_helper'

RSpec.describe "log_posts/show", type: :view do
  before(:each) do
    @city = City.create({
      name: "San Francisco",
      continent: "North America"
      })

    @user = User.create({
      first_name: "Chuck",
      last_name: "Norris",
      email: "joe@dirt.com",
      password: "nopasschuck",
      city: @city
      })

    @log_post = assign(:log_post, LogPost.create!(
      :title => "Title",
      :body => "MyText",
      :user => @user,
      :city => @city
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Chuck/)
    expect(rendered).to match(/San Francisco/)
  end
end
