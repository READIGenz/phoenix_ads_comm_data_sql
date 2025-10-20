
CREATE PROCEDURE TruncateAndDropTables()
BEGIN
    -- Truncate 7 tables
    TRUNCATE TABLE address_seg_commercial;
    TRUNCATE TABLE borrower_seg;
    TRUNCATE TABLE credit_facility_seg;
    TRUNCATE TABLE dishonour_of_cheque_seg;
    TRUNCATE TABLE gurantor_seg;
    TRUNCATE TABLE relationship_seg;
    TRUNCATE TABLE security_seg;
    TRUNCATE TABLE status_commercial;
END;
