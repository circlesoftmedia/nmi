class AddUserIdToProducts < ActiveRecord::Migration
  def change
    add_column :products, :user_id, :integer
    add_column :products, :brand_id, :integer
  end
end
