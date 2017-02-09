SELECT distinct e2.employee_id, e2.last_name
FROM employees e1
JOIN employees e2 on e1.department_id = e2.department_id
WHERE e1.last_name like '%u%'
;   