class ChangeBrandNameToBrandIdProducts < ActiveRecord::Migration
  def up
    remove_column :products, :brand_name
  end

end
