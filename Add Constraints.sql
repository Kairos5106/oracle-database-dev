/*  Constraints for PRINT_JOB entity:
    There are four primary keys composing a composite key which are CUSTOMER_ID, KIOSK_ID, DOCUMENT_ID and TRANSACTION_ID
*/
-- Defining primary keys
ALTER TABLE PRINT_JOB
ADD CONSTRAINT PK_PRINT_JOB PRIMARY KEY (CUSTOMER_ID, KIOSK_ID, DOCUMENT_ID, TRANSACTION_ID); -- Defining primary keys for PRINT_JOB

-- Constraints: CUSTOMER_ID
-- ALTER TABLE PRINT_JOB
-- ADD CONSTRAINT FK_CUSTOMER_ID FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMER(CUSTOMER_ID) ON DELETE CASCADE;

ALTER TABLE PRINT_JOB
MODIFY CUSTOMER_ID NOT NULL;

-- Constraints: KIOSK_ID
-- ALTER TABLE PRINT_JOB
-- ADD CONSTRAINT FK_KIOSK_ID FOREIGN KEY (KIOSK_ID) REFERENCES KIOSK(KIOSK_ID) ON DELETE CASCADE;

ALTER TABLE PRINT_JOB
MODIFY KIOSK_ID NOT NULL;

-- Constraints: DOCUMENT_ID
-- ALTER TABLE PRINT_JOB
-- ADD CONSTRAINT FK_DOCUMENT_ID FOREIGN KEY (DOCUMENT_ID) REFERENCES DOCUMENT(DOCUMENT_ID) ON DELETE CASCADE;

ALTER TABLE PRINT_JOB
MODIFY DOCUMENT_ID NOT NULL;

-- Constraints: TRANSACTION_ID
-- ALTER TABLE PRINT_JOB
-- ADD CONSTRAINT FK_TRANSACTION_ID FOREIGN KEY (TRANSACTION_ID) REFERENCES TRANSACTION_HISTORY(TRANSACTION_ID) ON DELETE CASCADE;

ALTER TABLE PRINT_JOB
MODIFY TRANSACTION_ID NOT NULL;

-- Constraints: JOB_DATE
ALTER TABLE PRINT_JOB
MODIFY JOB_DATE NOT NULL;

-- Constraints: JOB_TIME
ALTER TABLE PRINT_JOB
MODIFY JOB_TIME NOT NULL;

-- Constraints: JOB_STATUS
ALTER TABLE PRINT_JOB
ADD CONSTRAINT CHK_VALID_STATUS CHECK (JOB_STATUS IN ('Pending', 'Processing', 'Completed'));

ALTER TABLE PRINT_JOB
MODIFY JOB_STATUS DEFAULT 'Pending';

-- Constraints: NUMBER_OF_COPIES
ALTER TABLE PRINT_JOB
ADD CONSTRAINT CHK_POSITIVE_COPIES CHECK (NUMBER_OF_COPIES > 0);

ALTER TABLE PRINT_JOB
MODIFY NUMBER_OF_COPIES NOT NULL;

-- Constraints: TOTAL_PRICE
ALTER TABLE PRINT_JOB
ADD CONSTRAINT CHK_POSITIVE_PRICE CHECK (TOTAL_PRICE > 0);

ALTER TABLE PRINT_JOB
MODIFY TOTAL_PRICE NOT NULL;

-- Constraints: PAGES_PER_SHEET
ALTER TABLE PRINT_JOB
ADD CONSTRAINT CHK_POSITIVE_PAGES CHECK (PAGES_PER_SHEET > 0);

ALTER TABLE PRINT_JOB
MODIFY PAGES_PER_SHEET NOT NULL;

-- Constraints: ROTATION_OPTION
ALTER TABLE PRINT_JOB
MODIFY ROTATION_OPTION DEFAULT 0;

ALTER TABLE PRINT_JOB
ADD CONSTRAINT CHK_VALID_ROTATION CHECK (ROTATION_OPTION IN (0, 90, 180, 270));

-- Constraints: DOUBLE_SIDED_TYPE
ALTER TABLE PRINT_JOB
ADD CONSTRAINT CHK_DOUBLE_SIDED CHECK (DOUBLE_SIDED_TYPE IN ('None', 'Long edge', 'Short edge'));

ALTER TABLE PRINT_JOB
MODIFY DOUBLE_SIDED_TYPE DEFAULT 'None';

-- Constraints: PRINT_COLOR
ALTER TABLE PRINT_JOB
ADD CONSTRAINT CHK_PRINT_COLOR CHECK (PRINT_COLOR IN ('Black and White', 'Color'));

ALTER TABLE PRINT_JOB
MODIFY PRINT_COLOR DEFAULT 'Black and White';

-- Constraints: PAGE_RANGE
ALTER TABLE PRINT_JOB
MODIFY PAGE_RANGE NOT NULL;

ALTER TABLE PRINT_JOB
MODIFY PAGE_RANGE DEFAULT 'All';

/*  Constraints for CUSTOMER entity: */
--PRIMARY KEY:
ALTER TABLE CUSTOMER
ADD PRIMARY KEY (CUSTOMER_ID);

--NOT NULL:
ALTER TABLE CUSTOMER
MODIFY CUSTOMER_ID NOT NULL;

--NOT NULL:
ALTER TABLE CUSTOMER
MODIFY CUSTOMER_NAME NOT NULL;

