--exec DBMS_OUTPUT.enable;

--select * from kontrah where kh_id = 1200;

declare
  nazwa slownik % Rowtype;
  type adres_typ is record(miasto kontrah.kh_miasto%Type, adres kontrah.kh_adres%Type);
  typ_adresu adres_typ;
  type pos_typ is record(id_sso kontrah.kh_id%Type, nazwa_sso KONTRAH.KH_NAZWA%Type, adres adres_typ);
  typ_posu pos_typ;
begin

  select * into nazwa
    from slownik
   where sl_id = 1210958;
   
   DBMS_OUTPUT.PUT_LINE(nazwa.sl_id||' '||nazwa.sl_opis);
   
   select kh_miasto, KH_ADRES into typ_adresu
    from kontrah
   where kh_id = 1200;
   
   DBMS_OUTPUT.PUT_LINE(typ_adresu.miasto||' '||typ_adresu.ADRES);
   
end;