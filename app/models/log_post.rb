class LogPost < ActiveRecord::Base
  belongs_to :user
  belongs_to :city
end
