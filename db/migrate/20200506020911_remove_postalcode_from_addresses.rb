class RemovePostalcodeFromAddresses < ActiveRecord::Migration[5.2]
  def change
    remove_column :addresses, :postalcode, :string
  end
end
