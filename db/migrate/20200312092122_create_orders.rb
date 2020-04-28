class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :end_user_id
      t.integer :order_status
      t.integer :total_price
      t.integer :payment
      t.string :postal_code
      t.integer :postage
      t.string :address
      t.string :street_address
      t.integer :address_btn
      t.timestamps
    end
  end
end
