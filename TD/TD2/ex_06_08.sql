SELECT emp2.LAST_NAME, 
    emp2.HIRE_DATE
FROM EMPLOYEES emp1
JOIN EMPLOYEES emp2 on emp1.HIRE_DATE <  emp2.HIRE_DATE
WHERE emp1.LAST_NAME= 'Davies' 
;