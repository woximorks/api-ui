class CreateActionLogAttrs < ActiveRecord::Migration[7.1]
  def change
    create_table :action_log_attrs do |t|
      t.string :action_log_attr_title

      t.timestamps
    end
  end
end
