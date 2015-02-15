class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.string :description
      t.float :price
      t.string :brand_name
      t.string :part_number

      t.timestamps
    end
  end
end
