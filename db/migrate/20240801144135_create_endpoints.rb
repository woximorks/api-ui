class CreateEndpoints < ActiveRecord::Migration[7.1]
  def change
    create_table :endpoints do |t|
      t.string :endpoint_title

      t.timestamps
    end
  end
end
