class CreateEndpointAssociatedAttrs < ActiveRecord::Migration[7.1]
  def change
    create_table :endpoint_associated_attrs do |t|
      t.references :endpoint, null: false, foreign_key: true
      t.boolean :endpoint_create
      t.boolean :endpoint_update
      t.boolean :endpoint_show
      t.boolean :endpoint_index
      t.boolean :endpoint_delete
      t.references :attr, null: false, foreign_key: true
      t.boolean :attr_create_request
      t.boolean :attr_create_response
      t.boolean :attr_delete_request
      t.boolean :attr_delete_response
      t.boolean :attr_index_request
      t.boolean :attr_index_response
      t.boolean :attr_show_request
      t.boolean :attr_show_response
      t.boolean :attr_update_request
      t.boolean :attr_update_response
      t.string :attr_type
      t.string :associated_ui_info
      t.string :associated_product_info

      t.timestamps
    end
  end
end
