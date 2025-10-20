-- SQL Procedure to create indexes on the "Id" and "contract_no" columns of the "account_seg" table

-- Define a procedure to create the indexes

CREATE PROCEDURE CreateAccountSegIndexes()
BEGIN

-- Change the engine of all 7 tables to 'InnoDB'

    ALTER TABLE address_seg_commercial ENGINE = InnoDB;

    ALTER TABLE borrower_seg ENGINE = InnoDB;

    ALTER TABLE credit_facility_seg ENGINE = InnoDB;

    ALTER TABLE dishonour_of_cheque_seg ENGINE = InnoDB;

    ALTER TABLE gurantor_seg ENGINE = InnoDB;

    ALTER TABLE relationship_seg ENGINE = InnoDB;

    ALTER TABLE security_seg ENGINE = InnoDB;

    ALTER TABLE status ENGINE = InnoDB;

END;


