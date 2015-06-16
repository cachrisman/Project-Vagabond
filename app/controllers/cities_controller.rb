class CitiesController < ApplicationController
  include CitiesHelper

	def index
  	render :index
  end

  def show
  	@city = City.find(params[:id])
  	render :show
  end
end
