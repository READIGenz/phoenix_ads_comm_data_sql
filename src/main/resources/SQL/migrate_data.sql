
CREATE PROCEDURE MoveDataToTables()
BEGIN
    -- Create 'email_seg' table if it doesn't exist
    -- Create 'address_seg_commercial' table
CREATE TABLE IF NOT EXISTS address_seg_commercial (
    address_id BIGINT,
    address_line1 VARCHAR(255),
    address_line2 VARCHAR(255),
    address_line3 VARCHAR(255),
    borrower_office_DUNS_Number VARCHAR(255),
    borrower_office_location_type VARCHAR(255),
    City_Town VARCHAR(255),
    Country VARCHAR(255),
    District VARCHAR(255),
    Fax_Area_Code VARCHAR(10),
    Fax_Numbers VARCHAR(255),
    Filler VARCHAR(255),
    Mobile_Numbers VARCHAR(255),
    Pin_Code VARCHAR(20),
    State_Union_Territory VARCHAR(255),
    Telephone_Area_Code VARCHAR(10),
    Telephone_Numbers VARCHAR(255),
    borrower_id BIGINT
);

    -- Insert data into 'address_seg_commercial'
    INSERT INTO address_seg_commercial (address_id, address_line1, address_line2, address_line3, borrower_office_DUNS_Number, borrower_office_location_type, City_Town, Country, District, Fax_Area_Code, Fax_Numbers, Filler, Mobile_Numbers, Pin_Code, State_Union_Territory, Telephone_Area_Code, Telephone_Numbers, borrower_id)
    SELECT address_id, address_line1_a, address_line2_a, address_line3_a, borrower_office_DUNS_Number, borrower_office_location_type, City_Town_add, Country_a, District_a, Fax_Area_Code_a, Fax_Numbers_a, Filler_add, Mobile_Numbers_a, Pin_Code_a, State_Union_Territory_a, Telephone_Area_Code_a, Telephone_Numbers_a, borrower_id_add
    FROM commercial_bank_data
    WHERE address_id IS NOT NULL AND address_id != '';


    -- Create 'borrower_seg' table if it doesn't exist
    CREATE TABLE IF NOT EXISTS borrower_seg (
    borrower_id BIGINT,
    application VARCHAR(255),
    asses_agency VARCHAR(255),
    borrower_Legl VARCHAR(255),
    borrower_name VARCHAR(255),
    borrower_short_name VARCHAR(255),
    business_catg VARCHAR(255),
    buss_indus_type VARCHAR(255),
    cdt_rating VARCHAR(255),
    cdt_rating_date VARCHAR(10),
    cdt_rating_exp_date VARCHAR(10),
    cin_No VARCHAR(255),
    ckyc VARCHAR(255),
    class_actv_1 VARCHAR(255),
    class_actv_2 VARCHAR(255),
    class_actv_3 VARCHAR(255),
    comp_reg_num VARCHAR(255),
    unique_commercial_id VARCHAR(255),
    fin_year VARCHAR(20),
    incorporation_date VARCHAR(10),
    cur_reporting_Branch_code VARCHAR(255),
    no_of_emp VARCHAR(255),
    pan_No VARCHAR(255),
    prev_mem_Branch_code VARCHAR(255),
    sales_fig VARCHAR(255),
    serv_Tax_No VARCHAR(255),
    sic_code VARCHAR(255),
    tin_No VARCHAR(255),
    udyam_no VARCHAR(255)
);


    -- Insert data into 'borrower_seg'
    INSERT INTO borrower_seg (borrower_id, application, asses_agency, borrower_Legl, borrower_name, borrower_short_name, business_catg, buss_indus_type, cdt_rating, cdt_rating_date, cdt_rating_exp_date, cin_No, ckyc, class_actv_1, class_actv_2, class_actv_3, comp_reg_num, unique_commercial_id, fin_year, incorporation_date, cur_reporting_Branch_code, no_of_emp, pan_No, prev_mem_Branch_code, sales_fig, serv_Tax_No, sic_code, tin_No, udyam_no)
    SELECT borrower_id, application, asses_agency, borrower_Legl, borrower_name, borrower_short_name, business_catg, buss_indus_type, cdt_rating, cdt_rating_date, cdt_rating_exp_date, cin_No, ckyc_b, class_actv_1, class_actv_2, class_actv_3, comp_reg_num, unique_commercial_id, fin_year, incorporation_date, cur_reporting_Branch_code, no_of_emp, pan_No, prev_mem_Branch_code, sales_fig, serv_Tax_No, sic_code, tin_No, udyam_no
    FROM commercial_bank_data
    WHERE borrower_id IS NOT NULL AND borrower_id != '';


    -- Create 'credit_facility_seg' table if it doesn't exist
    CREATE TABLE IF NOT EXISTS credit_facility_seg (
    cred_id BIGINT,
    Account_Status VARCHAR(255),
    Account_Status_Date VARCHAR(10),
    Account_Number VARCHAR(255),
    Last_Repaid_Amount VARCHAR(255),
    Amount_NPA VARCHAR(255),
    Amount_Overdue VARCHAR(255),
    Amount_Restructured VARCHAR(255),
    Sanctioned_Amount VARCHAR(255),
    Settled_Amout VARCHAR(255),
    Written_Off_amount VARCHAR(255),
    Asset_Classification_Date VARCHAR(10),
    Asset_Classification_Days_Past_Due VARCHAR(255),
    Asset_Security_coverage VARCHAR(255),
    Bank_Remark_Code VARCHAR(255),
    Credit_Type VARCHAR(255),
    Currency_Code VARCHAR(255),
    Current_Balance VARCHAR(255),
    Date_of_suit VARCHAR(10),
    Wilful_Default_Date VARCHAR(10),
    Dispute_ID_No VARCHAR(255),
    Drawing_Power VARCHAR(255),
    Guarantee_Coverage VARCHAR(255),
    High_Credit VARCHAR(255),
    Installment_Amount VARCHAR(255),
    Loan_Expiry_date VARCHAR(10),
    Loan_Renewal_Date VARCHAR(10),
    OTHER_BK VARCHAR(255),
    Overdue_bucket_01 VARCHAR(255),
    Overdue_bucket_02 VARCHAR(255),
    Overdue_bucket_03 VARCHAR(255),
    Overdue_bucket_04 VARCHAR(255),
    Overdue_bucket_05 VARCHAR(255),
    Previous_Account_Number VARCHAR(255),
    Reasons_for_Restructuring VARCHAR(255),
    Repayment_frequency VARCHAR(255),
    Sanction_Date VARCHAR(10),
    Suit_Amount_in_Rupees VARCHAR(255),
    Suit_Reference_Number VARCHAR(255),
    Suit_Filed_status VARCHAR(255),
    Tenure VARCHAR(255),
    Transaction_Type_Code VARCHAR(255),
    UFCEAmount VARCHAR(255),
    UFCE_Date VARCHAR(10),
    Wilful_Default_Status VARCHAR(255),
    borrower_id BIGINT
);


    -- Insert data into 'credit_facility_seg'
    INSERT INTO credit_facility_seg (cred_id, Account_Status, Account_Status_Date, Account_Number, Last_Repaid_Amount, Amount_NPA, Amount_Overdue, Amount_Restructured, Sanctioned_Amount, Settled_Amout, Written_Off_amount, Asset_Classification_Date, Asset_Classification_Days_Past_Due, Asset_Security_coverage, Bank_Remark_Code, Credit_Type, Currency_Code, Current_Balance, Date_of_suit, Wilful_Default_Date, Dispute_ID_No, Drawing_Power, Guarantee_Coverage, High_Credit, Installment_Amount, Loan_Expiry_date, Loan_Renewal_Date, OTHER_BK, Overdue_bucket_01, Overdue_bucket_02, Overdue_bucket_03, Overdue_bucket_04, Overdue_bucket_05, Previous_Account_Number, Reasons_for_Restructuring, Repayment_frequency, Sanction_Date, Suit_Amount_in_Rupees, Suit_Reference_Number, Suit_Filed_status, Tenure, Transaction_Type_Code, UFCEAmount, UFCE_Date, Wilful_Default_Status, borrower_id)
    SELECT cred_id, Account_Status, Account_Status_Date, Account_Number, Last_Repaid_Amount, Amount_NPA, Amount_Overdue, Amount_Restructured, Sanctioned_Amount, Settled_Amount_c, Written_Off_amount, Asset_Classification_Date, Asset_Classification_Days_Past_Due, Asset_Security_coverage, Bank_Remark_Code, Credit_Type, Currency_Code, Current_Balance, Date_of_suit, Wilful_Default_Date, Dispute_ID_No, Drawing_Power, Guarantee_Coverage, High_Credit, Installment_Amount, Loan_Expiry_date, Loan_Renewal_Date, OTHER_BK, Overdue_bucket_01, Overdue_bucket_02, Overdue_bucket_03, Overdue_bucket_04, Overdue_bucket_05, Previous_Account_Number, Reasons_for_Restructuring, Repayment_frequency, Sanction_Date, Suit_Amount_in_Rupees, Suit_Reference_Number, Suit_Filed_status, Tenure, Transaction_Type_Code, UFCEAmount, UFCE_Date, Wilful_Default_Status, borrower_id_cred
    FROM commercial_bank_data
    WHERE cred_id IS NOT NULL AND cred_id != '';


    -- Create 'dishonour_of_cheque_seg' table if it doesn't exist
    CREATE TABLE IF NOT EXISTS dishonour_of_cheque_seg (
    dishonour_id BIGINT,
    Amount VARCHAR(255),
    check_issue_date VARCHAR(10),
    instrument_check_no VARCHAR(255),
    date_of_dishonour VARCHAR(10),
    filler VARCHAR(255),
    no_of_dishonour VARCHAR(255),
    reason_for_dishonour VARCHAR(255),
    cred_id BIGINT
);


    -- Insert data into 'dishonour_of_cheque_seg'
    INSERT INTO dishonour_of_cheque_seg (dishonour_id, Amount, check_issue_date, instrument_check_no, date_of_dishonour, filler, no_of_dishonour, reason_for_dishonour,cred_id)
    SELECT dishonour_id, Amount, check_issue_date, instrument_check_no, date_of_dishonour, filler_dis, no_of_dishonour, reason_for_dishonour, cred_id_dis
    FROM commercial_bank_data
    WHERE dishonour_id IS NOT NULL AND dishonour_id != '';

    -- Create 'gurantor_seg' table if it doesn't exist
    CREATE TABLE IF NOT EXISTS gurantor_seg (
    gurantor_id BIGINT,
    Address_Line_3 VARCHAR(255),
    Address_Line_1 VARCHAR(255),
    Address_Line_2 VARCHAR(255),
    Business_Category VARCHAR(255),
    Business_Industry_Type VARCHAR(255),
    CIN VARCHAR(255),
    City_Town VARCHAR(255),
    CKYC VARCHAR(255),
    com_Registration_no VARCHAR(255),
    Country VARCHAR(255),
    Date_of_Birth VARCHAR(10),
    DIN VARCHAR(255),
    District VARCHAR(255),
    Driving_Licence_ID VARCHAR(255),
    Fax_Area_Code VARCHAR(10),
    Fax_Number VARCHAR(255),
    Full_Name VARCHAR(255),
    Gender VARCHAR(255),
    Guarantee_Invocation_Date VARCHAR(10),
    Guarantor_DUNS_Number VARCHAR(255),
    Guarantor_Entity_Name VARCHAR(255),
    Date_of_Incorporation VARCHAR(10),
    Guarantor_Type VARCHAR(255),
    Mobile_Number VARCHAR(255),
    Individual_Name_Prefix VARCHAR(255),
    PAN VARCHAR(255),
    Passport_Number VARCHAR(255),
    PIN_Code VARCHAR(20),
    Ration_Card_No VARCHAR(255),
    Service_Tax VARCHAR(255),
    State_Union_Territory VARCHAR(255),
    Telephone_Area_Code VARCHAR(10),
    Telephone_Number VARCHAR(255),
    TIN VARCHAR(255),
    Udyam_Registration_Number VARCHAR(255),
    UID VARCHAR(255),
    Voter_ID VARCHAR(255),
    borrower_id BIGINT,
    cred_id BIGINT
);


    -- Insert data into 'gurantor_seg'
    INSERT INTO gurantor_seg (gurantor_id, Address_Line_3, Address_Line_1, Address_Line_2, Business_Category, Business_Industry_Type, CIN, City_Town, CKYC, com_Registration_no, Country, Date_of_Birth, DIN, District, Driving_Licence_ID, Fax_Area_Code, Fax_Number, Full_Name, Gender, Guarantee_Invocation_Date, Guarantor_DUNS_Number, Guarantor_Entity_Name, Date_of_Incorporation, Guarantor_Type, Mobile_Number, Individual_Name_Prefix, PAN, Passport_Number, PIN_Code, Ration_Card_No, Service_Tax, State_Union_Territory, Telephone_Area_Code, Telephone_Number, TIN, Udyam_Registration_Number, UID, Voter_ID, cred_id)
    SELECT gurantor_id, Address_Line_3_g, Address_Line_1_g, Address_Line_2_g, Business_Category_g, Business_Industry_Type, CIN_g, City_Town_g, CKYC_g, com_Registration_no, Country_g, Date_of_Birth, DIN_g, District_g, Driving_Licence_ID, Fax_Area_Code_g, Fax_Number_g, Full_Name_g, Gender_g, Guarantee_Invocation_Date, Guarantor_DUNS_Number, Guarantor_Entity_Name, Date_of_Incorporation, Guarantor_Type, Mobile_Number_g, Individual_Name_Prefix_g, PAN_g, Passport_Number, PIN_Code_g, Ration_Card_No_g, Service_Tax_g, State_Union_Territory_g, Telephone_Area_Code_g, Telephone_Number_g, TIN_g, Udyam_Registration_Number_g, UID_g, Voter_ID_g, cred_id_g
    FROM commercial_bank_data
    WHERE gurantor_id IS NOT NULL AND gurantor_id != '';

    -- Create 'relationship_seg' table
