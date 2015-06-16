class RemoveCityFromLogPost < ActiveRecord::Migration
  def change
    remove_column :log_posts, :city, :string
  end
end
