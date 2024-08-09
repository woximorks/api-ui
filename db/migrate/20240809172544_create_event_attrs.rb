class CreateEventAttrs < ActiveRecord::Migration[7.1]
  def change
    create_table :event_attrs do |t|
      t.string :event_attr_title

      t.timestamps
    end
  end
end
