class AddAdminPlainPasswordToStores < ActiveRecord::Migration[8.0]
  def change
    add_column :stores, :admin_plain_password, :string
  end
end
