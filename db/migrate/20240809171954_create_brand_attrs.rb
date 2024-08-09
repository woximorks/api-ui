class CreateBrandAttrs < ActiveRecord::Migration[7.1]
  def change
    create_table :brand_attrs do |t|
      t.string :brand_attr_title

      t.timestamps
    end
  end
end
