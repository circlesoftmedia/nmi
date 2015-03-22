class CategoryIdToProducts < ActiveRecord::Migration
  def up
    add_column :products, :category_id, :integer
  end
end
