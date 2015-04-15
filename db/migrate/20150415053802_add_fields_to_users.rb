class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_active, :boolean, default: true
    add_column :users, :start_date, :date
    add_column :users, :end_date, :date
    add_column :users, :contact_num_first, :string
    add_column :users, :contact_num_second, :string
    add_column :users, :uniq_id, :string

    add_column :products, :is_active, :boolean, default: false
    add_column :products, :store, :string

  end
end
