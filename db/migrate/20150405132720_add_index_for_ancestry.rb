class AddIndexForAncestry < ActiveRecord::Migration
  def up
    add_index :categories, :ancestry
  end

  def down
    remove_index :categories, :ancestry
  end
end
