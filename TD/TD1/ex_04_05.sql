SELECT last_name, job_id,
        decode(job_id,
        'AD_PRES', 'A',
        'ST_MAN', 'B',
        'IT_PROG', 'C',
        'SA_REP', 'D',
        'ST_CLERK', 'E'
        ,'0') as GRADE
FROM employees;