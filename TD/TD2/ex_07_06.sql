SELECT emp.department_id, emp.last_name, emp.job_id
FROM employees emp
JOIN departments dep 
    on emp.department_id = dep.department_id
WHERE dep.department_name = 'Executive'
;