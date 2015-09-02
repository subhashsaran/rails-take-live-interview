class AddColumnsToUsers < ActiveRecord::Migration
  def up
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :is_admin, :boolean
  end
  def down
    remove_column :users, :provider
    remove_column :users, :uid
    remove_column :users, :is_admin
  end
end
