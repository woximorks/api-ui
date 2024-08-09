class CreateWebUserAttrs < ActiveRecord::Migration[7.1]
  def change
    create_table :web_user_attrs do |t|
      t.string :web_user_attr_title

      t.timestamps
    end
  end
end
