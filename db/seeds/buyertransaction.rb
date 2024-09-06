buyertransaction_attrs = [
#Create
    #--Request
    "agent_uuid", #"String"
    "moxi_works_agent_id", #"String"
    "source_agent_id", #"String"
    "moxi_works_contact_id", #"String"
    "partner_contact_id", #"String"
    "transaction_name", #"String"
    "moxi_works_company_id", #"String"
    "parent_company_id", #"String"
    "notes", #"String"
    "address" ,#"String"
    "city", #"String"
    "state", #"String"
    "zip_code", #"String"
    "min_sqft", #"Integer"
    "max_sqft", #"Integer"
    "min_beds", #"Integer"
    "max_beds", #"Integer"
    "min_baths", #"Float"
    "max_baths", #"Float"
    "area_of_interest", #"Integer"
    "is_mls_transaction", #"Boolean"
    "mls_number", #"String"
    "start_timestamp", #"Integer"
    "commission_percentage", #"Float"
    "commission_flat_fee", #"Integer"
    "sales_volume_percentage", #"Float"
    "sales_volume_flat_fee", #"Integer"
    "target_price", #"Integer"
    "min_price", #"Integer"
    "max_price", #"Integer"
    "stage", #"Integer or String"
    #--Response
    "agent_uuid", #"String"
    "moxi_works_agent_id", #"String"
    "moxi_works_transaction_id", #"String"
    "moxi_works_contact_id", #"String"
    "partner_contact_id", #"String"
    "transaction_name", #"String or null"
    "notes", #"String or null"
    "stage", #"Integer"
    "stage_name", #"String"
    "address", #"String or null"
    "city", #"String or null"
    "state", #"String or null"
    "zip_code", #"String or null"
    "min_sqft", #"Integer or null"
    "max_sqft", #"Integer or null"
    "min_beds", #"Integer or null"
    "max_beds", #"Integer or null"
    "min_baths", #"Float or null"
    "max_baths", #"Float or null"
    "area_of_interest", #"String or null"
    "is_mls_transaction", #"Boolean"
    "mls_number", #"String or null"
    "start_timestamp", #"Integer or null"
    "commission_percentage", #"Float or null"
    "commission_flat_fee", #"Integer or null"
    "sales_volume_percentage", #"Float or null"
    "sales_volume_flat_fee", #"Integer or null"
    "target_price", #"Integer or null"
    "min_price", #"String or null"
    "max_price", #"Integer or null"
    "closing_price", #"Integer or null"
    "closing_timestamp", #"Integer or null"
    "state_changed_at", #"Integer or null"

#Update
    #--Request
    "agent_uuid", #"String"
    "moxi_works_agent_id", #"String"
    "source_agent_id", #"String"
    "moxi_works_transaction_id", #"String"
    "transaction_name", #"String"
    "moxi_works_company_id", #"String"
    "parent_company_id", #"String"
    "notes", #"String"
    "address", #"String"
    "city", #"String"
    "state", #"String"
    "zip_code", #"String"
    "min_sqft", #"Integer"
    "max_sqft", #"Integer"
    "min_beds", #"Integer"
    "max_beds", #"Integer"
    "min_baths", #"Float"
    "max_baths", #"Float"
    "area_of_interest", #"Integer"
    "is_mls_transaction", #"Boolean"
    "mls_number", #"String"
    "start_timestamp", #"Integer"
    "commission_percentage", #"Float"
    "commission_flat_fee", #"Integer"
    "sales_volume_percentage", #"Float"
    "sales_volume_flat_fee", #"Integer"
    "target_price", #"Integer"
    "min_price", #"Integer"
    "max_price", #"Integer"
    "closing_price", #"Integer"
    "closing_timestamp", #"Integer"
    "promote_transaction", #"Boolean"
    #--Response
    "agent_uuid", #"String"
    "moxi_works_agent_id", #"String"
    "moxi_works_transaction_id", #"String"
    "moxi_works_contact_id", #"String"
    "partner_contact_id", #"String"
    "transaction_name", #"String or null"
    "notes", #"String or null"
    "stage", #"Integer"
    "stage_name", #"String"
    "address", #"String or null"
    "city", #"String or null"
    "state", #"String or null"
    "zip_code", #"String or null"
    "min_sqft", #"Integer or null"
    "max_sqft", #"Integer or null"
    "min_beds", #"Integer or null"
    "max_beds", #"Integer or null"
    "min_baths", #"Float or null"
    "max_baths", #"Float or null"
    "area_of_interest", #"String or null"
    "is_mls_transaction", #"Boolean"
    "mls_number", #"String or null"
    "start_timestamp", #"Integer or null"
    "commission_percentage", #"Float or null"
    "commission_flat_fee", #"Integer or null"
    "sales_volume_percentage", #"Float or null" This doesn't show up in the documentation under Update response
    "sales_volume_flat_fee", #"Integer or null" This doesn't show up in the documentation under Update response
    "target_price", #"Integer or null"
    "min_price", #"String or null"
    "max_price", #"Integer or null"
    "closing_price", #"Integer or null"
    "closing_timestamp", #"Integer or null"
    "state_changed_at", #"Integer or null"

#Show
    #--Request
    "agent_uuid", #"String"
    "moxi_works_agent_id", #"String"
    "source_agent_id", #"String"
    "moxi_works_transaction_id", #"String"
    "moxi_works_company_id", #"String"
    "parent_company_id", #"String"
    #--Response
    "agent_uuid", #"String"
    "moxi_works_agent_id", #"String"
    "moxi_works_transaction_id", #"String"
    "moxi_works_contact_id", #"String"
    "partner_contact_id", #"String"
    "transaction_name", #"String or null"
    "notes", #"String or null"
    "stage", #"Integer"
    "stage_name", #"String"
    "address", #"String or null"
    "city", #"String or null"
    "state", #"String or null"
    "zip_code", #"String or null"
    "min_sqft", #"Integer or null"
    "max_sqft", #"Integer or null"
    "min_beds", #"Integer or null"
    "max_beds", #"Integer or null"
    "min_baths", #"Float or null"
    "max_baths", #"Float or null"
    "area_of_interest", #"String or null"
    "is_mls_transaction", #"Boolean"
    "mls_number", #"String or null"
    "start_timestamp", #"Integer or null"
    "commission_percentage", #"Float or null"
    "commission_flat_fee", #"Integer or null"
    "sales_volume_percentage", #"Float or null"
    "sales_volume_flat_fee", #"Integer or null"
    "target_price", #"Integer or null"
    "min_price", #"String or null"
    "max_price", #"Integer or null"
    "closing_price", #"Integer or null"
    "closing_timestamp", #"Integer or null"
    "state_changed_at", #"Integer or null"

#Index
    #--Request
    "agent_uuid", #"String"
    "moxi_works_agent_id", #"String"
    "source_agent_id", #"String"
    "moxi_works_company_id", #"String"
    "parent_company_id", #"String"
    "moxi_works_contact_id", #"String"
    "partner_contact_id", #"String"
    "page_number", #"Integer"
    "timestamps_only", #"Boolean"
    #--Response
    "agent_uuid", #"String"
    "moxi_works_agent_id", #"String"
    "moxi_works_transaction_id", #"String"
    "moxi_works_contact_id", #"String"
    "partner_contact_id", #"String"
    "transaction_name", #"String or null"
    "notes", #"String or null"
    "stage", #"Integer"
    "stage_name", #"String"
    "address", #"String or null"
    "city", #"String or null"
    "state", #"String or null"
    "zip_code", #"String or null"
    "min_sqft", #"Integer or null"
    "max_sqft", #"Integer or null"
    "min_beds", #"Integer or null"
    "max_beds", #"Integer or null"
    "min_baths", #"Float or null"
    "max_baths", #"Float or null"
    "area_of_interest", #"String or null"
    "is_mls_transaction", #"Boolean"
    "mls_number", #"String or null"
    "start_timestamp", #"Integer or null"
    "commission_percentage", #"Float or null"
    "commission_flat_fee", #"Integer or null"
    "sales_volume_percentage", #"Float or null"
    "sales_volume_flat_fee", #"Integer or null"
    "target_price", #"Integer or null"
    "min_price", #"String or null"
    "max_price", #"Integer or null"
    "closing_price", #"Integer or null"
    "closing_timestamp", #"Integer or null"
    "state_changed_at" #"Integer or null"
]

buyertransaction_attrs.each do |attr_title|
    Attr.find_or_create_by!(attr_title: attr_title)
end

buyertransaction_attrs.each do |attr_title|
    attr = Attr.find_by(attr_title: attr_title)
    endpoint = Endpoint.find_by(endpoint_title: "BuyerTransaction")
    associated_attr = AssociatedAttr.find_or_create_by!(attr_id: attr.id, endpoint_id: endpoint.id, product_id: 1)
end