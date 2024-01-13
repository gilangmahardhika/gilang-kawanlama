class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :sku
      t.integer :count, default: 0
      t.string :first_photo
      t.string :second_photo
      t.string :third_photo

      t.timestamps
    end
    add_index :products, :name
    add_index :products, :sku, unique: true
    add_index :products, :count
  end
end
