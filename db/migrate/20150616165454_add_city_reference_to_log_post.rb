class AddCityReferenceToLogPost < ActiveRecord::Migration
  def change
    add_reference :log_posts, :city, index: true, foreign_key: true
  end
end
