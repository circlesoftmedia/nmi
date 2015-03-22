class CreateProductItems < ActiveRecord::Migration
  def change
    create_table :product_items do |t|
      t.string :name
      t.string :type

      t.timestamps
    end
  end
end
