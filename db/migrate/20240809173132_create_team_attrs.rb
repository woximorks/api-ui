class CreateTeamAttrs < ActiveRecord::Migration[7.1]
  def change
    create_table :team_attrs do |t|
      t.string :team_attr_title

      t.timestamps
    end
  end
end
