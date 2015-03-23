class ChangeBrandNameToBrandIdProducts < ActiveRecord::Migration
  def up
    rename_column :products, :brand_name, :brand_id
  end

end
