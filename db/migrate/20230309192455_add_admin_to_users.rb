class AddAdminToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :admin, :string
    add_column :users, :boolean, :string
  end
end
