class AddAssociatedEndpointsToAssociatedAttrs < ActiveRecord::Migration[7.1]
  def change
    add_column :associated_attrs, :associated_endpoint, :jsonb, default: {}, null: false
  end
end
