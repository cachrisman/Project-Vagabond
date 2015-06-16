class LogPostsController < ApplicationController
  before_action :set_log_post, only: [:show, :edit, :update, :destroy]

  # GET /log_posts
  # GET /log_posts.json
  def index
    @log_posts = LogPost.all
  end

  # GET /log_posts/1
  # GET /log_posts/1.json
  def show
  end

  # GET /log_posts/new
  def new
    @log_post = LogPost.new
  end

  # GET /log_posts/1/edit
  def edit
    if current_user.id == @log_post.user_id
      render :edit
    else 
      flash[:warning] = "Sorry, you can only edit your own posts"
      redirect_to @log_post
    end
  end

  # POST /log_posts
  # POST /log_posts.json
  def create
    @log_post = LogPost.new(log_post_params)

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

  # PATCH/PUT /log_posts/1
  # PATCH/PUT /log_posts/1.json
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

  # DELETE /log_posts/1
  # DELETE /log_posts/1.json
  def destroy
    @log_post.destroy
    respond_to do |format|
      format.html { redirect_to log_posts_url, notice: 'Log post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_log_post
      @log_post = LogPost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def log_post_params
      params.require(:log_post).permit(:title, :body, :user_id, :city)
    end
end
