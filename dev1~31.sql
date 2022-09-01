CREATE TABLE CUSTOMERS(
ID INTEGER,
NAME VARCHAR2(20),
AGE NUMBER(3),
ADDRESS VARCHAR2(50),
SALARY INTEGER,
CONSTRAINT PK_ID PRIMARY KEY(ID)
);

SET DEFINE OFF;

INSERT INTO CUSTOMERS VALUES(1,'SONIC',24, 'INDIA', 25000);
INSERT INTO CUSTOMERS VALUES(2,'KNUCKLES',24, 'AMERICA', 300000);
INSERT INTO CUSTOMERS VALUES (3,'ELSA',23,'GERMANY',40000);
INSERT INTO CUSTOMERS VALUES(4,'ANNA', 20, 'LONDON',25000);
INSERT INTO CUSTOMERS VALUES (5,'OLAF',19,'AUSTRALIA',60000);

COMMIT;

CREATE TRIGGER TRI_SALARY 
BEFORE DELETE OR INSERT OR UPDATE ON CUSTOMERS
FOR EACH ROW
WHEN (NEW.ID>0)
DECLARE
 SAL_DIFF NUMBER ;
BEGIN
 SAL_DIFF := :NEW.SALARY - :OLD.SALARY;
 DBMS_OUTPUT.PUT_LINE('OLDSALARY'|| :OLD.SALARY);
 DBMS_OUTPUT.PUT_LINE('NEWSALARY'|| :NEW.SALARY);
 DBMS_OUTPUT.PUT_LINE('SALDIFF'|| :SAL_DIFF);
END;

update customers set salary = 50000 where id = 3;

DECLARE  
   c_id customers.id%type := 3;  
   c_name  customers.name%type;  
   c_addr customers.address%type;  
BEGIN  
   SELECT  name, address INTO  c_name, c_addr  
   FROM customers  
   WHERE id = c_id;  
DBMS_OUTPUT.PUT_LINE ('Name: '||  c_name);  
 DBMS_OUTPUT.PUT_LINE ('Address: ' || c_addr);  
EXCEPTION  
   WHEN no_data_found THEN  
      dbms_output.put_line('No such customer!');  
   WHEN others THEN  
      dbms_output.put_line('Error!');  
END;  
