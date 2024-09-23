company_attrs = [
#Show
    #--Request
    "moxi_works_company_id", #*
    #--Response
    "moxi_works_company_id", #"String"
    "name", #"String"
    "numeric_id", #"String"
    "client_company_id", #"String"
    "partners", #"Array"
    "public_partner_attrs", #"Hash or null"

#Index
    #--Request (no content)
    #--Response
    "moxi_works_company_id", #"String"
    "name", #"String"
    "numeric_id", #"String"
    "client_company_id", #"String"
    "public_partner_attrs", #"Hash or null"

#Search
    #--Request
    "per_page", #"Integer"
    "page_number", #"Integer"
    "parent_company_id", #"String"
    "show_paging_totals", #"Boolean"
    #--Response
    "name", #"String"
    "numeric_id", #"String"
    "client_company_id", #"String"
    "public_partner_attrs" #"Hash or null"
]

company_attrs.each do |attr_title|
    AssociatedAttr.find_or_create_by(attr_title: attr_title) do |attr|
      # Set other attributes if necessary, for example:
      attr.request_type = {}
      attr.associated_endpoint = {}
    end
  end