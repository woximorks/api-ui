DO $$
BEGIN

UPDATE associated_attrs
SET
  request_type = jsonb_set(
    request_type,
    '{Listing}',
    (COALESCE(request_type->'Listing', '[]'::jsonb) || '["Update Request"]'::jsonb)
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title IN ( -- setting the following associated_attrs -> request_type to contain "#Request Type"
    'moxi_works_listing_id',
    'moxi_works_company_id',
    'parent_company_id',
    'underscore_response'
);

UPDATE associated_attrs
SET
  request_type = jsonb_set(
    request_type,
    '{Listing}',
    (COALESCE(request_type->'Listing', '[]'::jsonb) || '["Update Response"]'::jsonb)
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title IN ( -- setting the following associated_attrs -> request_type to contain "#Request Type"
    #--Response
    'LotSizeAcres',
    'BathroomsFull',
    'BathroomsHalf',
    'BathroomsOneQuarter',
    'BathroomsPartial',
    'BathroomsThreeQuarter',
    'BathroomsTotalInteger',
    'BathroomsTotal',
    'BedroomsTotal',
    'PublicTitle',
    'PublicRemarks',
    'ModificationTimestamp',
    'StatusChangeDate',
    'InternetAddressDisplayYN',
    'DaysOnMarket',
    'ListingContractDate',
    'CreatedDate',
    'ElementarySchool',
    'GarageSpaces',
    'WaterfrontYN',
    'HighSchool',
    'AssociationFee',
    'ListOfficeName',
    'ListPrice',
    'ListingID',
    'ListAgentFullName',
    'ListAgentUUID',
    'ListAgentOfficeID',
    'ListAgentMoxiWorksOfficeID',
    'SecondaryListAgentFullName',
    'SecondaryListAgentUUID',
    'SchoolDistrict',
    'Address',
    'Address2',
    'City',
    'CountyOrParish',
    'Latitude',
    'Longitude',
    'StateOrProvince',
    'PostalCode',
    'Community',
    'LotSizeSquareFeet',
    'InternetEntireListingDisplayYN',
    'MiddleOrJuniorSchool',
    'ListOfficeAOR',
    'ListOfficeAORArea',
    'PoolYN',
    'PropertyType',
    'TaxAnnualAmount',
    'TaxYear',
    'SingleStory',
    'LivingArea',
    'ViewYN',
    'YearBuilt',
    'OnMarket',
    'Status',
    'MoxiWorksListingId',
    'AgentCreatedListing',
    'VirtualTourURL',
    'SharedPartnerData',
    'TaxParcelId',
    'ListingURL',
    'PropertyFeatures',
    'CompanyListingAttributes',
    'OpenHouse',
    'ImagesLastModified',
    'ListingImages',
    'BuyerCommissionType',
    'BuyerCommissionValue'
    );

UPDATE associated_attrs
SET
  request_type = jsonb_set(
    request_type,
    '{Listing}',
    (COALESCE(request_type->'Listing', '[]'::jsonb) || '["Show Request"]'::jsonb)
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title IN ( -- setting the following associated_attrs -> request_type to contain "#Request Type"
    'moxi_works_listing_id',
    'moxi_works_company_id',
    'parent_company_id',
    'underscore_response'
);
UPDATE associated_attrs
SET
  request_type = jsonb_set(
    request_type,
    '{Listing}',
    (COALESCE(request_type->'Listing', '[]'::jsonb) || '["Show Response"]'::jsonb)
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title IN (
    'LotSizeAcres',
    'BathroomsFull',
    'BathroomsHalf',
    'BathroomsOneQuarter',
    'BathroomsPartial',
    'BathroomsThreeQuarter',
    'BathroomsTotalInteger',
    'BathroomsTotal',
    'BedroomsTotal',
    'PublicTitle',
    'PublicRemarks',
    'ModificationTimestamp',
    'StatusChangeDate',
    'InternetAddressDisplayYN',
    'DaysOnMarket',
    'ListingContractDate',
    'CreatedDate',
    'ElementarySchool',
    'GarageSpaces',
    'WaterfrontYN',
    'HighSchool',
    'AssociationFee',
    'ListOfficeName',
    'ListPrice',
    'ListingID',
    'ListAgentFullName',
    'ListAgentUUID',
    'ListAgentOfficeID',
    'ListAgentMoxiWorksOfficeID',
    'SecondaryListAgentFullName',
    'SecondaryListAgentUUID',
    'SchoolDistrict',
    'Address',
    'Address2',
    'City',
    'CountyOrParish',
    'Latitude',
    'Longitude',
    'StateOrProvince',
    'PostalCode',
    'Community',
    'LotSizeSquareFeet',
    'InternetEntireListingDisplayYN',
    'MiddleOrJuniorSchool',
    'ListOfficeAOR',
    'ListOfficeAORArea',
    'PoolYN',
    'PropertyType',
    'TaxAnnualAmount',
    'TaxYear',
    'SingleStory',
    'LivingArea',
    'ViewYN',
    'YearBuilt',
    'OnMarket',
    'Status',
    'MoxiWorksListingId',
    'AgentCreatedListing',
    'VirtualTourURL',
    'SharedPartnerData',
    'TaxParcelId',
    'ListingURL',
    'PropertyFeatures',
    'CompanyListingAttributes',
    'OpenHouse',
    'ImagesLastModified',
    'ListingImages',
    'BuyerCommissionType',
    'BuyerCommissionValue'
    );

UPDATE associated_attrs
SET
  request_type = jsonb_set(
    request_type,
    '{Listing}',
    (COALESCE(request_type->'Listing', '[]'::jsonb) || '["Index Request"]'::jsonb)
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title IN ( -- setting the following associated_attrs -> request_type to contain "#Request Type"
    'moxi_works_company_id',
    'parent_company_id',
    'updated_since',
    'agent_uuid',
    'moxi_works_agent_id',
    'source_agent_id',
    'moxi_works_office_id',
    'last_moxi_works_listing_id',
    'shared_partner_data_updated_since',
    'market_status',
    'property_types',
    'only_agent_created',
    'coming_soon',
    'underscore_response',
    'timestamps_only'
    );

UPDATE associated_attrs
SET
  request_type = jsonb_set(
    request_type,
    '{Listing}',
    (COALESCE(request_type->'Listing', '[]'::jsonb) || '["Index Response"]'::jsonb)
  ),
  updated_at = CURRENT_TIMESTAMP
WHERE attr_title IN ( -- setting the following associated_attrs -> request_type to contain "#Request Type"
    'FinalPage',
    'Listings'
);

END $$;