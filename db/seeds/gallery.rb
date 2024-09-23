gallery_attrs = [
#Show
    #--Request
    "agent_uuid", #"String"
    "moxi_works_agent_id", #"String"
    "source_agent_id", #"String"
    "moxi_works_company_id", #"String"
    "parent_company_id", #"String"

    #--Response
    "ListingID", #"String"
    "ListOfficeAOR", #"String or null"
    "ListingImages" #"Array"
]

gallery_attrs.each do |attr_title|
    AssociatedAttr.find_or_create_by(attr_title: attr_title) do |attr|
      # Set other attributes if necessary, for example:
      attr.request_type = {}
      attr.associated_endpoint = {}
    end
  end