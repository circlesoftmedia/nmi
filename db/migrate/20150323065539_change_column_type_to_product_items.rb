class ChangeColumnTypeToProductItems < ActiveRecord::Migration
  def up
    change_column :product_items, :type, :item_type
  end
end
