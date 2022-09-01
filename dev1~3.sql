--to instruct SQL Developer to echo the output to the screen
SET SERVEROUTPUT ON;
 
-- PL/SQL block for the requirement
DECLARE
  v_id  INTEGER:= 101;
  v_name   VARCHAR2(20):= 'Deepika';
 
BEGIN
  /*Details of employee with ID 100 will be retrieved and stored 
      in the variables using select statement*/
  INSERT INTO ABC VALUES(v_id,v_name);
  --You will see how to write SQL statements in PL/SQL block in the next section
  DBMS_OUTPUT.PUT_LINE ('Employee ID: ' || v_id);
--  DBMS_OUTPUT.PUT_LINE ('First Name: ' || v_first_name);
--  DBMS_OUTPUT.PUT_LINE ('Contact Number: ' || v_phone_number);
END;

CREATE  TRIGGER zoho.funu  
AFTER INSERT ON Ind.Accounts
DECLARE 
   Var.SID SYS.HEADERS:= Header.id; 
BEGIN  
   Zoho.shift(Var.SID)
END;