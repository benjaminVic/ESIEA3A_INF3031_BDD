CREATE OR REPLACE PACKAGE PCK_EMPLOYES AS
    -- Retourne le plus haut department
    PROCEDURE MAX_DEPART(i_last_name employees.last_name%type);
END PCK_EMPLOYES;

CREATE OR REPLACE PACKAGE BODY PCK_EMPLOYES AS
    PROCEDURE MAX_DEPART(i_last_name employees.last_name%type)
    IS
        v_max_deptno NUMBER;
    begin
        select max(department_id) into v_max_deptno from departments;
        DBMS_OUTPUT.PUT_LINE('Le departement le plus grand est : ' || v_max_deptno);
    END MAX_DEPART;
END PCK_EMPLOYES;