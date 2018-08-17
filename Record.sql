set Serveroutput On;

-------------------------Przyklad_5
declare
    type rec_kontrah_prow is record(
        id_sso pma_sso.id_sso%type,
        nazwa_sso varchar(200),
        kwota numeric(10,2)
    );
    kontrah_prow_zm_1 rec_kontrah_prow;
    
    type type_tab_kontrah_prow is table of rec_kontrah_prow;
    tab_kontrah_prow type_tab_kontrah_prow;
    
    ilosc_danych Pls_Integer;
begin
    select id_sso, kh_nazwa, sum(kwota_do_wyplaty) bulk collect into tab_kontrah_prow
      from pma_sso
      join prowizje.kontrah on kh_id = id_sso
     where data_prowizji = '2018/03/01'
       and id_sso IN(1200,1199)
     group by id_sso, kh_nazwa;

    ilosc_danych := tab_kontrah_prow.count;
    for i in 1..ilosc_danych
    loop
        dbms_output.put_line('******************');
        dbms_output.put_line('Id: ' || tab_kontrah_prow(i).id_sso);
        dbms_output.put_line('Nazwa: ' || tab_kontrah_prow(i).nazwa_sso);
        dbms_output.put_line('Kwota: ' || tab_kontrah_prow(i).kwota);
        dbms_output.put_line('******************');    
    end loop;
end;
/

-------------------------Przyklad_4
declare
    type rec_kontrah_prow is record(
        id_sso pma_sso.id_sso%type,
        nazwa_sso varchar(200),
        kwota numeric(10,2)
    );
    kontrah_prow_zm_1 rec_kontrah_prow;
begin
    select id_sso, kh_nazwa, sum(kwota_do_wyplaty) into kontrah_prow_zm_1
      from pma_sso
      join prowizje.kontrah on kh_id = id_sso
     where data_prowizji = '2018/03/01'
       and id_sso = 1200
     group by id_sso, kh_nazwa;

    dbms_output.put_line('******************');
    dbms_output.put_line('Id: ' || kontrah_prow_zm_1.id_sso);
    dbms_output.put_line('Nazwa: ' || kontrah_prow_zm_1.nazwa_sso);
    dbms_output.put_line('Kwota: ' || kontrah_prow_zm_1.kwota);
    dbms_output.put_line('******************');    
    
end;
/


-------------------------Przyklad_3
declare
    type rec_kontrah_prow is record(
        id_sso pma_sso.id_sso%type,
        nazwa_sso varchar(200),
        kwota numeric(10,2)
    );
    kontrah_prow_zm_1 rec_kontrah_prow;
    kontrah_prow_zm_2 rec_kontrah_prow;
    
    Type tab_kontrah_prow is table of rec_kontrah_prow INDEX BY BINARY_INTEGER;
    tab_kontrah tab_kontrah_prow;
begin
    kontrah_prow_zm_1.id_sso := 123;
    kontrah_prow_zm_1.nazwa_sso := 'Przykladowy kontrah';
    kontrah_prow_zm_1.kwota := 100100;
    
    kontrah_prow_zm_2.id_sso := 321;
    kontrah_prow_zm_2.nazwa_sso := 'Test 2 Przykladowy kontrah';
    kontrah_prow_zm_2.kwota := 123123;
    tab_kontrah(1) := kontrah_prow_zm_1;
    tab_kontrah(2) := kontrah_prow_zm_2;

    for i in tab_kontrah.first..tab_kontrah.last
    loop
        dbms_output.put_line('******************');
        dbms_output.put_line('Id: ' || tab_kontrah(i).id_sso);
        dbms_output.put_line('Nazwa: ' || tab_kontrah(i).nazwa_sso);
        dbms_output.put_line('Kwota: ' || tab_kontrah(i).kwota);
        dbms_output.put_line('******************');    
    end loop;
       
end;
/


-------------------------Przyklad_2
declare
    type rec_kontrah_prow is record(
        id_sso pma_sso.id_sso%type,
        nazwa_sso varchar(200),
        kwota numeric(10,2)
    );
    kontrah_prow_zm_1 rec_kontrah_prow;
    
    Type tab_kontrah_prow is table of rec_kontrah_prow INDEX BY BINARY_INTEGER;
    tab_kontrah tab_kontrah_prow;
begin
    kontrah_prow_zm_1.id_sso := 123;
    kontrah_prow_zm_1.nazwa_sso := 'Przykladowy kontrah';
    kontrah_prow_zm_1.kwota := 100100;

    tab_kontrah(1) := kontrah_prow_zm_1;
    dbms_output.put_line('******************');
    dbms_output.put_line('Id: ' || tab_kontrah(1).id_sso);
    dbms_output.put_line('Nazwa: ' || tab_kontrah(1).nazwa_sso);
    dbms_output.put_line('Kwota: ' || tab_kontrah(1).kwota);
    dbms_output.put_line('******************');    
end;
/

-------------------------Przyklad_1
declare
    type rec_kontrah_prow is record(
        id_sso pma_sso.id_sso%type,
        nazwa_sso varchar(200),
        kwota numeric(10,2)
    );
    kontrah_prow_zm rec_kontrah_prow;
begin
    kontrah_prow_zm.id_sso := 123;
    kontrah_prow_zm.nazwa_sso := 'Przykladowy kontrah';
--    kontrah_prow_zm.kwota := 100100;
    
    dbms_output.put_line('******************');
    dbms_output.put_line('Id: ' || kontrah_prow_zm.id_sso);
    dbms_output.put_line('Nazwa: ' || kontrah_prow_zm.nazwa_sso);
    dbms_output.put_line('Kwota: ' || kontrah_prow_zm.kwota);
    dbms_output.put_line('******************');
end;
/