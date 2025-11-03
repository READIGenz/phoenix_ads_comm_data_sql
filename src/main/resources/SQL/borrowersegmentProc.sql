CREATE PROCEDURE BorrowerSegmentProcedure()
BEGIN
    INSERT INTO borrower_seg (
        borrower_id, application, asses_agency, borrower_Legl, borrower_name,
        borrower_short_name, business_catg, buss_indus_type, cdt_rating,
        cdt_rating_date, cdt_rating_exp_date, cin_No, ckyc, class_actv_1,
        class_actv_2, class_actv_3, comp_reg_num, unique_commercial_id, fin_year,
        incorporation_date, cur_reporting_Branch_code, no_of_emp, pan_No,
        prev_mem_Branch_code, sales_fig, serv_Tax_No, sic_code, tin_No, udyam_no
    )
    SELECT
        COALESCE(borrower_id, ''),
        '' AS application,
       IF(LENGTH(COALESCE(Assessment_Agency___Authority, '')) = 1,
          CONCAT('0', COALESCE(Assessment_Agency___Authority, '')),
          COALESCE(Assessment_Agency___Authority, '')
       ) AS Assessment_Agency___Authority,

        COALESCE(Borrowers_Legal_Constitution, ''),
        COALESCE(Borrowes_Name, ''),
        COALESCE(Borrower_Short_Name, ''),
        IF(LENGTH(COALESCE(Business_Category, '')) = 1,
        CONCAT('0', COALESCE(Business_Category, '')),
        COALESCE(Business_Category, '')
        ) AS Business_Category,
        IF(LENGTH(COALESCE(Business__Industry_Type, '')) = 1,
           CONCAT('0', COALESCE(Business__Industry_Type, '')),
           COALESCE(Business__Industry_Type, '')
        ) AS Business__Industry_Type,
        COALESCE(Credit_Rating, ''),
        COALESCE(Credit_Rating_As_On, ''),
        COALESCE(Credit_Rating_Expiry_Date, ''),
        COALESCE(CIN, ''),
        '' AS ckyc,
        COALESCE(Class_of_Activity_1, ''),
        COALESCE(Class_of_Activity_2, ''),
        COALESCE(Class_of_Activity_3, ''),
        COALESCE(Company_Registration_Number, ''),
        COALESCE(CONCAT(COALESCE(A_c_No_, ''), '_', COALESCE(Borrowes_Name, '')), '') AS unique_commercial_id,
        COALESCE(Financial_Year, ''),
        COALESCE(Date_of_Incorporation, ''),
        COALESCE(Member_Branch_Code, ''),
        COALESCE(Number_of_Employees, ''),
        COALESCE(PAN, ''),
        COALESCE(Previous_Member_Branch_Code, ''),
        COALESCE(Sales_Figure, ''),
        COALESCE(Service_Tax__, ''),
        COALESCE(SIC_Code, ''),
        COALESCE(TIN, ''),
        '' AS udyam_no
    FROM bs
    WHERE borrower_id IS NOT NULL
      AND borrower_id != '';
END