
INSERT INTO MY_EMPLOYEE
VALUES (&ID,
        '&last_name',
        '&first_name',
        lower(substr('&first_name',0) || substr('&last_name',7)),
        &salary)
;
/*
UPDATE MY_EMPLOYEE
SET USERID = lower(substr('&first_name',0) || substr('&last_name',7))
;
*/