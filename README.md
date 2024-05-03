# README
*Endpoints*
- All available Endpoints in the MoxiCloud API Documentation - http://moxiworks-platform.github.io/api.html#api-endpoint-usage
- Each individual endpoint page contains a list of associated attributes, and what they correlate to within the UI.
    -((endpoints/[id]) (see endpoint show / _endpoint view files)) for more info
- The endpoint ID (and attribute ID) is necessary to associate an attribute using the 'endpoint associated attributes' section, and is listed on this endpoint show page.

----------

*Attributes*
- Related Attribute information for any Attribute that is associated with an Endpoint.
- Much of the same logic applies here as Endpoint, where the attr page contains a list of associated Endpoints, linking to that unique association, and the attr ID is listed on this page (it's also in the URL path /attrs[id])

----------

*Endpoint Associated Attributes*
- All uniquely associated endpoint-attribute information. This is the bread and butter of the application and where the information related to these unique associations lives.

----------

*User Info*
- A user session must be created to create, update, or destroy these records. This is managed through the devise gem - https://rubygems.org/gems/devise/versions/4.9.3?locale=en and was implemented to ensure unauthorized changes cannot be made to this info.