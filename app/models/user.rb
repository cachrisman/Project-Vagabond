class User < ActiveRecord::Base
  has_secure_password

  has_many :log_posts
end
