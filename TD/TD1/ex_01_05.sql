--1.2.1
select employee_id, last_name, job_id, hire_date as startdate
from employees
;

--1.2.2
select distinct job_id
from employees
;

--1.2.3
select employee_id as "Emp #", last_name as "Employee", 
job_id as Job, hire_date as "Hire Date"
from employees
;

select employee_id || ', ' || last_name
from employees
;

--1.2.4
select employee_id || ',' || first_name || ',' || last_name || ',' || email || ',' || phone_number || ',' || 
hire_date || ',' || job_id || ',' || salary || ',' || commission_pct || ',' || manager_id || ',' || department_id as "THE_OUTPUT"
from employees
;


