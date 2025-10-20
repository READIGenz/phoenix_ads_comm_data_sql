CREATE  PROCEDURE `DropBackUpTables`()
BEGIN
    DECLARE month_value INT;
    DECLARE year_value INT;
    DECLARE i INT DEFAULT 0;

    -- Initialize month and year to the current month and year
    SET month_value = MONTH(CURRENT_DATE);
    SET year_value = YEAR(CURRENT_DATE);

    -- Adjust month and year to start from six months ago
    SET month_value = month_value - 6;
    IF month_value <= 0 THEN
        SET month_value = month_value + 12;
        SET year_value = year_value - 1;
    END IF;

    -- Construct month-year string in the format MM_YYYY (e.g., 04_2024)
    SET @month_year = CONCAT(LPAD(month_value, 2, '0'), '_', year_value);

    -- Drop the table for the corresponding month-year
    SET @sql = CONCAT('DROP TABLE IF EXISTS borrower_seg_', @month_year, ';');
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;

    SET @sql = CONCAT('DROP TABLE IF EXISTS address_seg_commercial_', @month_year, ';');
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;

    SET @sql = CONCAT('DROP TABLE IF EXISTS credit_facility_seg_', @month_year, ';');
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;

    SET @sql = CONCAT('DROP TABLE IF EXISTS dishonour_of_cheque_seg_', @month_year, ';');
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;

    SET @sql = CONCAT('DROP TABLE IF EXISTS gurantor_seg_', @month_year, ';');
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;

    SET @sql = CONCAT('DROP TABLE IF EXISTS relationship_seg_', @month_year, ';');
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;

    SET @sql = CONCAT('DROP TABLE IF EXISTS security_seg_', @month_year, ';');
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END;
