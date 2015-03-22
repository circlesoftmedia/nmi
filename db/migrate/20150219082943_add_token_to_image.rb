class AddTokenToImage < ActiveRecord::Migration
  def change
    add_column :images, :product_token, :string

  end
end
