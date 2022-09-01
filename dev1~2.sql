create or replace trigger tri_chck_sal
BEFORE INSERT OR UPDATE OF SALARY ON EMP 
FOR EACH ROW

DECLARE
  v_min_salary jobs.min_salary%TYPE;
  v_new_job_id jobs.job_id%TYPE := :new.job_id;
BEGIN
   select min_salary into v_min_salary from JOBS where job_id = UPPER(v_new_job_id);
   IF: new.salary < v_min_salary
   THEN
       new.salary := v_min_salary;
   END IF;
   
END;

ALTER TRIGGER tri_chck_sal disable;
DROP TRIGGER tri_chck_sal;
    
ALTER TRIGGER tri_sal_chk disable;
DROP TRIGGER tri_sal_chk;
        
CREATE OR REPLACE TRIGGER tri_sal_chk
BEFORE INSERT OR UPDATE OF SALARY ON EMP
FOR EACH ROW 
WHEN (NEW.JOB_ID<> 'AD_PRES')
DECLARE
  v_min_salary jobs.min_salary%TYPE;
  v_new_job_id jobs.job_id%TYPE := :new.job_id;
BEGIN
   select min_salary into v_min_salary from JOBS where job_id = UPPER(v_new_job_id);
IF: new.salary < v_min_salary THEN
       :new.salary := v_min_salary;
   END IF;
   
END;

 
