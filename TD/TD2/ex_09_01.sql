CREATE TABLE MY_EMPLOYEE (
ID NUMBER(4) NOT NULL,
LAST_NAME VARCHAR2(25),
FIRST_NAME VARCHAR2(25),
USERID VARCHAR2(8),
SALARY NUMBER(9,2)
--CONSTRAINT my_employee_pk PRIMARY KEY (ID)
);

DROP TABLE MY_EMPLOYEE PURGE;