class CreateBuyerTransactionAttrs < ActiveRecord::Migration[7.1]
  def change
    create_table :buyer_transaction_attrs do |t|
      t.string :buyer_transaction_attr_title

      t.timestamps
    end
  end
end
