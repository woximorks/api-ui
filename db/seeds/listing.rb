listing_attrs = []

listing_attrs.each do |attr_title|
    Attr.find_or_create_by!(attr_title: attr_title)
end