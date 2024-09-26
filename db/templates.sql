DO $$
BEGIN

-- Set Product associations to the attribute on a local (endpoint specific) level
-- This is useful when the attribute already has associated info that applies to a new endpoint
    -- #Endpoint
    -- ["#Product1", "#Product2", "#Product3"]
    -- ("Attribute1", "Attribute2", "Attribute3", "Attribute4")
UPDATE associated_attrs
SET
  ui_info = jsonb_set(
    ui_info,
    '{#Endpoint}',
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'#Endpoint', '[]'::jsonb) || '["#Product1", "#Product2", "#Product3"]'::jsonb
      )
    )
  )
WHERE attr_title IN (
  "#Attribute1",
  "#Attribute2",
  "#Attribute3",
  "#Attribute4"
);

  -- Set Product associations to the attribute on a global level
  -- This is useful when the attribute already has associated info that applies to a new endpoint
    -- #Endpoint
    -- ("Attribute1", "Attribute2", "Attribute3", "Attribute4")
UPDATE associated_attrs
SET
  associated_endpoints = jsonb_set( -- setting the following associated_endpoints to have Brand associations within the Endpoints Array
    associated_endpoints,
    '{Endpoints}',
    (COALESCE(associated_endpoints->'Endpoints', '[]'::jsonb) || '["#Endpoint"]'::jsonb)
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title IN (
    '#Attribute1',
    '#Attribute2',
    '#Attribute3'
);

-- Update 2 text fields demonstrating the attribute's association to a Moxi Product
  -- #database_column_name
  -- #Product1Text
    -- #Some string with info...
  -- #Product2Text
    -- #Some string with info...
-- Set Product associations to the attribute on a local (endpoint specific) level
  -- ["#Product1", "#Product2"]
-- Set Product associations to the attribute on a global level
  -- #Endpoint
    -- ["#Product1", "#Product2"]
UPDATE #database_table -- The name of the database table
SET 
  ui_info = jsonb_set(
    jsonb_set(
      jsonb_set(
        jsonb_set(
          #database_column_name, -- The corresponding column name of the field to be updated
        '{#Product1Text}', -- To add text information about the attribute and how it associates to a product
          to_jsonb((COALESCE(ui_info->>'#Product1Text', '') || '#Some string with information about the association to product1.'))
      ), -- APIText, RosterText, and the actual string value. COALESCE allows the data to append to existing data without overwriting.
      '{#Product2Text}',
          to_jsonb((COALESCE(ui_info->>'Product1Text', '') || '#Some string with information about the association to product2.'))
      ),
      '{Products}',
      (
        SELECT jsonb_agg(DISTINCT value)
        FROM jsonb_array_elements_text(
          COALESCE(ui_info->'Products', '[]'::jsonb) || '["#Product1", "#Product2"]'::jsonb -- The product name, ie API, Roster
        )
      )
    ),
    '{#Endpoint}', -- Set Product associations to the attribute association on a local (endpoint specific) level
    (
      SELECT jsonb_agg(DISTINCT value)
      FROM jsonb_array_elements_text(
        COALESCE(ui_info->'#Endpoint', '[]'::jsonb) || '["#Product1", "#Product2"]'::jsonb -- Endpoint name, Product name, ie API, Roster
      )
    )
  ),
  associated_endpoints = jsonb_set(
    associated_endpoints,
    '{Endpoints}',
    '["#Endpoint"]' -- Set attribute association to the endpoint on a global level
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title = '#attribute_title'; -- Attribute name, ie agent_uuid, email_addresses, etc

END $$;









/*
Some garbage chatgpt delivered based on the following - 

"Here are 3 update statements I regularly make to a postgreSQL database I have. 
I want to figure out how to simplify the process and reduce the redundancy and lines of code. 
Something comparable to mixins for sass comes to mind. What do you recommend?
[above update statements provided]"

**********
"In this refactoring:

    The update_associated_attrs procedure encapsulates the common update logic.
    It takes parameters to handle the various inputs, such as endpoint, products, attributes, table name, column name, and attribute title.
    This approach reduces redundancy and makes your code more maintainable.

You can call this procedure with different sets of parameters as needed, just like using mixins in Sass."
*/

-- It throws an error read the above comment
CREATE OR REPLACE PROCEDURE update_associated_attrs(
    p_endpoint TEXT,
    p_products TEXT[],
    p_attributes TEXT[],
    p_database_table TEXT,
    p_database_column_name TEXT,
    p_attribute_title TEXT
)
LANGUAGE plpgsql
AS $$
BEGIN
    -- Update association between a Product and an endpoint
    UPDATE associated_attrs
    SET
      ui_info = jsonb_set(
        ui_info,
        format('{%s}', p_endpoint),
        (
          SELECT jsonb_agg(DISTINCT value)
          FROM jsonb_array_elements_text(
            COALESCE(ui_info->p_endpoint, '[]'::jsonb) || to_jsonb(p_products)::jsonb
          )
        )
      )
    WHERE attr_title = ANY(p_attributes);

    -- Update association between an endpoint and an attribute
    UPDATE associated_attrs
    SET
      associated_endpoints = jsonb_set(
        associated_endpoints,
        '{Endpoints}',
        (COALESCE(associated_endpoints->'Endpoints', '[]'::jsonb) || format('["%s"]', p_endpoint)::jsonb)
      ),
      updated_at = CURRENT_TIMESTAMP
    WHERE attr_title = ANY(p_attributes);

    -- Update 2 text fields demonstrating the attribute's association to a Product
    UPDATE associated_attrs
    SET
      ui_info = jsonb_set(
        jsonb_set(
          jsonb_set(
            jsonb_set(
              p_database_column_name::jsonb,
              format('{%sText}', p_products[1]),
              to_jsonb((COALESCE(ui_info->>format('%sText', p_products[1]), '') || format('#Some string with information about the association to %s.', p_products[1])))
            ),
            format('{%sText}', p_products[2]),
            to_jsonb((COALESCE(ui_info->>format('%sText', p_products[2]), '') || format('#Some string with information about the association to %s.', p_products[2])))
          ),
          '{Products}',
          (
            SELECT jsonb_agg(DISTINCT value)
            FROM jsonb_array_elements_text(
              COALESCE(ui_info->'Products', '[]'::jsonb) || to_jsonb(p_products)::jsonb
            )
          )
        ),
        format('{%s}', p_endpoint),
        (
          SELECT jsonb_agg(DISTINCT value)
          FROM jsonb_array_elements_text(
            COALESCE(ui_info->p_endpoint, '[]'::jsonb) || to_jsonb(p_products)::jsonb
          )
        )
      ),
      associated_endpoints = jsonb_set(
        associated_endpoints,
        '{Endpoints}',
        format('["%s"]', p_endpoint)::jsonb
      ),
      updated_at = CURRENT_TIMESTAMP
    WHERE attr_title = p_attribute_title;
END $$;

CALL update_associated_attrs(
    '#Endpoint',
    ARRAY['#Product1', '#Product2', '#Product3'],
    ARRAY['#Attribute1', '#Attribute2', '#Attribute3', '#Attribute4'],
    '#database_table',
    '#database_column_name',
    '#attribute_title'
);