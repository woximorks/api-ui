class CreateOfficeAttrs < ActiveRecord::Migration[7.1]
  def change
    create_table :office_attrs do |t|
      t.string :office_attr_title

      t.timestamps
    end
  end
end
