class CreateEmailCampaignAttrs < ActiveRecord::Migration[7.1]
  def change
    create_table :email_campaign_attrs do |t|
      t.string :email_campaign_attr_title

      t.timestamps
    end
  end
end
