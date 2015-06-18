module LogPostsHelper

	def sanitize_obscenities(title, body)
		@title = Obscenity.sanitize(title)
		@body = Obscenity.sanitize(body)
	end
end
