class RemoveAddressInfoFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :address_info, :integer
  end
end
