class AddUniqCodeToProducts < ActiveRecord::Migration
  def change
    add_column :products, :uniq_code, :string

  end
end
