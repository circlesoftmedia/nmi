class ChangeColumnTypeToProductItems < ActiveRecord::Migration
  def up
    rename_column :product_items, :type, :item_type
  end
end
