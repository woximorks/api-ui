# README

* This project demonstrates the available Endpoints in the MoxiCloud API, and how their corresponding Attributes associate to the different Products, and the MoxiWorks UI.

    - This is demonstrated using has many through associations.
        - https://guides.rubyonrails.org/v7.2/association_basics.html#the-has-many-through-association
        - https://guides.rubyonrails.org/v7.2/association_basics.html#choosing-between-has-many-through-and-has-and-belongs-to-many
            - The simplest rule of thumb is that you should set up a has_many :through relationship if you need to work with the relationship model as an independent entity. If you don't need to do anything with the relationship model, it may be simpler to set up a has_and_belongs_to_many relationship (though you'll need to remember to create the joining table in the database).
    - Proof of concept using ActionLog, Agent, and Brand. These pages display all appropriate information related to the endpoint, which product it's associated with, and the association info. I've also included information from the MoxiCloud documentation, where applicable.
        - http://moxiworks-platform.github.io/api.html#moxicloud-api-introduction
    - Some basic front end has been added, mostly using Flex principles and some stockish images. I also added bootstrap, though I don't use it much.
        - Bootstrap and related libraries implemented
        - Added "Open Sans" font from Google library, set some basic styling to more closely match our help center
        - Replaced the images with those from the help center
    - 'Unassociated' is a placeholder product type to allow the DB to seed with current associations in place between product and associated_attr
    - ActionLog, Agent, and Brand are completed. I've double checked against the existing documentation and all of the associated attributes are listed.
        - It's worth noting that this entire project 'working' relies on the current structure of the seed file (and referenced files in the seeds folder). The IDs for endpoints and attrs that are assigned are referenced in the commmands.sql file to populate the DB in the event that a complete reset needs to happen. Further changes to the seed files for ActionLog, Agent, Brand, or the root seed file at this point could break the application. As such, an SQL backup file has been created and added to db/backups folder.

    - Added pg_search gem
        - https://github.com/Casecommons/pg_search
        - https://www.youtube.com/watch?v=ZRpXAY21t28
        - associated_attr model is updated to include search params for 'keyword'. It checks 'endpoint.endpoint_title, attr.attr_title, product.product_title, and ui_info'.

    - BuyerTransaction added
        - nav shared view created and added to all pages
            - Changes to some routes
        - commands.sql contains all documentation related info
    
    - Company added
        - associated commands added to commands.sql file
        - shared company associated attrs file updated to display the appropriate product cards
        - nav updated to include links to the company view
        - routes updated
        - action referenced in the pages controller
        - actual company page within the pages folder added

    - Followed same steps within the 'Company added' section above for other endpoints.
        - Contact, EmailCampaign, Event, Gallery, Group, LeadSource, 
            
    - Converted ui_info model to jsonb type
        - made necessary updates to the front end files to display the content appropriately.
        - threw everything into a 'general' category but the option to add other json objects is there for now.
