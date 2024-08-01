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

2. 