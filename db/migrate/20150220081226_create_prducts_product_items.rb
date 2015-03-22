class CreatePrductsProductItems < ActiveRecord::Migration
  def change
    create_table :products_product_items do |t|
      t.integer :product_id
      t.integer :product_item_id
      t.string  :value
      t.timestamps
    end
  end
end
