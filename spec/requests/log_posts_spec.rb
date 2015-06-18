require 'rails_helper'

RSpec.describe "LogPosts", type: :request do
  describe "GET /log_posts" do
    it "works! (now write some real specs)" do
      get log_posts_path
      expect(response).to have_http_status(200)
    end
  end
end
