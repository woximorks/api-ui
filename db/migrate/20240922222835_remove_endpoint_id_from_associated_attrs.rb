class RemoveEndpointIdFromAssociatedAttrs < ActiveRecord::Migration[7.1]
  def change
    remove_column :associated_attrs, :endpoint_id, :string
  end
end
