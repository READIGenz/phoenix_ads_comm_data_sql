CREATE PROCEDURE `DuplicateTables`(IN input_date VARCHAR(8))
BEGIN
    DECLARE month_value VARCHAR(2);
    DECLARE year_value VARCHAR(4);

    -- Extract month and year from input_date (format ddmmyyyy)
    SET month_value = SUBSTRING(input_date, 3, 2);
    SET year_value = SUBSTRING(input_date, 5, 4);

    -- Construct month-year string
    SET @month_year = CONCAT(month_value, '_', year_value);

    -- Duplicate table1 (address_seg_commercial)
    -- Drop table if it already exists
    SET @sql1 = CONCAT('DROP TABLE IF EXISTS address_seg_commercial_', @month_year, ';');
    PREPARE stmt1 FROM @sql1;
    EXECUTE stmt1;
    DEALLOCATE PREPARE stmt1;

    -- Create new table
    SET @sql2 = CONCAT('CREATE TABLE address_seg_commercial_', @month_year, ' LIKE address_seg_commercial;');
    PREPARE stmt2 FROM @sql2;
    EXECUTE stmt2;
    DEALLOCATE PREPARE stmt2;

    -- Insert data into new table
    SET @sql3 = CONCAT('INSERT INTO address_seg_commercial_', @month_year, ' SELECT * FROM address_seg_commercial;');
    PREPARE stmt3 FROM @sql3;
    EXECUTE stmt3;
    DEALLOCATE PREPARE stmt3;

    -- Duplicate table2 (borrower_seg)
    SET @sql4 = CONCAT('DROP TABLE IF EXISTS borrower_seg_', @month_year, ';');
    PREPARE stmt4 FROM @sql4;
    EXECUTE stmt4;
    DEALLOCATE PREPARE stmt4;

    SET @sql5 = CONCAT('CREATE TABLE borrower_seg_', @month_year, ' LIKE borrower_seg;');
    PREPARE stmt5 FROM @sql5;
    EXECUTE stmt5;
    DEALLOCATE PREPARE stmt5;

    SET @sql6 = CONCAT('INSERT INTO borrower_seg_', @month_year, ' SELECT * FROM borrower_seg;');
    PREPARE stmt6 FROM @sql6;
    EXECUTE stmt6;
    DEALLOCATE PREPARE stmt6;

    -- Duplicate table3 (credit_facility_seg)
    SET @sql7 = CONCAT('DROP TABLE IF EXISTS credit_facility_seg_', @month_year, ';');
    PREPARE stmt7 FROM @sql7;
    EXECUTE stmt7;
    DEALLOCATE PREPARE stmt7;

    SET @sql8 = CONCAT('CREATE TABLE credit_facility_seg_', @month_year, ' LIKE credit_facility_seg;');
    PREPARE stmt8 FROM @sql8;
    EXECUTE stmt8;
    DEALLOCATE PREPARE stmt8;

    SET @sql9 = CONCAT('INSERT INTO credit_facility_seg_', @month_year, ' SELECT * FROM credit_facility_seg;');
    PREPARE stmt9 FROM @sql9;
    EXECUTE stmt9;
    DEALLOCATE PREPARE stmt9;

    -- Duplicate table4 (dishonour_of_cheque_seg)
    SET @sql10 = CONCAT('DROP TABLE IF EXISTS dishonour_of_cheque_seg_', @month_year, ';');
    PREPARE stmt10 FROM @sql10;
    EXECUTE stmt10;
    DEALLOCATE PREPARE stmt10;

    SET @sql11 = CONCAT('CREATE TABLE dishonour_of_cheque_seg_', @month_year, ' LIKE dishonour_of_cheque_seg;');
    PREPARE stmt11 FROM @sql11;
    EXECUTE stmt11;
    DEALLOCATE PREPARE stmt11;

    SET @sql12 = CONCAT('INSERT INTO dishonour_of_cheque_seg_', @month_year, ' SELECT * FROM dishonour_of_cheque_seg;');
    PREPARE stmt12 FROM @sql12;
    EXECUTE stmt12;
    DEALLOCATE PREPARE stmt12;

    -- Duplicate table5 (gurantor_seg)
    SET @sql13 = CONCAT('DROP TABLE IF EXISTS gurantor_seg_', @month_year, ';');
    PREPARE stmt13 FROM @sql13;
    EXECUTE stmt13;
    DEALLOCATE PREPARE stmt13;

    SET @sql14 = CONCAT('CREATE TABLE gurantor_seg_', @month_year, ' LIKE gurantor_seg;');
    PREPARE stmt14 FROM @sql14;
    EXECUTE stmt14;
    DEALLOCATE PREPARE stmt14;

    SET @sql15 = CONCAT('INSERT INTO gurantor_seg_', @month_year, ' SELECT * FROM gurantor_seg;');
    PREPARE stmt15 FROM @sql15;
    EXECUTE stmt15;
    DEALLOCATE PREPARE stmt15;

    -- Duplicate table6 (relationship_seg)
    SET @sql16 = CONCAT('DROP TABLE IF EXISTS relationship_seg_', @month_year, ';');
    PREPARE stmt16 FROM @sql16;
    EXECUTE stmt16;
    DEALLOCATE PREPARE stmt16;

    SET @sql17 = CONCAT('CREATE TABLE relationship_seg_', @month_year, ' LIKE relationship_seg;');
    PREPARE stmt17 FROM @sql17;
    EXECUTE stmt17;
    DEALLOCATE PREPARE stmt17;

    SET @sql18 = CONCAT('INSERT INTO relationship_seg_', @month_year, ' SELECT * FROM relationship_seg;');
    PREPARE stmt18 FROM @sql18;
    EXECUTE stmt18;
    DEALLOCATE PREPARE stmt18;

    -- Duplicate table7 (security_seg)
    SET @sql19 = CONCAT('DROP TABLE IF EXISTS security_seg_', @month_year, ';');
    PREPARE stmt19 FROM @sql19;
    EXECUTE stmt19;
    DEALLOCATE PREPARE stmt19;

    SET @sql20 = CONCAT('CREATE TABLE security_seg_', @month_year, ' LIKE security_seg;');
    PREPARE stmt20 FROM @sql20;
    EXECUTE stmt20;
    DEALLOCATE PREPARE stmt20;

    SET @sql21 = CONCAT('INSERT INTO security_seg_', @month_year, ' SELECT * FROM security_seg;');
    PREPARE stmt21 FROM @sql21;
    EXECUTE stmt21;
    DEALLOCATE PREPARE stmt21;

END;
