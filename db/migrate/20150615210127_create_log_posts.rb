class CreateLogPosts < ActiveRecord::Migration
  def change
    create_table :log_posts do |t|
      t.string :title
      t.text :body
      t.references :user, index: true, foreign_key: true
      t.string :city

      t.timestamps null: false
    end
  end
end
