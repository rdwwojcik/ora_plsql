declare
  cursor plany is
    select psk_koszyk_nazwa, psk_plan, psk_realizacja_planu
      from plany_sprzedazy_koszyki
     where psk_data = '2015/04/01'
       and psk_id_sso =  1199;
  
  plany_row plany%rowtype;
begin
  
  Open plany;  
  loop
    fetch plany into plany_row;
    exit when plany%notfound;
    
    DBMS_OUTPUT.PUT_LINE('Koszyk: '|| plany_row.psk_koszyk_nazwa ||' Plan: ' || plany_row.psk_plan || ' Realizacja: ' || plany_row.psk_realizacja_planu);
  end loop;
  
  Close plany;
  
end;
/

select * from plany_sprzedazy_koszyki where psk_data = '2015/04/01' and psk_id_sso =  1199;

select lpad('111',3,'0') from dual;

select to_char(last_day(sysdate), 'yyyy/mm/dd hh24:mi:ss') from dual;

select round(sysdate,'month') from dual;

select psk_kod_bscs, PSK_KOSZYK_NAZWA, sum(psk_plan)
    from plany_sprzedazy_koszyki
   where psk_data = '2015/03/01'
group by rollup(psk_kod_bscs,PSK_KOSZYK_NAZWA);


declare
 wynik tmp_plany_kopia%rowtype;
begin

  select * 
    from tmp_plany_kopia
   where psk_id = 106953;

  wynik.psk_plan := 2;
  
  insert into tmp_plany_kopia values wynik;

end;


MERGE INTO tmp_plany_kopia b
USING (
  select * 
    from plany_sprzedazy_koszyki
   where psk_data = '2015/03/01' 
     and psk_id_sso =  1199) e
ON (b.psk_id = e.psk_id and b.psk_koszyk = e.psk_koszyk)
WHEN MATCHED THEN
  UPDATE SET b.psk_miasto = 'Jest'
WHEN NOT MATCHED THEN
  INSERT (e.psk_koszyk, e.psk_kod_bscs, e.psk_data, e.psk_id_sso)
  VALUES (b.psk_koszyk, b.psk_kod_bscs, b.psk_data, b.psk_id_sso);

select * 
  from tmp_plany_kopia
 where psk_data = '2015/03/01' 
   and psk_id_sso =  1199;
   
select * 
  from plany_sprzedazy_koszyki
 where psk_data = '2015/03/01' 
   and psk_id_sso =  1199;

--update tmp_plany_kopia set psk_koszyk = 123 where psk_id = 107367;

--create table tmp_plany_kopia As
--select *
--  from plany_sprzedazy_koszyki

--create table tmp_plany_marge(
--  p_id numeric(38,0),
--  p_idx numeric(38,0),
--  p_kod_bscs varchar(20)
--)
  
--CREATE TABLE Students
--(
--StudentID INTEGER PRIMARY KEY,
--Name VARCHAR(15)
--)
--
--INSERT INTO Students VALUES (1,'Adam')
--INSERT INTO Students VALUES (2,'Ewa');
--INSERT INTO Students VALUES (3,'Dominika');
--INSERT INTO Students VALUES (4,'Zofia');
--INSERT INTO Students VALUES (5,'Ewelina');

--CREATE TABLE StudentExamPoints
--(
--StudentID INTEGER REFERENCES Students,
--StudentPoints INTEGER,
--Pass INTEGER default 0,
--Cheater INTEGER
--)

--INSERT INTO StudentExamPoints VALUES(1,51,0,0);
--INSERT INTO StudentExamPoints VALUES(2,72,0,0);
--INSERT INTO StudentExamPoints VALUES(3,86,0,1);

SELECT S.Name
	,Ep.StudentPoints
	,Ep.Pass
	,EP.Cheater
FROM StudentExamPoints Ep
JOIN Students S ON S.StudentID = Ep.StudentID;
/

MERGE INTO StudentExamPoints ex
  USING (SELECT StudentID,Name FROM Students) st
ON (ex.StudentID = st.StudentID)
--WHEN MATCHED AND ex.Cheater = 1        THEN DELETE
WHEN MATCHED THEN UPDATE SET ex.Pass = 1
WHEN NOT MATCHED THEN
INSERT(StudentID,StudentPoints,Pass,Cheater)
VALUES(st.StudentID,0,0,0);


MERGE INTO tmp_plany_kopia b
USING (
  select * 
    from plany_sprzedazy_koszyki
   where psk_data = '2015/03/01' 
     and psk_id_sso =  1199) e
ON (b.psk_id = e.psk_id and b.psk_koszyk = e.psk_koszyk)
WHEN MATCHED THEN
  UPDATE SET b.psk_miasto = 'Jest'
WHEN NOT MATCHED THEN
  INSERT (e.psk_koszyk, e.psk_kod_bscs, e.psk_data, e.psk_id_sso)
  VALUES (b.psk_koszyk, b.psk_kod_bscs, b.psk_data, b.psk_id_sso);