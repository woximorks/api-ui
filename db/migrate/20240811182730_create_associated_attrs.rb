class CreateAssociatedAttrs < ActiveRecord::Migration[7.1]
  def change
    create_table :associated_attrs do |t|
      t.references :endpoint, null: false, foreign_key: true
      t.references :attr, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.jsonb :request_type, null: false, default: {}
      t.jsonb :ui_info, null: false, default: {}
      t.timestamps
    end
  end
end
