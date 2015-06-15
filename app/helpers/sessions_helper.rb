module SessionsHelper

  def login(user)
    session[:user_id] = user.id
    @current_user = user
  end

  def current_user
    return false if session[:user_id] == nil
    @current_user ||= User.find(session[:user_id])
  end

  def logged_in?
    if current_user == nil
      return false
    else
      return true
    end
  end

  def logout
    @current_user = session[:user_id] = nil
    redirect_to root_path
  end

end
