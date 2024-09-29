# README

* This project demonstrates the available Endpoints in the MoxiCloud API, and how their corresponding Attributes associate to the different Products, and the MoxiWorks UI.

* Databasics
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

* Update Notes
    - 

* To Do:
    - These are things that need to be addressed - a list of non critical issues that can be addressed in a single commit moving forward
    - A:
    - B:
    - C: 