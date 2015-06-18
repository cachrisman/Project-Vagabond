class RemoveCityFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :city, :string
  end
end
