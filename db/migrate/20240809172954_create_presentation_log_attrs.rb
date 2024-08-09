class CreatePresentationLogAttrs < ActiveRecord::Migration[7.1]
  def change
    create_table :presentation_log_attrs do |t|
      t.string :presentation_log_attr_title

      t.timestamps
    end
  end
end
