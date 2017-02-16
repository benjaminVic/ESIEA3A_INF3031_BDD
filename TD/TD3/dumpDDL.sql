CREATE TABLE hr.departments (
    department_id     NUMBER(4) NOT NULL,
    department_name   VARCHAR2(30 BYTE)
        CONSTRAINT dept_name_nn NOT NULL,
    manager_id        NUMBER(6),
    location_id       NUMBER(4),
    cost_center       VARCHAR2(25)
)
    PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
        STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

COMMENT ON TABLE hr.departments IS 'Departments table that shows details of departments where employees
work. Contains 27 rows; references with locations,employees,and job_history tables.'
;

COMMENT ON COLUMN hr.departments.department_id IS 'Primary key column of departments table.';

COMMENT ON COLUMN hr.departments.department_name IS 'A not null column that shows name of a department. Administration,
Marketing,Purchasing,Human Resources,Shipping,IT,Executive,Public
Relations,Sales,Finance,and Accounting. '
;

COMMENT ON COLUMN hr.departments.manager_id IS 'Manager_id of a department. Foreign key to employee_id column of employees table. The manager_id column of the employee table references this column.'
;

COMMENT ON COLUMN hr.departments.location_id IS 'Location id where a department is located. Foreign key to location_id column of locations table.'
;

CREATE UNIQUE INDEX hr.dept_id_pk ON
    hr.departments ( department_id ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

CREATE INDEX hr.dept_location_ix ON
    hr.departments ( location_id ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

ALTER TABLE hr.departments ADD CONSTRAINT dept_id_pk PRIMARY KEY ( department_id )
    USING INDEX hr.dept_id_pk;

CREATE TABLE hr.employees (
    employee_id      NUMBER(6) NOT NULL,
    first_name       VARCHAR2(20 BYTE),
    last_name        VARCHAR2(25 BYTE)
        CONSTRAINT emp_last_name_nn NOT NULL,
    email            VARCHAR2(25 BYTE)
        CONSTRAINT emp_email_nn NOT NULL,
    phone_number     VARCHAR2(20 BYTE),
    hire_date        DATE
        CONSTRAINT emp_hire_date_nn NOT NULL,
    job_id           VARCHAR2(10 BYTE)
        CONSTRAINT emp_job_nn NOT NULL,
    salary           NUMBER(8,2),
    commission_pct   NUMBER(2,2),
    manager_id       NUMBER(6),
    department_id    NUMBER(4)
)
    PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
        STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

ALTER TABLE hr.employees ADD CONSTRAINT emp_salary_min CHECK (
    salary > 0
);

COMMENT ON TABLE hr.employees IS 'employees table. Contains 107 rows. References with departments,
jobs,job_history tables. Contains a self reference.'
;

COMMENT ON COLUMN hr.employees.employee_id IS 'Primary key of employees table.';

COMMENT ON COLUMN hr.employees.first_name IS 'First name of the employee. A not null column.';

COMMENT ON COLUMN hr.employees.last_name IS 'Last name of the employee. A not null column.';

COMMENT ON COLUMN hr.employees.email IS 'Email id of the employee';

COMMENT ON COLUMN hr.employees.phone_number IS 'Phone number of the employee; includes country code and area code';

COMMENT ON COLUMN hr.employees.hire_date IS 'Date when the employee started on this job. A not null column.';

COMMENT ON COLUMN hr.employees.job_id IS 'Current job of the employee; foreign key to job_id column of the
jobs table. A not null column.'
;

COMMENT ON COLUMN hr.employees.salary IS 'Monthly salary of the employee. Must be greater
than zero (enforced by constraint emp_salary_min)'
;

COMMENT ON COLUMN hr.employees.commission_pct IS 'Commission percentage of the employee; Only employees in sales
department elgible for commission percentage'
;

COMMENT ON COLUMN hr.employees.manager_id IS 'Manager id of the employee; has same domain as manager_id in
departments table. Foreign key to employee_id column of employees table.
(useful for reflexive joins and CONNECT BY query)'
;

COMMENT ON COLUMN hr.employees.department_id IS 'Department id where employee works; foreign key to department_id
column of the departments table'
;

CREATE INDEX hr.emp_department_ix ON
    hr.employees ( department_id ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

CREATE UNIQUE INDEX hr.emp_email_uk ON
    hr.employees ( email ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

CREATE UNIQUE INDEX hr.emp_emp_id_pk ON
    hr.employees ( employee_id ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

CREATE INDEX hr.emp_job_ix ON
    hr.employees ( job_id ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

CREATE INDEX hr.emp_manager_ix ON
    hr.employees ( manager_id ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

CREATE INDEX hr.emp_name_ix ON
    hr.employees ( last_name ASC,first_name ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

ALTER TABLE hr.employees ADD CONSTRAINT emp_emp_id_pk PRIMARY KEY ( employee_id )
    USING INDEX hr.emp_emp_id_pk;

ALTER TABLE hr.employees ADD CONSTRAINT emp_email_uk UNIQUE ( email )
    USING INDEX hr.emp_email_uk;

CREATE TABLE projects (
    project_id                    NUMBER(6) NOT NULL,
    project_name                  VARCHAR2(100),
    project_start_date            DATE,
    project_end_date              DATE,
    departements_departement_id   NUMBER(4)
)

logging;

ALTER TABLE projects ADD CONSTRAINT projects_pk PRIMARY KEY ( project_id );

ALTER TABLE hr.departments ADD CONSTRAINT dept_loc_fk FOREIGN KEY ( location_id )
    REFERENCES hr.locations ( location_id )
NOT DEFERRABLE;

ALTER TABLE hr.departments ADD CONSTRAINT dept_mgr_fk FOREIGN KEY ( manager_id )
    REFERENCES hr.employees ( employee_id )
NOT DEFERRABLE;

ALTER TABLE hr.employees ADD CONSTRAINT emp_dept_fk FOREIGN KEY ( department_id )
    REFERENCES hr.departments ( department_id )
NOT DEFERRABLE;

ALTER TABLE hr.employees ADD CONSTRAINT emp_job_fk FOREIGN KEY ( job_id )
    REFERENCES hr.jobs ( job_id )
NOT DEFERRABLE;

ALTER TABLE hr.employees ADD CONSTRAINT emp_manager_fk FOREIGN KEY ( manager_id )
    REFERENCES hr.employees ( employee_id )
NOT DEFERRABLE;

ALTER TABLE projects ADD CONSTRAINT projects_departments_fk FOREIGN KEY ( departements_departement_id )
    REFERENCES hr.departments ( department_id )
NOT DEFERRABLE;

CREATE OR REPLACE TRIGGER hr.secure_employees BEFORE
    INSERT OR UPDATE OR DELETE ON hr.employees
BEGIN
    secure_dml;
END secure_employees;
/

CREATE OR REPLACE TRIGGER hr.update_job_history AFTER
    UPDATE OF job_id,department_id ON hr.employees
    FOR EACH ROW
BEGIN
    add_job_history(
        :old.employee_id,
        :old.hire_date,
        SYSDATE,
        :old.job_id,
        :old.department_id
    );
END;
/