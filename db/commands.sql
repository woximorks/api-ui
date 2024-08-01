pg_dump -U root -d api_ui_development -f db/backups/api_ui_development.sql

-- CREATE NEW endpoint associated attr
--(id, endpoint_id, e_create, e_update, e_show, e_index, e_delete, attr_id, a_c_request, response, a_d_request, response, a_i_request, response, a_s_request, response, a_u_request, response, attr_type, associated_ui_info, associated_product_info, created_at, updated_at 
INSERT INTO endpoint_associated_attrs VALUES (1, 1, '0', '0', '0', '0', '0', 1, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'test', 'test', 'test', current_timestamp, current_timestamp)

-- UPDATE EXISTING endpoint associated attr
