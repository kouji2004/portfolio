class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      # アソシエーションの為にuser_idが必要
      t.integer :user_id, null: false
      t.string :title, null: false
      t.string :body, null: false
      t.string :prevention, null: false
      t.references :category, null: false, foreign_key: true
      t.timestamps
    end
  end
end

