class InitialSchema < ActiveRecord::Migration[7.1]
  def change
    create_table :associated_attrs do |t|
      t.jsonb :request_type, null: false, default: {}
      t.jsonb :ui_info, null: false, default: {}
      t.jsonb :associated_endpoints, null: false, default: {}
      t.string :attr_title, null: false

      t.timestamps
    end
  end
end