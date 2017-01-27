SELECT last_name, job_id, salary AS Sal
FROM employees;

--Fonctionne, 107 lignes retournée

SELECT *
FROM job_grades;

--Fails : no such table

SELECT employee_id, last_name,
(salary * 12) AS ANNUALSALARY
FROM employees;

--après last name il manque une ,
--sal est un mauvais nom il faut ecrire SALARY
--il manque le AS de l'alias de annualsalary qui ne prend pas d'espace
--la multiplication prends une * et non un x et se parenthèse.
