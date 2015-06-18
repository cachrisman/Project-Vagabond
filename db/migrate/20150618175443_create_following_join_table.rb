class CreateFollowingJoinTable < ActiveRecord::Migration
  def change
   create_table :following, id: false do |t|
     t.integer :user_id
     t.integer :following_id
   end
   add_index :following, [:user_id, :following_id]
  end
end