CREATE TABLE IF NOT EXISTS relationship_seg (
    borrower_id VARCHAR(255),
    rel_id VARCHAR(255),
    Address_Line1 VARCHAR(255),
    Address_Line2 VARCHAR(255),
    Address_Line3 VARCHAR(255),
    Business_Category VARCHAR(255),
    Business_entity_name VARCHAR(255),
    Business_Industry_Type VARCHAR(255),
    CIN VARCHAR(255),
    City_Town VARCHAR(255),
    CKYC VARCHAR(255),
    Company_Registration_Number VARCHAR(255),
    Country VARCHAR(255),
    Date_of_Birth VARCHAR(10),
    DIN VARCHAR(255),
    District VARCHAR(255),
    Driving_Licence_ID VARCHAR(255),
    Fax_Area_Code VARCHAR(10),
    Fax_Numbers VARCHAR(255),
    Full_Name VARCHAR(255),
    Gender VARCHAR(255),
    Mobile_Numbers VARCHAR(255),
    Individual_Name_prefix VARCHAR(255),
    PAN VARCHAR(255),
    Passport_Number VARCHAR(255),
    Percentage_of_Control VARCHAR(255),
    Pin_Code VARCHAR(20),
    Ration_Card_No VARCHAR(255),
    Related_Type VARCHAR(255),
    Relationship_DUNS_Number VARCHAR(255),
    Date_of_Incorporation VARCHAR(10),
    Service_Tax VARCHAR(255),
    State_union_territory VARCHAR(255),
    Telephone_Area_Code VARCHAR(10),
    Telephone_Numbers VARCHAR(255),
    TIN VARCHAR(255),
    Relationship VARCHAR(255),
    Udyam_Registration_Number VARCHAR(255),
    UID VARCHAR(255),
    Voter_Id VARCHAR(255)
);

