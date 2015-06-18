class CitiesController < ApplicationController
  include CitiesHelper
  #before_filter :redirect_unauthenticated, except: [:show]

	def index
        end

  def show
  	@city = City.find(params[:id])

        @map_url = "https://www.google.com/maps/embed/v1/place?key=AIzaSyA6uHiYNpXLoVoNBWrgPgS1tIGYcn6tHH0&q=#{@city.name.sub(' ', '+')}"
        @log_posts = LogPost.where("city_id == #{@city.id}").order(:updated_at).reverse_order

        @users = []
        @log_posts.each do |post|
          post.title.slice(0, 100)  #truncate to 100 chars
          post.body.slice(0, 140)  #truncate to 140 chars
          @users << User.find(post.user_id)
        end
  	render :show
  end
end
