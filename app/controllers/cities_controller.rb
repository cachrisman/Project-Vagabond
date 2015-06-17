class CitiesController < ApplicationController
  include CitiesHelper

	def index
  	render :index
  end

  def show
  	@city = City.find(params[:id])
    @image_path = "#{params[:id]}.jpg"
  	render :show
  end
end
