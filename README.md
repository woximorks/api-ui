# README

* This project demonstrates the available Endpoints in the MoxiCloud API, and how their corresponding Attributes associate to the different Products, and the MoxiWorks UI.

* Features and Information
    - /index
        - Search box checks against the DB within each associated_attr -> [attr_title, ui_info, associated_endpoints]. This scope can be updated in the associated_attr.rb model file
        - https://github.com/Casecommons/pg_search
        - After searching, product related information populates for each attr that is associated in some way.
            - Logic related to the order / how this returned content displays can be set on the index.html.erb file.
                - Updates to the corresponding titles representing this information on that index file can be set within the application_helper.rb file.
   - /{#endpoint}
        - Infographic containing each attribute associated with that {#endpoint}, and what product it associates to.

* API Support
    - use /api/{#attr_title} to call the related API data for an attribute and it's associations.
        - #attr_title is the attr_title as seen in the associated_attrs table.
        
* Databasics
    - To create and populate the database
        - There is a backup file in the db/ folder, created with pg_dump, titled {#endpoint}-{#endpoint}.sql
        - Alternatively
            - rails db:create db:migrate db:seed
            - Connect to the database
            - Run each {#endpoint}.sql file within db/ folder
    - Table info
        - associated_attrs: Attributes that are associated with an endpoint and a Moxi product
            - id: The unique ID of the associated_attr
            - request_type: The type of request(s) associated with an endpoint
                - jsonb objects
                - The title of each Array will indicate which endpoint is being referenced
                - The contents of each Array are strings that indicate the type(s) of requests, ie ['Create Request', 'Delete Request']
            - ui_info: Information about the attribute. It's association, the product it's associated with, and how it correlates to the UI and the Moxi product(s)
                - jsonb objects
                - ProductText (APIText, ActionLogText, etc): The actual string containing words about the specific attribute and it's association to that product. For example, APIText for agent_uuid contains specific information about the agent_uuid attribute and how it can be used to make API calls, whereas RosterText for the same agent_uuid attribute contains information specific to how and where it associates to the UI.
                - Products Array
                    - Contains all associated products, ie ["ActionLog", "API", "Engage"]
                - Endpoint Array (ActionLog, Agent)
                    - Contains specific product associations based on the Array selected, allowing for greater control of what displays when and where on the front end and use of the pgsearch features.
            - associated_endpoint: Supplemental information related to which endpoints the attribute is associated with. Using this to control when stuff displays on the front end.
            - attr_title: The title of the attribute, as it can be called within the API and displays within the documentation
            - created and updated columns are self explanatory
    
    -

* Update Notes
    
    - 

* To Do:
    - These are things that need to be addressed - a list of non critical issues that can be addressed in a single commit moving forward
    - A:
    - B:
    - C: 