SELECT last_name, TO_CHAR(hire_date, 'DD-MON-RR'),
TO_CHAR(hire_date, 'DAY') as "DAY"
FROM employees
ORDER by  mod(to_char(hire_date, 'D') + 6, 7)
;