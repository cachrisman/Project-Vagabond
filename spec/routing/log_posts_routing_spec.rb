require "rails_helper"

RSpec.describe LogPostsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/log_posts").to route_to("log_posts#index")
    end

    it "routes to #new" do
      expect(:get => "/log_posts/new").to route_to("log_posts#new")
    end

    it "routes to #show" do
      expect(:get => "/log_posts/1").to route_to("log_posts#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/log_posts/1/edit").to route_to("log_posts#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/log_posts").to route_to("log_posts#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/log_posts/1").to route_to("log_posts#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/log_posts/1").to route_to("log_posts#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/log_posts/1").to route_to("log_posts#destroy", :id => "1")
    end

  end
end
