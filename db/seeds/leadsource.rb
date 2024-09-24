lead_source_attrs = [
#Index
    #--Request (no data)
    #--Response
    "moxi_works_lead_source_id", #"String"
    "name", #"String"
    "is_partner_alias", #"Boolean"
    "is_partner_default" #"Boolean"
]

lead_source_attrs.each do |attr_title|
    AssociatedAttr.find_or_create_by(attr_title: attr_title) do |attr|
      # Set other attributes if necessary, for example:
      attr.request_type = {}
      attr.associated_endpoints = {}
    end
  end