SELECT employee_id, last_name, salary, 
CAST(salary*1.15 as int) as "New Salary"
FROM employees
;