SELECT last_name as "Employee", salary as "Monthly Salary"
FROM employees
WHERE salary < 12000 AND salary > 5000
AND department_id in (20,50)
;