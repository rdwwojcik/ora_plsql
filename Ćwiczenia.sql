--create package testy
--is
--
--  cursor plany is
--    select * 
--      from plany_sprzedazy_koszyki
--     where psk_data = '2015/03/01' 
--       and psk_id_sso =  1199;
--
--end;
--/

--create package body testy
--is
--
--  procedure test_kursora
--  is
--  begin
--    DBMS_OUTPUT.PUT_LINE(' sad');
--  end;
--
--end;

declare
  
  cursor plany is
    select * 
      from plany_sprzedazy_koszyki
     where psk_data = '2015/03/01' 
       and psk_id_sso =  1199
       and psk_koszyk_nazwa is not null;
  
  wiersz plany%rowtype;
begin
  
  open plany;
  
  loop
    fetch plany into wiersz;
    exit when plany%notfound;
    
    
  end loop;
  
end;