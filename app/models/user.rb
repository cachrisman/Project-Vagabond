class User < ActiveRecord::Base
  has_secure_password
  validates :email, uniqueness: true
  validates :first_name, :last_name, :email, :city_id, presence: true
  has_many :log_posts
  belongs_to :city

  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user.try(:authenticate, params[:password])
  end
end
