select * from slownik  where sl_typ  =10;

select * from slownik  where sl_id = 1123421310;

declare
  typ  slownik.sl_typ%type := 10;
  opis slownik.sl_opis%type := 'Jakiœ';
BEGIN
  INSERT INTO slownik(sl_typ,SL_OPIS,sl_dost)
  SELECT
    sl_typ,SL_OPIS,sl_dost
  from slownik
 where sl_id = 1255098;

  IF SQL%ROWCOUNT = 1 THEN
    RAISE NO_DATA_FOUND;
  END IF;
  
--  EXCEPTION
--    WHEN NO_DATA_FOUND THEN
--      DBMS_OUTPUT.PUT_LINE('Brak danych');
END;
/

declare
  n number := -1;
BEGIN
  IF n < 0 THEN
    RAISE INVALID_NUMBER;  -- raise explicitly
  ELSE
    DBMS_OUTPUT.PUT_LINE('All is OK.');
  END IF;
  EXCEPTION
    WHEN INVALID_NUMBER THEN
      DBMS_OUTPUT.PUT_LINE('Substituting default value for invalid number.');
END;


