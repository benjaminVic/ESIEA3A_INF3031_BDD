SELECT MAX(salary) AS "Maximum",
MIN(salary) AS "Minimum",
SUM(salary) AS "Sum",
trunc(AVG(salary)) AS "Average"
FROM employees
;