class LogPost < ActiveRecord::Base
 	validates :user_id, :city_id, :title, :body, presence: true
        validates :title, length: { maximum: 200}
  
  belongs_to :user
  belongs_to :city
end
