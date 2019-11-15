class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title #force is not to be empty --- minimun and maximum length
      t.string :body #force is not to be empty --- minimun and maximum length
      t.references :user, foreign_key: true #force is not to be empty
      t.timestamps      
    end
    add_index :posts, [:user_id, :created_at]
  end
end
