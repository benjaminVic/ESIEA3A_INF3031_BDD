SELECT last_name, job_id, hire_date
FROM employees
WHERE last_name in ('Matos', 'Taylor')
ORDER BY hire_date asc
;