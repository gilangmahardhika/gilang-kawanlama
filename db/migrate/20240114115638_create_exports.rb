class CreateExports < ActiveRecord::Migration[7.1]
  def change
    create_table :exports do |t|
      t.string :file
      t.references :user, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
