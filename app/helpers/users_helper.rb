module UsersHelper

	def user_log_posts
		user = User.find(params[:id])
		user.log_posts
	end

end
