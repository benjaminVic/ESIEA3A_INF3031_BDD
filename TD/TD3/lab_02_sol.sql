SET SERVEROUTPUT ON
DECLARE
v_today date := SYSDATE;
v_tomorrow v_today%type;
BEGIN
v_tomorrow := v_today +1;
DBMS_OUTPUT.PUT_LINE(v_today);
DBMS_OUTPUT.PUT_LINE(v_tomorrow);
END;