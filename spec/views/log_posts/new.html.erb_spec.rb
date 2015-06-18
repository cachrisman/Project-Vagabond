require 'rails_helper'

RSpec.describe "log_posts/new", type: :view do
  before(:each) do
    assign(:log_post, LogPost.new(
      :title => "MyString",
      :body => "MyText",
      :user => nil,
      :city => nil
    ))
  end

  it "renders new log_post form" do
    render

    assert_select "form[action=?][method=?]", log_posts_path, "post" do

      assert_select "input#log_post_title[name=?]", "log_post[title]"

      assert_select "textarea#log_post_body[name=?]", "log_post[body]"

      assert_select "input#log_post_user_id[name=?]", "log_post[user_id]"

      assert_select "input#log_post_city_id[name=?]", "log_post[city_id]"
    end
  end
end
