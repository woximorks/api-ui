#Products
products = [
    "test"
=begin
    "ActivePipe",
    "Roster",
    "Engage",
    "Websites",
    "Promote",
    "Present",
    "Impress",
    "Balance",
    "Stellar",
    "API",
    "Email",
    "Syndication"
=end
    ]

products.each do |product_title|
    Product.find_or_create_by!(product_title: product_title)
end