CREATE  PROCEDURE `TruncateOrCreateStatusTable`()
BEGIN
    DECLARE tableExists INT DEFAULT 0;

    -- Check if the `status` table exists in the current database
    SELECT COUNT(*)
    INTO tableExists
    FROM information_schema.tables
    WHERE table_schema = DATABASE() AND table_name = 'status_commercial';

    -- If the `status` table exists, truncate it; otherwise, create it
    IF tableExists > 0 THEN
        SET @truncateSQL = 'TRUNCATE TABLE status_commercial';
        PREPARE stmt FROM @truncateSQL;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;
        SELECT 'Table `status_commercial` truncated successfully.' AS message;
    ELSE
        CREATE TABLE `status_commercial` (
          `Id` bigint NOT NULL,
          `addr_rejects` text,
          `application` varchar(255) DEFAULT NULL,
          `borrower_rejects` text,
          `unique_commercial_id` varchar(255) DEFAULT NULL,
          `credit_facility_rejects` text,
          `dishonour_rejects` text,
          `gurantor_rejects` text,
          `insert_date` datetime DEFAULT NULL,
          `relationship_rejects` text,
          `security_seg_rejects` text,
          PRIMARY KEY (`Id`)
        );
        SELECT 'Table `status_commercial` created successfully.' AS message;
    END IF;
END