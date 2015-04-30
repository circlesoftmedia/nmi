class ChangeDatatypesToProducts < ActiveRecord::Migration
  def up
    change_column :products, :description, :text
  end
end
