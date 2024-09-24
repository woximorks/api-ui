class DatabaseCleanup < ActiveRecord::Migration[7.1]
  def change
    drop_table :endpoints
    drop_table :attrs
    drop_table :products
  end
end
