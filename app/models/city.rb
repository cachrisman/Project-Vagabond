class City < ActiveRecord::Base
  has_many :users
  has_many :log_posts
end
