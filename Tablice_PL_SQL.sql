declare
  Type rec_slownik is Record(id_slownika numeric(38,0),
                             opis varchar(200));
  Type tab_slownik is Table of rec_slownik;
  
  tablica tab_slownik;
  rekord rec_slownik;
begin
  
  select sl_id, sl_opis bulk collect into tablica
    from slownik
   where sl_typ = 91;
   
  for idx in 1..tablica.last
  loop
  
    rekord := tablica(idx);
  
    DBMS_OUTPUT.PUT_LINE('Id: ' || rekord.id_slownika || ' Opis: ' || rekord.opis);
  
  end loop;
  
end;