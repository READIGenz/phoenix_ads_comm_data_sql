CREATE PROCEDURE AddressSegmentCommercialProcedure()
BEGIN
    INSERT INTO address_seg_commercial (
        address_line1,
        address_line2,
        address_line3,
        borrower_office_DUNS_Number,
        borrower_office_location_type,
        City_Town,
        Country,
        District,
        Fax_Area_Code,
        Fax_Numbers,
        Filler,
        Mobile_Numbers,
        Pin_Code,
        State_Union_Territory,
        Telephone_Area_Code,
        Telephone_Numbers,
        borrower_id
    )
    SELECT
        COALESCE(a.Address_Line_1, ''),
        COALESCE(a.Address_Line_2, ''),
        COALESCE(a.Address_Line_3, ''),
        COALESCE(a.Borrower_Office_DUNS_Number, ''),
        IF(LENGTH(COALESCE(a.Borrower_Office_Location_Type, '')) = 1,
           CONCAT('0', COALESCE(a.Borrower_Office_Location_Type, '')),
           COALESCE(a.Borrower_Office_Location_Type, '')
        ) AS Borrower_Office_Location_Type,
        COALESCE(a.City_Town, ''),
        COALESCE(a.Country, ''),
        COALESCE(a.District, ''),
        COALESCE(a.Fax_Area_Code, ''),
        COALESCE(a.Fax_Number_s_, ''),
        COALESCE(a.Filler, ''),
        COALESCE(a.Mobile_Number_s_, ''),
        COALESCE(a.Pin_Code, ''),
       IF(LENGTH(COALESCE(a.State_Union_Territory, '')) = 1,
          CONCAT('0', COALESCE(a.State_Union_Territory, '')),
          COALESCE(a.State_Union_Territory, '')
       ) AS State_Union_Territory,

        COALESCE(a.Telephone_Area_Code, ''),
        COALESCE(a.Telephone_Number_s_, ''),
        COALESCE(a.A_c_No_, '')
    FROM Address_Segment a
    WHERE A_c_No_ IS NOT NULL
      AND A_c_No_ != '';
END;