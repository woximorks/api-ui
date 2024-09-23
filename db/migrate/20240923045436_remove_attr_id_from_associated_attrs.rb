class RemoveAttrIdFromAssociatedAttrs < ActiveRecord::Migration[7.1]
  def change
    remove_column :associated_attrs, :attr_id, :string
  end
end
