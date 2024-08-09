class CreateGroupAttrs < ActiveRecord::Migration[7.1]
  def change
    create_table :group_attrs do |t|
      t.string :group_attr_title

      t.timestamps
    end
  end
end
