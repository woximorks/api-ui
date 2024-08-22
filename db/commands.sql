-- ActionLog

-- Update to Engage product
UPDATE associated_attrs
SET product_id = 4
WHERE attr_id in (10, 11, 12, 13, 14, 15);

-- Update to Roster product (change attr_id) -
UPDATE associated_attrs
SET product_id = 3
WHERE attr_id in (1, 2, 3, 8, 9);

-- Update to API product
UPDATE associated_attrs
SET product_id = 11
WHERE attr_id in (5, 6);

-- Agent

-- Update to Engage product
UPDATE associated_attrs
SET product_id = 4
WHERE attr_id in (25, 78);

-- Update to Roster product -
UPDATE associated_attrs
SET product_id = 3
WHERE attr_id in (28, 29, 30, 31, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 48, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 69, 70, 71, 73, 74, 76, 77, 79, 80, 81, 88, 89, 90);

-- Update to API product
UPDATE associated_attrs
SET product_id = 11
WHERE attr_id in (26, 27, 85, 91);

-- Update to Websites product
UPDATE associated_attrs
SET product_id = 5
WHERE attr_id = 82;