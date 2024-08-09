class CreateSoldListingsAttrs < ActiveRecord::Migration[7.1]
  def change
    create_table :sold_listings_attrs do |t|
      t.string :sold_listings_attr_title

      t.timestamps
    end
  end
end
