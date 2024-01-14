class RemoveFileFromExports < ActiveRecord::Migration[7.1]
  def change
    change_table :exports do |t|
      t.remove :file
    end
  end
end
