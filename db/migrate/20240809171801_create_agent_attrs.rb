class CreateAgentAttrs < ActiveRecord::Migration[7.1]
  def change
    create_table :agent_attrs do |t|
      t.string :agent_attr_title

      t.timestamps
    end
  end
end
