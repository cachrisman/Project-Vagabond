require 'rails_helper'

RSpec.describe "log_posts/index", type: :view do
  before(:each) do
    assign(:log_posts, [
      LogPost.create!(
        :title => "Title",
        :body => "MyText",
        :user => nil,
        :city => nil
      ),
      LogPost.create!(
        :title => "Title",
        :body => "MyText",
        :user => nil,
        :city => nil
      )
    ])
  end

  it "renders a list of log_posts" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
