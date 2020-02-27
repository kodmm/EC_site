class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :genre_id
      t.string :name
      t.integer :price
      t.string :image_id
      t.integer :status
      t.text :details

      t.timestamps
    end
  end
end
