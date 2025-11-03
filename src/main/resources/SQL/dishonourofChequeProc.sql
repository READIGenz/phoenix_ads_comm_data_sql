CREATE PROCEDURE DishonourOfChequeSegCommercialProcedure()
BEGIN
    INSERT INTO dishonour_of_cheque_seg (
        Amount,
        check_issue_date,
        instrument_check_no,
        date_of_dishonour,
        filler,
        no_of_dishonour,
        reason_for_dishonour,
        cred_id
    )
    SELECT
        COALESCE(cd.Amount, ''),
        CASE
            WHEN LENGTH(cd.Cheque_Issue_Date) = 7 THEN CONCAT('0', cd.Cheque_Issue_Date)
            ELSE COALESCE(cd.Cheque_Issue_Date, '')
        END AS check_issue_date,
        COALESCE(cd.Instrument___Cheque_Number, ''),
        CASE
            WHEN LENGTH(cd.Date_of_Dishonour) = 7 THEN CONCAT('0', cd.Date_of_Dishonour)
            ELSE COALESCE(cd.Date_of_Dishonour, '')
        END AS date_of_dishonour,
        COALESCE(cd.Filler, ''),
        COALESCE(cd.Number_of_times_dishonoured, ''),
        IF(LENGTH(COALESCE(cd.Reason_for_Dishonour, '')) = 1,
           CONCAT('0', COALESCE(cd.Reason_for_Dishonour, '')),
           COALESCE(cd.Reason_for_Dishonour, '')
        ) AS Reason_for_Dishonour,
        cf.cred_id
    FROM Dishonour_of_Cheques_Segment_CD AS cd
    JOIN credit_facility_seg AS cf
          ON cd.A_c_No_ = cf.Account_Number
        WHERE cf.cred_id IS NOT NULL;
END
