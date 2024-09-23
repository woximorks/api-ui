# README

* This project demonstrates the available Endpoints in the MoxiCloud API, and how their corresponding Attributes associate to the different Products, and the MoxiWorks UI.
            
    - Converted ui_info model to jsonb type
        - made necessary updates to the front end files to display the content appropriately.
        - threw everything into a 'general' category but the option to add other json objects is there for now.
        - Will absolutely need to revisit the Office endpoint, among others. Many of these attributes are incorrectly associated with Engage and, for example, the address related descriptions display related to Engage > transactions.

    - Refactoring after database restructure
        - Product association is now set within ui_info, specifically as a key value. i.e. {'Roster': 'some info, very specific to the roster associated attribute', 'Engage': 'engage info that doesn't apply to the roster specific attribute'}
            - commands.sql file also contains an update statement to fix the related descriptions as necessary
        - Check for 2 conditions on the front end
            - Endpoint association, and if the endpoint is associated, display the corresponding Product association info.
            - This is useful because there are attributes that share the same name (address, phone_number), but might correlate to Engage in one instance, and Roster in another depending on the associated Endpoint.
        - rails g migration AddAssociatedEndpointsToAssociatedAttrs associated_endpoint
        - rails g migration RemoveEndpointIdFromAssociatedAttrs endpoint_id
        - rails g migration RemoveProductIdFromAssociatedAttrs product_id
        - rails g migration RemoveAttrIdFromAssociatedAttrs attr_id
        - rails g migration AddAttrTitleToAssociatedAttrs attr_title
        - Seed files - removed the associations to these endpoint_id and product_id
        - https://ruby-doc.org/core-2.3.1/Array.html#method-i-dig
        - Commands file now contains 3 starter update statments. 
            - These now update the info based on the actual attr title, not an ID that was associated in some way through a different table. Yay.
            - looking at source_agent_id specifically, info related to this attribute will show on the ActionLog (specific to Roster), and more detail on the 'Agent' page is provided (the 'API' related data references the Agent endpoint specifically, so it shows on this page too. It might not make sense for that data to display on the ActionLog page, since it's specific to the Agent endpoint. This isn't the best example, but it demonstrates how this application and the related associations work.)
            - This is all controlled through the corresponding arrays and data added to 'ui_info' column. The 'ActionLog' array has only 'Roster' associated in the update statement (so Roster related text displays only on the front end), but the 'Agent' array has 'API' and 'Roster' associated (so both associated text values display on the front end).
    
    - pg_search gem will need to be revisited (it calls db tables that no longer exist)
        - https://github.com/Casecommons/pg_search
        - https://www.youtube.com/watch?v=ZRpXAY21t28
        - associated_attr model is updated to include search params for 'keyword'. It checks 'endpoint.endpoint_title, attr.attr_title, product.product_title, and ui_info'.