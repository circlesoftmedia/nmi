class ChangeBrandNameToBrandIdProducts < ActiveRecord::Migration
  def up
    rename_column :products, :brand_name, :brand_id
    change_column :products, :brand_id, :integer
  end
end
