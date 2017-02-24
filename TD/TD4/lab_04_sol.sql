set serveroutput on
declare
    v_max_deptno NUMBER;
begin
    select max(department_id) into v_max_deptno from departments;
    DBMS_OUTPUT.PUT_LINE('Le departement le plus grand est : ' || v_max_deptno);
end;