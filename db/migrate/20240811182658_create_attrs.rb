class CreateAttrs < ActiveRecord::Migration[7.1]
  def change
    create_table :attrs do |t|
      t.string :attr_title

      t.timestamps
    end
  end
end
