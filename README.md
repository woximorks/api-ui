# README

1. Initial framework established -
    - copied database.yml file from existing heroku repo and updated as necessary
    - pg gem to seedfile
    - Ran commands
        - bundle lock --add-platform x86_64-linux --add-platform ruby
            - https://devcenter.heroku.com/articles/getting-started-with-rails7
        - rails g controller Pages home
        - rails g model Endpoint endpoint_title
        - rails g model Attr attr_title
        - rails db:migrate
    - Seed file updated to populate the database with some starter info for all endpoints, and all related ActionLog attrs
        - find or create by does not add duplicate entries to the attrs table
        - Pulled tables directly from the provided links as commented in that seed file 
            - used dev tools, inspected the tables and extracted the necessary info
    - Homepage shows these endpoints and attributes, as set by the route 'root "pages#home"'
    - pages controller references all endpoint and attribute models so they can display dynamically on the homepage with the added logic to the home.html.erb file

2. Created the endpoint_associated_attr model, basic database structure
    - Ran command
        - rails g model endpoint_associated_attr endpoint:references endpoint_create:boolean endpoint_update:boolean endpoint_show:boolean endpoint_index:boolean endpoint_delete:boolean attr:references attr_create_request:boolean attr_create_response:boolean attr_delete_request:boolean attr_delete_response:boolean attr_index_request:boolean attr_index_response:boolean attr_show_request:boolean attr_show_response:boolean attr_update_request:boolean attr_update_response:boolean attr_type associated_ui_info associated_product_info
            - Generated changes to schema.rb file
            - Created the associated model.rb file
    - Referenced this model within Pages controller -> home
    - Display all associations on the home page
    - Seeds file updated, it now includes all Agent related attrs
    - db/backups folder and commands file created
        - This folder will contain the database backup, which can be generated with the listed command within the commands file
        - There is also an insert command that'll populate a test endpoint_associated_attr if necessary

3. Refactoring the seed data
    - https://medium.com/@ethanryan/split-your-rails-seeds-file-into-separate-files-in-different-folders-3c57be765818
    - rails g model ActionlogAssociatedAttr attr:references attr_title endpoint:references endpoint_title

4. Cleanup

5. Some more seed data added, using ChatGPT to pull this data slowly because I don't want to pay for unlimited chat data
    - Some notes about this data
        - It doesn't incorporate endpoints that are array or object type at this time
    - ActionLog - LeadSource is now populated into the seed files