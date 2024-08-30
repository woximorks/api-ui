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
        - rake db:seed
        - run contents of 'commands.sql' file