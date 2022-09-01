SET SERVEROUTPUT ON;

DECLARE

v_emp_id NUMBER(6) := 100;
v_f_name varchar2(20);
v_phone_number varchar2(25);

BEGIN

select f_name, phone_number into v_f_name, v_phone_number from EMP
where emp_id = v_emp_id;

DBMS_output.put_line('Employee id:'|| v_emp_id);
DBMS_output.put_line('First_name:'|| v_f_name);
DBMS_output.put_line('Contact No:'|| v_phone_number);


END;


SET SERVEROUTPUT ON;

DECLARE

v_f_name emp.f_name%type;

BEGIN

select f_name into v_f_name from EMP where emp_id = 100;

DBMS_OUTPUT.PUT_LINE('First_name:' || v_f_name);

END;

