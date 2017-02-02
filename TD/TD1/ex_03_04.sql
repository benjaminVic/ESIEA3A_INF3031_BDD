SELECT employee_id, last_name, salary, 
CAST(salary*1.155 as int) as "New Salary",
(CAST(salary*1.155 as int) - salary) as "Increase"
FROM employees
;