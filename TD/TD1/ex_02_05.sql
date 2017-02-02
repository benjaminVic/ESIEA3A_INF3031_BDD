SELECT last_name, department_id
FROM employees
WHERE department_id in (20,50)
ORDER BY last_name asc
;