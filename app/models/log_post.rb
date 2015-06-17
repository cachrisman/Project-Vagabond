class LogPost < ActiveRecord::Base
 	validates :user_id, :city_id, :title, :body, presence: true
        validates_length_of :title,
                            :minimum => 1,
                            :maximum => 200,
                            :allow_blank => false
        validates_length_of :body,
                            :minimum => 1,
                            :allow_blank => false
  
  belongs_to :user
  belongs_to :city
end
