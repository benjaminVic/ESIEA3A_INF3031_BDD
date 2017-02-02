SELECT last_name as "Name", length(last_name) as "Length"
FROM employees
WHERE SUBSTR(last_name, 1) like 'A%'
OR SUBSTR(last_name, 1) like 'J%'
OR SUBSTR(last_name, 1) like 'M%'
;