class CitiesController < ApplicationController
  def index
  	@cities = City.all
  	render :index
  end

  def show
  	@city = City.find(params[:id])
    @image_path = "#{params[:id]}.jpg"
  	render :show
  end
end
