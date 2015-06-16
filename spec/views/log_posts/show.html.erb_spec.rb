require 'rails_helper'

RSpec.describe "log_posts/show", type: :view do
  before(:each) do
    city = City.new
    city.name = "San Francisco"
    @log_post = assign(:log_post, LogPost.create!(
      :title => "Title",
      :body => "MyText",
      :user_id => 1,
      :city => city
    ))
    @user = assign(:user, User.create!(
                     :first_name => "Alex",
                     :last_name => "Kelley",
                     :city_id => 1,
                     :email => "ak@me.com",
                     :password => "nogood"
                     ))

    # log in the user
    session[:user_id] = @user.id
    current_user = @user
  end

  it "renders all attributes in <p>" do
    render
    expect(rendered).to match (/Title/)
    expect(rendered).to match (/MyText/)
    expect(rendered).to match (/#{@user.first_name}/)
    expect(rendered).to match (/#{@user.last_name}/)
    expect(rendered).to match (/#{@log_post.city.name}/)
  end

end
