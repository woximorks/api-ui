class RemoveProductIdFromAssociatedAttrs < ActiveRecord::Migration[7.1]
  def change
    remove_column :associated_attrs, :product_id, :string
  end
end
