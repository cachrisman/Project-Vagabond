class LogPost < ActiveRecord::Base
 	validates :user_id, :city_id, :title, :body, presence: true
  
  belongs_to :user
  belongs_to :city
end
