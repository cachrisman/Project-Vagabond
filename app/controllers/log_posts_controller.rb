class LogPostsController < ApplicationController
  before_action :set_log_post, only: [:show, :edit, :update, :destroy]
  before_filter :redirect_unauthenticated
  include CitiesHelper

  def index
    return redirect_to cities_index_path if logged_in?
    redirect_to login_path
  end

  def show
    @post = LogPost.find(params[:id])
    @posts = LogPost.includes(:title, :body).order("created_at DESC").limit(5)
  end

  def new
    @log_post = LogPost.new
    @log_post.city = current_user.city
  end

  def edit
    if current_user.id == @log_post.user_id
      render :edit
    else
      flash[:warning] = "Sorry, you can only edit your own posts"
      redirect_to @log_post
    end
  end

  def create
    @log_post = LogPost.new(log_post_params)
    @log_post.city = current_user.city

    respond_to do |format|
      if @log_post.save
        format.html { redirect_to @log_post, notice: 'Log post was successfully created.' }
        format.json { render :show, status: :created, location: @log_post }
      else
        format.html { render :new }
        format.json { render json: @log_post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @log_post.update(log_post_params)
        format.html { redirect_to @log_post, notice: 'Log post was successfully updated.' }
        format.json { render :show, status: :ok, location: @log_post }
      else
        format.html { render :edit }
        format.json { render json: @log_post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if current_user.id == @log_post.user_id
      @log_post.destroy
      respond_to do |format|
        #format.html { redirect_to log_posts_url, notice: 'Log post was successfully destroyed.' }
        format.html { redirect_to :back, notice: 'Log post was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      flash[:warning] = "Sorry, you can only delete your own posts"
      redirect_to :back
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_log_post
      @log_post = LogPost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def log_post_params

      city = check_city_input

      @post_params = {}
      @post_params = params.require(:log_post).permit(:title, :body, :user_id)
      @post_params[:city_id] = city.id
      @post_params[:user_id] = current_user.id
      return @post_params
    end
end