-- INSERT statement for 'relationship_seg'
INSERT INTO relationship_seg (borrower_id, rel_id, Address_Line1, Address_Line2, Address_Line3, Business_Category, Business_entity_name, Business_Industry_Type, CIN, City_Town, CKYC, Company_Registration_Number, Country, Date_of_Birth, DIN, District, Driving_Licence_ID, Fax_Area_Code, Fax_Numbers, Full_Name, Gender, Mobile_Numbers, Individual_Name_prefix, PAN, Passport_Number, Percentage_of_Control, Pin_Code, Ration_Card_No, Related_Type, Relationship_DUNS_Number, Date_of_Incorporation, Service_Tax, State_union_territory, Telephone_Area_Code, Telephone_Numbers, TIN, Relationship, Udyam_Registration_Number, UID, Voter_Id)
SELECT borrower_id_rel, rel_id, Address_Line1_r, Address_Line2_r, Address_Line3_r, Business_Category_r, Business_entity_name, Business_Industry_Type_r, CIN_r, City_Town_r, CKYC_r, Company_Registration_Number, Country_r, Date_of_Birth_r, DIN_r, District_r, Driving_Licence_ID_r, Fax_Area_Code_r, Fax_Numbers_r, Full_Name_r, Gender_r, Mobile_Numbers, Individual_Name_prefix, PAN_r, Passport_Number_r, Percentage_of_Control, Pin_Code_r, Ration_Card_No_r, Related_Type, Relationship_DUNS_Number, Date_of_Incorporation_r, Service_Tax_r, State_union_territory_r, Telephone_Area_Code_r, Telephone_Numbers_r, TIN_r, Relationship, Udyam_Registration_Number_r, UID_r, Voter_Id_r
FROM commercial_bank_data
WHERE rel_id IS NOT NULL AND rel_id != '';


    -- Create 'security_seg' table if it doesn't exist
    CREATE TABLE IF NOT EXISTS security_seg (
    sec_id BIGINT,
    curr_type VARCHAR(255),
    filler VARCHAR(255),
    security_classification VARCHAR(255),
    type_of_security VARCHAR(255),
    val_of_security VARCHAR(255),
    date_of_valuation DATE,
    cred_id BIGINT
);

    -- Insert data into 'security_seg' with date format conversion
    INSERT INTO security_seg (sec_id, curr_type, filler, security_classification, type_of_security, val_of_security, date_of_valuation, cred_id)
    SELECT sec_id, curr_type, filler_s, security_classification, type_of_security, val_of_security, date_of_valuation, cred_id_sec
    FROM commercial_bank_data
    WHERE sec_id IS NOT NULL AND sec_id != '';
END;
