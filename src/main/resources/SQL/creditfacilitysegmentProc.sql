CREATE PROCEDURE CreditFacilitySegCommercialProcedure()
BEGIN
    INSERT INTO credit_facility_seg (
        Account_Status,
        Account_Status_Date,
        Account_Number,
        Last_Repaid_Amount,
        Amount_NPA,
        Amount_Overdue,
        Amount_Restructured,
        Sanctioned_Amount,
        Settled_Amout,
        Written_Off_amount,
        Asset_Classification_Date,
        Asset_Classification_Days_Past_Due,
        Asset_Security_coverage,
        Bank_Remark_Code,
        Credit_Type,
        Currency_Code,
        Current_Balance,
        Date_of_suit,
        Wilful_Default_Date,
        Dispute_ID_No,
        Drawing_Power,
        Guarantee_Coverage,
        High_Credit,
        Installment_Amount,
        Loan_Expiry_date,
        Loan_Renewal_Date,
        Overdue_bucket_01,
        Overdue_bucket_02,
        Overdue_bucket_03,
        Overdue_bucket_04,
        Overdue_bucket_05,
        Previous_Account_Number,
        Reasons_for_Restructuring,
        Repayment_frequency,
        Sanction_Date,
        Suit_Amount_in_Rupees,
        Suit_Reference_Number,
        Suit_Filed_status,
        Tenure,
        Transaction_Type_Code,
        Wilful_Default_Status,
        borrower_id
    )
    SELECT
        IF(LENGTH(COALESCE(cf.Account_Status, '')) = 1,
           CONCAT('0', COALESCE(cf.Account_Status, '')),
           COALESCE(cf.Account_Status, '')
        ) AS Account_Status,

        CASE
            WHEN LENGTH(cf.Account_Status_Date) = 7 THEN LPAD(cf.Account_Status_Date, 8, '0')
            ELSE COALESCE(cf.Account_Status_Date, '')
        END,
        COALESCE(cf.Account_Number, ''),
        COALESCE(cf.Last_Repaid_Amount, ''),
        COALESCE(cf.Amount_of_Contracts_Classified_as_NPA, ''),  -- Amount_NPA
        COALESCE(cf.Amount_Overdue___Limit_Overdue, ''),
        COALESCE(cf.Notional_Amount_of_Out_standing_Restructured_Contracts, ''), -- Amount_Restructured
        COALESCE(cf.Sanctioned_Amount__Notional_Amount_of_Contract, ''),
        COALESCE(cf.Settled_Amount, ''),
        COALESCE(cf.Written_Off_Amount, ''),
        CASE
            WHEN LENGTH(cf.Asset_Classification_Date) = 7 THEN LPAD(cf.Asset_Classification_Date, 8, '0')
            ELSE COALESCE(cf.Asset_Classification_Date, '')
        END,
        IF(LENGTH(COALESCE(cf.Asset_Classification, '')) = 1,
           CONCAT('000', COALESCE(cf.Asset_Classification, '')),
        IF(LENGTH(COALESCE(cf.Asset_Classification, '')) = 2,
        CONCAT('00', COALESCE(cf.Asset_Classification, '')),
        COALESCE(cf.Asset_Classification, '')
        )
        ) AS Asset_Classification,  -- Days_Past_Due (or change if numeric)
        IF(LENGTH(COALESCE(cf.Asset_based_Security_coverage, '')) = 1,
           CONCAT('0', COALESCE(cf.Asset_based_Security_coverage, '')),
           COALESCE(cf.Asset_based_Security_coverage, '')
        ) AS Asset_based_Security_coverage,
        COALESCE(cf.Bank_Remark_Code, ''),
        IF(LENGTH(COALESCE(cf.Credit_Type, '')) = 3,
           CONCAT('0', COALESCE(cf.Credit_Type, '')),
           COALESCE(cf.Credit_Type, '')
        ) AS Credit_Type,
        COALESCE(cf.Currency_Code, ''),
        COALESCE(cf.Current_Balance___Limit_Utilized__Mark_to_Market, ''),
        CASE
            WHEN LENGTH(cf.Date_of_Suit) = 7 THEN LPAD(cf.Date_of_Suit, 8, '0')
            ELSE COALESCE(cf.Date_of_Suit, '')
        END,
        CASE
            WHEN LENGTH(cf.Date_Classified_as_Wilful_Default) = 7 THEN LPAD(cf.Date_Classified_as_Wilful_Default, 8, '0')
            ELSE COALESCE(cf.Date_Classified_as_Wilful_Default, '')
        END,
        COALESCE(cf.Dispute_ID_No_, ''),
        COALESCE(cf.Drawing_Power, ''),
        IF(LENGTH(COALESCE(cf.Guarantee_Coverage, '')) = 1,
           CONCAT('0', COALESCE(cf.Guarantee_Coverage, '')),
           COALESCE(cf.Guarantee_Coverage, '')
        ) AS Guarantee_Coverage,
        COALESCE(cf.High_Credit, ''),
        COALESCE(cf.Installment_Amount, ''),
        CASE
            WHEN LENGTH(cf.Loan_Expiry___Maturity_Date) = 7 THEN LPAD(cf.Loan_Expiry___Maturity_Date, 8, '0')
            ELSE COALESCE(cf.Loan_Expiry___Maturity_Date, '')
        END,
        CASE
            WHEN LENGTH(cf.Loan_Renewal_Date) = 7 THEN LPAD(cf.Loan_Renewal_Date, 8, '0')
            ELSE COALESCE(cf.Loan_Renewal_Date, '')
        END,
        COALESCE(cf.Overdue_Bucket_01__1_–_30_days_, ''),
        COALESCE(cf.Overdue_Bucket_02__31_–_60_days_, ''),
        COALESCE(cf.Overdue_Bucket_03__61_–_90_days_, ''),
        COALESCE(cf.Overdue_Bucket_04_91_–_180_days_, ''),
        COALESCE(cf.Overdue_Bucket_05__Above_180_days_, ''),
        COALESCE(cf.Previous_Account_Number, ''),
        IF(LENGTH(COALESCE(cf.Major_reasons_for_Restructuring, '')) = 1,
           CONCAT('0', COALESCE(cf.Major_reasons_for_Restructuring, '')),
           COALESCE(cf.Major_reasons_for_Restructuring, '')
        ) AS Major_reasons_for_Restructuring,
        IF(LENGTH(COALESCE(cf.Repayment_Frequency, '')) = 1,
           CONCAT('0', COALESCE(cf.Repayment_Frequency, '')),
           COALESCE(cf.Repayment_Frequency, '')
        ) AS Repayment_Frequency,
        CASE
            WHEN LENGTH(cf.Facility___Loan_Activation___Sanction_Date) = 7 THEN LPAD(cf.Facility___Loan_Activation___Sanction_Date, 8, '0')
            ELSE COALESCE(cf.Facility___Loan_Activation___Sanction_Date, '')
        END,
        COALESCE(cf.Suit_Amount_in_Rupees, ''),
        COALESCE(cf.Suit_Reference_Number, ''),
        IF(LENGTH(COALESCE(cf.Suit_Filed_Status, '')) = 1,
           CONCAT('0', COALESCE(cf.Suit_Filed_Status, '')),
           COALESCE(cf.Suit_Filed_Status, '')
        ) AS Suit_Filed_Status,
        COALESCE(cf.Tenure___Weighted_Average_maturity_period_of_Contracts, ''),
        IF(LENGTH(COALESCE(cf.Transaction_Type_Code, '')) = 1,
           CONCAT('0', COALESCE(cf.Transaction_Type_Code, '')),
           COALESCE(cf.Transaction_Type_Code, '')
        ) AS Transaction_Type_Code,
        COALESCE(cf.Wilful_Default_Status, ''),
        br.borrower_id
    FROM cr AS cf
    JOIN borrower_seg AS br
      ON cf.A_c_No_ = SUBSTRING_INDEX(br.unique_commercial_id, '_', 1)
    WHERE br.borrower_id IS NOT NULL;
END
