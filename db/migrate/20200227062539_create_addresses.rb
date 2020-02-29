class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :end_user_id
      t.string :postalcode
      t.string :street_address
      t.string :address

      t.timestamps
    end
  end
end
