class ChangeAssociatedEndpointToAssociatedEndpoints < ActiveRecord::Migration[7.1]
  def change
    rename_column :associated_attrs, :associated_endpoint, :associated_endpoints
  end
end
