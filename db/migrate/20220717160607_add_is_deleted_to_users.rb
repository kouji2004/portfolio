class AddIsDeletedToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :is_delete, :boolean, default: false, null:false
  end
end
