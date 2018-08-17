declare
  cursor cur_plany(data_param plany_sprzedazy_koszyki.psk_data%Type, typ_prowiz number, koszyk number := 1210958) is
    select kh_nazwa, psk_koszyk_nazwa, psk_plan, psk_realizacja_planu
      from plany_sprzedazy_koszyki
      join kontrah on kh_id = psk_id_sso
     where psk_data = data_param
       and KH_ID_TYP_PROWIZ = typ_prowiz
       and psk_koszyk = koszyk
    order by kh_nazwa;
  
  Type nest_type is table of cur_plany%rowtype;
  nest_table nest_type;
  cur cur_plany%rowtype;
begin
    
    Open cur_plany('2015/04/01', 17787, 1210961);

    fetch cur_plany bulk collect into nest_table;
    
    for idx in 1 .. nest_table.Last
    loop
      cur := nest_table(idx);
    
      DBMS_OUTPUT.PUT_LINE('Agent: ' || cur.kh_nazwa || ' Koszyk: ' || cur.psk_koszyk_nazwa || ' Plan: ' || cur.psk_plan); 
    end loop;

--    loop
--      fetch cur_plany into cur;
--      exit when cur_plany%notfound;
--      DBMS_OUTPUT.PUT_LINE('Agent: ' || cur.kh_nazwa || ' Koszyk: ' || cur.psk_koszyk_nazwa || ' Plan: ' || cur.psk_plan); 
--    end loop;

    close cur_plany;
--    for cur IN cur_plany('2015/04/01', 17787, 1210959)
--    loop
--      DBMS_OUTPUT.PUT_LINE('Agent: ' || cur.kh_nazwa || ' Koszyk: ' || cur.psk_koszyk_nazwa || ' Plan: ' || cur.psk_plan); 
--    end loop;
end;