class AddAttrTitleToAssociatedAttrs < ActiveRecord::Migration[7.1]
  def change
    add_column :associated_attrs, :attr_title, :string
  end
end
