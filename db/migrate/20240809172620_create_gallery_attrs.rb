class CreateGalleryAttrs < ActiveRecord::Migration[7.1]
  def change
    create_table :gallery_attrs do |t|
      t.string :gallery_attr_title

      t.timestamps
    end
  end
end
