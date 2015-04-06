class AddSubCategoriesToProducts < ActiveRecord::Migration
  def change
    add_column :products, :sub_category_id, :integer

    add_column :products, :sub_category_first_id, :integer

    add_column :products, :sub_category_second_id, :integer

  end
end
