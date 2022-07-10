class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|

      t.integer :user_id, null: false
      t.string :name
      t.string :subbody
      t.string :mainbody
      t.integer :gender
      t.timestamps
    end
  end
end
