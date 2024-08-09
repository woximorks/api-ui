class CreateLeadSourceAttrs < ActiveRecord::Migration[7.1]
  def change
    create_table :lead_source_attrs do |t|
      t.string :lead_source_attr_title

      t.timestamps
    end
  end
end
