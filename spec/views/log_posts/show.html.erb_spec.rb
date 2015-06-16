require 'rails_helper'

RSpec.describe "log_posts/show", type: :view do
  before(:each) do
    @log_post = assign(:log_post, LogPost.create!(
      :title => "Title",
      :body => "MyText",
      :user => nil,
      :city => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
