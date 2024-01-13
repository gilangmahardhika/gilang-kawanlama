class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.string :password_digest
      t.string :role

      t.timestamps
    end
    add_index :users, :email, unique: true
    add_index :users, :password_digest
    add_index :users, :role
  end
end
