select admin.*, to_char(ad_czas_bazy, 'yyyy/mm/dd hh24:mi:ss') from admin order by Ad_Czas_Bazy desc;
--delete from admin

select * from user_SCHEDULER_JOB_LOG;
select * from user_SCHEDULER_JOB_RUN_DETAILS order by Req_Start_Date desc;

--Create SCHEDULER and two JOB
BEGIN
  DBMS_SCHEDULER.create_schedule (
    schedule_name   => 'test_minutely_schedule',
    start_date      => SYSTIMESTAMP,
    repeat_interval => 'freq=MINUTELY; interval=1;',
    end_date        => NULL,
    comments        => 'Repeats minutely, on the minute, for ever.');
END;
/

begin
DBMS_SCHEDULER.create_job (
    job_name        => 'test_job_run_procedure',
    schedule_name   => 'test_minutely_schedule',
    job_type        => 'STORED_PROCEDURE',
    job_action      => 'add_admin',
    enabled         => TRUE,
    comments        => 'Job defined entirely by the CREATE JOB procedure.');
end;
/

BEGIN
  DBMS_SCHEDULER.create_program (
    program_name   => 'test_plsql_block_prog',
    program_type   => 'PLSQL_BLOCK',
    program_action => 'insert into admin(ad_imie, ad_nazwisko) values(''franek'', ''dolas'');',
    enabled        => TRUE,
    comments       => 'Program to gather SCOTT statistics using a PL/SQL block.');
end;
/

begin
DBMS_SCHEDULER.create_job (
    job_name        => 'test_job_run_program',
    program_name    => 'test_plsql_block_prog',
    schedule_name   => 'test_minutely_schedule',
    enabled         => TRUE,
    comments        => 'Job defined entirely by the CREATE JOB procedure.');
end;
/

--begin    
--    DBMS_SCHEDULER.drop_program (program_name => 'test_plsql_block_prog');
--    DBMS_SCHEDULER.drop_job (job_name => 'test_job_run_procedure');
--    DBMS_SCHEDULER.drop_job (job_name => 'test_job_run_program');
--    DBMS_SCHEDULER.drop_schedule (schedule_name => 'test_minutely_schedule');
--end;
--/

--create or replace procedure add_admin
--is
--    new_id Pls_Integer;
--begin
--    insert into admin(ad_imie, ad_nazwisko) values('radek', 'wojcik');
--end;
--/

--ONE JOB
begin
DBMS_SCHEDULER.create_job (
    job_name        => 'test_job_definition',
    job_type        => 'PLSQL_BLOCK',
    job_action      => 'insert into admin(ad_imie, ad_nazwisko) values(''radek'', ''wojcik''); commit;',
    start_date      => SYSTIMESTAMP,
    repeat_interval => 'freq=MINUTELY; INTERVAL=1;',
    end_date        => NULL,
    enabled         => TRUE,
    comments        => 'Job defined entirely by the CREATE JOB procedure.');
end;
/

--begin
--  DBMS_SCHEDULER.drop_job (job_name => 'test_job_definition');
--end;

--create sequence admin_seq;

--create trigger t_ai_admin
--    before insert on admin
--    for each row 
--begin
--    if(:new.ad_id is null) Then
--        :new.ad_id := admin_seq.nextval;
--    end if;
--end;
--/
