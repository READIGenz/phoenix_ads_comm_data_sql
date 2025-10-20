CREATE PROCEDURE CountRowsInTable(IN tableName VARCHAR(255))
BEGIN
    SET @query = CONCAT('SELECT COUNT(*) FROM ', tableName);
    PREPARE stmt FROM @query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END;
