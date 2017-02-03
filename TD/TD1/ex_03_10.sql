SELECT RPAD(SUBSTR(last_name, 0,7), 8, ' ') 
|| LPAD('*',TRUNC(salary /1000),'*') as "EMPLOYEES_AND_THEIR_SALARIES"
FROM employees
;