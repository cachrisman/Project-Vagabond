class CitiesController < ApplicationController
  include CitiesHelper

	def index
  	return redirect_unauthenticated
    render :index
  end

  def show
    return redirect_unauthenticated unless logged_in?
  	@city = City.find(params[:id])
        @image_path = "#{params[:id]}.jpg"
        @log_posts = LogPost.where("city_id == #{@city.id}").order(:updated_at).reverse_order
        @users = []
        @log_posts.each do |post|
          @users << User.find(post.user_id)
        end
        #binding.pry
  	render :show
  end
end
