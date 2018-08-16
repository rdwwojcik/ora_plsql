exec test_package.Wyswietl_Wynik;

create package test_package
is

  Zmienna_1 NUMBER;
  
  function Daj_Ref_Cursor(id_slownika number) return sys_refcursor;
  procedure Wyswietl_Wynik;

end;
/


------------**********************************************************----------
create or replace package body test_package
is

  procedure Wyswietl_Wynik
  is
  Wynik_Cursor sys_refcursor;
  rekord slownik%Rowtype;
  begin
    
    Wynik_Cursor := Daj_Ref_Cursor(Zmienna_1);
    loop
      Fetch Wynik_Cursor into rekord;
      exit when Wynik_Cursor%notfound;
      
      DBMS_OUTPUT.PUT_LINE('Id: ' || rekord.sl_id || ' Opis: ' || rekord.sl_opis);
      
    end loop;
    
  end;

--------------------------------------------------------------------------------
  function Daj_Ref_Cursor(id_slownika number) return sys_refcursor
  is
  Wynik sys_refcursor;
  begin
    
    open Wynik for
      Select *
        from slownik
       where sl_typ = id_slownika;
       
    return Wynik;
    
  end;
--------------------------------------------------------------------------------
begin
  Zmienna_1 := 91; 
end;