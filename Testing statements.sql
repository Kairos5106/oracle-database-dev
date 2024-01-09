-- Select statements
SELECT * FROM PRINT_JOB;
SELECT * FROM PRINT_JOB WHERE CUSTOMER_ID = 3;

-- Delete tables
DROP TABLE PRINT_JOB;
DROP TABLE CUSTOMER;
DROP TABLE KIOSK;
DROP TABLE DOCUMENT;
DROP TABLE TRANSACTION_HISTORY;
DROP TABLE ADMINISTRATOR;
DROP TABLE REPORT_SYSTEM;
DROP TABLE KIOSK_USAGE;

-- Other delete statements
DELETE FROM PRINT_JOB;
DELETE FROM PRINT_JOB WHERE CUSTOMER_ID = 1;