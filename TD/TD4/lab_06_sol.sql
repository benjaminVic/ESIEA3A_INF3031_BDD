CREATE OR REPLACE FUNCTION PRENOM_EMP(i_last_name employees.last_name%type)
    RETURN varchar2
IS
    results varchar2(32767);
BEGIN   
    SELECT first_name into results
    FROM employees
    WHERE employees.last_name = i_last_name;
    return results;
END
;