SELECT last_name, job_id, salary
FROM employees
WHERE (salary != 2500 OR salary != 3500 OR salary != 7000)
AND (job_id = 'SA_REP' OR job_id = 'ST_CLERK')
;