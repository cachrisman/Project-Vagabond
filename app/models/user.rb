class User < ActiveRecord::Base
  has_secure_password
  validates :email, uniqueness: true
  validates :first_name, :last_name, :email, :city_id, presence: true
  has_many :log_posts
  belongs_to :city
  has_and_belongs_to_many :following,
                          class_name: "User",
                          join_table: "following",
                          foreign_key: "user_id",
                          association_foreign_key: "following_id"

  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user.try(:authenticate, params[:password])
  end
end
