class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_filter :redirect_unauthenticated, except: [:new, :create]

  def index
    @user = current_user
    return redirect_to @user if @user
    redirect_to login_path
  end

  def show
    @user = User.find(params[:id])
    @log_posts = @user.log_posts.limit(10)
    @log_post_limit = 10

      render :show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    if current_user == @user
      render :edit
    else
      flash[:warning] = "Sorry, you can only edit your own profile"
      redirect_to @user
    end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        login(@user)
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      city = City.find_by_name(params[:user][:city])
      if city == nil
        city = City.create({name: params[:user][:city]})
      end

      @user_params = {}
      @user_params = params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
      @user_params[:city_id] = city.id
      return @user_params
    end

end
