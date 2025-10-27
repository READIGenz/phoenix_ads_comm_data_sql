CREATE PROCEDURE SecuritySegmentProcedure()
BEGIN
    INSERT INTO security_seg (
     curr_type,
      filler,
      security_classification,
       type_of_security,
       val_of_security,
       date_of_valuation,
        cred_id)

    SELECT
        COALESCE(ss.Currency_Type, ''),
        COALESCE(ss.Filler, ''),
        COALESCE(ss.Security_Classification, ''),
        COALESCE(ss.Type_of_Security, ''),
        COALESCE(ss.Value_of_Security, ''),
        COALESCE(ss.Date_of_Valuation, ''),
        cf.cred_id
    FROM ss AS ss
    JOIN credit_facility_seg AS cf
          ON ss.A_c_No_ = cf.Account_Number
        WHERE cf.cred_id IS NOT NULL;
END
