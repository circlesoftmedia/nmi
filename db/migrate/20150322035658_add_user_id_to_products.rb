class AddUserIdToProducts < ActiveRecord::Migration
  def change
    add_column :products, :user_id, :integer
    change_column :products, :brand_id, :integer
  end
end