--NOT NULL:
ALTER TABLE CUSTOMER
MODIFY CUSTOMER_EMAIL NOT NULL;

--NOT NULL:
ALTER TABLE CUSTOMER
MODIFY CUSTOMER_PHONE_NO NOT NULL;

--NOT NULL:
ALTER TABLE CUSTOMER
MODIFY CUSTOMER_PASSWORD NOT NULL;

--NOT NULL:
ALTER TABLE CUSTOMER
MODIFY CUSTOMER_STATUS NOT NULL;

--NOT NULL:
ALTER TABLE CUSTOMER
MODIFY CUSTOMER_WORKPLACE NOT NULL;

ALTER TABLE CUSTOMER
ADD UNIQUE (CUSTOMER_USERNAME);

SELECT * FROM CUSTOMER;

/*  Constraints for KIOSK entity */
--PRIMARY KEY:
ALTER TABLE KIOSK
ADD PRIMARY KEY (KIOSK_ID);

--KIOSK_ID NOT NULL
ALTER TABLE KIOSK
MODIFY KIOSK_ID NOT NULL;

--FOREIGN KEY
ALTER TABLE KIOSK
ADD FOREIGN KEY (RECORD_ID) REFERENCES REPORT_SYSTEM(RECORD_ID);

--RECORD_ID NOT NULL
ALTER TABLE KIOSK
MODIFY RECORD_ID NOT NULL;

--KIOSK_ADDRESS NOT NULL
ALTER TABLE KIOSK
MODIFY KIOSK_ADDRESS NOT NULL;

--KIOSK_STATUS NOT NULL
ALTER TABLE KIOSK
MODIFY KIOSK_STATUS NOT NULL;

/*  Constraints for TRANSACTION_HISTORY entity */
--PRIMARY KEY:
ALTER TABLE TRANSACTION_HISTORY
ADD PRIMARY KEY (TRANSACTION_ID);

--NOT NULL:
ALTER TABLE TRANSACTION_HISTORY
MODIFY TRANSACTION_METHOD VARCHAR(50) NOT NULL;

--CHECK Constraint:
-- Adding a CHECK constraint for TRANSACTION_AMOUNT between 5 and 30000
ALTER TABLE TRANSACTION_HISTORY
ADD CONSTRAINT CHEC_TRANSACTION_AMOUNT_RANGE CHECK (TRANSACTION_AMOUNT >= 5.00 AND TRANSACTION_AMOUNT <= 30000.00);

/*  Constraints for DOCUMENT entity */
-- Adding a PRIMARY KEY constraint to DOCUMENT_ID
ALTER TABLE DOCUMENT
ADD CONSTRAINT PK_DOCUMENT PRIMARY KEY (DOCUMENT_ID);

-- Making DOCUMENT_NAME NOT NULL and restricting its length
ALTER TABLE DOCUMENT
MODIFY DOCUMENT_NAME VARCHAR2(255) NOT NULL; -- Adjust the length as needed

-- Making DOCUMENT_SIZE NOT NULL and ensuring it's positive
ALTER TABLE DOCUMENT
MODIFY DOCUMENT_SIZE NUMBER CHECK (DOCUMENT_SIZE > 0);

-- Adding a CHECK constraint for DATE_UPLOADED within a specific range
ALTER TABLE DOCUMENT
ADD CONSTRAINT CHK_DATE_UPLOADED CHECK (DATE_UPLOADED >= TO_DATE('2023-01-12', 'YYYY-MM-DD') AND DATE_UPLOADED <= TO_DATE('2024-01-12', 'YYYY-MM-DD'));

/*  Constraints for ADMINISTRATOR entity */
-- adding primary key constraint
ALTER TABLE ADMINISTRATOR
ADD PRIMARY KEY (ADMIN_ID);

--unique constraint
ALTER TABLE ADMINISTRATOR 
ADD UNIQUE (ADMIN_ID);

-- make admin_id not null
ALTER TABLE ADMINISTRATOR 
MODIFY ADMIN_ID NOT NULL; 

-- make admin_name not null
ALTER TABLE ADMINISTRATOR
MODIFY ADMIN_NAME NOT NULL;

-- make admin_address not null
ALTER TABLE ADMINISTRATOR 
MODIFY ADMIN_ADDRESS NOT NULL;

-- make admin_position not null
ALTER TABLE ADMINISTRATOR 
MODIFY ADMIN_POSITION NOT NULL;

-- add constraints in admin_access_level
ALTER TABLE ADMINISTRATOR
ADD CONSTRAINT CHK_VALID_ACCESS CHECK (ADMIN_ACCESS_LEVEL IN ('EXPERIENCED', 'MID', 'ENTRY'));

ALTER TABLE ADMINISTRATOR
MODIFY ADMIN_ACCESS_LEVEL DEFAULT 'ENTRY';

/*  Constraints for REPORT_SYSTEM entity */
-- adding primary key constraint
ALTER TABLE REPORT_SYSTEM
ADD PRIMARY KEY (RECORD_ID);

-- unique constraint
ALTER TABLE REPORT_SYSTEM
ADD UNIQUE (RECORD_ID);

-- record_id not null
ALTER TABLE REPORT_SYSTEM
MODIFY RECORD_ID NOT NULL;

-- record_date not null
ALTER TABLE REPORT_SYSTEM
MODIFY RECORD_DATE NOT NULL;