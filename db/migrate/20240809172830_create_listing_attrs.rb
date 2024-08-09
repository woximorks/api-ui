class CreateListingAttrs < ActiveRecord::Migration[7.1]
  def change
    create_table :listing_attrs do |t|
      t.string :listing_attr_title

      t.timestamps
    end
  end
end
