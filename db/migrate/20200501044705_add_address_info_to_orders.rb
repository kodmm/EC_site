class AddAddressInfoToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :address_info, :string
  end
end
