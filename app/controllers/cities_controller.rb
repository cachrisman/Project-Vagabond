class CitiesController < ApplicationController
  include CitiesHelper

	def index
  	render :index
  end

  def show
  	@city = City.find(params[:id])
        @image_path = "#{params[:id]}.jpg"
        @log_posts = LogPost.where("city_id == #{@city.id}").order(:updated_at).reverse_order
        @users = []
        @log_posts.each do |post|
          post.title.slice(0, 100)  #truncate to 100 chars
          post.body.slice(0, 140)  #truncate to 140 chars
          @users << User.find(post.user_id)
        end
        #binding.pry
  	render :show
  end
end
