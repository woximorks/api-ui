class CreateTaskAttrs < ActiveRecord::Migration[7.1]
  def change
    create_table :task_attrs do |t|
      t.string :task_attr_title

      t.timestamps
    end
  end
end
