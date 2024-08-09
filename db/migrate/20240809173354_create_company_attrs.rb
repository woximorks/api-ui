class CreateCompanyAttrs < ActiveRecord::Migration[7.1]
  def change
    create_table :company_attrs do |t|
      t.string :company_attr_title

      t.timestamps
    end
  end
end
