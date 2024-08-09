class CreateContactAttrs < ActiveRecord::Migration[7.1]
  def change
    create_table :contact_attrs do |t|
      t.string :contact_attr_title

      t.timestamps
    end
  end
end
