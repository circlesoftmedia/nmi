class AddUserIdToProducts < ActiveRecord::Migration
  def change
    remove_column :products, :brand_id
    add_column :products, :user_id, :integer
    add_column :products, :brand_id, :integer
  end
end
