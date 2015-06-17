class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.confirm(params.require(:user).permit(:email, :password))
    if @user
      login(@user)
      flash[:success] = "Successful login"
      redirect_to cities_path
    else
      flash[:error] = "Something went wrong"
      redirect_to login_path
    end
  end

end
