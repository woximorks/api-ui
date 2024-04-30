# README

- bin/rails g scaffold attr attr_title
- bin/rails g scaffold endpoint endpoint_title
- bin/rails g scaffold endpoint_associated_attr endpoint:references attr:references endpoint_create:boolean endpoint_update:boolean endpoint_show:boolean endpoint_index:boolean endpoint_delete:boolean attr_create_request:boolean attr_create_response:boolean attr_delete_request:boolean attr_delete_response:boolean attr_index_request:boolean attr_index_response:boolean attr_show_request:boolean attr_show_response:boolean attr_update_request:boolean attr_update_response:boolean attr_type associated_ui_info associated_product_info
- bin/rails db:migrate

* made a few related changes to manipulate the database from the front end 
    - index set on routes page
    - Added list of attributes, endpoints on the index page


----------------------------------------------
- bin/rails g scaffold attr attr_title
- bin/rails g scaffold endpoint endpoint_title
- bin/rails g scaffold endpoint_associated_attr endpoint:references attr:references endpoint_create:boolean endpoint_update:boolean endpoint_show:boolean endpoint_index:boolean endpoint_delete:boolean attr_create_request:boolean attr_create_response:boolean attr_delete_request:boolean attr_delete_response:boolean attr_index_request:boolean attr_index_response:boolean attr_show_request:boolean attr_show_response:boolean attr_update_request:boolean attr_update_response:boolean attr_type associated_ui_info associated_product_info associated_attr_description
- bin/rails db:migrate